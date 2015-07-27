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

    entity gpgpu_top_level is
        port (
            clk_in_p 					    : in  std_logic;
            clk_in_n 					    : in  std_logic;
            
            gpgpu_config_cntrl_en_in        : in  std_logic;
            gpgpu_config_top_cs             : in  std_logic;
            gpgpu_config_top_rw             : in  std_logic;
            gpgpu_config_top_adr            : in  std_logic_vector(31 downto 0);
            gpgpu_config_top_rd_data        : out std_logic_vector(31 downto 0);
            gpgpu_config_top_wr_data        : in  std_logic_vector(31 downto 0);
            
            cmem_cntrl_en_in                : in std_logic;
            cmem_wr_data_a_top			    : in std_logic_vector(7 downto 0);
            cmem_addr_a_top				    : in std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
            cmem_wr_en_a_top				: in std_logic_vector(0 downto 0);
            cmem_rd_data_a_top			    : out std_logic_vector(7 downto 0);
    
            block_scheduler_en		        : in  std_logic;
			write_instructions_en           : in  std_logic;
            write_instructions_done         : out std_logic;
			host_reset_out			        : out std_logic;
			kernel_done					    : out std_logic
        );
    end gpgpu_top_level;

architecture arch of gpgpu_top_level is

    --
    -- Clocks and reset
    --
    signal sys_clk                              : std_logic;
    signal sys_dcm_locked                       : std_logic;
    signal all_dcms_locked                      : std_logic;
   
    signal host_reset_reg                       : std_logic_vector(3 downto 0);
    signal host_reset                           : std_logic;
	signal smp_reset_out					    : std_logic;
	signal smp_reset_in						    : std_logic;
    
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
    --
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
    
    signal block_scheduler_rdy                  : std_logic;
    
    --
    -- Streaming Multiprocessor
    --
    signal streaming_multiprocessor_en_i        : std_logic;
    
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
    
    signal cmem_wr_data_a			            : std_logic_vector(7 downto 0);
    signal cmem_addr_a				            : std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
    signal cmem_wr_en_a				            : std_logic_vector(0 downto 0);
    signal cmem_rd_data_a			            : std_logic_vector(7 downto 0);
    
    signal cmem_wr_data_a_smp			        : std_logic_vector(7 downto 0);
    signal cmem_addr_a_smp				        : std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
    signal cmem_wr_en_a_smp				        : std_logic_vector(0 downto 0);
    signal cmem_rd_data_a_smp			        : std_logic_vector(7 downto 0);
    
    signal cmem_wr_data_b			            : std_logic_vector(7 downto 0);
    signal cmem_addr_b				            : std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
    signal cmem_wr_en_b				            : std_logic_vector(0 downto 0);
    signal cmem_rd_data_b			            : std_logic_vector(7 downto 0);
    
	signal sysmem_wr_data_a			            : std_logic_vector(7 downto 0);
	signal sysmem_addr_a				        : std_logic_vector(SYSMEM_ADDR_SIZE-1 downto 0);
	signal sysmem_wr_en_a					    : std_logic_vector(0 downto 0);
	signal sysmem_rd_data_a				        : std_logic_vector(7 downto 0);
	
    signal sysmem_wr_data_b				        : std_logic_vector(7 downto 0);
	signal sysmem_addr_b					    : std_logic_vector(SYSMEM_ADDR_SIZE-1 downto 0);
	signal sysmem_wr_en_b					    : std_logic_vector(0 downto 0);
	signal sysmem_rd_data_b				        : std_logic_vector(7 downto 0);
	
begin

    -- Create an AND'd lock signal 
    all_dcms_locked             <= sys_dcm_locked;  
	smp_reset_in				<= smp_reset_out;					
	
    --
    -- Generate an internal reset
    --
    pInternalReset: process (all_dcms_locked, sys_clk)
    begin
        if (all_dcms_locked = '0') then 
            host_reset_reg(3 downto 0)   <= "1111";
            host_reset                   <= '1';
        elsif (rising_edge(sys_clk)) then 
            host_reset_reg(3 downto 0)   <= host_reset_reg(2 downto 0) & '0'; 
            host_reset                   <= host_reset_reg(3);
        end if;                    
    end process;
    
	host_reset_out <= host_reset;
    
    --
    -- Configuration
    --
    gpgpu_config_reg_cs         <= gpgpu_config_top_cs when (gpgpu_config_cntrl_en_in = '1') else gpgpu_config_smp_cs;
    gpgpu_config_reg_rw		    <= gpgpu_config_top_rw when (gpgpu_config_cntrl_en_in = '1') else gpgpu_config_smp_rw;
	gpgpu_config_reg_adr		<= gpgpu_config_top_adr when (gpgpu_config_cntrl_en_in = '1') else gpgpu_config_smp_adr;
    gpgpu_config_reg_data_in	<= gpgpu_config_top_wr_data when (gpgpu_config_cntrl_en_in = '1') else gpgpu_config_smp_wr_data;
	
    
    gpgpu_config_top_rd_data    <= gpgpu_config_reg_data_out when (gpgpu_config_cntrl_en_in = '1') else (others => '0');
    gpgpu_config_smp_rd_data    <= gpgpu_config_reg_data_out when (gpgpu_config_cntrl_en_in = '0') else (others => '0');
    
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
            
			smp_reset_out				=> smp_reset_out,
            smp_en_out                  => smp_run_en,
            
            rdy                         => block_scheduler_rdy,
			kernel_done					=> kernel_done
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
            host_reset                  => smp_reset_in,
            
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
            
            gmem_wr_data_a			    => gmem_wr_data_a,
            gmem_addr_a				    => gmem_addr_a,
            gmem_wr_en_a				=> gmem_wr_en_a,
            gmem_rd_data_a			    => gmem_rd_data_a,
                
            gmem_wr_data_b			    => gmem_wr_data_b,
            gmem_addr_b				    => gmem_addr_b,
            gmem_wr_en_b				=> gmem_wr_en_b,
            gmem_rd_data_b			    => gmem_rd_data_b,
            
            cmem_wr_data_a			    => cmem_wr_data_a_smp,
            cmem_addr_a				    => cmem_addr_a_smp,
            cmem_wr_en_a				=> cmem_wr_en_a_smp,
            cmem_rd_data_a			    => cmem_rd_data_a_smp,
                
            cmem_wr_data_b			    => cmem_wr_data_b,
            cmem_addr_b				    => cmem_addr_b,
            cmem_wr_en_b				=> cmem_wr_en_b,
            cmem_rd_data_b			    => cmem_rd_data_b,
            
            sysmem_wr_data_a	        => sysmem_wr_data_a,
            sysmem_addr_a				=> sysmem_addr_a,
            sysmem_wr_en_a				=> sysmem_wr_en_a,
            sysmem_rd_data_a			=> sysmem_rd_data_a,
                
            sysmem_wr_data_b			=> sysmem_wr_data_b,
            sysmem_addr_b				=> sysmem_addr_b,
            sysmem_wr_en_b				=> sysmem_wr_en_b,
            sysmem_rd_data_b			=> sysmem_rd_data_b,
            
			write_instructions_en       => write_instructions_en,
            write_instructions_done     => write_instructions_done,
				
            smp_done                    => smp_done
      );
        
    --
    -- Global Memory
    --
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
    cmem_addr_a         <= cmem_addr_a_top when (cmem_cntrl_en_in = '1') else cmem_addr_a_smp;
    cmem_wr_en_a        <= cmem_wr_en_a_top when (cmem_cntrl_en_in = '1') else cmem_wr_en_a_smp;
    cmem_wr_data_a      <= cmem_wr_data_a_top when (cmem_cntrl_en_in = '1') else cmem_wr_data_a_smp;
    cmem_rd_data_a_top  <= cmem_rd_data_a when (cmem_cntrl_en_in = '1') else (others => '0');
    cmem_rd_data_a_smp  <= cmem_rd_data_a when (cmem_cntrl_en_in = '0') else (others => '0');
    
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
    
    uSystemClock : system_clock_mmcm
        port map (
            clk_in1_p   => clk_in_p,
            clk_in1_n   => clk_in_n,
    
            clk_out1    => sys_clk,
    
            reset       => '0',
            locked      => sys_dcm_locked
        );

end arch;

