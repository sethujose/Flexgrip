----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      streaming_multiprocessor_cntlr - arch 
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
--use IEEE.numeric_std.all;

library thread_id_calc_lib;
library warp_per_block_calc_lib;
library block_id_calc_lib;

library unisim;
use unisim.vcomponents.all;

use work.gpgpu_package.all;

    entity streaming_multiprocessor_cntlr is
        generic (
            SHMEM_ADDR_SIZE                 : integer := 14
        );
        port (
            clk_in                          : in  std_logic;
            host_reset                      : in  std_logic;
            
            smp_run_en                      : in  std_logic;
            warp_generator_done             : in  std_logic;
            warp_scheduler_done             : in  std_logic;
            
            threads_per_block_in            : in  std_logic_vector(11 downto 0);
            num_blocks_in                   : in  std_logic_vector(3 downto 0);
            shmem_base_addr_in              : in  std_logic_vector(31 downto 0);
            shmem_size_in                   : in  std_logic_vector(31 downto 0);
            parameter_size_in               : in  std_logic_vector(15 downto 0);
            gprs_size_in                    : in  std_logic_vector(8 downto 0);
            block_x_in                      : in  std_logic_vector(15 downto 0);
            block_y_in                      : in  std_logic_vector(15 downto 0);
            block_z_in                      : in  std_logic_vector(15 downto 0);
            grid_x_in                       : in  std_logic_vector(15 downto 0);
            grid_y_in                       : in  std_logic_vector(15 downto 0);
            block_idx_in                    : in  std_logic_vector(15 downto 0);
            
            gpgpu_config_reg_cs_out         : out std_logic;
            gpgpu_config_reg_rw_out         : out std_logic;
            gpgpu_config_reg_adr_out        : out std_logic_vector(31 downto 0);
            gpgpu_config_reg_rd_data_in     : in  std_logic_vector(31 downto 0);
            gpgpu_config_reg_wr_data_out    : out std_logic_vector(31 downto 0);
            
            shmem_addr_out                  : out std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
            shmem_wr_en_out                 : out std_logic_vector(0 downto 0);
            shmem_wr_data_out               : out std_logic_vector(7 downto 0);
            shmem_rd_data_in                : in  std_logic_vector(7 downto 0);

            gprs_base_addr_out              : out gprs_addr_array; 
            gprs_reg_num_out                : out gprs_reg_array;
            gprs_lane_id_out                : out warp_lane_id_array; 
            gprs_wr_en_out                  : out wr_en_array;
            gprs_wr_data_out                : out vector_register;
            gprs_rd_data_in                 : in  vector_register;
            
            warps_per_block_out             : out std_logic_vector(5 downto 0);
            warps_per_block_ld              : out std_logic;
            
            smp_configuration_en            : out std_logic;
            warp_generator_en               : out std_logic;
            smp_done                        : out std_logic
        );    
    end streaming_multiprocessor_cntlr;

architecture arch of streaming_multiprocessor_cntlr is
    
    component block_id_calc  
        port (
            clk_1           : in std_logic;
            ce_1            : in std_logic;
            en              : in std_logic; 
            block_idx_in    : in std_logic_vector(15 downto 0); 
            grid_x_in       : in std_logic_vector(15 downto 0); 
            idx_in          : in std_logic_vector(15 downto 0); 
            block_id_x_out  : out std_logic_vector(15 downto 0); 
            block_id_y_out  : out std_logic_vector(15 downto 0);
            valid           : out std_logic
        );
    end component;
    
    component warps_per_block_calc  
        port (
            clk_1                   : in std_logic;
            ce_1                    : in std_logic;
            en                      : in std_logic; 
            threads_per_block_in    : in std_logic_vector(11 downto 0); 
            warp_size_in            : in std_logic_vector(5 downto 0);
            warps_per_block_out     : out std_logic_vector(5 downto 0);
            data_valid_out          : out std_logic  
        );
    end component;
    
    component thread_id_calc  
        port (
            clk_1                   : in std_logic; 
            ce_1                    : in std_logic; 
            en                      : in std_logic;
            block_x_in              : in std_logic_vector(15 downto 0); 
            block_y_in              : in std_logic_vector(15 downto 0); 
            block_z_in              : in std_logic_vector(15 downto 0);  
            num_cores_in            : in std_logic_vector(7 downto 0); 
            warp_size_in            : in std_logic_vector(5 downto 0); 
            warps_per_block_in      : in std_logic_vector(5 downto 0);
            block_indx_in           : in std_logic_vector(15 downto 0); 
            x_indx_in               : in std_logic_vector(15 downto 0); 
            y_indx_in               : in std_logic_vector(15 downto 0); 
            z_indx_in               : in std_logic_vector(15 downto 0);
            thread_id_out           : out std_logic_vector(31 downto 0); 
            thread_lane_id_out      : out std_logic_vector(7 downto 0); 
            warp_id_out             : out std_logic_vector(31 downto 0); 
            warp_lane_id_out        : out std_logic_vector(5 downto 0);
            data_valid              : out std_logic
        );
    end component;
    
    constant HEADER_SIZE                        : integer := 16;
    constant PARAM_SIZE                         : integer := 16;
    
    type smp_cntlr_state_type is (IDLE, CALC_BLOCK_IDS, CALC_BLOCK_IDS_WAIT, WRITE_BLOCK_IDS_SHMEM_1, WRITE_BLOCK_IDS_SHMEM_2, 
                                  READ_SHMEM_PARAMS, READ_SHMEM_PARAMS_WAIT, WRITE_PARAMS_SHMEM_1, WRITE_PARAMS_SHMEM_2,
                                  WRITE_PARAMS_SHMEM_3, WRITE_PARAMS_SHMEM_4, CALC_WARPS_PER_BLOCK, CALC_WARPS_PER_BLOCK_WAIT, 
                                  WARP_GEN_WAIT, CALC_THREAD_IDS_BLOCK_INC, CALC_THREAD_IDS, CALC_THREAD_IDS_WAIT, 
                                  CALC_THREAD_IDS_WRITE, WARP_SCHED_WAIT);
    signal smp_cntlr_state_machine              : smp_cntlr_state_type;
    
    type header_data_array is array (HEADER_SIZE-1 downto 0) of std_logic_vector(15 downto 0);
    signal header_data_i                        : header_data_array;
    
    signal write_data_cnt                       : integer range 0 to (HEADER_SIZE+PARAM_SIZE);
	signal header_index						    : integer range 0 to HEADER_SIZE;
    signal block_id_calc_en                     : std_logic;
    signal num_blocks_i                         : std_logic_vector(3 downto 0);
    signal parameter_size_i                     : std_logic_vector(15 downto 0);
    signal block_x_i                            : std_logic_vector(15 downto 0);
    signal block_y_i                            : std_logic_vector(15 downto 0);
    signal block_z_i                            : std_logic_vector(15 downto 0);
    signal grid_x_i                             : std_logic_vector(15 downto 0);
    signal grid_y_i                             : std_logic_vector(15 downto 0);
    signal block_idx_i                          : std_logic_vector(15 downto 0);
    signal idx_i                                : std_logic_vector(15 downto 0);
    signal shmem_param_idx_i                    : std_logic_vector(15 downto 0);
    signal block_id_x_o                         : std_logic_vector(15 downto 0); 
    signal block_id_y_o                         : std_logic_vector(15 downto 0);       
    signal block_id_calc_valid                  : std_logic;
    
    signal warps_per_block_en                   : std_logic; 
    signal threads_per_block_i                  : std_logic_vector(11 downto 0); 
    signal warp_size_i                          : std_logic_vector(5 downto 0);
    signal warps_per_block_o                    : std_logic_vector(5 downto 0);
    signal warps_per_block_i                    : std_logic_vector(5 downto 0);
    signal warps_per_block_dv                   : std_logic;
    
    signal thread_id_calc_en                    : std_logic;
    signal shmem_addr_i                         : std_logic_vector(47 downto 0);
    signal gprs_size_i                          : std_logic_vector(8 downto 0);
    signal num_cores_i                          : std_logic_vector(7 downto 0);
    signal x_indx_i                             : std_logic_vector(15 downto 0); 
    signal y_indx_i                             : std_logic_vector(15 downto 0); 
    signal z_indx_i                             : std_logic_vector(15 downto 0);
    signal thread_id_o                          : std_logic_vector(31 downto 0); 
    signal thread_lane_id_o                     : std_logic_vector(7 downto 0); 
    signal warp_id_o                            : std_logic_vector(31 downto 0); 
    signal warp_lane_id_o                       : std_logic_vector(5 downto 0);
    signal thread_id_i                          : std_logic_vector(31 downto 0);
    signal thread_lane_id_i                     : integer range 0 to CORES;
    signal gprs_base_addr_i                     : std_logic_vector(40 downto 0);
    signal warp_lane_id_i                       : std_logic_vector(5 downto 0);
    signal thread_id_calc_dv                    : std_logic;
            
    signal warp_generator_done_reg              : std_logic;
    signal warp_scheduler_done_reg              : std_logic;
    signal smp_run_en_reg                       : std_logic;
    signal flag			                        : std_logic;
            
begin

    pSMPCntlrStateMachine: process(clk_in)
        variable x_cnt                                          : std_logic_vector(15 downto 0); 
        variable y_cnt                                          : std_logic_vector(15 downto 0); 
        variable z_cnt                                          : std_logic_vector(15 downto 0);
	begin
		if(rising_edge(clk_in)) then 
            if (host_reset = '1') then
                warp_generator_done_reg                             <= '0';
                warp_scheduler_done_reg                             <= '0';
                smp_run_en_reg                                      <= '0';
                gpgpu_config_reg_cs_out                             <= '0';
                gpgpu_config_reg_rw_out                             <= '1';
                smp_cntlr_state_machine			                    <= IDLE;
            else
                case smp_cntlr_state_machine is 
                    when IDLE =>
                        block_id_calc_en                            <= '0';
                        shmem_addr_i                                <= (others => '0');
                        idx_i                                       <= (others => '0');
                        shmem_param_idx_i                           <= (others => '0');
                        header_data_i                               <= (others => (others => '0'));
                        shmem_wr_en_out                             <= (others => '0');
                        shmem_wr_data_out                           <= (others => '0');
                        gpgpu_config_reg_cs_out                     <= '0';
                        gpgpu_config_reg_rw_out                     <= '1';
                        gpgpu_config_reg_adr_out                    <= (others => '0');
                        write_data_cnt                              <= 0;
                        header_index                           	    <= 0;
                        warps_per_block_i                           <= (others => '0');
                        warps_per_block_en                          <= '0';
                        warps_per_block_out                         <= (others => '0');
                        warps_per_block_ld                          <= '0';
                        thread_id_calc_en                           <= '0';
                        x_cnt                                       := (others => '0');
                        y_cnt                                       := (others => '0'); 
                        z_cnt                                       := (others => '0');
                        x_indx_i                                    <= (others => '0'); 
                        y_indx_i                                    <= (others => '0');
                        z_indx_i                                    <= (others => '0');
                        thread_lane_id_i                            <= 0;
                        gprs_base_addr_i                            <= (others => '0');
                        warp_lane_id_i                              <= (others => '0');
                        smp_configuration_en                        <= '1';
                        smp_done                                    <= '0';
                        warp_generator_en                           <= '0';
                        flag	                                     <= '0';
                        smp_run_en_reg                              <= smp_run_en;
                        if (smp_run_en_reg = '0' and smp_run_en = '1') then
                            threads_per_block_i                     <= threads_per_block_in;
                            num_blocks_i                            <= num_blocks_in;
                            parameter_size_i                        <= parameter_size_in;
                            block_x_i                               <= block_x_in;
                            block_y_i                               <= block_y_in;
                            block_z_i                               <= block_z_in;
                            grid_x_i                                <= grid_x_in;
                            grid_y_i                                <= grid_y_in;
                            block_idx_i                             <= block_idx_in;
                            gprs_size_i                             <= gprs_size_in;
                            num_cores_i                             <= conv_std_logic_vector(CORES, 8);
                            warp_size_i                             <= WARP_SIZE;
                            smp_cntlr_state_machine                 <= CALC_BLOCK_IDS;
                        end if;
                    when CALC_BLOCK_IDS =>
                        write_data_cnt                              <= 0;
                        header_index                           	    <= 0;
                        shmem_wr_en_out                             <= (others => '0');
                        shmem_wr_data_out                           <= (others => '0');
                        if (idx_i < num_blocks_i) then
                            block_id_calc_en                        <= '1';
                            shmem_addr_i                            <= (shmem_base_addr_in + (shmem_size_in * idx_i));
                            header_data_i(0)                        <= x"0000";
                            header_data_i(1)                        <= block_x_i;
                            header_data_i(2)                        <= block_y_i;
                            header_data_i(3)                        <= block_z_i;
                            header_data_i(4)                        <= grid_x_i;
                            header_data_i(5)                        <= grid_y_i;
                            smp_cntlr_state_machine                 <= CALC_BLOCK_IDS_WAIT;
                        else
                            smp_cntlr_state_machine                 <= CALC_WARPS_PER_BLOCK;
                        end if;
                    when CALC_BLOCK_IDS_WAIT =>
                        block_id_calc_en                            <= '0';
                        if (block_id_calc_valid = '1') then
                            header_data_i(6)                        <= block_id_x_o;
                            header_data_i(7)                        <= block_id_y_o;
                            idx_i                                   <= idx_i + "01";
                            smp_cntlr_state_machine                 <= WRITE_BLOCK_IDS_SHMEM_1;
                        end if;
                    when WRITE_BLOCK_IDS_SHMEM_1 =>
                        shmem_wr_en_out                             <= (others => '1');
                        shmem_wr_data_out                           <= header_data_i(header_index)(7 downto 0);
                        shmem_addr_out             			        <= shmem_addr_i(SHMEM_ADDR_SIZE-1 downto 0) + conv_std_logic_vector(write_data_cnt, SHMEM_ADDR_SIZE);
                        write_data_cnt                              <= write_data_cnt + 1;
                        smp_cntlr_state_machine                     <= WRITE_BLOCK_IDS_SHMEM_2;
                    when WRITE_BLOCK_IDS_SHMEM_2 =>
                        shmem_wr_en_out                             <= (others => '1');
                        shmem_wr_data_out                           <= header_data_i(header_index)(15 downto 8);
                        shmem_addr_out             					<= shmem_addr_i(SHMEM_ADDR_SIZE-1 downto 0) + conv_std_logic_vector(write_data_cnt, SHMEM_ADDR_SIZE);
                        if (write_data_cnt < HEADER_SIZE-1) then
                            write_data_cnt                          <= write_data_cnt + 1;
                            header_index                            <= header_index + 1;
                            smp_cntlr_state_machine                 <= WRITE_BLOCK_IDS_SHMEM_1;
                        else
                            smp_cntlr_state_machine                 <= READ_SHMEM_PARAMS;
                        end if;
                    when READ_SHMEM_PARAMS =>
                        shmem_wr_en_out                             <= (others => '0');
                        shmem_wr_data_out                           <= (others => '0');
                        shmem_addr_out                              <= (others => '0');
                        if (shmem_param_idx_i < parameter_size_i) then
                            gpgpu_config_reg_cs_out                 <= '1';
                            gpgpu_config_reg_adr_out                <= CONFIG_PARAMS_START + shmem_param_idx_i; 
                            smp_cntlr_state_machine                 <= READ_SHMEM_PARAMS_WAIT;
                         else
                            shmem_param_idx_i                       <= (others => '0');
                            gpgpu_config_reg_cs_out                 <= '0';
                            smp_cntlr_state_machine                 <= CALC_BLOCK_IDS;
                         end if;
                    when READ_SHMEM_PARAMS_WAIT =>
                        shmem_param_idx_i                           <= shmem_param_idx_i + "01";
                        write_data_cnt                              <= write_data_cnt + 1;
                        smp_cntlr_state_machine                     <= WRITE_PARAMS_SHMEM_1;   
                    when WRITE_PARAMS_SHMEM_1 =>
                        shmem_wr_en_out                             <= (others => '1');
                        shmem_wr_data_out                           <= gpgpu_config_reg_rd_data_in(7 downto 0);
                        shmem_addr_out             				    <= shmem_addr_i(SHMEM_ADDR_SIZE-1 downto 0) + conv_std_logic_vector(write_data_cnt, SHMEM_ADDR_SIZE);
                        write_data_cnt                              <= write_data_cnt + 1;
                        smp_cntlr_state_machine                     <= WRITE_PARAMS_SHMEM_2;
                    when WRITE_PARAMS_SHMEM_2 =>
                        shmem_wr_en_out                             <= (others => '1');
                        shmem_wr_data_out                           <= gpgpu_config_reg_rd_data_in(15 downto 8);
                        shmem_addr_out             				    <= shmem_addr_i(SHMEM_ADDR_SIZE-1 downto 0) + conv_std_logic_vector(write_data_cnt, SHMEM_ADDR_SIZE);
                        write_data_cnt                              <= write_data_cnt + 1;
                        smp_cntlr_state_machine                     <= WRITE_PARAMS_SHMEM_3;
                    when WRITE_PARAMS_SHMEM_3 =>
                        shmem_wr_en_out                             <= (others => '1');
                        shmem_wr_data_out                           <= gpgpu_config_reg_rd_data_in(23 downto 16);
                        shmem_addr_out             				    <= shmem_addr_i(SHMEM_ADDR_SIZE-1 downto 0) + conv_std_logic_vector(write_data_cnt, SHMEM_ADDR_SIZE);
                        write_data_cnt                              <= write_data_cnt + 1;
                        smp_cntlr_state_machine                     <= WRITE_PARAMS_SHMEM_4;
                    when WRITE_PARAMS_SHMEM_4 =>
                        shmem_wr_en_out                             <= (others => '1');
                        shmem_wr_data_out                           <= gpgpu_config_reg_rd_data_in(31 downto 24);
                        shmem_addr_out             				    <= shmem_addr_i(SHMEM_ADDR_SIZE-1 downto 0) + conv_std_logic_vector(write_data_cnt, SHMEM_ADDR_SIZE);
                        smp_cntlr_state_machine                     <= READ_SHMEM_PARAMS;
                    when CALC_WARPS_PER_BLOCK =>
                        warps_per_block_en                          <= '1';
                        smp_cntlr_state_machine                     <= CALC_WARPS_PER_BLOCK_WAIT;
                    when CALC_WARPS_PER_BLOCK_WAIT =>
                        warps_per_block_en                          <= '0';
                        if (warps_per_block_dv = '1') then
                            idx_i                                   <= (others => '0');
                            warps_per_block_i                       <= warps_per_block_o;
                            warps_per_block_out                     <= warps_per_block_o;
                            warps_per_block_ld                      <= '1';
                            smp_cntlr_state_machine                 <= CALC_THREAD_IDS;
                        end if;
                    when CALC_THREAD_IDS_BLOCK_INC =>
                        if (idx_i < num_blocks_i) then
                            smp_cntlr_state_machine                 <= CALC_THREAD_IDS;
                            flag                                    <= '0';
                        else
                            if (flag = '0') then
                                thread_id_calc_en              		<= '1';
                                smp_cntlr_state_machine             <= CALC_THREAD_IDS_WAIT;
                                flag 							    <= '1';
                            else									 
                                warp_generator_en                   <= '1';
                                smp_cntlr_state_machine             <= WARP_GEN_WAIT;
                            end if;
                        end if;
                    when CALC_THREAD_IDS =>
                        gprs_wr_en_out(thread_lane_id_i)            <= '0';
                        warps_per_block_ld                          <= '0';
                        if (x_cnt < block_x_i) then
                            x_cnt                                   := x_cnt + "01";
                            x_indx_i                                <= x_cnt - "01";
                            y_indx_i                                <= y_cnt;
                            z_indx_i                                <= z_cnt;
                            thread_id_calc_en                       <= '1';
                            smp_cntlr_state_machine                 <= CALC_THREAD_IDS_WAIT;
                        else
                            x_cnt                                   := x"0001";
                            y_cnt                                   := y_cnt + "01";
                            if (y_cnt < block_y_i) then
                                x_indx_i                            <= x_cnt - "01";
                                y_indx_i                            <= y_cnt;
                                z_indx_i                            <= z_cnt;
                                thread_id_calc_en                   <= '1';
                                smp_cntlr_state_machine             <= CALC_THREAD_IDS_WAIT;
                            else
                                y_cnt                               := (others => '0');
                                z_cnt                               := z_cnt + "01";
                                if (z_cnt < block_z_i) then
                                    x_indx_i                        <= x_cnt - "01";
                                    y_indx_i                        <= y_cnt;
                                    z_indx_i                        <= z_cnt;
                                    thread_id_calc_en               <= '1';
                                    smp_cntlr_state_machine         <= CALC_THREAD_IDS_WAIT;
                                else
                                    x_cnt                           := (others => '0');
                                    y_cnt                           := (others => '0');
                                    z_cnt                           := (others => '0');
                                    idx_i                           <= idx_i + "01";
                                    smp_cntlr_state_machine         <= CALC_THREAD_IDS_BLOCK_INC;
                                end if;
                            end if;
                        end if;
                    when CALC_THREAD_IDS_WAIT =>
                        thread_id_calc_en                           <= '0';
                        if (thread_id_calc_dv = '1') then
                            thread_id_i                             <= thread_id_o;
                            thread_lane_id_i                        <= conv_integer(unsigned(thread_lane_id_o));
                            gprs_base_addr_i                        <= warp_id_o * gprs_size_i;
                            warp_lane_id_i                          <= warp_lane_id_o;
                            smp_cntlr_state_machine                 <= CALC_THREAD_IDS_WRITE;
                        end if;
                    when CALC_THREAD_IDS_WRITE =>
                        gprs_base_addr_out(thread_lane_id_i)        <= gprs_base_addr_i(8 downto 0);
                        gprs_reg_num_out(thread_lane_id_i)          <= (others => '0');
                        gprs_lane_id_out(thread_lane_id_i)          <= warp_lane_id_i(1 downto 0);
                        gprs_wr_en_out(thread_lane_id_i)            <= '1';
                        gprs_wr_data_out(thread_lane_id_i)          <= thread_id_i;
                        if (flag = '0') then
                            smp_cntlr_state_machine                 <= CALC_THREAD_IDS;
                        else 
                            smp_cntlr_state_machine         	    <= CALC_THREAD_IDS_BLOCK_INC;
                        end if;
                    when WARP_GEN_WAIT =>
                        warp_generator_en                           <= '0';
                        warp_generator_done_reg                     <= warp_generator_done;
                        if (warp_generator_done_reg = '0' and warp_generator_done = '1') then
                            smp_configuration_en                    <= '0';
                            smp_cntlr_state_machine                 <= WARP_SCHED_WAIT;
                        end if;
                    when WARP_SCHED_WAIT =>
                        warp_scheduler_done_reg                     <= warp_scheduler_done;
                        if (warp_scheduler_done_reg = '0' and warp_scheduler_done = '1') then
                            smp_configuration_en                    <= '1';
                            smp_done                                <= '1';  
                            smp_cntlr_state_machine                 <= IDLE;
                        end if;
                    when others =>
                        smp_cntlr_state_machine                     <= IDLE;
                end case;
            end if;
        end if;
    end process;
   
--    pCalculateSharedMemAddr: process(shmem_addr_i, write_data_cnt, host_reset)
--    begin
--        if (host_reset = '1') then
--            shmem_addr_out              <= (others => '0');
--        else
--            shmem_addr_out              <= shmem_addr_i(SHMEM_ADDR_SIZE-1 downto 0) + conv_std_logic_vector(write_data_cnt, SHMEM_ADDR_SIZE);
--        end if;
--    end process;


--- PROCESS TO COUNT OVERHEAD CYCLES. PLEASE DO NOT REMOVE----------------

--    process(clk_in)
--	 
--    variable count : integer range 0 to 200000;              
--    begin
--		if (host_reset = '1') then
--			count:=0;
--	   elsif(rising_edge(clk_in)) then
--				if(smp_cntlr_state_machine = WARP_SCHED_WAIT) then
--                 report "Overhead Count =" & integer'image(count);
--			   else
--						count := count + 1;
--			   end if;
--      end if;
--	 end process;
	 
    uBlockIdCalc : block_id_calc
        port map (
            clk_1               => clk_in,
            ce_1                => '1',
            en                  => block_id_calc_en,
            block_idx_in        => block_idx_i,
            grid_x_in           => grid_x_i,
            idx_in              => idx_i,
            block_id_x_out      => block_id_x_o,
            block_id_y_out      => block_id_y_o,
            valid               => block_id_calc_valid
        );

    uWarpsPerBlock : warps_per_block_calc
        port map (
            ce_1                        => '1',
            clk_1                       => clk_in,
            en                          => warps_per_block_en,
            threads_per_block_in        => threads_per_block_i,
            warp_size_in                => warp_size_i,
            warps_per_block_out         => warps_per_block_o,
            data_valid_out              => warps_per_block_dv
        );
        
    uThreadIdCalc : thread_id_calc  
        port map (
            clk_1                   => clk_in,
            ce_1                    => '1',
            en                      => thread_id_calc_en,
            block_x_in              => block_x_i,
            block_y_in              => block_y_i,
            block_z_in              => block_z_i,
            num_cores_in            => num_cores_i,
            warp_size_in            => warp_size_i,
            warps_per_block_in      => warps_per_block_i,
            block_indx_in           => idx_i,
            x_indx_in               => x_indx_i,
            y_indx_in               => y_indx_i,
            z_indx_in               => z_indx_i,
            thread_id_out           => thread_id_o,
            thread_lane_id_out      => thread_lane_id_o,
            warp_id_out             => warp_id_o,
            warp_lane_id_out        => warp_lane_id_o,
            data_valid              => thread_id_calc_dv
        );
        
end arch;

