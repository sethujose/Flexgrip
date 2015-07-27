----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      gpgpu_top_level - arch 
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
use IEEE.std_logic_unsigned.all ;  
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.gpgpu_package.all;

    entity gpgpu_ml605_top_level is
        generic (
            GMEM_ADDR_SIZE              : integer := 18;
            CMEM_ADDR_SIZE              : integer := 13;
            SYSMEM_ADDR_SIZE            : integer := 9
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
			decode_flag					: out std_logic; --/////////////////****************
			check_dest_reg_out_tb		: out std_logic_vector(8 downto 0);
			read_check_out_tb			: out std_logic_vector(9 downto 0);
			
			req_tb : out std_logic;
			read_en_tb : out std_logic;
			valid_tb : out std_logic;
			fifo_data_in_tb: out std_logic_vector(31 downto 0)

        );
    end gpgpu_ml605_top_level;


architecture arch of gpgpu_ml605_top_level is

component NoC is
port (
req : in std_logic;
ack : out std_logic;
clk : in  std_logic;
read_en : out std_logic;
write_en_noc : out std_logic_vector (0 downto 0);
write_add: out std_logic_vector(2 downto 0);
valid : in std_logic;
fifo_data_in: in std_logic_vector(31 downto 0);
fifo_data_out: out std_logic_vector(31 downto 0)
);
end component;
    component gpgpu_configuration
        port (
            clk_in                      : in  std_logic;
            host_reset                  : in  std_logic;
            reset_registers             : in  std_logic;
            
            config_reg_cs               : in  std_logic;
            config_reg_rw               : in  std_logic;
            config_reg_adr              : in  std_logic_vector(31 downto 0);
            config_reg_data_in          : in  std_logic_vector(31 downto 0);
            config_reg_data_out         : out std_logic_vector(31 downto 0);
            
            kernel_blocks_per_core      : out std_logic_vector(3 downto 0);
            kernel_num_gprs             : out std_logic_vector(8 downto 0);
            kernel_shmem_size           : out std_logic_vector(31 downto 0);
            kernel_parameter_size       : out std_logic_vector(15 downto 0);
            kernel_dyn_shmem_size       : out std_logic_vector(31 downto 0);
            kernel_block_x              : out std_logic_vector(15 downto 0);
            kernel_block_y              : out std_logic_vector(15 downto 0);
            kernel_block_z              : out std_logic_vector(15 downto 0);
            kernel_grid_x               : out std_logic_vector(15 downto 0);
            kernel_grid_y               : out std_logic_vector(15 downto 0)
        );
    end component;
    
    component block_scheduler
        port (
            clk_in                      : in  std_logic;
			host_reset                  : in  std_logic;
            
            en                          : in  std_logic;
            
            kernel_blocks_per_core_in   : in  std_logic_vector(3 downto 0);
            kernel_num_gprs_in          : in  std_logic_vector(8 downto 0);
            kernel_shmem_size_in        : in  std_logic_vector(31 downto 0);
            kernel_parameter_size_in    : in  std_logic_vector(15 downto 0);
            kernel_dyn_shmem_size_in    : in  std_logic_vector(31 downto 0);
            kernel_block_x_in           : in  std_logic_vector(15 downto 0);
            kernel_block_y_in           : in  std_logic_vector(15 downto 0);
            kernel_block_z_in           : in  std_logic_vector(15 downto 0);
            kernel_grid_x_in            : in  std_logic_vector(15 downto 0);
            kernel_grid_y_in            : in  std_logic_vector(15 downto 0);
            
            smp_done_in                 : in  std_logic;
            
            threads_per_block_out       : out std_logic_vector(11 downto 0);
            num_blocks_out              : out std_logic_vector(3 downto 0);
            shmem_base_addr_out         : out std_logic_vector(31 downto 0);
            shmem_size_out              : out std_logic_vector(31 downto 0);
            parameter_size_out          : out std_logic_vector(15 downto 0);
            gprs_size_out               : out std_logic_vector(8 downto 0);
            block_x_out                 : out std_logic_vector(15 downto 0);
            block_y_out                 : out std_logic_vector(15 downto 0);
            block_z_out                 : out std_logic_vector(15 downto 0);
            grid_x_out                  : out std_logic_vector(15 downto 0);
            grid_y_out                  : out std_logic_vector(15 downto 0);
            block_idx_out               : out std_logic_vector(15 downto 0);
            shmem_params_out            : out std_logic_vector(15 downto 0);
            cmem_params_out             : out std_logic_vector(15 downto 0);
            
            threads_per_block_ld        : out std_logic;
            num_blocks_ld               : out std_logic;
            shmem_base_addr_ld          : out std_logic;
            shmem_size_ld               : out std_logic;
            parameter_size_ld           : out std_logic;
            gprs_size_ld                : out std_logic;
            block_x_ld                  : out std_logic;
            block_y_ld                  : out std_logic;
            block_z_ld                  : out std_logic;
            grid_x_ld                   : out std_logic;
            grid_y_ld                   : out std_logic;
            block_idx_ld                : out std_logic;
            
			smp_reset_out			    : out std_logic;
            smp_en_out                  : out std_logic;
            
            rdy                         : out std_logic;
			kernel_done					: out std_logic
        );  
    end component;
    
    component streaming_multiprocessor
        generic (
            STREAMING_MULTIPROCESSOR_ID : std_logic_vector(7 downto 0) := x"00";
            GMEM_ADDR_SIZE              : integer := 32;
            CMEM_ADDR_SIZE              : integer := 32;
            SYSMEM_ADDR_SIZE            : integer := 32
        );
        port (
            clk_in                      : in  std_logic;
            shader_clk_in               : in  std_logic;
			host_reset                  : in  std_logic;
            
            threads_per_block_in        : in  std_logic_vector(11 downto 0);
            num_blocks_in               : in  std_logic_vector(3 downto 0);
            shmem_base_addr_in          : in  std_logic_vector(31 downto 0);
            shmem_size_in               : in  std_logic_vector(31 downto 0);
            parameter_size_in           : in  std_logic_vector(15 downto 0);
            gprs_size_in                : in  std_logic_vector(8 downto 0);
            block_x_in                  : in  std_logic_vector(15 downto 0);
            block_y_in                  : in  std_logic_vector(15 downto 0);
            block_z_in                  : in  std_logic_vector(15 downto 0);
            grid_x_in                   : in  std_logic_vector(15 downto 0);
            grid_y_in                   : in  std_logic_vector(15 downto 0);
            block_idx_in                : in  std_logic_vector(15 downto 0);
            
            threads_per_block_ld        : in  std_logic;
            num_blocks_ld               : in  std_logic;
            shmem_base_addr_ld          : in  std_logic;
            shmem_size_ld               : in  std_logic;
            parameter_size_ld           : in  std_logic;
            gprs_size_ld                : in  std_logic;
            block_x_ld                  : in  std_logic;
            block_y_ld                  : in  std_logic;
            block_z_ld                  : in  std_logic;
            grid_x_ld                   : in  std_logic;
            grid_y_ld                   : in  std_logic;
            block_idx_ld                : in  std_logic;
            
            smp_run_en                  : in  std_logic;
            
            gpgpu_config_reg_cs         : out std_logic;
            gpgpu_config_reg_rw         : out std_logic;
            gpgpu_config_reg_adr        : out std_logic_vector(31 downto 0);
            gpgpu_config_reg_rd_data    : in  std_logic_vector(31 downto 0);
            gpgpu_config_reg_wr_data    : out std_logic_vector(31 downto 0);
            
            gmem_wr_data_a			    : out std_logic_vector(7 downto 0);
            gmem_addr_a				    : out std_logic_vector(GMEM_ADDR_SIZE-1 downto 0);
            gmem_wr_en_a				: out std_logic_vector(0 downto 0);
            gmem_rd_data_a			    : in  std_logic_vector(7 downto 0);
                
            gmem_wr_data_b			    : out std_logic_vector(7 downto 0);
            gmem_addr_b				    : out std_logic_vector(GMEM_ADDR_SIZE-1 downto 0);
            gmem_wr_en_b				: out std_logic_vector(0 downto 0);
            gmem_rd_data_b			    : in  std_logic_vector(7 downto 0);
            
            cmem_wr_data_a              : out std_logic_vector(7 downto 0);
            cmem_addr_a                 : out std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
            cmem_wr_en_a                : out std_logic_vector(0 downto 0);
            cmem_rd_data_a              : in  std_logic_vector(7 downto 0);
            
            cmem_wr_data_b              : out std_logic_vector(7 downto 0);
            cmem_addr_b                 : out std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
            cmem_wr_en_b                : out std_logic_vector(0 downto 0);
            cmem_rd_data_b              : in  std_logic_vector(7 downto 0); 
            
            sysmem_wr_data_a			: out std_logic_vector(7 downto 0);
            sysmem_addr_a				: out std_logic_vector(SYSMEM_ADDR_SIZE-1 downto 0);
            sysmem_wr_en_a				: out std_logic_vector(0 downto 0);
            sysmem_rd_data_a			: in  std_logic_vector(7 downto 0);
                
            sysmem_wr_data_b			: out std_logic_vector(7 downto 0);
            sysmem_addr_b				: out std_logic_vector(SYSMEM_ADDR_SIZE-1 downto 0);
            sysmem_wr_en_b				: out std_logic_vector(0 downto 0);
            sysmem_rd_data_b			: in  std_logic_vector(7 downto 0);
            
            -- stats
            stats_reset                 : in  std_logic;
            smp_stats_out               : out vector_stat_registers;
            
            smp_done                    : out std_logic;
				decode_flag_check					:out std_logic;  --///////////////////**********
				check_dest_reg_out			: out std_logic_vector(8 downto 0);
				read_check_out_out			: out std_logic_vector(9 downto 0);
				
				rd_en_fifo_in :  in STD_LOGIC;
				valid_fifo_out : out STD_LOGIC;
				dout_fifo_out :  out STD_LOGIC_VECTOR(31 DOWNTO 0);

				write_en_noc_ram_in : in std_logic_vector(0 downto 0);
				addr_noc_ram_in : in std_logic_vector(2 downto 0);
				data_noc_ram_in : in std_logic_vector(31 downto 0);
				not_empty: out std_logic
				
				
      );
    end component;
    
    component gpgpu_statistics is
        port (
            clk_in                      : in  std_logic;
            host_reset                  : in  std_logic;
            reset_registers             : in  std_logic;
            
            en                          : in  std_logic;
            
            smp_stats_in                : in vector_stat_registers;
            
            stats_reg_cs                : in  std_logic;
            stats_reg_rw                : in  std_logic;
            stats_reg_adr               : in  std_logic_vector(31 downto 0);
            stats_reg_data_in           : in  std_logic_vector(31 downto 0);
            stats_reg_data_out          : out std_logic_vector(31 downto 0)
        );
    end component;
    
    component ram_8x262144
        port (
            clka                        : in std_logic;
            addra                       : in std_logic_vector(17 downto 0);
            wea                         : in std_logic_vector(0 downto 0);
            dina                        : in std_logic_vector(7 downto 0);
            douta                       : out std_logic_vector(7 downto 0);
            clkb                        : in std_logic;
            addrb                       : in std_logic_vector(17 downto 0);
            web                         : in std_logic_vector(0 downto 0);
            dinb                        : in std_logic_vector(7 downto 0);
            doutb                       : out std_logic_vector(7 downto 0)
        );
    end component;
    
    component ram_8x8192
        port (
            clka                        : in std_logic;
            addra                       : in std_logic_vector(12 downto 0);
            wea                         : in std_logic_vector(0 downto 0);
            dina                        : in std_logic_vector(7 downto 0);
            douta                       : out std_logic_vector(7 downto 0);
            clkb                        : in std_logic;
            addrb                       : in std_logic_vector(12 downto 0);
            web                         : in std_logic_vector(0 downto 0);
            dinb                        : in std_logic_vector(7 downto 0);
            doutb                       : out std_logic_vector(7 downto 0)
        );
    end component;
    
    component system_memory_cntlr
        port (
			clk_in_a                : in  std_logic;
			mem_data_in_a	        : in std_logic_vector(7 downto 0);
			mem_addr_in_a			: in std_logic_vector(8 downto 0);
			mem_wr_en_a				: in std_logic_vector(0 downto 0);
			mem_data_out_a			: out std_logic_vector(7 downto 0);
            
            clk_in_b                : in  std_logic;
			mem_data_in_b			: in std_logic_vector(7 downto 0);
			mem_addr_in_b			: in std_logic_vector(8 downto 0);
			mem_wr_en_b				: in std_logic_vector(0 downto 0);
			mem_data_out_b			: out std_logic_vector(7 downto 0)
		);
	end component;
    
    --signal clk_50HMz                            : std_logic;
    --signal clk_100MHz                           : std_logic;
    --
    --signal block_scheduler_en                   : std_logic;
    
    signal kernel_blocks_per_core               : std_logic_vector(3 downto 0);
    signal kernel_num_gprs                      : std_logic_vector(8 downto 0);
    signal kernel_shmem_size                    : std_logic_vector(31 downto 0);
    signal kernel_parameter_size                : std_logic_vector(15 downto 0);
    signal kernel_dyn_shmem_size                : std_logic_vector(31 downto 0);
    signal kernel_block_x                       : std_logic_vector(15 downto 0);
    signal kernel_block_y                       : std_logic_vector(15 downto 0);
    signal kernel_block_z                       : std_logic_vector(15 downto 0);
    signal kernel_grid_x                        : std_logic_vector(15 downto 0);
    signal kernel_grid_y                        : std_logic_vector(15 downto 0);
    
    signal smp_done                             : std_logic;
    
    signal threads_per_block                    : std_logic_vector(11 downto 0);
    signal num_blocks                           : std_logic_vector(3 downto 0);
    signal shmem_base_addr                      : std_logic_vector(31 downto 0);
    signal shmem_size                           : std_logic_vector(31 downto 0);
    signal parameter_size                       : std_logic_vector(15 downto 0);
    signal gprs_size                            : std_logic_vector(8 downto 0);
    signal block_x                              : std_logic_vector(15 downto 0);
    signal block_y                              : std_logic_vector(15 downto 0);
    signal block_z                              : std_logic_vector(15 downto 0);
    signal grid_x                               : std_logic_vector(15 downto 0);
    signal grid_y                               : std_logic_vector(15 downto 0);
    signal block_idx                            : std_logic_vector(15 downto 0);
    
    signal smp_run_en                           : std_logic;
    
    signal threads_per_block_ld                 : std_logic;
    signal num_blocks_ld                        : std_logic;
    signal shmem_base_addr_ld                   : std_logic;
    signal shmem_size_ld                        : std_logic;
    signal parameter_size_ld                    : std_logic;
    signal gprs_size_ld                         : std_logic;
    signal block_x_ld                           : std_logic;
    signal block_y_ld                           : std_logic;
    signal block_z_ld                           : std_logic;
    signal grid_x_ld                            : std_logic;
    signal grid_y_ld                            : std_logic;
    signal block_idx_ld                         : std_logic;
    signal shmem_params_ld                      : std_logic;
    signal cmem_params_ld                       : std_logic;
    
    signal block_scheduler_rdy                  : std_logic;
    
    signal kernel_done_i                        : std_logic;
    
    --
    -- Streaming Multiprocessor
    --
    signal streaming_multiprocessor_en_i        : std_logic;
    
    --
    -- Configuration
    --
    signal gpgpu_config_reg_cs                  : std_logic;
    signal gpgpu_config_reg_rw                  : std_logic;
    signal gpgpu_config_reg_adr                 : std_logic_vector(31 downto 0);
    signal gpgpu_config_reg_data_in             : std_logic_vector(31 downto 0);
    signal gpgpu_config_reg_data_out            : std_logic_vector(31 downto 0);
    
    signal gpgpu_config_smp_cs                  : std_logic;
    signal gpgpu_config_smp_rw                  : std_logic;
    signal gpgpu_config_smp_adr                 : std_logic_vector(31 downto 0);
    signal gpgpu_config_smp_rd_data             : std_logic_vector(31 downto 0);
    signal gpgpu_config_smp_wr_data             : std_logic_vector(31 downto 0);
    
	--
	-- Memory
	--
    signal gmem_wr_data_a			            : std_logic_vector(7 downto 0);
    signal gmem_addr_a				            : std_logic_vector(GMEM_ADDR_SIZE-1 downto 0);
    signal gmem_wr_en_a				            : std_logic_vector(0 downto 0);
    signal gmem_rd_data_a			            : std_logic_vector(7 downto 0);
    
    signal gmem_wr_data_b			            : std_logic_vector(7 downto 0);
    signal gmem_addr_b				            : std_logic_vector(GMEM_ADDR_SIZE-1 downto 0);
    signal gmem_wr_en_b				            : std_logic_vector(0 downto 0);
    signal gmem_rd_data_b			            : std_logic_vector(7 downto 0);
    
    signal smp_gmem_wr_data_a			        : std_logic_vector(7 downto 0);
    signal smp_gmem_addr_a				        : std_logic_vector(GMEM_ADDR_SIZE-1 downto 0);
    signal smp_gmem_wr_en_a				        : std_logic_vector(0 downto 0);
    signal smp_gmem_rd_data_a			        : std_logic_vector(7 downto 0);
    
    signal smp_gmem_wr_data_b			        : std_logic_vector(7 downto 0);
    signal smp_gmem_addr_b				        : std_logic_vector(GMEM_ADDR_SIZE-1 downto 0);
    signal smp_gmem_wr_en_b				        : std_logic_vector(0 downto 0);
    signal smp_gmem_rd_data_b			        : std_logic_vector(7 downto 0);
    
    signal cmem_wr_data_a			            : std_logic_vector(7 downto 0);
    signal cmem_addr_a				            : std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
    signal cmem_wr_en_a				            : std_logic_vector(0 downto 0);
    signal cmem_rd_data_a			            : std_logic_vector(7 downto 0);
    
    signal cmem_wr_data_b			            : std_logic_vector(7 downto 0);
    signal cmem_addr_b				            : std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
    signal cmem_wr_en_b				            : std_logic_vector(0 downto 0);
    signal cmem_rd_data_b			            : std_logic_vector(7 downto 0);
    
    signal smp_cmem_wr_data_a			        : std_logic_vector(7 downto 0);
    signal smp_cmem_addr_a				        : std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
    signal smp_cmem_wr_en_a				        : std_logic_vector(0 downto 0);
    signal smp_cmem_rd_data_a			        : std_logic_vector(7 downto 0);
    
    signal smp_cmem_wr_data_b			        : std_logic_vector(7 downto 0);
    signal smp_cmem_addr_b				        : std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
    signal smp_cmem_wr_en_b				        : std_logic_vector(0 downto 0);
    signal smp_cmem_rd_data_b			        : std_logic_vector(7 downto 0);
    
    signal sysmem_wr_data_a			            : std_logic_vector(7 downto 0);
	signal sysmem_addr_a				        : std_logic_vector(SYSMEM_ADDR_SIZE-1 downto 0);
	signal sysmem_wr_en_a					    : std_logic_vector(0 downto 0);
	signal sysmem_rd_data_a				        : std_logic_vector(7 downto 0);
    
    signal sysmem_wr_data_b			            : std_logic_vector(7 downto 0);
	signal sysmem_addr_b				        : std_logic_vector(SYSMEM_ADDR_SIZE-1 downto 0);
	signal sysmem_wr_en_b					    : std_logic_vector(0 downto 0);
	signal sysmem_rd_data_b				        : std_logic_vector(7 downto 0);
    
	signal smp_sysmem_wr_data_a			        : std_logic_vector(7 downto 0);
	signal smp_sysmem_addr_a				    : std_logic_vector(SYSMEM_ADDR_SIZE-1 downto 0);
	signal smp_sysmem_wr_en_a					: std_logic_vector(0 downto 0);
	signal smp_sysmem_rd_data_a				    : std_logic_vector(7 downto 0);
	
    signal smp_sysmem_wr_data_b				    : std_logic_vector(7 downto 0);
	signal smp_sysmem_addr_b					: std_logic_vector(SYSMEM_ADDR_SIZE-1 downto 0);
	signal smp_sysmem_wr_en_b					: std_logic_vector(0 downto 0);
	signal smp_sysmem_rd_data_b				    : std_logic_vector(7 downto 0);
	
    --
    -- Stats
    --
    signal smp_stats                            : vector_stat_registers;
	 signal decode_flag_check				:std_logic; --///////////////*****************
	 signal not_empty_i: std_logic;
	 
signal ack: std_logic;
signal    rd_en_fifo_i :  STD_LOGIC;
signal     valid_fifo : STD_LOGIC;
signal     dout_fifo :  STD_LOGIC_VECTOR(31 DOWNTO 0);

signal write_en_noc_ram_i : std_logic_vector(0 downto 0);
signal addr_noc_ram_i : std_logic_vector(2 downto 0);
signal data_noc_ram_i : std_logic_vector(31 downto 0);
    
begin
    req_tb <= not_empty_i;
			read_en_tb <= rd_en_fifo_i;
			valid_tb <= valid_fifo;
			fifo_data_in_tb <= dout_fifo;
	-- Dummy smp_done output for top-level design
	smp_done_signal                 <= smp_done;
    kernel_done                     <= kernel_done_i;
    
    --
    -- Configuration
    --
	 
    gpgpu_config_reg_cs         <= gpgpu_config_top_cs when (gpgpu_config_cntrl_en_in = '1') else gpgpu_config_smp_cs;
    gpgpu_config_reg_rw		    <= gpgpu_config_top_rw when (gpgpu_config_cntrl_en_in = '1') else gpgpu_config_smp_rw;
	gpgpu_config_reg_adr		<= gpgpu_config_top_adr when (gpgpu_config_cntrl_en_in = '1') else gpgpu_config_smp_adr;
    gpgpu_config_reg_data_in	<= gpgpu_config_top_wr_data when (gpgpu_config_cntrl_en_in = '1') else gpgpu_config_smp_wr_data;
	
    gpgpu_config_top_rd_data    <= gpgpu_config_reg_data_out when (gpgpu_config_cntrl_en_in = '1') else (others => '0');
    gpgpu_config_smp_rd_data    <= gpgpu_config_reg_data_out when (gpgpu_config_cntrl_en_in = '0') else (others => '0');
    
	 nocc : NoC
	port map(
		req => not_empty_i,
		ack => ack,
		clk => sys_clk,
		read_en => rd_en_fifo_i,
		write_en_noc => write_en_noc_ram_i,
		write_add => addr_noc_ram_i,
		valid => valid_fifo,
		fifo_data_in => dout_fifo,
		fifo_data_out => data_noc_ram_i
	);

	
    uGPGPUConfiguration : gpgpu_configuration
        port map (
            clk_in                      => sys_clk,
            host_reset                  => host_reset,
            reset_registers             => host_reset,
            
            config_reg_cs               => gpgpu_config_reg_cs,
            config_reg_rw               => gpgpu_config_reg_rw,
            config_reg_adr              => gpgpu_config_reg_adr,
            config_reg_data_in          => gpgpu_config_reg_data_in,
            config_reg_data_out         => gpgpu_config_reg_data_out,
            
            kernel_blocks_per_core      => kernel_blocks_per_core,
            kernel_num_gprs             => kernel_num_gprs,
            kernel_shmem_size           => kernel_shmem_size,
            kernel_parameter_size       => kernel_parameter_size,
            kernel_dyn_shmem_size       => kernel_dyn_shmem_size,
            kernel_block_x              => kernel_block_x,
            kernel_block_y              => kernel_block_y,
            kernel_block_z              => kernel_block_z,
            kernel_grid_x               => kernel_grid_x,
            kernel_grid_y               => kernel_grid_y
        );
    
    --
    -- Block Scheduler
    --
    uBlockScheduler : block_scheduler
        port map (
            clk_in                      => sys_clk,
			host_reset                  => host_reset,
            
            en                          => block_scheduler_en,
            
            kernel_blocks_per_core_in   => kernel_blocks_per_core,
            kernel_num_gprs_in          => kernel_num_gprs,
            kernel_shmem_size_in        => kernel_shmem_size,
            kernel_parameter_size_in    => kernel_parameter_size,
            kernel_dyn_shmem_size_in    => kernel_dyn_shmem_size,
            kernel_block_x_in           => kernel_block_x,
            kernel_block_y_in           => kernel_block_y,
            kernel_block_z_in           => kernel_block_z,
            kernel_grid_x_in            => kernel_grid_x,
            kernel_grid_y_in            => kernel_grid_y,
            
            smp_done_in                 => smp_done,
            
            threads_per_block_out       => threads_per_block,
            num_blocks_out              => num_blocks,
            shmem_base_addr_out         => shmem_base_addr,
            shmem_size_out              => shmem_size,
            parameter_size_out          => parameter_size,
            gprs_size_out               => gprs_size,
            block_x_out                 => block_x,
            block_y_out                 => block_y,
            block_z_out                 => block_z,
            grid_x_out                  => grid_x,
            grid_y_out                  => grid_y,
            block_idx_out               => block_idx,
            
            threads_per_block_ld        => threads_per_block_ld,
            num_blocks_ld               => num_blocks_ld,
            shmem_base_addr_ld          => shmem_base_addr_ld,
            shmem_size_ld               => shmem_size_ld,
            parameter_size_ld           => parameter_size_ld,
            gprs_size_ld                => gprs_size_ld,
            block_x_ld                  => block_x_ld,
            block_y_ld                  => block_y_ld,
            block_z_ld                  => block_z_ld,
            grid_x_ld                   => grid_x_ld,
            grid_y_ld                   => grid_y_ld,
            block_idx_ld                => block_idx_ld,
            
            smp_reset_out				=> open,
            smp_en_out                  => smp_run_en,
            
            rdy                         => block_scheduler_rdy,
            kernel_done					=> kernel_done_i
        );
        
    --
    -- Streaming Multiprocessor
    --
    uStreamingMultiProcessor : streaming_multiprocessor
        generic map (
            STREAMING_MULTIPROCESSOR_ID => x"00",
            GMEM_ADDR_SIZE              => GMEM_ADDR_SIZE,
            CMEM_ADDR_SIZE              => CMEM_ADDR_SIZE,
            SYSMEM_ADDR_SIZE            => SYSMEM_ADDR_SIZE
        )
        port map (
            clk_in                      => sys_clk,
            shader_clk_in               => sys_clk,
            host_reset                  => host_reset,
            
            threads_per_block_in        => threads_per_block,
            num_blocks_in               => num_blocks,
            shmem_base_addr_in          => shmem_base_addr,
            shmem_size_in               => shmem_size,
            parameter_size_in           => parameter_size,
            gprs_size_in                => gprs_size,
            block_x_in                  => block_x,
            block_y_in                  => block_y,
            block_z_in                  => block_z,
            grid_x_in                   => grid_x,
            grid_y_in                   => grid_y,
            block_idx_in                => block_idx,
            
            threads_per_block_ld        => threads_per_block_ld,
            num_blocks_ld               => num_blocks_ld,
            shmem_base_addr_ld          => shmem_base_addr_ld,
            gprs_size_ld                => gprs_size_ld,
            shmem_size_ld               => shmem_size_ld,
            parameter_size_ld           => parameter_size_ld,
            block_x_ld                  => block_x_ld,
            block_y_ld                  => block_y_ld,
            block_z_ld                  => block_z_ld,
            grid_x_ld                   => grid_x_ld,
            grid_y_ld                   => grid_y_ld,
            block_idx_ld                => block_idx_ld,
            
            smp_run_en                  => smp_run_en,
            
            gpgpu_config_reg_cs         => gpgpu_config_smp_cs,
            gpgpu_config_reg_rw         => gpgpu_config_smp_rw,
            gpgpu_config_reg_adr        => gpgpu_config_smp_adr,
            gpgpu_config_reg_rd_data    => gpgpu_config_smp_rd_data,
            gpgpu_config_reg_wr_data    => gpgpu_config_smp_wr_data,
            
            gmem_wr_data_a			    => smp_gmem_wr_data_a,
            gmem_addr_a				    => smp_gmem_addr_a,
            gmem_wr_en_a				=> smp_gmem_wr_en_a,
            gmem_rd_data_a			    => smp_gmem_rd_data_a,
                
            gmem_wr_data_b			    => smp_gmem_wr_data_b,
            gmem_addr_b				    => smp_gmem_addr_b,
            gmem_wr_en_b				=> smp_gmem_wr_en_b,
            gmem_rd_data_b			    => smp_gmem_rd_data_b,
            
            cmem_wr_data_a			    => smp_cmem_wr_data_a,
            cmem_addr_a				    => smp_cmem_addr_a,
            cmem_wr_en_a				=> smp_cmem_wr_en_a,
            cmem_rd_data_a			    => smp_cmem_rd_data_a,
                
            cmem_wr_data_b			    => smp_cmem_wr_data_b,
            cmem_addr_b				    => smp_cmem_addr_b,
            cmem_wr_en_b				=> smp_cmem_wr_en_b,
            cmem_rd_data_b			    => smp_cmem_rd_data_b,
            
            sysmem_wr_data_a	        => smp_sysmem_wr_data_a,
            sysmem_addr_a				=> smp_sysmem_addr_a,
            sysmem_wr_en_a				=> smp_sysmem_wr_en_a,
            sysmem_rd_data_a			=> smp_sysmem_rd_data_a,
                
            sysmem_wr_data_b			=> smp_sysmem_wr_data_b,
            sysmem_addr_b				=> smp_sysmem_addr_b,
            sysmem_wr_en_b				=> smp_sysmem_wr_en_b,
            sysmem_rd_data_b			=> smp_sysmem_rd_data_b,
            
            -- stats
            stats_reset                 => block_scheduler_en,
            smp_stats_out               => smp_stats,
            
            smp_done                    => smp_done, 
				decode_flag_check				=> decode_flag, --////////////////******************
				check_dest_reg_out		=> check_dest_reg_out_tb,
				read_check_out_out			=> read_check_out_tb,
				
				
				rd_en_fifo_in => rd_en_fifo_i,
     valid_fifo_out => valid_fifo,
     dout_fifo_out  => dout_fifo,
	 not_empty => not_empty_i,

 write_en_noc_ram_in => write_en_noc_ram_i,
 addr_noc_ram_in => addr_noc_ram_i,
 data_noc_ram_in => data_noc_ram_i
      );
   
    uGPGPUStatistics : gpgpu_statistics
        port map (
            clk_in                      => sys_clk,
            host_reset                  => host_reset,
            reset_registers             => host_reset,
            
            en                          => kernel_done_i,
            
            smp_stats_in                => smp_stats,
            
            stats_reg_cs                => gpgpu_stats_top_cs,
            stats_reg_rw                => gpgpu_stats_top_rw,
            stats_reg_adr               => gpgpu_stats_top_adr,
            stats_reg_data_in           => gpgpu_stats_top_wr_data,
            stats_reg_data_out          => gpgpu_stats_top_rd_data
        );
        
    --
    -- Global Memory
    --
    gmem_wr_data_a          <= gmem_wr_data_a_in when (gmem_cntrl_en_in = '1') else smp_gmem_wr_data_a;
    gmem_addr_a		        <= gmem_addr_a_in when (gmem_cntrl_en_in = '1') else smp_gmem_addr_a;
	gmem_wr_en_a		    <= gmem_wr_en_a_in when (gmem_cntrl_en_in = '1') else smp_gmem_wr_en_a;
	gmem_rd_data_a_out	    <= gmem_rd_data_a when (gmem_cntrl_en_in = '1') else (others => '0');
    smp_gmem_rd_data_a      <= gmem_rd_data_a when (gmem_cntrl_en_in = '0') else (others => '0');
    
    gmem_wr_data_b          <= gmem_wr_data_b_in when (gmem_cntrl_en_in = '1') else smp_gmem_wr_data_b;
    gmem_addr_b		        <= gmem_addr_b_in when (gmem_cntrl_en_in = '1') else smp_gmem_addr_b;
	gmem_wr_en_b		    <= gmem_wr_en_b_in when (gmem_cntrl_en_in = '1') else smp_gmem_wr_en_b;
	gmem_rd_data_b_out	    <= gmem_rd_data_b when (gmem_cntrl_en_in = '1') else (others => '0');
    smp_gmem_rd_data_b      <= gmem_rd_data_b when (gmem_cntrl_en_in = '0') else (others => '0');
    
    uGlobalMemory : ram_8x262144
		port map (
			clka                            => sys_clk,
            addra                           => gmem_addr_a,
			wea                             => gmem_wr_en_a,
			dina                            => gmem_wr_data_a,
			douta                           => gmem_rd_data_a,
			clkb                            => sys_clk,
            addrb                           => gmem_addr_b,
			web                             => gmem_wr_en_b,
			dinb                            => gmem_wr_data_b,
			doutb                           => gmem_rd_data_b
        );
    
    --
    -- Constant Memory
    --
    cmem_wr_data_a          <= cmem_wr_data_a_in when (cmem_cntrl_en_in = '1') else smp_cmem_wr_data_a;
    cmem_addr_a		        <= cmem_addr_a_in when (cmem_cntrl_en_in = '1') else smp_cmem_addr_a;
	cmem_wr_en_a		    <= cmem_wr_en_a_in when (cmem_cntrl_en_in = '1') else smp_cmem_wr_en_a;
	cmem_rd_data_a_out	    <= cmem_rd_data_a when (cmem_cntrl_en_in = '1') else (others => '0');
    smp_cmem_rd_data_a      <= cmem_rd_data_a when (cmem_cntrl_en_in = '0') else (others => '0');
    
    cmem_wr_data_b          <= cmem_wr_data_b_in when (cmem_cntrl_en_in = '1') else smp_cmem_wr_data_b;
    cmem_addr_b		        <= cmem_addr_b_in when (cmem_cntrl_en_in = '1') else smp_cmem_addr_b;
	cmem_wr_en_b		    <= cmem_wr_en_b_in when (cmem_cntrl_en_in = '1') else smp_cmem_wr_en_b;
	cmem_rd_data_b_out	    <= cmem_rd_data_b when (cmem_cntrl_en_in = '1') else (others => '0');
    smp_cmem_rd_data_b      <= cmem_rd_data_b when (cmem_cntrl_en_in = '0') else (others => '0');
    
    uConstantMemory : ram_8x8192
		port map (
			clka                            => sys_clk,
            addra                           => cmem_addr_a,
			wea                             => cmem_wr_en_a,
			dina                            => cmem_wr_data_a,
			douta                           => cmem_rd_data_a,
			clkb                            => sys_clk,
            addrb                           => cmem_addr_b,
			web                             => cmem_wr_en_b,
			dinb                            => cmem_wr_data_b,
			doutb                           => cmem_rd_data_b
        );
        
    --
    -- System Memory
    --
    sysmem_wr_data_a        <= sysmem_wr_data_a_in when (sysmem_cntrl_en_in = '1') else smp_sysmem_wr_data_a;
    sysmem_addr_a		    <= sysmem_addr_a_in when (sysmem_cntrl_en_in = '1') else smp_sysmem_addr_a;
	sysmem_wr_en_a		    <= sysmem_wr_en_a_in when (sysmem_cntrl_en_in = '1') else smp_sysmem_wr_en_a;
	sysmem_rd_data_a_out	<= sysmem_rd_data_a when (sysmem_cntrl_en_in = '1') else (others => '0');
    smp_sysmem_rd_data_a    <= sysmem_rd_data_a when (sysmem_cntrl_en_in = '0') else (others => '0');
    
    sysmem_wr_data_b        <= sysmem_wr_data_b_in when (sysmem_cntrl_en_in = '1') else smp_sysmem_wr_data_b;
    sysmem_addr_b		    <= sysmem_addr_b_in when (sysmem_cntrl_en_in = '1') else smp_sysmem_addr_b;
	sysmem_wr_en_b		    <= sysmem_wr_en_b_in when (sysmem_cntrl_en_in = '1') else smp_sysmem_wr_en_b;
	sysmem_rd_data_b_out	<= sysmem_rd_data_b when (sysmem_cntrl_en_in = '1') else (others => '0');
    smp_sysmem_rd_data_b    <= sysmem_rd_data_b when (sysmem_cntrl_en_in = '0') else (others => '0');
    
    uSystemMemoryController : system_memory_cntlr
        port map (
            clk_in_a                => sys_clk,
			mem_data_in_a			=> sysmem_wr_data_a,
			mem_addr_in_a			=> sysmem_addr_a,
			mem_wr_en_a				=> sysmem_wr_en_a,
			mem_data_out_a			=> sysmem_rd_data_a,
            
            clk_in_b                => sys_clk,
			mem_data_in_b			=> sysmem_wr_data_b,
			mem_addr_in_b			=> sysmem_addr_b,
			mem_wr_en_b				=> sysmem_wr_en_b,
			mem_data_out_b			=> sysmem_rd_data_b
        );
    
end arch;
