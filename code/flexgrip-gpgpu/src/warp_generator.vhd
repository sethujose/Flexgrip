----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      warp_generator - arch 
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

library warp_id_calc_lib;

library unisim;
use unisim.vcomponents.all;

use work.gpgpu_package.all;

    entity warp_generator is
        generic (
            SHMEM_ADDR_SIZE         : integer := 14
        );
        port (
            clk_in                  : in  std_logic;
            host_reset              : in  std_logic;
            
            en                      : in  std_logic;
            
            threads_per_block_in    : in  std_logic_vector(11 downto 0);
            num_blocks_in           : in  std_logic_vector(3 downto 0);
            warps_per_block_in      : in  std_logic_vector(5 downto 0);
            shmem_base_addr_in      : in  std_logic_vector(31 downto 0);
            shmem_size_in           : in  std_logic_vector(31 downto 0);
            gprs_size_in            : in  std_logic_vector(8 downto 0);
            
            warp_pool_addr_out      : out std_logic_vector(4 downto 0);
			warp_pool_wr_en_out	    : out std_logic_vector(0 downto 0);
            warp_pool_wr_data_out	: out std_logic_vector(127 downto 0);
            
            warp_state_addr_out     : out std_logic_vector(4 downto 0);
			warp_state_wr_en_out    : out std_logic_vector(0 downto 0);
            warp_state_wr_data_out	: out std_logic_vector(1 downto 0);
            
            fence_regs_cta_id_out   : out fence_regs_vector_array;
            fence_regs_cta_id_ld    : out fence_regs_std_array;
            
            fence_regs_fence_en_out : out fence_regs_std_array;
            fence_regs_fence_en_ld  : out fence_regs_std_array;
            
            num_warps_out           : out std_logic_vector(4 downto 0);
            num_warps_ld            : out std_logic;
            
            -- stats
            stats_reset             : in  std_logic;
            stats_out               : out stat_record;
            
            done                    : out std_logic
        );
    end warp_generator;

architecture arch of warp_generator is

    component warp_id_calc  
        port (
            ce_1                    : in std_logic; 
            clk_1                   : in std_logic; 
            en                      : in std_logic;
            block_num_in            : in std_logic_vector(3 downto 0); 
            gprs_size_in            : in std_logic_vector(8 downto 0); 
            warp_num_in             : in std_logic_vector(4 downto 0); 
            warps_per_block_in      : in std_logic_vector(5 downto 0); 
            data_valid_out          : out std_logic; 
            gprs_base_addr_out      : out std_logic_vector(8 downto 0); 
            warp_id_out             : out std_logic_vector(4 downto 0)
        );
    end component;

    type warp_generator_state_type is (IDLE, CALC_WARP_ID, CALC_WARP_ID_WAIT, WRITE_WARP, WARP_GEN_COMPLETE);
    signal warp_generator_state_machine             : warp_generator_state_type;
    signal warp_state_i                             : warp_state_type;
    
    constant use_npc                                : std_logic := '0';
    constant initial_mask                           : std_logic_vector(31 downto 0) := x"FFFFFFFF";
    constant current_mask                           : std_logic_vector(31 downto 0) := x"FFFFFFFF";
    constant next_pc                                : std_logic_vector(31 downto 0) := x"00000000";
    
    signal en_reg                                   : std_logic; 
    
    signal block_num_cnt                            : std_logic_vector(3 downto 0);
    signal warps_per_block_cnt                      : std_logic_vector(11 downto 0);
    
    signal warp_id                                  : std_logic_vector(4 downto 0);
    signal warp_id_reg                              : std_logic_vector(4 downto 0);
    signal gprs_base_addr                           : std_logic_vector(8 downto 0);
    
    signal threads_per_block_i                      : std_logic_vector(11 downto 0);
    signal num_blocks_i                             : std_logic_vector(3 downto 0);
    signal warp_size_i                              : std_logic_vector(5 downto 0); 
    
    signal warp_id_calc_en_i                        : std_logic; 
    signal block_num_i                              : std_logic_vector(3 downto 0);
    signal shmem_base_addr_i                        : std_logic_vector(31 downto 0);
    signal shmem_size_i                             : std_logic_vector(31 downto 0);
    signal shmem_addr_i                             : std_logic_vector(35 downto 0);
    signal gprs_size_i                              : std_logic_vector(8 downto 0); 
    signal warp_num_i                               : std_logic_vector(4 downto 0); 
    signal warps_per_block_i                        : std_logic_vector(5 downto 0);
    signal warp_id_calc_dv_o                        : std_logic;
    signal gprs_base_addr_o                         : std_logic_vector(8 downto 0); 
    signal warp_id_o                                : std_logic_vector(4 downto 0);
    
    signal warp_id_addr                             : integer range 0 to MAX_WARPS;
    
    --
    -- Stats
    --
    signal stat_idle_cnt                            : integer range 0 to 2147483647;
    signal stat_idle_total_cnt                      : integer range 0 to 2147483647;
    signal stat_proc_cnt                            : integer range 0 to 2147483647;
    signal stat_proc_total_cnt                      : integer range 0 to 2147483647;
    
begin
    
    pWarpGeneratorStateMachine: process(clk_in)
	begin
		if(rising_edge(clk_in)) then 
            if (host_reset = '1') then
                warp_pool_wr_en_out					            <= (others => '0');
                warp_pool_addr_out						        <= (others => '0');
                warp_pool_wr_data_out                           <= (others => '0');
                warp_state_wr_data_out                          <= (others => '0');
                warp_state_addr_out                             <= (others => '0');
                warp_state_wr_en_out                            <= (others => '0');
                en_reg                                          <= '0';
                threads_per_block_i                             <= (others => '0');
                num_blocks_i                                    <= (others => '0');
                shmem_base_addr_i                               <= (others => '0');
                shmem_size_i                                    <= (others => '0');
                shmem_addr_i                                    <= (others => '0');
                warps_per_block_i                               <= (others => '0');
                warp_size_i                                     <= (others => '0');
                warps_per_block_i                               <= (others => '0');
                block_num_cnt                                   <= (others => '0');
                warps_per_block_cnt                             <= (others => '0');
                block_num_i                                     <= (others => '0');
                warp_num_i                                      <= (others => '0');
                gprs_size_i                                     <= (others => '0');
                warp_id_calc_en_i                               <= '0';
                warp_id                                         <= (others => '0');
                gprs_base_addr                                  <= (others => '0');
                num_warps_ld                                    <= '0';
                warp_state_i                                    <= READY;
                num_warps_out                                   <= (others => '0');
                done                                            <= '0';
                warp_generator_state_machine			        <= IDLE;
            else
                case warp_generator_state_machine is 
                    when IDLE =>
                        warp_pool_wr_en_out					    <= (others => '0');
                        warp_pool_addr_out						<= (others => '0');
                        warp_pool_wr_data_out                   <= (others => '0');
                        warp_state_wr_data_out                  <= (others => '0');
                        warp_state_addr_out                     <= (others => '0');
                        warp_state_wr_en_out                    <= (others => '0');
                        fence_regs_cta_id_out                   <= (others => (others => '0'));
                        fence_regs_cta_id_ld                    <= (others => '0');
                        fence_regs_fence_en_out                 <= (others => '0');
                        fence_regs_fence_en_ld                  <= (others => '0');
                        threads_per_block_i                     <= (others => '0');
                        warp_size_i                             <= (others => '0');
                        block_num_cnt                           <= (others => '0');
                        warps_per_block_cnt                     <= (others => '0');
                        block_num_i                             <= (others => '0');
                        warp_num_i                              <= (others => '0');
                        gprs_size_i                             <= (others => '0');
                        shmem_addr_i                            <= (others => '0');
                        warp_id_calc_en_i                       <= '0';
                        warp_id                                 <= (others => '0');
                        warp_id_reg                             <= (others => '0');
                        gprs_base_addr                          <= (others => '0');
                        num_warps_ld                            <= '0';
                        warp_state_i                            <= READY;
                        num_warps_out                           <= (others => '0');
                        done                                    <= '0';
                        en_reg                                  <= en;
                        if (en_reg = '0' and en = '1') then
                            threads_per_block_i                 <= threads_per_block_in;
                            num_blocks_i                        <= num_blocks_in;
                            shmem_base_addr_i                   <= shmem_base_addr_in;
                            shmem_size_i                        <= shmem_size_in;
                            warps_per_block_i                   <= warps_per_block_in;
                            warp_generator_state_machine        <= CALC_WARP_ID;
                        end if;
                    when CALC_WARP_ID =>
                        warp_pool_wr_en_out                     <= (others => '0');
                        warp_state_wr_en_out                    <= (others => '0');
                        fence_regs_cta_id_out                   <= (others => (others => '0'));
                        fence_regs_cta_id_ld                    <= (others => '0');
                        fence_regs_fence_en_out                 <= (others => '0');
                        fence_regs_fence_en_ld                  <= (others => '0');
                        if (block_num_cnt < num_blocks_i) then
                            if (warps_per_block_cnt < warps_per_block_i) then
                                block_num_i                     <= block_num_cnt;
                                shmem_addr_i                    <= shmem_base_addr_i + (block_num_cnt * shmem_size_i);
                                warp_num_i                      <= warps_per_block_cnt(4 downto 0);
                                gprs_size_i                     <= gprs_size_in;
                                warp_id_calc_en_i               <= '1';
                                warps_per_block_cnt             <= warps_per_block_cnt + "01";
                                warp_generator_state_machine    <= CALC_WARP_ID_WAIT;
                            else
                                warps_per_block_cnt             <= (others => '0');
                                block_num_cnt                   <= block_num_cnt + "01";
                            end if;
                        else
                            warp_id_reg                         <= warp_id;
                            warp_generator_state_machine        <= WARP_GEN_COMPLETE;
                        end if;
                    when CALC_WARP_ID_WAIT =>
                        warp_id_calc_en_i                       <= '0';
                        if (warp_id_calc_dv_o = '1') then
                            warp_id                             <= warp_id_o;
                            warp_id_addr                        <= conv_integer(warp_id_o);
                            gprs_base_addr                      <= gprs_base_addr_o;
                            warp_generator_state_machine        <= WRITE_WARP;
                        end if;
                    when WRITE_WARP =>                          --              14 (123 - 110)                          4 (109-106)    9 (105-97)       1 (96)  32 (95-64) 32 (63-32)      32 (31-0)
                        warp_pool_wr_data_out                   <= "0000" & shmem_addr_i(SHMEM_ADDR_SIZE-1 downto 0) &  block_num_i & gprs_base_addr & use_npc & next_pc & initial_mask & current_mask;
                        warp_pool_addr_out                      <= warp_id;
                        warp_pool_wr_en_out                     <= (others => '1');
                        warp_state_wr_data_out                  <= encode_warp_state(warp_state_i);
                        warp_state_addr_out                     <= warp_id;
                        warp_state_wr_en_out                    <= (others => '1');
                        fence_regs_cta_id_out(warp_id_addr)     <= block_num_i;
                        fence_regs_cta_id_ld(warp_id_addr)      <= '1';
                        fence_regs_fence_en_out(warp_id_addr)   <= '0';
                        fence_regs_fence_en_ld(warp_id_addr)    <= '1';
                        warp_generator_state_machine            <= CALC_WARP_ID;
                    when WARP_GEN_COMPLETE =>
                        num_warps_out                           <= warp_id_reg + "01";
                        num_warps_ld                            <= '1';
                        done                                    <= '1';
                        warp_generator_state_machine		    <= IDLE;
                    when others =>
                        warp_generator_state_machine		    <= IDLE;
                end case;
            end if;
		end if;
	end process;
    
    uWarpIdCalc : warp_id_calc
        port map (
            ce_1                        => '1',
            clk_1                       => clk_in,
            en                          => warp_id_calc_en_i,
            block_num_in                => block_num_i,
            gprs_size_in                => gprs_size_i,
            warp_num_in                 => warp_num_i,
            warps_per_block_in          => warps_per_block_i,
            data_valid_out              => warp_id_calc_dv_o,
            warp_id_out                 => warp_id_o,
            gprs_base_addr_out          => gprs_base_addr_o
        );

    --
    -- Stats
    --
    stats_out.total_idle            <= std_logic_vector(to_unsigned(stat_idle_total_cnt, stats_out.total_idle'length));
    stats_out.total_processing      <= std_logic_vector(to_unsigned(stat_proc_total_cnt, stats_out.total_processing'length));
    stats_out.total_stall           <= (others => '0');
    
    pWarpGeneratorStats: process(clk_in)
	begin
		if(rising_edge(clk_in)) then
            if (host_reset = '1' or stats_reset = '1') then
                stat_idle_cnt                       <= 0;
                stat_idle_total_cnt                 <= 0;
                stat_proc_cnt                       <= 0;
                stat_proc_total_cnt                 <= 0;
            else
                if (warp_generator_state_machine = IDLE) then
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

