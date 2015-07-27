----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      warp_scheduler - arch 
-- Project Name:     GPGPU
-- Target Devices: 
-- Tool versions:    ISE 10.1
-- Description: 
--
----------------------------------------------------------------------------
-- Revisions:       
--  REV:        Date:           Description:
--  0.1.a       9/13/2010       Created Top level file 
----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;  
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.gpgpu_package.all;

    entity warp_scheduler is
        generic (
            SHMEM_ADDR_SIZE             : integer := 14
        );
        port (
            clk_in                      : in  std_logic;
			host_reset              	: in  std_logic;
            reset                       : in  std_logic;
            
            pipeline_stall_in           : in std_logic;
            
            num_blocks_in           	: in  std_logic_vector(3 downto 0);
			num_warps_in                : in  std_logic_vector(4 downto 0);
            gprs_size_in                : in  std_logic_vector(8 downto 0);
            
            warps_done_mask_in          : in  std_logic_vector(MAX_WARPS-1 downto 0);
            
            warp_pool_addr_out          : out std_logic_vector(4 downto 0);
			warp_pool_wr_en_out	        : out std_logic_vector(0 downto 0);
            warp_pool_wr_data_out	    : out std_logic_vector(127 downto 0);
            warp_pool_rd_data_in	    : in  std_logic_vector(127 downto 0);
            
            warp_state_addr_out         : out std_logic_vector(4 downto 0);
			warp_state_wr_en_out	    : out std_logic_vector(0 downto 0);
            warp_state_wr_data_out	    : out std_logic_vector(1 downto 0);
            warp_state_rd_data_in	    : in  std_logic_vector(1 downto 0);
            
            program_cntr_out            : out std_logic_vector(31 downto 0);
            warp_id_out                 : out std_logic_vector(4 downto 0);
            warp_lane_id_out            : out std_logic_vector(1 downto 0);
            cta_id_out                  : out std_logic_vector(3 downto 0);
            initial_mask_out            : out std_logic_vector(31 downto 0);
            current_mask_out            : out std_logic_vector(31 downto 0);
            shmem_base_addr_out         : out std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
            gprs_size_out               : out std_logic_vector(8 downto 0);
            gprs_base_addr_out          : out std_logic_vector(8 downto 0);
            
            done                        : out std_logic;
            
            -- stats
            stats_reset                 : in  std_logic;
            stats_out                   : out stat_record;
            stats_smp_out               : out stat_record;
            
            pipeline_reg_ld	            : out std_logic;
			fetch_en					: out std_logic
        );
    end warp_scheduler;

architecture arch of warp_scheduler is

    component warps_done_lut is
        port (
            clk_in              : in  std_logic;
            host_reset          : in  std_logic;
            
            num_warps_in        : in  std_logic_vector(4 downto 0);
            warps_done_mask     : out std_logic_vector (MAX_WARPS-1 downto 0)
        );
    end component;

    component shift_register is
        generic (
            n           : integer   := 4
        );
        port ( 
            clk         : in  std_logic;
            reset       : in  std_logic;
            d           : in  std_logic_vector(31 downto 0);
            q           : out std_logic_vector(31 downto 0)
        );
    end component;

    type warp_scheduler_state_type is (IDLE, READ_FIRST_WARP, SCHEDULE_FIRST_WARP, SCHEDULE_WARP_LANE_0, 
                                      SCHEDULE_WARP_NEXT_LANE, SCHEDULE_WARP_STALL, SCHEDULE_WARP_STALL_2, SCHEDULE_WARP32_STALL,
                                      SCHEDULE_WARP_WAIT_1, SCHEDULE_WARP_WAIT_2, SCHEDULE_WARP_READ_WAIT, SCHEDULE_WARP32_STATE_WAIT,
                                      SCHEDULE_WARP_DONE);
    signal warp_scheduler_state_machine             : warp_scheduler_state_type;
    signal warp_scheduler_next_state                : warp_scheduler_state_type;
	 
	signal warps_done_mask                          : std_logic_vector(MAX_WARPS-1 downto 0) := (others => '0');
    
    signal warp_id_cnt                              : std_logic_vector(4 downto 0);
    signal warp_id_cnt_reg                          : std_logic_vector(4 downto 0);
    signal warp_lane_cnt                            : std_logic_vector(1 downto 0);
    signal warp_lane_cnt_reg                        : std_logic_vector(1 downto 0);
    signal program_cntr                             : std_logic_vector(31 downto 0);
    
    signal shmem_base_addr_reg                      : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal cta_id_reg                               : std_logic_vector(3 downto 0);
    signal gprs_base_addr_reg                       : std_logic_vector(8 downto 0);
    signal initial_mask_reg                         : std_logic_vector(31 downto 0);
    signal current_mask_reg                         : std_logic_vector(31 downto 0);
    signal program_cntr_reg                         : std_logic_vector(31 downto 0);
    signal gprs_size_reg                            : std_logic_vector(8 downto 0);
    signal num_blocks_i           			        : std_logic_vector(3 downto 0);
	
    -- stats
    signal stat_warp_cnt_en                         : std_logic;
    
    signal stat_single_warp_idle_cnt                : integer range 0 to 2147483647; 
    signal stat_total_warp_idle_cnt                 : integer range 0 to 2147483647; 
    signal stat_single_warp_proc_cnt                : integer range 0 to 2147483647; 
    signal stat_total_warp_proc_cnt                 : integer range 0 to 2147483647; 
                
    signal count_computation_1                      : integer range 0 to 2147483647; 
    signal count_computation_2                      : integer range 0 to 2147483647;
    signal count_overhead 		                    : integer range 0 to 2147483647;
    signal stat_total_cnt                           : std_logic_vector(31 downto 0);
    signal stat_idle_cnt                            : std_logic_vector(31 downto 0);
    
begin

    pWarpSchedulerStateMachine: process(clk_in)
	begin
		if (rising_edge(clk_in)) then
            if (host_reset = '1' or reset = '1') then
                stat_warp_cnt_en                                    <= '0';
                program_cntr_out                                    <= (others => '0');
                warp_id_out                                         <= (others => '0');
                warp_lane_id_out                                    <= (others => '0');
                cta_id_out                                          <= (others => '0');
                initial_mask_out                                    <= (others => '0');
                current_mask_out                                    <= (others => '0');
                shmem_base_addr_out                                 <= (others => '0');
                gprs_size_out                                       <= (others => '0');
                gprs_base_addr_out                                  <= (others => '0');
                warp_lane_cnt                                       <= (others => '0');
                warp_lane_cnt_reg                                   <= (others => '0');
                warp_id_cnt                                         <= (others => '0');
                warp_id_cnt_reg                                     <= (others => '0');
                program_cntr                                        <= (others => '0');
                program_cntr_reg                                    <= (others => '0');
                cta_id_reg                                          <= (others => '0');
                gprs_size_reg                                       <= (others => '0');
                gprs_base_addr_reg                                  <= (others => '0');
                initial_mask_reg                                    <= (others => '0');
                current_mask_reg                                    <= (others => '0');
                warp_pool_addr_out                                  <= (others => '0');
                warp_pool_wr_en_out                                 <= (others => '0');
                warp_pool_wr_data_out	                            <= (others => '0');
                warp_state_addr_out                                 <= (others => '0');
                warp_state_wr_en_out                                <= (others => '0');
                warp_state_wr_data_out	                            <= (others => '0');
                done                                                <= '0';
                pipeline_reg_ld                                     <= '0';
                fetch_en											<= '0';
                warp_scheduler_next_state                           <= IDLE;
                warp_scheduler_state_machine                        <= IDLE;
            else
                case warp_scheduler_state_machine is 
                    when IDLE =>
                        stat_warp_cnt_en                            <= '1';
                        warp_id_cnt                                 <= (others => '0');
                        warp_lane_cnt                               <= (others => '0');
                        program_cntr                                <= (others => '0');
                        program_cntr_reg                            <= (others => '0');
                        warp_id_cnt_reg                             <= (others => '0');
                        warp_lane_cnt_reg                           <= (others => '0');
                        cta_id_reg                                  <= (others => '0');
                        gprs_base_addr_reg                          <= (others => '0');
                        initial_mask_reg                            <= (others => '0');
                        current_mask_reg                            <= (others => '0');
                        gprs_size_reg                               <= gprs_size_in;
                        program_cntr_out                            <= (others => '0');
                        warp_id_out                                 <= (others => '0');
                        warp_lane_id_out                            <= (others => '0');
                        cta_id_out                                  <= (others => '0');
                        initial_mask_out                            <= (others => '0');
                        current_mask_out                            <= (others => '0');
                        shmem_base_addr_out                         <= (others => '0');
                        gprs_size_out                               <= (others => '0');
                        gprs_base_addr_out                          <= (others => '0');
                        warp_pool_addr_out                          <= (others => '0');
                        warp_pool_wr_en_out                         <= (others => '0');
                        warp_pool_wr_data_out	                    <= (others => '0');
                        warp_state_addr_out                         <= (others => '0');
                        warp_state_wr_en_out                        <= (others => '0');
                        warp_state_wr_data_out	                    <= (others => '0');
                        done                                        <= '0';
                        pipeline_reg_ld                             <= '0';
                        fetch_en								    <= '0';
                        num_blocks_i 								<= num_blocks_in;
                        warp_scheduler_next_state                   <= READ_FIRST_WARP;
                        warp_scheduler_state_machine			    <= READ_FIRST_WARP;
                        
                    when READ_FIRST_WARP =>
                        warp_scheduler_next_state                   <= SCHEDULE_FIRST_WARP;
                        warp_scheduler_state_machine			    <= SCHEDULE_FIRST_WARP;
                        
                    when SCHEDULE_FIRST_WARP =>
                        warp_id_out                                 <= warp_id_cnt_reg;
                        warp_lane_id_out                            <= warp_lane_cnt_reg;
                        shmem_base_addr_out                         <= warp_pool_rd_data_in(123 downto 110);
                        shmem_base_addr_reg                         <= warp_pool_rd_data_in(123 downto 110);
                        cta_id_out                                  <= warp_pool_rd_data_in(109 downto 106);
                        cta_id_reg                                  <= warp_pool_rd_data_in(109 downto 106);
                        gprs_base_addr_out                          <= warp_pool_rd_data_in(105 downto 97);
                        gprs_base_addr_reg                          <= warp_pool_rd_data_in(105 downto 97);
                        initial_mask_out                            <= warp_pool_rd_data_in(63 downto 32);
                        initial_mask_reg                            <= warp_pool_rd_data_in(63 downto 32);
                        current_mask_out                            <= warp_pool_rd_data_in(31 downto 0);
                        current_mask_reg                            <= warp_pool_rd_data_in(31 downto 0);
                        program_cntr_out                            <= warp_pool_rd_data_in(95 downto 64);
                        program_cntr_reg                            <= warp_pool_rd_data_in(95 downto 64);
                        gprs_size_out                               <= gprs_size_reg;
                        if (CORES /= 32) then
                            warp_id_cnt                             <= warp_id_cnt_reg;
							warp_lane_cnt                           <= warp_lane_cnt_reg + "01";
							warp_pool_addr_out                      <= warp_id_cnt_reg;
							warp_pool_wr_en_out                     <= (others => '0');
							warp_state_addr_out                     <= warp_id_cnt_reg;
							warp_state_wr_en_out                    <= (others => '1');
							warp_state_wr_data_out	                <= encode_warp_state(ACTIVE);
							pipeline_reg_ld                         <= '1';
							fetch_en		 	                    <= '1';
							warp_scheduler_next_state               <= SCHEDULE_WARP_NEXT_LANE;
							warp_scheduler_state_machine            <= SCHEDULE_WARP_WAIT_1;
                        elsif (warp_id_cnt_reg < num_warps_in-1) then
                            warp_id_cnt                             <= warp_id_cnt_reg + "01";
                            warp_lane_cnt                           <= (others => '0');
                            warp_pool_addr_out                      <= warp_id_cnt_reg;
                            warp_pool_wr_en_out                     <= (others => '0');
							warp_state_addr_out                     <= warp_id_cnt_reg;
							warp_state_wr_en_out                    <= (others => '1');
							warp_state_wr_data_out	                <= encode_warp_state(ACTIVE);
							pipeline_reg_ld                         <= '1';
							fetch_en		 	                    <= '1';
							warp_scheduler_state_machine            <= SCHEDULE_WARP32_STATE_WAIT;
                        else
                            warp_id_cnt                             <= (others => '0');
                            warp_lane_cnt                           <= (others => '0');
                            warp_pool_addr_out                      <= warp_id_cnt_reg;
                            warp_pool_wr_en_out                     <= (others => '0');
                            warp_state_addr_out                     <= warp_id_cnt_reg;
							warp_state_wr_en_out                    <= (others => '1');
							warp_state_wr_data_out	                <= encode_warp_state(ACTIVE);
							pipeline_reg_ld                         <= '1';
							fetch_en		 	                    <= '1';
							warp_scheduler_next_state               <= SCHEDULE_WARP_LANE_0;
							warp_scheduler_state_machine            <= SCHEDULE_WARP_WAIT_1;
                        end if;
                    
                    when SCHEDULE_WARP32_STATE_WAIT =>
                        if (warp_id_cnt_reg < num_warps_in-1) then
                            warp_id_cnt                             <= warp_id_cnt_reg + "01";
                            warp_lane_cnt                           <= (others => '0');
                            warp_pool_addr_out                      <= warp_id_cnt_reg + "01";
                            warp_pool_wr_en_out                     <= (others => '0');
                            warp_state_addr_out                     <= warp_id_cnt_reg + "01";
                            warp_state_wr_en_out                    <= (others => '0');
                        else
                            warp_id_cnt                             <= (others => '0');
                            warp_lane_cnt                           <= (others => '0');
                            warp_pool_addr_out                      <= (others => '0');
                            warp_pool_wr_en_out                     <= (others => '0');
                            warp_state_addr_out                     <= (others => '0');
                            warp_state_wr_en_out                    <= (others => '0');
                        end if;
                        if (pipeline_stall_in = '0') then
                            pipeline_reg_ld                         <= '0';   
							fetch_en		 	                    <= '0';
							warp_scheduler_next_state               <= SCHEDULE_WARP_LANE_0;
                            warp_scheduler_state_machine            <= SCHEDULE_WARP_WAIT_1;
                        else
                            pipeline_reg_ld                         <= '0';
							fetch_en		 	                    <= '0';
							warp_scheduler_next_state               <= SCHEDULE_WARP_LANE_0;
                            warp_scheduler_state_machine            <= SCHEDULE_WARP_STALL_2;
                        end if;
                        
                    when SCHEDULE_WARP_LANE_0 =>
                        if (warps_done_mask_in = warps_done_mask) then
                            warp_scheduler_state_machine            <= SCHEDULE_WARP_DONE;
                        elsif (warp_state_rd_data_in = encode_warp_state(READY)) then     -- ready
                            warp_id_out                             <= warp_id_cnt_reg;
                            warp_lane_id_out                        <= warp_lane_cnt_reg;
                            shmem_base_addr_out                     <= warp_pool_rd_data_in(123 downto 110);
                            shmem_base_addr_reg                     <= warp_pool_rd_data_in(123 downto 110);
                            cta_id_out                              <= warp_pool_rd_data_in(109 downto 106);
                            cta_id_reg                              <= warp_pool_rd_data_in(109 downto 106);
                            gprs_base_addr_out                      <= warp_pool_rd_data_in(105 downto 97);
                            gprs_base_addr_reg                      <= warp_pool_rd_data_in(105 downto 97);
                            initial_mask_out                        <= warp_pool_rd_data_in(63 downto 32);
                            initial_mask_reg                        <= warp_pool_rd_data_in(63 downto 32);
                            current_mask_out                        <= warp_pool_rd_data_in(31 downto 0);
                            current_mask_reg                        <= warp_pool_rd_data_in(31 downto 0);
                            program_cntr_out                        <= warp_pool_rd_data_in(95 downto 64);
                            program_cntr_reg                        <= warp_pool_rd_data_in(95 downto 64);
                            gprs_size_out                           <= gprs_size_reg;
                            if (CORES /= 32) then
                                warp_id_cnt                         <= warp_id_cnt_reg;
                                warp_lane_cnt                       <= warp_lane_cnt_reg + "01";
								warp_pool_addr_out                  <= warp_id_cnt_reg;
								warp_pool_wr_en_out                 <= (others => '0');
								warp_state_addr_out                 <= warp_id_cnt_reg;
								warp_state_wr_en_out                <= (others => '1');
								warp_state_wr_data_out	            <= encode_warp_state(ACTIVE);
								if (pipeline_stall_in = '0') then
                                    pipeline_reg_ld                 <= '1';
									fetch_en		 	            <= '1';
									warp_scheduler_next_state       <= SCHEDULE_WARP_NEXT_LANE;
									warp_scheduler_state_machine    <= SCHEDULE_WARP_WAIT_1;
								else
									pipeline_reg_ld                 <= '0';
									fetch_en		 	            <= '0';
									warp_scheduler_next_state       <= SCHEDULE_WARP_NEXT_LANE;
									warp_scheduler_state_machine    <= SCHEDULE_WARP_STALL;
								end if;
							else
								warp_id_cnt                         <= warp_id_cnt_reg ;
								warp_lane_cnt                       <= (others => '0');
								warp_pool_addr_out                  <= warp_id_cnt_reg;
								warp_pool_wr_en_out                 <= (others => '0');
								warp_state_addr_out                 <= warp_id_cnt_reg ;
								warp_state_wr_en_out                <= (others => '1');
								warp_state_wr_data_out	            <= encode_warp_state(ACTIVE);
								if (pipeline_stall_in = '0') then
                                    pipeline_reg_ld                 <= '1';
									fetch_en		 	            <= '1';
									warp_scheduler_state_machine    <= SCHEDULE_WARP32_STATE_WAIT;
								else
									pipeline_reg_ld                 <= '0';
									fetch_en		 	            <= '0';
									warp_scheduler_state_machine    <= SCHEDULE_WARP32_STALL;
                                end if;
                            end if;
                        elsif (warp_state_rd_data_in = encode_warp_state(FINISHED)) then     -- finished
                            if (warp_id_cnt_reg < num_warps_in-1) then
                                warp_id_cnt                         <= warp_id_cnt_reg + "01";
                                warp_lane_cnt                       <= (others => '0');
                                warp_pool_addr_out                  <= warp_id_cnt_reg + "01";
                                warp_pool_wr_en_out                 <= (others => '0');
                                warp_state_addr_out                 <= warp_id_cnt_reg + "01";
                                warp_state_wr_en_out                <= (others => '0');
                            else
                                warp_id_cnt                         <= (others => '0');
                                warp_lane_cnt                       <= (others => '0');
                                warp_pool_addr_out                  <= (others => '0');
                                warp_pool_wr_en_out                 <= (others => '0');
                                warp_state_addr_out                 <= (others => '0');
                                warp_state_wr_en_out                <= (others => '0');
                            end if;
                            if (pipeline_stall_in = '0') then
                                pipeline_reg_ld                     <= '0';   ---MM: CHANGED TO 0 , as fetch is only on lane 0
                                fetch_en		 	              	<= '0';
                                warp_scheduler_next_state           <= SCHEDULE_WARP_LANE_0;
                                warp_scheduler_state_machine        <= SCHEDULE_WARP_WAIT_1;
                            else
                                stat_warp_cnt_en                    <= '0';
                                pipeline_reg_ld                     <= '0';
                                fetch_en		 	                <= '0';
                                warp_scheduler_next_state           <= SCHEDULE_WARP_LANE_0;
                                warp_scheduler_state_machine        <= SCHEDULE_WARP_STALL_2;
                            end if;
                        elsif (warp_state_rd_data_in = encode_warp_state(WAITING_FENCE)) then     -- WAITING_FENCE
                            if (warp_id_cnt_reg < num_warps_in-1) then
                                warp_id_cnt                         <= warp_id_cnt_reg + "01";
                                warp_lane_cnt                       <= (others => '0');
                                warp_pool_addr_out                  <= warp_id_cnt_reg + "01";
                                warp_pool_wr_en_out                 <= (others => '0');
                                warp_state_addr_out                 <= warp_id_cnt_reg + "01";
                                warp_state_wr_en_out                <= (others => '0');
                            else
                                warp_id_cnt                         <= (others => '0');
                                warp_lane_cnt                       <= (others => '0');
                                warp_pool_addr_out                  <= (others => '0');
                                warp_pool_wr_en_out                 <= (others => '0');
                                warp_state_addr_out                 <= (others => '0');
                                warp_state_wr_en_out                <= (others => '0');
                            end if;
                            if (pipeline_stall_in = '0') then
                                pipeline_reg_ld                     <= '0';   ---MM: CHANGED TO 0 , as fetch is only on lane 0
                                fetch_en		 	              	<= '0';
                                warp_scheduler_next_state           <= SCHEDULE_WARP_LANE_0;
                                warp_scheduler_state_machine        <= SCHEDULE_WARP_WAIT_1;
                            else
                                stat_warp_cnt_en                    <= '0';
                                pipeline_reg_ld                     <= '0';
                                fetch_en		 	                <= '0';
                                warp_scheduler_next_state           <= SCHEDULE_WARP_LANE_0;
                                warp_scheduler_state_machine        <= SCHEDULE_WARP_STALL_2;
                            end if;
                        else
                            if (warp_id_cnt <= num_warps_in-1) then
                                warp_id_cnt                         <= warp_id_cnt_reg;
                                warp_lane_cnt                       <= (others => '0');
                                warp_pool_addr_out                  <= warp_id_cnt_reg;
                                warp_pool_wr_en_out                 <= (others => '0');
                                warp_state_addr_out                 <= warp_id_cnt_reg;
                                warp_state_wr_en_out                <= (others => '0');
                            else
                                warp_id_cnt                         <= (others => '0');
                                warp_lane_cnt                       <= (others => '0');
                                warp_pool_addr_out                  <= (others => '0');
                                warp_pool_wr_en_out                 <= (others => '0');
                                warp_state_addr_out                 <= (others => '0');
                                warp_state_wr_en_out                <= (others => '0');
                            end if;
                            pipeline_reg_ld                         <= '0';
                            fetch_en		 	                    <= '0';
                            warp_scheduler_state_machine            <= SCHEDULE_WARP_READ_WAIT;
                            warp_scheduler_next_state               <= SCHEDULE_WARP_LANE_0;
                        end if;
                        
                    when SCHEDULE_WARP_NEXT_LANE =>
                        warp_id_out                                 <= warp_id_cnt_reg;
                        warp_lane_id_out                            <= warp_lane_cnt_reg;
                        cta_id_out                                  <= cta_id_reg;
                        gprs_base_addr_out                          <= gprs_base_addr_reg;
                        initial_mask_out                            <= initial_mask_reg;
                        current_mask_out                            <= current_mask_reg;
                        program_cntr_out                            <= program_cntr_reg;
                        shmem_base_addr_out                         <= shmem_base_addr_reg;
                        gprs_size_out                               <= gprs_size_reg;
                        warp_state_wr_en_out                        <= (others => '0');
                        warp_state_wr_data_out	                    <= (others => '0');
                        if (warp_lane_cnt_reg < WARP_LANES-1) then -- lanes 1 and 2
                            warp_id_cnt                             <= warp_id_cnt_reg;
                            warp_lane_cnt                           <= warp_lane_cnt_reg + "01";
                            if (pipeline_stall_in = '0') then
                                pipeline_reg_ld                     <= '1';    ---MM: CHANGED TO 0 , as fetch is only on lane 0
                                fetch_en		 	                <= '0';
                                warp_scheduler_next_state           <= SCHEDULE_WARP_NEXT_LANE;
                                warp_scheduler_state_machine        <= SCHEDULE_WARP_WAIT_1;
                            else
                                stat_warp_cnt_en                    <= '0';
                                pipeline_reg_ld                     <= '0';
                                fetch_en		 	                <= '0';
                                warp_scheduler_next_state           <= SCHEDULE_WARP_NEXT_LANE;
                                warp_scheduler_state_machine        <= SCHEDULE_WARP_STALL;
                            end if;
                        else                                            -- lane 3
                            if (warp_id_cnt_reg < num_warps_in-1) then
                                warp_id_cnt                         <= warp_id_cnt_reg + "01";
                                warp_lane_cnt                       <= (others => '0');
                                warp_pool_addr_out                  <= warp_id_cnt_reg + "01";
                                warp_pool_wr_en_out                 <= (others => '0');
                                warp_state_addr_out                 <= warp_id_cnt_reg + "01";
                                warp_state_wr_en_out                <= (others => '0');
                            else
                                warp_id_cnt                         <= (others => '0');
                                warp_lane_cnt                       <= (others => '0');
                                warp_pool_addr_out                  <= (others => '0');
                                warp_pool_wr_en_out                 <= (others => '0');
                                warp_state_addr_out                 <= (others => '0');
                                warp_state_wr_en_out                <= (others => '0');
                            end if;
                            if (pipeline_stall_in = '0') then
                                pipeline_reg_ld                     <= '1';   ---MM: CHANGED TO 0 , as fetch is only on lane 0
                                fetch_en		 	              	<= '0';
                                warp_scheduler_next_state           <= SCHEDULE_WARP_LANE_0;
                                warp_scheduler_state_machine        <= SCHEDULE_WARP_WAIT_1;
                            else
                                stat_warp_cnt_en                    <= '0';
                                pipeline_reg_ld                     <= '0';
                                fetch_en		 	                <= '0';
                                warp_scheduler_next_state           <= SCHEDULE_WARP_LANE_0;
                                warp_scheduler_state_machine        <= SCHEDULE_WARP_STALL;
                            end if;
                        end if;
                        
                    when SCHEDULE_WARP_STALL =>
                        if (pipeline_stall_in = '0') then
                            stat_warp_cnt_en                        <= '1';
                            pipeline_reg_ld                         <= '1';   ---MM: CHANGED TO 0 , as fetch is only on lane 0
                            if (warp_lane_cnt_reg = "00") then
                                fetch_en		 	             	<= '1';
                            else 
                                fetch_en		 	             	<= '0';
                            end if;
                            warp_scheduler_state_machine            <= SCHEDULE_WARP_WAIT_1;
                        end if;
                              
                    when SCHEDULE_WARP_STALL_2 =>
                        if (pipeline_stall_in = '0') then
                            stat_warp_cnt_en                        <= '1';
                            warp_scheduler_state_machine            <= SCHEDULE_WARP_WAIT_1;
                        end if;
                    
                    when SCHEDULE_WARP32_STALL =>
                        if (pipeline_stall_in = '0') then
                            pipeline_reg_ld                         <= '1';  
                            fetch_en		 	             	    <= '1';
                            warp_scheduler_state_machine            <= SCHEDULE_WARP32_STATE_WAIT;
                        end if;
                          
                    when SCHEDULE_WARP_READ_WAIT =>
                        warp_id_cnt_reg                             <= warp_id_cnt;
                        warp_lane_cnt_reg                           <= warp_lane_cnt;
                        warp_scheduler_state_machine                <= warp_scheduler_next_state;
                        
                    when SCHEDULE_WARP_WAIT_1 =>
                        warp_id_cnt_reg                             <= warp_id_cnt;
                        warp_lane_cnt_reg                           <= warp_lane_cnt;
                        pipeline_reg_ld                             <= '0';
                        fetch_en		 	                   	    <= '0';
                        warp_scheduler_state_machine                <= SCHEDULE_WARP_WAIT_2;
                        
                    when SCHEDULE_WARP_WAIT_2 =>
                        warp_scheduler_state_machine                <= warp_scheduler_next_state;
                        
                    when SCHEDULE_WARP_DONE =>
                        done                                        <= '1';
                        warp_scheduler_state_machine                <= SCHEDULE_WARP_DONE;
                        
                    when others =>
                        warp_scheduler_state_machine		        <= IDLE;
                end case;
            end if;
		end if;
	end process;
    
    uWarpsDoneLUT : warps_done_lut 
        port map(
            clk_in              => clk_in,
            host_reset          => host_reset,
            
            num_warps_in        => num_warps_in,
            warps_done_mask     => warps_done_mask
        );

    --
    -- Stats
    --
    stats_out.total_idle            <= std_logic_vector(to_unsigned(stat_total_warp_idle_cnt, stats_out.total_idle'length));
    stats_out.total_processing      <= std_logic_vector(to_unsigned(stat_total_warp_proc_cnt, stats_out.total_processing'length));
    stats_out.total_stall           <= (others => '0');
    
    --stats_smp_out.total             <= std_logic_vector(to_unsigned(count_computation_1, stats_smp_out.total'length));
    
    pWarpSchedulerStats : process(clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (host_reset = '1' or stats_reset = '1') then
                stat_single_warp_idle_cnt           <= 0;
                stat_total_warp_idle_cnt            <= 0;
                stat_single_warp_proc_cnt           <= 0;
                stat_total_warp_proc_cnt            <= 0;
            else
                if (stat_warp_cnt_en = '1') then
                    stat_single_warp_idle_cnt       <= 0;
                    
                    stat_single_warp_proc_cnt       <= stat_single_warp_proc_cnt + 1;
                    stat_total_warp_proc_cnt        <= stat_total_warp_proc_cnt + 1;
                else
                    stat_single_warp_idle_cnt       <= stat_single_warp_idle_cnt + 1;
                    stat_total_warp_idle_cnt        <= stat_total_warp_idle_cnt + 1;
                    
                    stat_single_warp_proc_cnt       <= 0;
                end if;
            end if;
        end if;
    end process;
    
    stat_total_cnt      <= std_logic_vector(to_unsigned(count_computation_1, stat_total_cnt'length));
    stat_idle_cnt       <= std_logic_vector(to_unsigned(count_overhead, stat_idle_cnt'length));
    
    uShiftStatTotalCnt : shift_register
        generic map (
            n           => 2
        )
        port map ( 
            clk         => clk_in,
            reset       => host_reset,
            d           => stat_total_cnt,
            q           => stats_smp_out.total
        );
    
    uShiftStatIdleCnt : shift_register
        generic map (
            n           => 2
        )
        port map ( 
            clk         => clk_in,
            reset       => host_reset,
            d           => stat_idle_cnt,
            q           => stats_smp_out.total_idle
        );
        
    pComputationCount: process(clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (host_reset = '1' or reset = '1' or stats_reset = '1') then
                if (host_reset = '1' or stats_reset = '1') then
                    count_computation_1     <= 0; 
                    count_computation_2     <= 0;
                    count_overhead          <= 0;
                elsif (reset = '1') then
                    count_overhead          <= count_overhead + 1;
                end if;
            else
                if (count_computation_1 < 2147483647 ) then
                    count_computation_1     <= count_computation_1 + 1;
                else 
                    count_computation_1     <= 0;
                    count_computation_2     <= count_computation_2 + 1;
                end if;
            end if;
        end if;
    end process;

end arch;

