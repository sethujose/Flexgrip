----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      pipeline_fetch - arch 
-- Project Name:     GPGPU
-- Target Devices: 
-- Tool versions:    ISE 10.1
-- Description: 
--      This module fetches instructions from the main memory.
--      Note: The instructions are stored in little-endian format.
--            For example: 0xaabbccdd is stored as
--                         mem[0] <= "dd"
--                         mem[1] <= "cc"
--                         mem[2] <= "bb"
--                         mem[3] <= "aa"
----------------------------------------------------------------------------
-- Revisions:       
--  REV:        Date:           Description:
--  0.1.a       9/13/2010       Created Top level file 
----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;  
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.gpgpu_package.all;

    entity pipeline_fetch is
        generic (
            MEM_ADDR_SIZE               : integer := 32;
            SHMEM_ADDR_SIZE             : integer := 14
        );
        port (
            reset                       : in  std_logic;
            clk_in                      : in  std_logic;
         
            fetch_en                    : in std_logic;
			pass_en						: in std_logic;
				
            pipeline_stall_in           : in std_logic;
            
            program_cntr_in             : in std_logic_vector(31 downto 0);
            warp_id_in                  : in std_logic_vector(4 downto 0);
            warp_lane_id_in             : in std_logic_vector(1 downto 0);
            cta_id_in                   : in std_logic_vector(3 downto 0);
            initial_mask_in             : in std_logic_vector(31 downto 0);
            current_mask_in             : in std_logic_vector(31 downto 0);
            shmem_base_addr_in          : in std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
            gprs_size_in                : in std_logic_vector(8 downto 0);
            gprs_base_addr_in           : in std_logic_vector(8 downto 0);
            
            mem_wr_data_a_out			: out std_logic_vector(7 downto 0);
			mem_addr_a_out				: out std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
			mem_wr_en_a_out				: out std_logic_vector(0 downto 0);
			mem_rd_data_a_in			: in  std_logic_vector(7 downto 0);
					
			mem_wr_data_b_out			: out std_logic_vector(7 downto 0);
			mem_addr_b_out				: out std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
			mem_wr_en_b_out				: out std_logic_vector(0 downto 0);
			mem_rd_data_b_in			: in  std_logic_vector(7 downto 0);
			
            program_cntr_out            : out std_logic_vector(31 downto 0);
            warp_id_out                 : out std_logic_vector(4 downto 0);
            warp_lane_id_out            : out std_logic_vector(1 downto 0);
            cta_id_out                  : out std_logic_vector(3 downto 0);
            initial_mask_out            : out std_logic_vector(31 downto 0);
            current_mask_out            : out std_logic_vector(31 downto 0);
            shmem_base_addr_out         : out std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
            gprs_size_out               : out std_logic_vector(8 downto 0);
            gprs_base_addr_out          : out std_logic_vector(8 downto 0);
            next_pc_out                 : out std_logic_vector(31 downto 0);
            instruction_out             : out std_logic_vector(63 downto 0);
            
            -- stats
            stats_reset                 : in  std_logic;
            stats_out                   : out stat_record;
    
            pipeline_stall_out          : out std_logic;
			pipeline_reg_ld	            : out std_logic
        );
    end pipeline_fetch;

architecture arch of pipeline_fetch is
    
	type fetch_state_type is (IDLE, READ_BYTES_0_1, READ_BYTES_0_1_WAIT, READ_BYTES_2_3, READ_BYTES_2_3_WAIT, READ_BYTES_4_5, READ_BYTES_4_5_WAIT, READ_BYTES_6_7, READ_BYTES_6_7_WAIT, DONE);
    signal fetch_state_machine              	: fetch_state_type;
	
    signal fetch_en_reg                         : std_logic;
    signal pass_en_reg                          : std_logic;
    signal long_instruction_en                  : std_logic;
    signal program_cntr_reg                     : std_logic_vector(31 downto 0);
    signal warp_id_reg                          : std_logic_vector(4 downto 0);
    signal warp_lane_id_reg                     : std_logic_vector(1 downto 0);
    signal cta_id_reg                           : std_logic_vector(3 downto 0);
    signal initial_mask_reg                     : std_logic_vector(31 downto 0);
    signal current_mask_reg                     : std_logic_vector(31 downto 0);
    signal shmem_base_addr_reg                  : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal gprs_size_reg                        : std_logic_vector(8 downto 0);
    signal gprs_base_addr_reg                   : std_logic_vector(8 downto 0);
    
    --
    -- Stats
    --
    signal stat_idle_cnt                            : integer range 0 to 2147483647;
    signal stat_idle_total_cnt                      : integer range 0 to 2147483647;
    signal stat_proc_cnt                            : integer range 0 to 2147483647;
    signal stat_proc_total_cnt                      : integer range 0 to 2147483647;
    signal stat_stall_cnt                           : integer range 0 to 2147483647;
    signal stat_stall_total_cnt                     : integer range 0 to 2147483647;
    
begin

    -- Memory Fetch State Machine
	pPipelineFetchStateMachine: process(clk_in)
	begin
		if (rising_edge(clk_in)) then 
            if (reset = '1') then
                mem_wr_en_a_out								<= (others => '0');
                mem_wr_en_b_out                             <= (others => '0');
--                mem_addr_a_out								<= (others => '0');
--                mem_addr_b_out								<= (others => '0');
                next_pc_out                                 <= (others => '0');
--                mem_wr_data_a_out                           <= (others => '0');
--                mem_wr_data_b_out                           <= (others => '0');
                program_cntr_out                            <= (others => '0');
--                warp_id_out                                 <= (others => '0');
--                warp_lane_id_out                            <= (others => '0');
--                cta_id_out                                  <= (others => '0');
--                initial_mask_out                            <= (others => '0');
--                current_mask_out                            <= (others => '0');
--                shmem_base_addr_out                         <= (others => '0');
--                gprs_size_out                               <= (others => '0');
--                gprs_base_addr_out                          <= (others => '0');
--                next_pc_out                                 <= (others => '0');
--                instruction_out						        <= (others => '0');
--                program_cntr_reg                            <= (others => '0');
--                warp_id_reg                                 <= (others => '0');
--                warp_lane_id_reg                            <= (others => '0');
--                cta_id_reg                                  <= (others => '0');
--                initial_mask_reg                            <= (others => '0');
--                current_mask_reg                            <= (others => '0');
--                shmem_base_addr_reg                         <= (others => '0');
--                gprs_size_reg                               <= (others => '0');
--                gprs_base_addr_reg                          <= (others => '0');
--                long_instruction_en                         <= '0';
                pipeline_stall_out                          <= '0';
--                pipeline_reg_ld						        <= '0';
                fetch_state_machine							<= IDLE;
            else
                case fetch_state_machine is 
                    when IDLE =>
                        long_instruction_en                 <= '0';
                        next_pc_out                         <= (others => '0');
                        pipeline_reg_ld				        <= '0';
                        fetch_en_reg                        <= fetch_en;
                        pass_en_reg                         <= pass_en;
                        if (fetch_en_reg = '0' and fetch_en = '1') then
                            program_cntr_reg                <= program_cntr_in;
                            warp_id_reg                     <= warp_id_in;
                            warp_lane_id_reg                <= warp_lane_id_in;
                            cta_id_reg                      <= cta_id_in;
                            initial_mask_reg                <= initial_mask_in;
                            current_mask_reg                <= current_mask_in;
                            shmem_base_addr_reg             <= shmem_base_addr_in;
                            gprs_size_reg                   <= gprs_size_in;
                            gprs_base_addr_reg              <= gprs_base_addr_in;
                            mem_addr_a_out			        <= program_cntr_in(MEM_ADDR_SIZE-1 downto 0);
                            mem_wr_en_a_out				    <= (others => '0');
                            mem_addr_b_out			        <= program_cntr_in(MEM_ADDR_SIZE-1 downto 0) + x"1";
                            mem_wr_en_b_out				    <= (others => '0');
                            pipeline_stall_out              <= '1';
                            fetch_state_machine			    <= READ_BYTES_0_1_WAIT;
                        elsif (pass_en_reg = '0' and pass_en = '1') then
                            program_cntr_reg                <= program_cntr_in;
                            warp_id_reg                     <= warp_id_in;
                            warp_lane_id_reg                <= warp_lane_id_in;
                            cta_id_reg                      <= cta_id_in;
                            initial_mask_reg                <= initial_mask_in;
                            current_mask_reg                <= current_mask_in;
                            shmem_base_addr_reg             <= shmem_base_addr_in;
                            gprs_size_reg                   <= gprs_size_in;
                            gprs_base_addr_reg              <= gprs_base_addr_in;
                            pipeline_stall_out              <= '1';
                            fetch_state_machine			    <= DONE;
                        else
                            program_cntr_reg                <= (others => '0');
                            warp_id_reg                     <= (others => '0');
                            warp_lane_id_reg                <= (others => '0');
                            cta_id_reg                      <= (others => '0');
                            initial_mask_reg                <= (others => '0');
                            current_mask_reg                <= (others => '0');
                            shmem_base_addr_reg             <= (others => '0');
                            gprs_size_reg                   <= (others => '0');
                            gprs_base_addr_reg              <= (others => '0');
                            pipeline_stall_out              <= '0';
                        end if;
                    when READ_BYTES_0_1_WAIT =>
                        pipeline_stall_out                  <= '1';
                        fetch_state_machine			        <= READ_BYTES_0_1;
                    when READ_BYTES_0_1 =>
                        instruction_out(63 downto 32)		<= (others => '0');
                        instruction_out(7 downto 0)		    <= mem_rd_data_a_in;
                        instruction_out(15 downto 8)		<= mem_rd_data_b_in;
                        mem_addr_a_out			            <= program_cntr_in(MEM_ADDR_SIZE-1 downto 0) + x"2";
                        mem_wr_en_a_out				        <= (others => '0');
                        mem_addr_b_out			            <= program_cntr_in(MEM_ADDR_SIZE-1 downto 0) + x"3";
                        mem_wr_en_b_out				        <= (others => '0');
                        long_instruction_en                 <= mem_rd_data_a_in(0);
                        fetch_state_machine			        <= READ_BYTES_2_3_WAIT;
                    when READ_BYTES_2_3_WAIT =>
                        pipeline_stall_out                  <= '1';
                        fetch_state_machine			        <= READ_BYTES_2_3;
                    when READ_BYTES_2_3 =>
                        instruction_out(63 downto 32)		<= (others => '0');
                        instruction_out(23 downto 16)		<= mem_rd_data_a_in;
                        instruction_out(31 downto 24)		<= mem_rd_data_b_in;
                        if (long_instruction_en = '1') then	-- long instruction
                            mem_addr_a_out			        <= program_cntr_in(MEM_ADDR_SIZE-1 downto 0) + x"4";
                            mem_wr_en_a_out				    <= (others => '0');
                            mem_addr_b_out			        <= program_cntr_in(MEM_ADDR_SIZE-1 downto 0) + x"5";
                            mem_wr_en_b_out				    <= (others => '0');
                            next_pc_out                     <= program_cntr_in + x"8";
                            fetch_state_machine				<= READ_BYTES_4_5_WAIT;
                        else
                            next_pc_out                     <= program_cntr_in + x"4";
                            fetch_state_machine		        <= DONE;
                        end if;
                    when READ_BYTES_4_5_WAIT =>
                        pipeline_stall_out                  <= '1';
                        fetch_state_machine			        <= READ_BYTES_4_5;
                    when READ_BYTES_4_5 =>
                        instruction_out(39 downto 32)		<= mem_rd_data_a_in;
                        instruction_out(47 downto 40)		<= mem_rd_data_b_in;
                        mem_addr_a_out			            <= program_cntr_in(MEM_ADDR_SIZE-1 downto 0) + x"6";
                        mem_wr_en_a_out				        <= (others => '0');
                        mem_addr_b_out			            <= program_cntr_in(MEM_ADDR_SIZE-1 downto 0) + x"7";
                        mem_wr_en_b_out				        <= (others => '0');
                        fetch_state_machine			        <= READ_BYTES_6_7_WAIT;
                    when READ_BYTES_6_7_WAIT =>
                        pipeline_stall_out                  <= '1';
                        fetch_state_machine			        <= READ_BYTES_6_7;
                    when READ_BYTES_6_7 =>
                        instruction_out(55 downto 48)		<= mem_rd_data_a_in;
                        instruction_out(63 downto 56)		<= mem_rd_data_b_in;
                        fetch_state_machine			        <= DONE;
                    when DONE =>
                        if (pipeline_stall_in = '0') then
                            program_cntr_out                <= program_cntr_reg;
                            warp_id_out                     <= warp_id_reg;
                            warp_lane_id_out                <= warp_lane_id_reg;
                            cta_id_out                      <= cta_id_reg;
                            initial_mask_out                <= initial_mask_reg;
                            current_mask_out                <= current_mask_reg;
                            shmem_base_addr_out             <= shmem_base_addr_reg;
                            gprs_size_out                   <= gprs_size_reg;
                            gprs_base_addr_out              <= gprs_base_addr_reg;
                            pipeline_reg_ld			        <= '1';
                            fetch_state_machine		        <= IDLE;
                        end if;
                    when others =>
                        fetch_state_machine					<= IDLE;
                end case;
            end if;
		end if;
	end process;
	
    --
    -- Stats
    --
    stats_out.total_idle            <= std_logic_vector(to_unsigned(stat_idle_total_cnt, stats_out.total_idle'length));
    stats_out.total_processing      <= std_logic_vector(to_unsigned(stat_proc_total_cnt, stats_out.total_processing'length));
    stats_out.total_stall           <= std_logic_vector(to_unsigned(stat_stall_total_cnt, stats_out.total_stall'length));
            
    pPipelineFetchStats: process(clk_in)
	begin
		if(rising_edge(clk_in)) then
            if (reset = '1' or stats_reset = '1') then
                stat_idle_cnt                       <= 0;
                stat_idle_total_cnt                 <= 0;
                stat_proc_cnt                       <= 0;
                stat_proc_total_cnt                 <= 0;
                stat_stall_cnt                      <= 0;
                stat_stall_total_cnt                <= 0;
            else
                if (fetch_state_machine = IDLE) then
                    if ((fetch_en_reg = '0' and fetch_en = '1') or (pass_en_reg = '0' and pass_en = '1')) then
                        stat_idle_cnt               <= 0;
                        stat_proc_cnt               <= stat_proc_cnt + 1;
                        stat_proc_total_cnt         <= stat_proc_total_cnt + 1;
                    else
                        stat_idle_cnt               <= stat_idle_cnt + 1;
                        stat_idle_total_cnt         <= stat_idle_total_cnt + 1;
                        stat_proc_cnt               <= 0;
                    end if;
                elsif (fetch_state_machine = DONE) then
                    if (pipeline_stall_in = '0') then
                        stat_stall_cnt              <= 0;
                    else
                        stat_stall_cnt              <= stat_stall_cnt + 1;
                        stat_stall_total_cnt        <= stat_stall_total_cnt + 1;
                    end if;
                else
                    stat_proc_cnt                   <= stat_proc_cnt + 1;
                    stat_proc_total_cnt             <= stat_proc_total_cnt + 1;
                end if;
            end if;
        end if;
    end process;
    
end arch;

