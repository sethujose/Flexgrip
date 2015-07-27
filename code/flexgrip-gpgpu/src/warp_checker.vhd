----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      warp_checker - arch 
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

    entity warp_checker is
        generic (
            SHMEM_ADDR_SIZE             : integer := 14
        );
        port (
            clk_in                      : in  std_logic;
			host_reset                  : in  std_logic;
            reset                       : in  std_logic;
            
            en                          : in  std_logic;
            
            warp_id_in                  : in  std_logic_vector(4 downto 0);
            warp_lane_id_in             : in  std_logic_vector(1 downto 0);
            cta_id_in                   : in  std_logic_vector(3 downto 0);
            initial_mask_in             : in  std_logic_vector(31 downto 0);
            current_mask_in             : in  std_logic_vector(31 downto 0);
            shmem_base_addr_in          : in  std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
            gprs_base_addr_in           : in  std_logic_vector(8 downto 0);
            next_pc_in                  : in  std_logic_vector(31 downto 0);
            warp_state_in               : in  warp_state_type;
            warps_per_block_in     		: in  std_logic_vector(5 downto 0);
            
            warp_pool_addr_out          : out std_logic_vector(4 downto 0);
			warp_pool_wr_en_out	        : out std_logic_vector(0 downto 0);
            warp_pool_wr_data_out	    : out std_logic_vector(127 downto 0);
            warp_pool_rd_data_in	    : in  std_logic_vector(127 downto 0);
            
            warp_state_addr_out         : out std_logic_vector(4 downto 0);
			warp_state_wr_en_out	    : out std_logic_vector(0 downto 0);
            warp_state_wr_data_out	    : out std_logic_vector(1 downto 0);
            warp_state_rd_data_in	    : in  std_logic_vector(1 downto 0);
            
            fence_regs_fence_en_out     : out fence_regs_std_array;
            fence_regs_fence_en_ld      : out fence_regs_std_array;
				
            fence_regs_cta_id_in        : in  fence_regs_vector_array;
            fence_regs_fence_en_in      : in  fence_regs_std_array;
            
            warps_done_mask_out         : out std_logic_vector(MAX_WARPS-1 downto 0);
			
            -- stats
            stats_reset                 : in  std_logic;
            stats_out                   : out stat_record;
            
            pipeline_stall_out          : out std_logic
        );
    end warp_checker;

architecture arch of warp_checker is

    type warp_checker_state_type is (IDLE, CHECK_FENCE_WAIT, CHECK_FENCE, SET_WARPS_ACTIVE, DONE);
    signal warp_checker_state_machine               : warp_checker_state_type;
    
    signal en_reg                                   : std_logic;
    
    signal cta_id_mask                              : std_logic_vector(MAX_WARPS-1 downto 0);
    signal cta_id_mask_rev                          : std_logic_vector(MAX_WARPS-1 downto 0);
    signal fence_id_mask                            : std_logic_vector(MAX_WARPS-1 downto 0);
    
    signal warp_id_addr                             : integer range 0 to MAX_WARPS;
    signal warp_cntr                                : std_logic_vector(4 downto 0);
    signal warps_done_mask                          : std_logic_vector(MAX_WARPS-1 downto 0);
    
    signal last_lane_id                             : std_logic_vector(1 downto 0);
    
    --
    -- Stats
    --
    signal stat_idle_cnt                            : integer range 0 to 2147483647;
    signal stat_idle_total_cnt                      : integer range 0 to 2147483647;
    signal stat_proc_cnt                            : integer range 0 to 2147483647;
    signal stat_proc_total_cnt                      : integer range 0 to 2147483647;
    
begin

    pWarpChecker: process(clk_in)
	begin
		if (rising_edge(clk_in)) then
            if (host_reset = '1' or reset = '1') then
                warp_id_addr                                                            <= 0;    
                warp_cntr                                                               <= (others => '0');
                warp_pool_addr_out                                                      <= (others => '0');
                warp_pool_wr_en_out                                                     <= (others => '0');
                warp_pool_wr_data_out                                                   <= (others => '0');
                warps_done_mask                                                         <= (others => '0');
                fence_regs_fence_en_out                                                 <= (others => '0');
                fence_regs_fence_en_ld                                                  <= (others => '0');
                warps_done_mask_out                                                     <= (others => '0');
                en_reg                                                                  <= '0';
                pipeline_stall_out                                                      <= '0';
                warp_checker_state_machine                                              <= IDLE;
            else
                case warp_checker_state_machine is
                    when IDLE =>
                        warp_cntr                                                       <= (others => '0');
                        en_reg                                                          <= en;
                        warp_id_addr                                                    <= conv_integer(warp_id_in);
                        if (en_reg = '0' and en = '1') then
                            pipeline_stall_out                                          <= '1';
                            if (warp_lane_id_in = std_logic_vector(to_unsigned(WARP_LANES-1,2))) then
                                warp_pool_addr_out                                      <= warp_id_in;
                                warp_pool_wr_en_out                                     <= (others => '1');
                                warp_pool_wr_data_out                                   <= "0000" & shmem_base_addr_in & cta_id_in & gprs_base_addr_in & '0' & next_pc_in & initial_mask_in & current_mask_in;
                                warp_state_addr_out                                     <= warp_id_in;
                                warp_state_wr_en_out                                    <= (others => '1');
                                if (warp_state_in = FINISHED) then
                                    warp_state_wr_data_out                              <= encode_warp_state(FINISHED);
                                    warps_done_mask(conv_integer(warp_id_in))           <= '1';
                                    warp_checker_state_machine                          <= DONE;
                                elsif (warp_state_in = WAITING_FENCE) then
                                    fence_regs_fence_en_out(conv_integer(warp_id_in))   <= '1';
                                    fence_regs_fence_en_ld(conv_integer(warp_id_in))    <= '1';
                                    warp_state_wr_data_out                              <= encode_warp_state(WAITING_FENCE);
                                    warp_checker_state_machine                          <= CHECK_FENCE_WAIT;
                                else
                                    warp_state_wr_data_out                              <= encode_warp_state(READY);
                                    warp_checker_state_machine                          <= DONE;
                                end if;
                            else
                                warp_checker_state_machine                              <= DONE;
                            end if;
                        else
                            pipeline_stall_out                                          <= '0';
                            warps_done_mask_out                                         <= warps_done_mask;
                            warp_pool_addr_out                                          <= (others => '0');
                            warp_pool_wr_en_out                                         <= (others => '0');
                            warp_pool_wr_data_out                                       <= (others => '0');
                            warp_state_addr_out                                         <= (others => '0');
                            warp_state_wr_en_out                                        <= (others => '0');
                            warp_state_wr_data_out                                      <= (others => '0');
                            warp_checker_state_machine                                  <= IDLE;
                        end if;
                    when CHECK_FENCE_WAIT =>
                        warp_pool_addr_out                                              <= (others => '0');
                        warp_pool_wr_en_out                                             <= (others => '0');
                        warp_pool_wr_data_out                                           <= (others => '0');
                        warp_state_addr_out                                             <= (others => '0');
                        warp_state_wr_en_out                                            <= (others => '0');
                        warp_state_wr_data_out                                          <= (others => '0');
                        fence_regs_fence_en_ld(warp_id_addr)                            <= '0';
                        warp_checker_state_machine                                      <= CHECK_FENCE;
                    when CHECK_FENCE =>
                        if (cta_id_mask_rev = fence_id_mask) then
                            warp_checker_state_machine                                  <= SET_WARPS_ACTIVE;
                        else
                            warp_checker_state_machine                                  <= DONE;
                        end if;
                    when SET_WARPS_ACTIVE =>
                        if (conv_integer(warp_cntr) < MAX_WARPS) then
                            if (cta_id_mask_rev(conv_integer(warp_cntr)) = '1') then
                                fence_regs_fence_en_out(conv_integer(warp_cntr))   		<= '0';
                                fence_regs_fence_en_ld(conv_integer(warp_cntr))    		<= '1';
                                warp_state_addr_out                                     <= warp_cntr;
                                warp_state_wr_en_out                                    <= (others => '1');
                                warp_state_wr_data_out                                  <= encode_warp_state(READY);
                            else
                                warp_state_wr_en_out                                    <= (others => '0');
                            end if;
                            warp_cntr                                                   <= warp_cntr + "01";
                        else
                            warp_cntr                                                   <= (others => '0');
                            warp_checker_state_machine                                  <= DONE;
                        end if;
                    when DONE =>
                        pipeline_stall_out                                              <= '0';
                        warp_pool_addr_out                                              <= (others => '0');
                        warp_pool_wr_en_out                                             <= (others => '0');
                        warp_pool_wr_data_out                                           <= (others => '0');
                        warp_state_addr_out                                             <= (others => '0');
                        warp_state_wr_en_out                                            <= (others => '0');
                        warp_state_wr_data_out                                          <= (others => '0');
                        warps_done_mask_out                                             <= warps_done_mask;
                        warp_checker_state_machine                                      <= IDLE;
                    when others =>
                        warp_checker_state_machine                                      <= IDLE;
                end case;
            end if;
        end if;
    end process;
        
    gCheckFence: for i in 0 to MAX_WARPS-1 generate
		  cta_id_mask(i)      <= '1' when (fence_regs_cta_id_in(i) = cta_id_in) else '0';
		  fence_id_mask(i)    <= fence_regs_fence_en_in(i) when (fence_regs_cta_id_in(i) = cta_id_in) else '0';
    end generate;
	 
	
	with cta_id_in select
		cta_id_mask_rev <=
			ext (cta_id_mask(conv_integer(warps_per_block_in) - 1 downto 0), MAX_WARPS)  when "0000",
			cta_id_mask																	when others;
	
    --
    -- Stats
    --
    stats_out.total_idle            <= std_logic_vector(to_unsigned(stat_idle_total_cnt, stats_out.total_idle'length));
    stats_out.total_processing      <= std_logic_vector(to_unsigned(stat_proc_total_cnt, stats_out.total_processing'length));
    stats_out.total_stall           <= (others => '0');
    
    pWarpCheckerStats: process(clk_in)
	begin
		if (rising_edge(clk_in)) then
            if (host_reset = '1' or stats_reset = '1') then
                stat_idle_cnt                       <= 0;
                stat_idle_total_cnt                 <= 0;
                stat_proc_cnt                       <= 0;
                stat_proc_total_cnt                 <= 0;
            else
                if (warp_checker_state_machine = IDLE) then
                    if (en_reg = '0' and en = '1') then
                        stat_idle_cnt               <= 0;
                        stat_proc_cnt               <= stat_proc_cnt + 1;
                        stat_proc_total_cnt         <= stat_proc_total_cnt + 1;
                    else
                        stat_idle_cnt               <= stat_idle_cnt + 1;
                        stat_idle_total_cnt         <= stat_idle_total_cnt + 1;
                        stat_proc_cnt               <= 0;
                    end if;
                else
                    stat_proc_cnt                   <= stat_proc_cnt + 1;
                    stat_proc_total_cnt             <= stat_proc_total_cnt + 1;
                end if;
            end if;
        end if;
    end process;
                        
end arch;

