----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      warp_unit - arch 
-- Project Name:     GPGPU
-- Target Devices: 
-- Tool versions:    ISE 10.1
-- Description: 
--
--  ThreadsPerBlock = blockz * blocky * blockx = 256
--      These values are set by the programmer and a system call is made to
--      explicitly set the x, y, and z values. For example, in MatrixMul:
--
--      dim3 threads(block_size, block_size);
--      
--      Where block_size is set to 16, so x = 16. y = 16, and z = 1;
--
--  NumBlocks = std::min(blocksPerCore, height * width - i) = min(2, 255) = 2
--      Height and width are the block x and y values. So, in the case
--      above would be (16 * 16 * 1) - 1 = 255. And blocks per core is the following:
--
--      int blocksreg = CONFIG::MAX_VGPR / (kernel.GPRs() * WarpsPerBlock<CONFIG>(kernel)) = 512/(13*9) = 4
--          CONFIG::MAX_VGPR = 512
--          kernel.GPRs(): This is a value set inside the .cubin file. For exmple, in MatrixMul
--
--              code {
--                  name = _Z9matrixMulPfS_S_ii
--	                lmem = 0
--	                smem = 2084
--	                reg  = 13
--	                bar  = 1
--
--          WarpPerBlock = (ThreadsPerBlock(kernel) + CONFIG::WARP_SIZE - 1) / CONFIG::WARP_SIZE = (255 + 31)/32 = 9;
--              ThreadsPerBlock(kernel) =  16 * 16 - 1 = 255 (see above)
--              CONFIG::WARP_SIZE = 32 (defined in gpgpu_package.vhd) 
--                
--	    int blockssm = CONFIG::SHARED_SIZE / kernel.SharedTotal() = (16*1024) / ((16 + 0 + 2048 + 0 + 255) & (~255)) = 16384 / 2304 = 7
--              CONFIG::SHARED_SIZE = 16 * 1024 (defined in gpgpu_package.vhd) 
--              kernel.SharedTotal() = (16 + param_size + smem + dyn_smem + 255) & (~255);
--                  param_size: Function call from program to cuParamSetSize(). Not set in MatrixMul
--                  smem: Set in the .cubin file (see above) and is set to:
--                      smem = 2084
--                  dyn_smem: Called by program, cuFuncSetSharedSize(). Not used in MatrixMul
--
--	    int blockswarps = CONFIG::MAX_WARPS / WarpsPerBlock<CONFIG>(kernel) = 24 / 9 = 2
--	
--	    return std::min(std::min(blocksreg, blockssm), std::min(int(CONFIG::MAX_CTAS), blockswarps))
--                      (min(4, 7), min(8, 2)) = min(4, 2) = 2
--
--  ShmemBaseAddr: This would be the base address of the shared memory
--
--  SharedSize = kernel.SharedTotal() = (16 + param_size + smem + dyn_smem + 255) & (~255) = (16+0+2048+0+255) = 2304
--
--  GprsSize = kernel.GPRs() = 13
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

    entity warp_unit is
        generic (
            SHMEM_ADDR_SIZE             : integer := 14
        );
        port (
            clk_in                      : in  std_logic;
            host_reset                  : in  std_logic;
            warp_scheduler_reset        : in  std_logic;
            
            warp_generator_en           : in  std_logic;
            check_warp_en               : in  std_logic;
            pipeline_stall_in           : in  std_logic;
            
            threads_per_block_in        : in  std_logic_vector(11 downto 0);
            num_blocks_in               : in  std_logic_vector(3 downto 0);
            warps_per_block_in          : in  std_logic_vector(5 downto 0);
            shared_mem_base_addr_in     : in  std_logic_vector(31 downto 0);
            shared_mem_size_in          : in  std_logic_vector(31 downto 0);
            gprs_size_in                : in  std_logic_vector(8 downto 0);
            block_x_in                  : in  std_logic_vector(15 downto 0);
            block_y_in                  : in  std_logic_vector(15 downto 0);
            block_z_in                  : in  std_logic_vector(15 downto 0);
            grid_x_in                   : in  std_logic_vector(15 downto 0);
            grid_y_in                   : in  std_logic_vector(15 downto 0);
            block_idx_in                : in  std_logic_vector(15 downto 0);
            
            warp_id_in                  : in  std_logic_vector(4 downto 0);
            warp_lane_id_in             : in  std_logic_vector(1 downto 0);
            cta_id_in                   : in  std_logic_vector(3 downto 0);
            initial_mask_in             : in  std_logic_vector(31 downto 0);
            current_mask_in             : in  std_logic_vector(31 downto 0);
            shmem_base_addr_in          : in  std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
            gprs_base_addr_in           : in  std_logic_vector(8 downto 0);
            next_pc_in                  : in  std_logic_vector(31 downto 0);
            warp_state_in               : in  warp_state_type;
            
            program_cntr_out            : out std_logic_vector(31 downto 0);
            warp_id_out                 : out std_logic_vector(4 downto 0);
            warp_lane_id_out            : out std_logic_vector(1 downto 0);
            cta_id_out                  : out std_logic_vector(3 downto 0);
            initial_mask_out            : out std_logic_vector(31 downto 0);
            current_mask_out            : out std_logic_vector(31 downto 0);
            shmem_base_addr_out         : out std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
            gprs_size_out               : out std_logic_vector(8 downto 0);
            gprs_base_addr_out          : out std_logic_vector(8 downto 0);
            
            num_warps_out               : out std_logic_vector(4 downto 0);
            warp_generator_done         : out std_logic;
            
            pipeline_stall_out          : out std_logic;
            warp_scheduler_done         : out std_logic;
            
            -- stats
            stats_reset                 : in  std_logic;
            stats_warp_generator_out    : out stat_record;
            stats_warp_scheduler_out    : out stat_record;
            stats_warp_checker_out      : out stat_record;
            stats_smp_out               : out stat_record;
            
            pipeline_reg_ld	            : out std_logic;
			fetch_en					: out std_logic
        );
    end warp_unit;

architecture arch of warp_unit is

    --
    -- Component Declarations
    --
    component warp_configuration is
        port (
            clk_in                      : in  std_logic;
            host_reset                  : in  std_logic;
         
            reg_num_warps_in            : in  std_logic_vector(4 downto 0);
            
            reg_num_warps_ld            : in  std_logic;
            
            reg_num_warps_out           : out std_logic_vector(4 downto 0)
        );
    end component;


    component warp_generator
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
    end component;
    
    component warp_scheduler
        generic (
            SHMEM_ADDR_SIZE             : integer := 14
        );
        port (
            clk_in                      : in  std_logic;
			host_reset                  : in  std_logic;
            reset                       : in  std_logic;
            
            pipeline_stall_in           : in std_logic;
            
            num_blocks_in               : in  std_logic_vector(3 downto 0);
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
    end component;
    
    component warp_checker
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
            warps_per_block_in      	: in  std_logic_vector(5 downto 0);
            
            warp_pool_addr_out          : out std_logic_vector(4 downto 0);
			warp_pool_wr_en_out	        : out std_logic_vector(0 downto 0);
            warp_pool_wr_data_out	    : out std_logic_vector(127 downto 0);
            warp_pool_rd_data_in	    : in  std_logic_vector(127 downto 0);
            
            warp_state_addr_out         : out std_logic_vector(4 downto 0);
			warp_state_wr_en_out	   	: out std_logic_vector(0 downto 0);
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
    end component;

    component fence_registers
        port (
            clk_in                  : in  std_logic;
            host_reset              : in  std_logic;
            
            cta_id_in               : in  std_logic_vector(3 downto 0);
            cta_id_ld               : in  std_logic;
            
            fence_en_in             : in  std_logic;
            fence_en_ld             : in  std_logic;
            
            cta_id_out              : out std_logic_vector(3 downto 0);
            fence_en_out            : out std_logic
        );
    end component;
    
    component dp_ram_128x32
        port (
            clka                        : in std_logic;
            wea                         : in std_logic_vector(0 downto 0);
            addra                       : in std_logic_vector(4 downto 0);
            dina                        : in std_logic_vector(127 downto 0);
            douta                       : out std_logic_vector(127 downto 0);
            clkb                        : in std_logic;
            web                         : in std_logic_vector(0 downto 0);
            addrb                       : in std_logic_vector(4 downto 0);
            dinb                        : in std_logic_vector(127 downto 0);
            doutb                       : out std_logic_vector(127 downto 0)
        );
    end component;

    component dp_ram_2x32
        port (
            clka                        : in std_logic;
            wea                         : in std_logic_vector(0 downto 0);
            addra                       : in std_logic_vector(4 downto 0);
            dina                        : in std_logic_vector(1 downto 0);
            douta                       : out std_logic_vector(1 downto 0);
            clkb                        : in std_logic;
            web                         : in std_logic_vector(0 downto 0);
            addrb                       : in std_logic_vector(4 downto 0);
            dinb                        : in std_logic_vector(1 downto 0);
            doutb                       : out std_logic_vector(1 downto 0)
        );
    end component;
    
    --
    -- Signal Declarations
    --
    signal warp_gen_pool_addr                   : std_logic_vector(4 downto 0);
	signal warp_gen_pool_wr_en	                : std_logic_vector(0 downto 0);
    signal warp_gen_pool_wr_data	            : std_logic_vector(127 downto 0);
            
    signal warp_gen_state_addr                  : std_logic_vector(4 downto 0);
	signal warp_gen_state_wr_en                 : std_logic_vector(0 downto 0);
    signal warp_gen_state_wr_data	            : std_logic_vector(1 downto 0);
    
    signal num_warps_d                          : std_logic_vector(4 downto 0);      
    signal num_warps_ld                         : std_logic;
    signal reg_num_warps                        : std_logic_vector(4 downto 0);
    
    signal warp_sched_pool_addr                 : std_logic_vector(4 downto 0);
	signal warp_sched_pool_wr_en	            : std_logic_vector(0 downto 0);
    signal warp_sched_pool_wr_data	            : std_logic_vector(127 downto 0);
    signal warp_sched_pool_rd_data	            : std_logic_vector(127 downto 0);
            
    signal warp_sched_state_addr                : std_logic_vector(4 downto 0);
	signal warp_sched_state_wr_en	            : std_logic_vector(0 downto 0);
    signal warp_sched_state_wr_data	            : std_logic_vector(1 downto 0);
    signal warp_sched_state_rd_data	            : std_logic_vector(1 downto 0);
    
	signal warp_pool_wr_en_a                    : std_logic_vector(0 downto 0);
	signal warp_pool_addr_a                     : std_logic_vector(4 downto 0);
	signal warp_pool_wr_data_a                  : std_logic_vector(127 downto 0);
	signal warp_pool_rd_data_a                  : std_logic_vector(127 downto 0);
    
	signal warp_pool_wr_en_b                    : std_logic_vector(0 downto 0);
	signal warp_pool_addr_b                     : std_logic_vector(4 downto 0);
	signal warp_pool_wr_data_b                  : std_logic_vector(127 downto 0);
	signal warp_pool_rd_data_b                  : std_logic_vector(127 downto 0);
    
    signal warp_state_wr_en_a                   : std_logic_vector(0 downto 0);
	signal warp_state_addr_a                    : std_logic_vector(4 downto 0);
	signal warp_state_wr_data_a                 : std_logic_vector(1 downto 0);
	signal warp_state_rd_data_a                 : std_logic_vector(1 downto 0);
    
	signal warp_state_wr_en_b                   : std_logic_vector(0 downto 0);
	signal warp_state_addr_b                    : std_logic_vector(4 downto 0);
	signal warp_state_wr_data_b                 : std_logic_vector(1 downto 0);
	signal warp_state_rd_data_b                 : std_logic_vector(1 downto 0);
    
    signal warp_gen_fence_regs_rd_cta_id        : fence_regs_vector_array;
    signal warp_checker_fence_regs_rd_cta_id    : fence_regs_vector_array;
    signal warp_gen_fence_regs_cta_id_ld        : fence_regs_std_array;
    signal warp_gen_fence_regs_wr_cta_id        : fence_regs_vector_array;
    
    signal warp_gen_fence_regs_rd_fence_en      : fence_regs_std_array;
    signal warp_checker_fence_regs_rd_fence_en  : fence_regs_std_array;
    signal warp_gen_fence_regs_fence_en_ld      : fence_regs_std_array;
    signal warp_checker_fence_regs_fence_en_ld  : fence_regs_std_array;
    signal warp_gen_fence_regs_wr_fence_en      : fence_regs_std_array;
    signal warp_checker_fence_regs_wr_fence_en  : fence_regs_std_array;
	 
    signal fence_regs_rd_cta_id                 : fence_regs_vector_array;
    signal fence_regs_cta_id_ld                 : fence_regs_std_array;
    signal fence_regs_wr_cta_id                 : fence_regs_vector_array;
    
    signal fence_regs_rd_fence_en               : fence_regs_std_array;
    signal fence_regs_fence_en_ld               : fence_regs_std_array;
    signal fence_regs_wr_fence_en               : fence_regs_std_array;
    
    signal warps_done_mask_int                  : std_logic_vector(MAX_WARPS-1 downto 0);
    signal warps_done_mask_int_reg              : std_logic_vector(MAX_WARPS-1 downto 0);
    
begin
    
    uWarpConfiguration : warp_configuration
        port map (
            clk_in                      => clk_in,
			host_reset                  => host_reset,
            
            reg_num_warps_in            => num_warps_d,
            
            reg_num_warps_ld            => num_warps_ld,
            
            reg_num_warps_out           => reg_num_warps
        );
        
    uWarpGenerator : warp_generator
        generic map (
            SHMEM_ADDR_SIZE             => SHMEM_ADDR_SIZE
        )
        port map (
            clk_in                      => clk_in,
            host_reset                  => host_reset,
            
            en                          => warp_generator_en,
            
            threads_per_block_in        => threads_per_block_in,
            num_blocks_in               => num_blocks_in,
            warps_per_block_in          => warps_per_block_in,
            shmem_base_addr_in          => shared_mem_base_addr_in,
            shmem_size_in               => shared_mem_size_in,
            gprs_size_in                => gprs_size_in,
            
            warp_pool_addr_out          => warp_gen_pool_addr,
			warp_pool_wr_en_out	        => warp_gen_pool_wr_en,
            warp_pool_wr_data_out	    => warp_gen_pool_wr_data,
            
            warp_state_addr_out         => warp_gen_state_addr,
			warp_state_wr_en_out        => warp_gen_state_wr_en,
            warp_state_wr_data_out	    => warp_gen_state_wr_data,
            
            fence_regs_cta_id_out       => warp_gen_fence_regs_wr_cta_id,
            fence_regs_cta_id_ld        => warp_gen_fence_regs_cta_id_ld,
            
            fence_regs_fence_en_out     => warp_gen_fence_regs_wr_fence_en,
            fence_regs_fence_en_ld      => warp_gen_fence_regs_fence_en_ld,
            
            num_warps_out               => num_warps_d,
            num_warps_ld                => num_warps_ld,
            
            stats_reset                 => stats_reset,
            stats_out                   => stats_warp_generator_out,
            
            done                        => warp_generator_done
        );

    uWarpScheduler : warp_scheduler
        generic map (
            SHMEM_ADDR_SIZE             => SHMEM_ADDR_SIZE
        )
        port map (
            clk_in                      => clk_in,
			host_reset                  => host_reset,
            reset                       => warp_scheduler_reset,
            
            pipeline_stall_in           => pipeline_stall_in,
            
            num_blocks_in               => num_blocks_in,
			num_warps_in                => reg_num_warps,
            gprs_size_in                => gprs_size_in,
            
            warps_done_mask_in          => warps_done_mask_int_reg,
            
            warp_pool_addr_out          => warp_sched_pool_addr,
			warp_pool_wr_en_out	        => warp_sched_pool_wr_en,
            warp_pool_wr_data_out	    => warp_sched_pool_wr_data,
            warp_pool_rd_data_in	    => warp_sched_pool_rd_data,
            
            warp_state_addr_out         => warp_sched_state_addr,
			warp_state_wr_en_out	    => warp_sched_state_wr_en,
            warp_state_wr_data_out	    => warp_sched_state_wr_data,
            warp_state_rd_data_in	    => warp_sched_state_rd_data,
            
            program_cntr_out            => program_cntr_out,
            warp_id_out                 => warp_id_out,
            warp_lane_id_out            => warp_lane_id_out,
            cta_id_out                  => cta_id_out,
            initial_mask_out            => initial_mask_out,
            current_mask_out            => current_mask_out,
            shmem_base_addr_out         => shmem_base_addr_out,
            gprs_size_out               => gprs_size_out,
            gprs_base_addr_out          => gprs_base_addr_out,
            
            done                        => warp_scheduler_done,
            
            stats_reset                 => stats_reset,
            stats_out                   => stats_warp_scheduler_out,
            stats_smp_out               => stats_smp_out,
            
            pipeline_reg_ld	            => pipeline_reg_ld,
			fetch_en					=> fetch_en
        );
        
    uWarpChecker : warp_checker
        generic map (
            SHMEM_ADDR_SIZE             => SHMEM_ADDR_SIZE
        )
        port map (
            clk_in                      => clk_in,
			host_reset                  => host_reset,
            reset                       => warp_scheduler_reset,
            
            en                          => check_warp_en,
            
            warp_id_in                  => warp_id_in,
            warp_lane_id_in             => warp_lane_id_in,
            cta_id_in                   => cta_id_in,
            initial_mask_in             => initial_mask_in,
            current_mask_in             => current_mask_in,
            shmem_base_addr_in          => shmem_base_addr_in,
            gprs_base_addr_in           => gprs_base_addr_in,
            next_pc_in                  => next_pc_in,
            warp_state_in               => warp_state_in,
            warps_per_block_in          => warps_per_block_in,
				
            warp_pool_addr_out          => warp_pool_addr_b,
			warp_pool_wr_en_out	        => warp_pool_wr_en_b,
            warp_pool_wr_data_out	    => warp_pool_wr_data_b,
            warp_pool_rd_data_in	    => warp_pool_rd_data_b,
            
            warp_state_addr_out         => warp_state_addr_b,
			warp_state_wr_en_out	   	=> warp_state_wr_en_b,
            warp_state_wr_data_out	    => warp_state_wr_data_b,
            warp_state_rd_data_in	    => warp_state_rd_data_b,
            
            fence_regs_fence_en_out     => warp_checker_fence_regs_wr_fence_en,
            fence_regs_fence_en_ld      => warp_checker_fence_regs_fence_en_ld,
            
            fence_regs_cta_id_in        => warp_checker_fence_regs_rd_cta_id,
            fence_regs_fence_en_in      => warp_checker_fence_regs_rd_fence_en,
            
            warps_done_mask_out         => warps_done_mask_int,
            
            stats_reset                 => stats_reset,
            stats_out                   => stats_warp_checker_out,
            
            pipeline_stall_out          => pipeline_stall_out
        );
    
    
    pWarpCheckerToWarScheduler : process(clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (host_reset = '1' or warp_scheduler_reset = '1') then
                warps_done_mask_int_reg         <= (others => '0');
            else
                warps_done_mask_int_reg         <= warps_done_mask_int;
            end if;
        end if;
    end process;
    
    uWarpPoolMemory : dp_ram_128x32
		port map (
			clka                        => clk_in,
			wea                         => warp_pool_wr_en_a,
			addra                       => warp_pool_addr_a,
			dina                        => warp_pool_wr_data_a,
			douta                       => warp_pool_rd_data_a,
			clkb                        => clk_in,
			web                         => warp_pool_wr_en_b,
			addrb                       => warp_pool_addr_b,
			dinb                        => warp_pool_wr_data_b,
			doutb                       => warp_pool_rd_data_b
        );
    
    uWarpStateMemory : dp_ram_2x32
		port map (
			clka                        => clk_in,
			wea                         => warp_state_wr_en_a,
			addra                       => warp_state_addr_a,
			dina                        => warp_state_wr_data_a,
			douta                       => warp_state_rd_data_a,
			clkb                        => clk_in,
			web                         => warp_state_wr_en_b,
			addrb                       => warp_state_addr_b,
			dinb                        => warp_state_wr_data_b,
			doutb                       => warp_state_rd_data_b
        );
    
    gFenceRegisters: for i in 0 to MAX_WARPS-1 generate
        uFenceRegisters : fence_registers
            port map (
                clk_in                  => clk_in,
                host_reset              => host_reset,
                
                cta_id_in               => fence_regs_wr_cta_id(i),
                cta_id_ld               => fence_regs_cta_id_ld(i),
                
                fence_en_in             => fence_regs_wr_fence_en(i),
                fence_en_ld             => fence_regs_fence_en_ld(i),
                
                cta_id_out              => fence_regs_rd_cta_id(i),
                fence_en_out            => fence_regs_rd_fence_en(i)
            );
    end generate;
    
    warp_pool_wr_en_a                   <= warp_gen_pool_wr_en when (warp_scheduler_reset = '1') else warp_sched_pool_wr_en;
    warp_pool_addr_a                    <= warp_gen_pool_addr when (warp_scheduler_reset = '1') else warp_sched_pool_addr;
    warp_pool_wr_data_a                 <= warp_gen_pool_wr_data when (warp_scheduler_reset = '1') else warp_sched_pool_wr_data;
    warp_sched_pool_rd_data             <= warp_pool_rd_data_a;
    
    warp_state_wr_en_a                  <= warp_gen_state_wr_en when (warp_scheduler_reset = '1') else warp_sched_state_wr_en;
    warp_state_addr_a                   <= warp_gen_state_addr when (warp_scheduler_reset = '1') else warp_sched_state_addr;
    warp_state_wr_data_a                <= warp_gen_state_wr_data when (warp_scheduler_reset = '1') else warp_sched_state_wr_data;
    warp_sched_state_rd_data            <= warp_state_rd_data_a;
    
    fence_regs_wr_cta_id                <= warp_gen_fence_regs_wr_cta_id when (warp_scheduler_reset = '1') else (others => (others => '0'));
    fence_regs_cta_id_ld                <= warp_gen_fence_regs_cta_id_ld when (warp_scheduler_reset = '1') else (others => '0');
    
    warp_checker_fence_regs_rd_cta_id   <=
       fence_regs_rd_cta_id when (warp_scheduler_reset = '0') else
       (others => (others => '0'));
   
    warp_gen_fence_regs_rd_cta_id       <= 
        fence_regs_rd_cta_id when (warp_scheduler_reset = '1') else
       (others => (others => '0'));
    
    fence_regs_wr_fence_en              <= warp_gen_fence_regs_wr_fence_en when (warp_scheduler_reset = '1') else warp_checker_fence_regs_wr_fence_en;
    fence_regs_fence_en_ld              <= warp_gen_fence_regs_fence_en_ld when (warp_scheduler_reset = '1') else warp_checker_fence_regs_fence_en_ld;
    
    warp_checker_fence_regs_rd_fence_en <=
        fence_regs_rd_fence_en  when (warp_scheduler_reset = '0') else
        (others => '0');
        
    warp_gen_fence_regs_rd_fence_en     <=
        fence_regs_rd_fence_en  when (warp_scheduler_reset = '1') else
        (others => '0');    
    
    num_warps_out                       <= reg_num_warps;

end arch;

