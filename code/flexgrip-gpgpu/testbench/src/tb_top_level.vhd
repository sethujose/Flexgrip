--------------------------------------------------------------------------------
-- Company: UMass Amherst	
-- Engineer: Murtaza Merchant
--
-- Create Date:   16:47:43 05/15/2012
-- Design Name:   Top-level testbench
-- Module Name:   C:/Users/Murtaza/Documents/XilinxDesigns/gpgpu_virtex6_sim/tb_top_level.vhd
-- Project Name:  gpgpu_virtex6
-- Target Device:  Virtex-6 VLX 240T -1 f1156
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: gpgpu_top_level
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.std_logic_unsigned.all;  
use IEEE.std_logic_arith.all;

library unisim;
use unisim.vcomponents.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;

use work.gpgpu_package.all;

entity tb_top_level is
end tb_top_level;
 
ARCHITECTURE behavior OF tb_top_level is 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    --component gpgpu_top_level
    --    port(
    --        clk_in_p 					    : in  std_logic;
    --        clk_in_n 					    : in  std_logic;
    --        
    --        gpgpu_config_cntrl_en_in        : in  std_logic;
    --        gpgpu_config_top_cs             : in  std_logic;
    --        gpgpu_config_top_rw             : in  std_logic;
    --        gpgpu_config_top_adr            : in  std_logic_vector(31 downto 0);
    --        gpgpu_config_top_rd_data        : out std_logic_vector(31 downto 0);
    --        gpgpu_config_top_wr_data        : in  std_logic_vector(31 downto 0);
    --        
    --        cmem_cntrl_en_in                : in std_logic;
    --        cmem_wr_data_a_top			    : in std_logic_vector(7 downto 0);
    --        cmem_addr_a_top				    : in std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
    --        cmem_wr_en_a_top				: in std_logic_vector(0 downto 0);
    --        cmem_rd_data_a_top			    : out std_logic_vector(7 downto 0);
    --        
    --        block_scheduler_en		        : in  std_logic;
	--		write_instructions_en           : in  std_logic;
    --        write_instructions_done         : out std_logic;
	--		host_reset_out			        : out std_logic;
	--		kernel_done					    : out std_logic
    --    );
    --end component;
    
    component gpgpu_ml605_top_level
        generic (
            GMEM_ADDR_SIZE              : integer := 32;
            CMEM_ADDR_SIZE              : integer := 32;
            SYSMEM_ADDR_SIZE            : integer := 32
        );
        port (
            sys_clk                     : in  std_logic;
            host_reset                  : in  std_logic;
            block_scheduler_en		    : in  std_logic;
            kernel_done					: out std_logic;
            smp_done_signal 			: out std_logic;
            
            gmem_cntrl_en_in            : in  std_logic;
            cmem_cntrl_en_in            : in  std_logic;
            sysmem_cntrl_en_in          : in  std_logic;
            gpgpu_config_cntrl_en_in    : in  std_logic;
            
            gpgpu_config_top_cs         : in  std_logic;
            gpgpu_config_top_rw         : in  std_logic;
            gpgpu_config_top_adr        : in  std_logic_vector(31 downto 0);
            gpgpu_config_top_rd_data    : out std_logic_vector(31 downto 0);
            gpgpu_config_top_wr_data    : in  std_logic_vector(31 downto 0);
            
            gpgpu_stats_top_cs          : in  std_logic;
            gpgpu_stats_top_rw          : in  std_logic;
            gpgpu_stats_top_adr         : in  std_logic_vector(31 downto 0);
            gpgpu_stats_top_rd_data     : out std_logic_vector(31 downto 0);
            gpgpu_stats_top_wr_data     : in  std_logic_vector(31 downto 0);
            
            gmem_wr_data_a_in	        : in std_logic_vector(7 downto 0);
			gmem_addr_a_in			    : in std_logic_vector(GMEM_ADDR_SIZE-1 downto 0);
			gmem_wr_en_a_in		        : in std_logic_vector(0 downto 0);
			gmem_rd_data_a_out		    : out std_logic_vector(7 downto 0);
            
            gmem_wr_data_b_in	        : in std_logic_vector(7 downto 0);
			gmem_addr_b_in			    : in std_logic_vector(GMEM_ADDR_SIZE-1 downto 0);
			gmem_wr_en_b_in		        : in std_logic_vector(0 downto 0);
			gmem_rd_data_b_out		    : out std_logic_vector(7 downto 0);
            
            cmem_wr_data_a_in	        : in std_logic_vector(7 downto 0);
			cmem_addr_a_in			    : in std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
			cmem_wr_en_a_in		        : in std_logic_vector(0 downto 0);
			cmem_rd_data_a_out		    : out std_logic_vector(7 downto 0);
            
            cmem_wr_data_b_in	        : in std_logic_vector(7 downto 0);
			cmem_addr_b_in			    : in std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
			cmem_wr_en_b_in		        : in std_logic_vector(0 downto 0);
			cmem_rd_data_b_out		    : out std_logic_vector(7 downto 0);
            
            sysmem_wr_data_a_in	        : in std_logic_vector(7 downto 0);
			sysmem_addr_a_in			: in std_logic_vector(SYSMEM_ADDR_SIZE-1 downto 0);
			sysmem_wr_en_a_in		    : in std_logic_vector(0 downto 0);
			sysmem_rd_data_a_out		: out std_logic_vector(7 downto 0);
            
            sysmem_wr_data_b_in	        : in std_logic_vector(7 downto 0);
			sysmem_addr_b_in			: in std_logic_vector(SYSMEM_ADDR_SIZE-1 downto 0);
			sysmem_wr_en_b_in		    : in std_logic_vector(0 downto 0);
			sysmem_rd_data_b_out		: out std_logic_vector(7 downto 0);
			decode_flag					: out std_logic; --////////*********
			check_dest_reg_out_tb			: out std_logic_vector(8 downto 0);
			read_check_out_tb			: out std_logic_vector(9 downto 0);
			req_tb : out std_logic;
			read_en_tb : out std_logic;
			valid_tb : out std_logic;
			fifo_data_in_tb: out std_logic_vector(31 downto 0)
        );
    end component;
    
    component tb_configuration is
        generic (
            APPLICATION             : string := "MATRIX_MULT"
        );
        port (
            clk                     : in std_logic;
            reset                   : in std_logic;
            reset_registers         : in  std_logic;
            
            cmem_reg_cs             : in  std_logic;
            cmem_reg_rw             : in  std_logic;
            cmem_reg_adr            : in  std_logic_vector(5 downto 0);
            cmem_reg_data_in        : in  std_logic_vector(7 downto 0);
            cmem_reg_data_out       : out std_logic_vector(7 downto 0);
            
            kernel_reg_cs           : in  std_logic;
            kernel_reg_rw           : in  std_logic;
            kernel_reg_adr          : in  std_logic_vector(3 downto 0);
            kernel_reg_data_in      : in  std_logic_vector(31 downto 0);
            kernel_reg_data_out     : out std_logic_vector(31 downto 0);
            
            cmem_param_size_out     : out std_logic_vector(5 downto 0);
            kernel_param_size_out   : out std_logic_vector(3 downto 0);
            kernel_block_x_out      : out std_logic_vector(15 downto 0);
            kernel_block_y_out      : out std_logic_vector(15 downto 0);
            kernel_block_z_out      : out std_logic_vector(15 downto 0);
            kernel_grid_x_out       : out std_logic_vector(15 downto 0);
            kernel_grid_y_out       : out std_logic_vector(15 downto 0);
            kernel_gprs_out         : out std_logic_vector(8 downto 0);
            kernel_shmem_size_out   : out std_logic_vector(31 downto 0);
            threads_per_block_out   : out std_logic_vector(11 downto 0);
            warps_per_block_out     : out std_logic_vector(5 downto 0);
            blocks_registers_out    : out std_logic_vector(7 downto 0);
            blocks_shared_mem_out   : out std_logic_vector(7 downto 0);
            blocks_warps_out        : out std_logic_vector(7 downto 0);
            blocks_per_core_out     : out std_logic_vector(3 downto 0)
        );
    end component;

    component write_instructions
        generic (
            APPLICATION         : string := "MATRIX MULT";
            MEM_ADDR_SIZE       : integer := 32
        );
        port (                            
            clk                 : in std_logic; 
            reset               : in std_logic;

            en                  : in std_logic;
            
            mem_addr_out	    : out std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
            mem_data_out        : out std_logic_vector(7 downto 0);
			mem_wr_en_out	    : out std_logic_vector(0 downto 0);

            done                : out std_logic 
        );
    end component;
    
    component read_data
        generic (
            MEM_ADDR_SIZE       : integer := 32
        );
        port (                            
            clk                 : in std_logic; 
            reset               : in std_logic;

            en                  : in std_logic;
            
            mem_start_addr_in   : in  std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
            mem_read_size_in    : in  std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
            mem_size_in         : in  std_logic_vector(2 downto 0);
            
            mem_addr_out        : out std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
            mem_wr_en_out       : out std_logic_vector(0 downto 0);
            mem_wr_data_out     : out std_logic_vector(7 downto 0);
            mem_rd_data_in      : in  std_logic_vector(7 downto 0);

            read_data_out       : out std_logic_vector(31 downto 0);
            read_data_rdy_out   : out std_logic;
            
            done                : out std_logic 
        );
    end component;
    
    -- constants
	constant clk_period                 : time := 10 ns;
            
	--Testbench FSM
	type testbench_state_type is (IDLE, WRITE_INSTRUCTIONS_MEM, WRITE_INSTRUCTIONS_WAIT, 
                                  WRITE_KERNEL_PARAM_SIZE, READ_KERNEL_PARAMETERS, 
                                  READ_KERNEL_PARAMETERS_WAIT, WRITE_KERNEL_PARAMETERS,
                                  WRITE_KERNEL_BLOCK_X, WRITE_KERNEL_BLOCK_Y, WRITE_KERNEL_BLOCK_Z,
                                  WRITE_KERNEL_GRID_X, WRITE_KERNEL_GRID_Y, WRITE_KERNEL_GPRS,
                                  WRITE_KERNEL_SHMEM_SIZE, WRITE_KERNEL_BOCKS_PER_CORE,
                                  READ_CMEM_PARAMETERS, READ_CMEM_PARAMETERS_WAIT, WRITE_CMEM_BYTE, SCHEDULE_BLOCKS, 
								  SMP_PROCESSING, GPGPU_STATS, GPGPU_STATS_BYTE0_WAIT, GPGPU_STATS_READ_BYTE0,
                                  GPGPU_STATS_BYTE1_WAIT, GPGPU_STATS_READ_BYTE1, 
                                  GPGPU_STATS_BYTE2_WAIT, GPGPU_STATS_READ_BYTE2,
                                  GPGPU_STATS_BYTE3_WAIT, GPGPU_STATS_READ_BYTE3,
                                  READ_DATA_MEM, READ_DATA_MEM_WAIT, DONE);
											
    signal test_bench_state_machine : testbench_state_type := IDLE; 
   
    -- clock and reset
    signal clk_100MHz                   : std_logic := '0';
    signal sys_reset                    : std_logic := '0';
    signal host_reset                   : std_logic;
    signal host_reset_reg               : std_logic_vector(3 downto 0);
    
    signal kernel_block_x               : std_logic_vector(15 downto 0);
    signal kernel_block_y               : std_logic_vector(15 downto 0);
    signal kernel_block_z               : std_logic_vector(15 downto 0);
    signal kernel_grid_x                : std_logic_vector(15 downto 0);
    signal kernel_grid_y                : std_logic_vector(15 downto 0);
    signal kernel_gprs                  : std_logic_vector(8 downto 0);
    signal kernel_shmem_size            : std_logic_vector(31 downto 0);
    signal threads_per_block            : std_logic_vector(11 downto 0);
    signal warps_per_block              : std_logic_vector(5 downto 0);
    signal blocks_per_core              : std_logic_vector(3 downto 0);
            
    signal block_scheduler_en           : std_logic := '0';
    signal write_instructions_en        : std_logic;
    signal write_instructions_done      : std_logic;	
 	signal write_instructions_done_reg  : std_logic;
    
    signal read_data_en                 : std_logic;
            
    signal mem_start_addr_i             : std_logic_vector(GMEM_ADDR_SIZE-1 downto 0);
    signal mem_read_size_i              : std_logic_vector(GMEM_ADDR_SIZE-1 downto 0);
    signal read_data_o                  : std_logic_vector(31 downto 0);
    signal read_data_rdy_o              : std_logic;
    signal read_data_done               : std_logic;
    signal read_data_done_reg           : std_logic;
    
    signal smp_done_signal              : std_logic;
    
    signal gpgpu_config_cntrl_en        : std_logic;
    signal gpgpu_config_top_cs          : std_logic;
    signal gpgpu_config_top_rw          : std_logic;
    signal gpgpu_config_top_adr         : std_logic_vector(31 downto 0);
    signal gpgpu_config_top_rd_data     : std_logic_vector(31 downto 0);
    signal gpgpu_config_top_wr_data     : std_logic_vector(31 downto 0);
    
    signal gpgpu_stats_top_cs           : std_logic;
    signal gpgpu_stats_top_rw           : std_logic;
    signal gpgpu_stats_top_adr          : std_logic_vector(31 downto 0);
    signal gpgpu_stats_top_rd_data      : std_logic_vector(31 downto 0);
    signal gpgpu_stats_top_wr_data      : std_logic_vector(31 downto 0);
    
    signal gmem_cntrl_en                : std_logic;
    signal gmem_wr_data_a	            : std_logic_vector(7 downto 0);
	signal gmem_addr_a			        : std_logic_vector(GMEM_ADDR_SIZE-1 downto 0);
	signal gmem_wr_en_a		            : std_logic_vector(0 downto 0);
	signal gmem_rd_data_a		        : std_logic_vector(7 downto 0);      
    signal gmem_wr_data_b	            : std_logic_vector(7 downto 0);
	signal gmem_addr_b			        : std_logic_vector(GMEM_ADDR_SIZE-1 downto 0);
	signal gmem_wr_en_b		            : std_logic_vector(0 downto 0);
	signal gmem_rd_data_b		        : std_logic_vector(7 downto 0);
    
    signal cmem_cntrl_en                : std_logic;    
    signal cmem_wr_data_a	            : std_logic_vector(7 downto 0);
	signal cmem_addr_a			        : std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
	signal cmem_wr_en_a		            : std_logic_vector(0 downto 0);
	signal cmem_rd_data_a		        : std_logic_vector(7 downto 0);   
    signal cmem_wr_data_b	            : std_logic_vector(7 downto 0);
	signal cmem_addr_b			        : std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
	signal cmem_wr_en_b		            : std_logic_vector(0 downto 0);
	signal cmem_rd_data_b		        : std_logic_vector(7 downto 0);
    
    signal sysmem_cntrl_en              : std_logic;
    signal sysmem_wr_data_a	            : std_logic_vector(7 downto 0);
	signal sysmem_addr_a		        : std_logic_vector(SYSMEM_ADDR_SIZE-1 downto 0);
	signal sysmem_wr_en_a		        : std_logic_vector(0 downto 0);
	signal sysmem_rd_data_a		        : std_logic_vector(7 downto 0);    
    signal sysmem_wr_data_b	            : std_logic_vector(7 downto 0);
	signal sysmem_addr_b			    : std_logic_vector(SYSMEM_ADDR_SIZE-1 downto 0);
	signal sysmem_wr_en_b		        : std_logic_vector(0 downto 0);
	signal sysmem_rd_data_b		        : std_logic_vector(7 downto 0);
    
    signal cmem_reg_cs                  : std_logic;
    signal cmem_reg_rw                  : std_logic;
    signal cmem_reg_adr                 : std_logic_vector(5 downto 0);
    signal cmem_reg_wr_data             : std_logic_vector(7 downto 0);
    signal cmem_reg_rd_data             : std_logic_vector(7 downto 0);
    
    signal kernel_reg_cs                : std_logic;
    signal kernel_reg_rw                : std_logic;
    signal kernel_reg_adr               : std_logic_vector(3 downto 0);
    signal kernel_reg_wr_data           : std_logic_vector(31 downto 0);
    signal kernel_reg_rd_data           : std_logic_vector(31 downto 0);
    
    signal cmem_param_size              : std_logic_vector(5 downto 0);
    signal kernel_param_size            : std_logic_vector(3 downto 0);
            
    signal kernel_params_cnt            : std_logic_vector(3 downto 0);
    signal cmem_params_cnt              : std_logic_vector(5 downto 0);
    
    signal kernel_done	                : std_logic;
    signal kernel_done_reg              : std_logic;
	
    -- stats
    signal gpgpu_statistics             : vector_stat_registers;
    signal gpgpu_stats_cnt              : integer range 0 to stat_stages'length;
	 signal decode_test						:std_logic; --/////////////*****************
	 signal write_dest_check		 		: std_logic_vector(8 downto 0);
	 signal read_check 				: std_logic_vector(9 downto 0);
	 
	 signal req_tb :  std_logic;
		signal	read_en_tb :  std_logic;
		signal	valid_tb :  std_logic;
		
	signal fifo_data_in_tb:  std_logic_vector(31 downto 0);
begin
 
    -- Clock process definitions
    pClk100MHz : process
    begin
		clk_100MHz  <= '0';
		wait for clk_period/2;
		clk_100MHz  <= '1';
		wait for clk_period/2;
    end process;
    
    pSystemReset : process
    begin
		wait for clk_period*4;
		sys_reset  <= '1';
    end process;
    
    pInternalReset: process (clk_100MHz, sys_reset)
    begin
        if (sys_reset = '0') then 
            host_reset_reg(3 downto 0)   <= "1111";
            host_reset                   <= '1';
        elsif (rising_edge(clk_100MHz)) then 
            host_reset_reg(3 downto 0)   <= host_reset_reg(2 downto 0) & '0'; 
            host_reset                   <= host_reset_reg(3);
        end if;                    
    end process;
    
    uGPGPU : gpgpu_ml605_top_level
        generic map (
            GMEM_ADDR_SIZE              => GMEM_ADDR_SIZE,
            CMEM_ADDR_SIZE              => CMEM_ADDR_SIZE,
            SYSMEM_ADDR_SIZE            => SYSMEM_ADDR_SIZE
        )
        port map (
            sys_clk                     => clk_100MHz,
            host_reset                  => host_reset,
            block_scheduler_en		    => block_scheduler_en,
            kernel_done					=> kernel_done,
            smp_done_signal 			=> smp_done_signal,
            
            gmem_cntrl_en_in            => gmem_cntrl_en,
            cmem_cntrl_en_in            => cmem_cntrl_en,
            sysmem_cntrl_en_in          => sysmem_cntrl_en,
            gpgpu_config_cntrl_en_in    => gpgpu_config_cntrl_en,
            
            gpgpu_config_top_cs         => gpgpu_config_top_cs,
            gpgpu_config_top_rw         => gpgpu_config_top_rw,
            gpgpu_config_top_adr        => gpgpu_config_top_adr,
            gpgpu_config_top_rd_data    => gpgpu_config_top_rd_data,
            gpgpu_config_top_wr_data    => gpgpu_config_top_wr_data,
            
            gpgpu_stats_top_cs          => gpgpu_stats_top_cs,
            gpgpu_stats_top_rw          => gpgpu_stats_top_rw,
            gpgpu_stats_top_adr         => gpgpu_stats_top_adr,
            gpgpu_stats_top_rd_data     => gpgpu_stats_top_rd_data,
            gpgpu_stats_top_wr_data     => gpgpu_stats_top_wr_data,
            
            gmem_wr_data_a_in	        => gmem_wr_data_a,
			gmem_addr_a_in			    => gmem_addr_a,
			gmem_wr_en_a_in		        => gmem_wr_en_a,
			gmem_rd_data_a_out		    => gmem_rd_data_a,
            
            gmem_wr_data_b_in	        => gmem_wr_data_b,
			gmem_addr_b_in			    => gmem_addr_b,
			gmem_wr_en_b_in		        => gmem_wr_en_b,
			gmem_rd_data_b_out		    => gmem_rd_data_b,
            
            cmem_wr_data_a_in	        => cmem_wr_data_a,
			cmem_addr_a_in			    => cmem_addr_a,
			cmem_wr_en_a_in		        => cmem_wr_en_a,
			cmem_rd_data_a_out		    => cmem_rd_data_a,
            
            cmem_wr_data_b_in	        => cmem_wr_data_b,
			cmem_addr_b_in			    => cmem_addr_b,
			cmem_wr_en_b_in		        => cmem_wr_en_b,
			cmem_rd_data_b_out		    => cmem_rd_data_b,
            
            sysmem_wr_data_a_in	        => sysmem_wr_data_a,
			sysmem_addr_a_in			=> sysmem_addr_a,
			sysmem_wr_en_a_in		    => sysmem_wr_en_a,
			sysmem_rd_data_a_out		=> sysmem_rd_data_a,
            
            sysmem_wr_data_b_in	        => sysmem_wr_data_b,
			sysmem_addr_b_in			=> sysmem_addr_b,
			sysmem_wr_en_b_in		    => sysmem_wr_en_b,
			sysmem_rd_data_b_out		=> sysmem_rd_data_b,
			decode_flag					=> decode_test, --///////////////*************
			check_dest_reg_out_tb => write_dest_check,
			 read_check_out_tb => read_check,
			  req_tb  => 		req_tb,	
			  read_en_tb => read_en_tb,
			
					valid_tb => valid_tb,
	 fifo_data_in_tb => fifo_data_in_tb  

			 );
	
    uTestBenchConfig : tb_configuration
        generic map (
            APPLICATION             => "VECTOR_ADD"
        )
        port map (
            clk                     => clk_100MHz,
            reset                   => host_reset,
            reset_registers         => host_reset,
            
            cmem_reg_cs             => cmem_reg_cs,
            cmem_reg_rw             => cmem_reg_rw,
            cmem_reg_adr            => cmem_reg_adr,
            cmem_reg_data_in        => cmem_reg_wr_data,
            cmem_reg_data_out       => cmem_reg_rd_data,
            
            kernel_reg_cs           => kernel_reg_cs,
            kernel_reg_rw           => kernel_reg_rw,
            kernel_reg_adr          => kernel_reg_adr,
            kernel_reg_data_in      => kernel_reg_wr_data,
            kernel_reg_data_out     => kernel_reg_rd_data,
            
            cmem_param_size_out     => cmem_param_size,
            kernel_param_size_out   => kernel_param_size,
            kernel_block_x_out      => kernel_block_x,
            kernel_block_y_out      => kernel_block_y,
            kernel_block_z_out      => kernel_block_z,
            kernel_grid_x_out       => kernel_grid_x,
            kernel_grid_y_out       => kernel_grid_y,
            kernel_gprs_out         => kernel_gprs,
            kernel_shmem_size_out   => kernel_shmem_size,
            threads_per_block_out   => threads_per_block,
            warps_per_block_out     => warps_per_block,
            blocks_registers_out    => open,
            blocks_shared_mem_out   => open,
            blocks_warps_out        => open,
            blocks_per_core_out     => blocks_per_core
        );
        
    -- Stimulus proces
    pStimulationProcess: process (clk_100MHz)
    begin	
        if (rising_edge(clk_100MHz)) then
            if (host_reset = '1') then
                sysmem_cntrl_en                         <= '0';
                gmem_cntrl_en                           <= '0';
                read_data_en                            <= '0';
				write_instructions_en 		            <= '0';
				block_scheduler_en			            <= '0';
                kernel_params_cnt                       <= (others => '0');
                cmem_params_cnt                         <= (others => '0');
                gpgpu_stats_cnt                         <= 0;
                gpgpu_config_cntrl_en                   <= '0';
                gpgpu_config_top_cs                     <= '0';
                gpgpu_config_top_rw                     <= '1';
                gpgpu_config_top_adr                    <= (others => '0');
                gpgpu_config_top_wr_data                <= (others => '0');
                kernel_reg_cs                           <= '0';
                kernel_reg_rw                           <= '0';
                kernel_reg_adr                          <= (others => '0');
                cmem_reg_cs                             <= '0';
                cmem_reg_rw                             <= '0';
                cmem_reg_adr                            <= (others => '0');          
                cmem_cntrl_en                           <= '0';
                cmem_wr_data_a			                <= (others => '0');
                cmem_addr_a				                <= (others => '0');
                cmem_wr_en_a			                <= (others => '0');
                mem_start_addr_i                        <= (others => '0');
                mem_read_size_i                         <= (others => '0');
            else    
                case test_bench_state_machine is
                    when IDLE =>
                        write_instructions_en 	        <= '0';
                        block_scheduler_en 		        <= '0';
                        read_data_en                    <= '0';
                        gpgpu_config_cntrl_en           <= '0';
                        gpgpu_config_top_cs             <= '0';
                        gpgpu_config_top_rw             <= '1';
                        gpgpu_config_top_adr            <= (others => '0');
                        gpgpu_config_top_wr_data        <= (others => '0');
                        kernel_reg_cs                   <= '0';
                        kernel_reg_rw                   <= '0';
                        kernel_reg_adr                  <= (others => '0');
                        cmem_reg_cs                     <= '0';
                        cmem_reg_rw                     <= '0';
                        cmem_reg_adr                    <= (others => '0');          
                        gmem_cntrl_en                   <= '0';
                        cmem_cntrl_en                   <= '0';
                        cmem_wr_data_a			        <= (others => '0');
                        cmem_addr_a				        <= (others => '0');
                        cmem_wr_en_a			        <= (others => '0');
                        kernel_params_cnt               <= (others => '0');
                        cmem_params_cnt                 <= (others => '0');
                        gpgpu_stats_cnt                 <= 0;
						test_bench_state_machine        <= WRITE_INSTRUCTIONS_MEM;
					
                    when WRITE_INSTRUCTIONS_MEM =>
                        sysmem_cntrl_en                 <= '1';
                        write_instructions_en           <= '1';
                        test_bench_state_machine        <= WRITE_INSTRUCTIONS_WAIT;
                    
                    when WRITE_INSTRUCTIONS_WAIT =>
                        write_instructions_en           <= '0';
                        write_instructions_done_reg     <= write_instructions_done;
                        if (write_instructions_done_reg = '0' and write_instructions_done = '1') then
                            sysmem_cntrl_en             <= '0';
                            test_bench_state_machine    <= WRITE_KERNEL_PARAM_SIZE;
                        end if;
                        
                    when WRITE_KERNEL_PARAM_SIZE =>
                        gpgpu_config_cntrl_en           <= '1';
                        gpgpu_config_top_cs             <= '1';
                        gpgpu_config_top_rw             <= '0';
                        gpgpu_config_top_adr            <= x"00000003";
                        gpgpu_config_top_wr_data        <= x"0000000" & kernel_param_size;
                        test_bench_state_machine        <= READ_KERNEL_PARAMETERS;
                        
                    when READ_KERNEL_PARAMETERS =>
                        if (kernel_params_cnt < kernel_param_size) then
                            kernel_reg_cs               <= '1';
                            kernel_reg_rw               <= '1';
                            kernel_reg_adr              <= kernel_params_cnt;
                            gpgpu_config_cntrl_en       <= '0';
                            gpgpu_config_top_cs         <= '0';
                            gpgpu_config_top_rw         <= '1';
                            gpgpu_config_top_adr        <= (others => '0');
                            gpgpu_config_top_wr_data    <= (others => '0');
                            test_bench_state_machine    <= READ_KERNEL_PARAMETERS_WAIT;
                        else
                            kernel_reg_cs               <= '0';
                            kernel_reg_rw               <= '1';
                            kernel_reg_adr              <= (others => '0');
                            gpgpu_config_cntrl_en       <= '0';
                            gpgpu_config_top_cs         <= '0';
                            gpgpu_config_top_rw         <= '1';
                            gpgpu_config_top_adr        <= (others => '0');
                            gpgpu_config_top_wr_data    <= (others => '0');
                            kernel_params_cnt           <= (others => '0');
                            test_bench_state_machine    <= WRITE_KERNEL_BLOCK_X;
                        end if;
                    
                    when READ_KERNEL_PARAMETERS_WAIT =>
                        test_bench_state_machine        <= WRITE_KERNEL_PARAMETERS;
                        
                    when WRITE_KERNEL_PARAMETERS =>
                        kernel_reg_cs                   <= '0';
                        gpgpu_config_cntrl_en           <= '1';
                        gpgpu_config_top_cs             <= '1';
                        gpgpu_config_top_rw             <= '0';
                        gpgpu_config_top_adr            <= CONFIG_PARAMS_START + kernel_params_cnt;
                        gpgpu_config_top_wr_data        <= kernel_reg_rd_data;
                        kernel_params_cnt               <= kernel_params_cnt + "01";
                        test_bench_state_machine        <= READ_KERNEL_PARAMETERS;
                    
                    when WRITE_KERNEL_BLOCK_X =>
                        gpgpu_config_cntrl_en           <= '1';
                        gpgpu_config_top_cs             <= '1';
                        gpgpu_config_top_rw             <= '0';
                        gpgpu_config_top_adr            <= x"00000005";
                        gpgpu_config_top_wr_data        <= x"0000" & kernel_block_x;
                        test_bench_state_machine        <= WRITE_KERNEL_BLOCK_Y;
                    
                    when WRITE_KERNEL_BLOCK_Y =>
                        gpgpu_config_cntrl_en           <= '1';
                        gpgpu_config_top_cs             <= '1';
                        gpgpu_config_top_rw             <= '0';
                        gpgpu_config_top_adr            <= x"00000006";
                        gpgpu_config_top_wr_data        <= x"0000" & kernel_block_y;
                        test_bench_state_machine        <= WRITE_KERNEL_BLOCK_Z;
                    
                    when WRITE_KERNEL_BLOCK_Z =>
                        gpgpu_config_cntrl_en           <= '1';
                        gpgpu_config_top_cs             <= '1';
                        gpgpu_config_top_rw             <= '0';
                        gpgpu_config_top_adr            <= x"00000007";
                        gpgpu_config_top_wr_data        <= x"0000" & kernel_block_z;
                        test_bench_state_machine        <= WRITE_KERNEL_GRID_X;
                    
                    when WRITE_KERNEL_GRID_X =>
                        gpgpu_config_cntrl_en           <= '1';
                        gpgpu_config_top_cs             <= '1';
                        gpgpu_config_top_rw             <= '0';
                        gpgpu_config_top_adr            <= x"00000008";
                        gpgpu_config_top_wr_data        <= x"0000" & kernel_grid_x;
                        test_bench_state_machine        <= WRITE_KERNEL_GRID_Y;
                    
                    when WRITE_KERNEL_GRID_Y =>
                        gpgpu_config_cntrl_en           <= '1';
                        gpgpu_config_top_cs             <= '1';
                        gpgpu_config_top_rw             <= '0';
                        gpgpu_config_top_adr            <= x"00000009";
                        gpgpu_config_top_wr_data        <= x"0000" & kernel_grid_y;
                        test_bench_state_machine        <= WRITE_KERNEL_GPRS;
                    
                    when WRITE_KERNEL_GPRS =>
                        gpgpu_config_cntrl_en           <= '1';
                        gpgpu_config_top_cs             <= '1';
                        gpgpu_config_top_rw             <= '0';
                        gpgpu_config_top_adr            <= x"00000001";
                        gpgpu_config_top_wr_data        <= x"0000" & "0000000" & kernel_gprs;
                        test_bench_state_machine        <= WRITE_KERNEL_SHMEM_SIZE;
                    
                    when WRITE_KERNEL_SHMEM_SIZE =>
                        gpgpu_config_cntrl_en           <= '1';
                        gpgpu_config_top_cs             <= '1';
                        gpgpu_config_top_rw             <= '0';
                        gpgpu_config_top_adr            <= x"00000002";
                        gpgpu_config_top_wr_data        <= kernel_shmem_size;
                        test_bench_state_machine        <= WRITE_KERNEL_BOCKS_PER_CORE;
                    
                    when WRITE_KERNEL_BOCKS_PER_CORE =>
                        gpgpu_config_cntrl_en           <= '1';
                        gpgpu_config_top_cs             <= '1';
                        gpgpu_config_top_rw             <= '0';
                        gpgpu_config_top_adr            <= x"00000000";
                        gpgpu_config_top_wr_data        <= x"0000000" & blocks_per_core;
                        test_bench_state_machine        <= READ_CMEM_PARAMETERS;
                        
                    when READ_CMEM_PARAMETERS =>
                        gpgpu_config_cntrl_en           <= '0';
                        gpgpu_config_top_cs             <= '0';
                        gpgpu_config_top_rw             <= '1';
                        if (cmem_params_cnt < cmem_param_size) then
                            cmem_reg_cs                 <= '1';
                            cmem_reg_rw                 <= '1';
                            cmem_reg_adr                <= cmem_params_cnt;
                            cmem_cntrl_en               <= '0';
                            cmem_wr_data_a			    <= (others => '0');
                            cmem_addr_a				    <= (others => '0');
                            cmem_wr_en_a			    <= (others => '0');
                            test_bench_state_machine    <= READ_CMEM_PARAMETERS_WAIT;
                        else
                            cmem_cntrl_en               <= '0';
                            cmem_wr_data_a			    <= (others => '0');
                            cmem_addr_a				    <= (others => '0');
                            cmem_wr_en_a			    <= (others => '0');
                            cmem_params_cnt             <= (others => '0');
                            test_bench_state_machine    <= SCHEDULE_BLOCKS;
                        end if;
                        
                    when READ_CMEM_PARAMETERS_WAIT =>
                        test_bench_state_machine        <= WRITE_CMEM_BYTE;
                        
                    when WRITE_CMEM_BYTE =>
                        cmem_reg_cs                     <= '0';
                        cmem_reg_rw                     <= '1';
                        cmem_cntrl_en                   <= '1';
                        cmem_wr_data_a			        <= cmem_reg_rd_data;
                        cmem_addr_a			            <= "0000000" & cmem_params_cnt;
                        cmem_wr_en_a			        <= (others => '1');
                        cmem_params_cnt                 <= cmem_params_cnt + "01";
                        test_bench_state_machine        <= READ_CMEM_PARAMETERS;
					 
                    when SCHEDULE_BLOCKS => 
                        block_scheduler_en              <= '1';
                        test_bench_state_machine        <= SMP_PROCESSING;
					
                    when SMP_PROCESSING =>
                        block_scheduler_en              <= '0';
                        kernel_done_reg                 <= kernel_done;
                        if (kernel_done_reg = '0' and kernel_done ='1') then 
                            test_bench_state_machine    <= GPGPU_STATS;
                        end if;
					
                    when GPGPU_STATS =>
                        if (gpgpu_stats_cnt < stat_stages'length) then
                            gpgpu_stats_top_cs          <= '1';
                            gpgpu_stats_top_rw          <= '1';
                            gpgpu_stats_top_adr         <= std_logic_vector(to_unsigned(gpgpu_stats_cnt*4, gpgpu_stats_top_adr'length));
                            test_bench_state_machine    <= GPGPU_STATS_BYTE0_WAIT;
                        else
                            gpgpu_stats_top_cs          <= '0';
                            gpgpu_stats_top_rw          <= '1';
                            test_bench_state_machine    <= READ_DATA_MEM;
                        end if;
                    
                    when GPGPU_STATS_BYTE0_WAIT =>
                        test_bench_state_machine        <= GPGPU_STATS_READ_BYTE0;
                    
                    when GPGPU_STATS_READ_BYTE0 =>
                        gpgpu_statistics(gpgpu_stats_cnt).total <= gpgpu_stats_top_rd_data;
                        gpgpu_stats_top_adr             <= std_logic_vector(to_unsigned((gpgpu_stats_cnt*4)+1, gpgpu_stats_top_adr'length));
                        test_bench_state_machine        <= GPGPU_STATS_BYTE1_WAIT;
                    
                    when GPGPU_STATS_BYTE1_WAIT =>
                        test_bench_state_machine        <= GPGPU_STATS_READ_BYTE1;
                    
                    when GPGPU_STATS_READ_BYTE1 =>
                        gpgpu_statistics(gpgpu_stats_cnt).total_idle <= gpgpu_stats_top_rd_data;
                        gpgpu_stats_top_adr             <= std_logic_vector(to_unsigned((gpgpu_stats_cnt*4)+2, gpgpu_stats_top_adr'length));
                        test_bench_state_machine        <= GPGPU_STATS_BYTE2_WAIT;
                    
                    when GPGPU_STATS_BYTE2_WAIT =>
                        test_bench_state_machine        <= GPGPU_STATS_READ_BYTE2;
                    
                    when GPGPU_STATS_READ_BYTE2 =>
                        gpgpu_statistics(gpgpu_stats_cnt).total_processing <= gpgpu_stats_top_rd_data;
                        gpgpu_stats_top_adr             <= std_logic_vector(to_unsigned((gpgpu_stats_cnt*4)+3, gpgpu_stats_top_adr'length));
                        test_bench_state_machine        <= GPGPU_STATS_BYTE3_WAIT;
                    
                    when GPGPU_STATS_BYTE3_WAIT =>
                        test_bench_state_machine        <= GPGPU_STATS_READ_BYTE3;
                    
                    when GPGPU_STATS_READ_BYTE3 =>
                        gpgpu_statistics(gpgpu_stats_cnt).total_stall <= gpgpu_stats_top_rd_data;
                        gpgpu_stats_cnt                 <= gpgpu_stats_cnt + 1;
                        test_bench_state_machine        <= GPGPU_STATS;
                        
                    when READ_DATA_MEM =>
                        gmem_cntrl_en                   <= '1';
                        read_data_en                    <= '1';
                        mem_start_addr_i                <= (others => '0');
                        mem_read_size_i                 <= "00" & x"3000"; -- 12288
                        test_bench_state_machine        <= READ_DATA_MEM_WAIT;
                    
                    when READ_DATA_MEM_WAIT =>
                        read_data_en                    <= '0';
                        read_data_done_reg              <= read_data_done;
                        if (read_data_done_reg = '0' and read_data_done = '1') then
                            gmem_cntrl_en                <= '0';
                            test_bench_state_machine     <= DONE;
                        end if;
                        
                    when DONE =>
						test_bench_state_machine        <= DONE;

                    when others =>
						test_bench_state_machine        <= IDLE;
                end case;
            end if;
        end if;
    end process;
   
    uWriteInstructions : write_instructions
        generic map (
            APPLICATION         => "VECTOR_ADD",
            MEM_ADDR_SIZE       => SYSMEM_ADDR_SIZE
        )
        port map (                            
            clk                 => clk_100MHz,
            reset               => host_reset,

            en                  => write_instructions_en,
            
            mem_addr_out	    => sysmem_addr_a,
            mem_data_out        => sysmem_wr_data_a,
			mem_wr_en_out	    => sysmem_wr_en_a,

            done                => write_instructions_done
        );

    uReadData : read_data
        generic map (
            MEM_ADDR_SIZE       => GMEM_ADDR_SIZE
        )
        port map (                            
            clk                 => clk_100MHz,
            reset               => host_reset,

            en                  => read_data_en,
            
            mem_start_addr_in   => mem_start_addr_i,
            mem_read_size_in    => mem_read_size_i,
            mem_size_in         => "011",
            
            mem_addr_out        => gmem_addr_a,
            mem_wr_en_out       => gmem_wr_en_a,
            mem_wr_data_out     => gmem_wr_data_a,
            mem_rd_data_in      => gmem_rd_data_a,

            read_data_out       => read_data_o,
            read_data_rdy_out   => read_data_rdy_o,
            
            done                => read_data_done
        );
end;
