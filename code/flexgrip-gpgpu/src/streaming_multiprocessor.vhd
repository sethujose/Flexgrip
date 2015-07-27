----------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      streaming_multiprocessor - arch 
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
--use IEEE.std_logic_arith.ALL;
use IEEE.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

library vector_registers_8_lib;
library vector_registers_16_lib;
library vector_registers_32_lib;
library predicate_registers_8_lib;
library predicate_registers_16_lib;
library predicate_registers_32_lib;
library address_registers_8_lib;
library address_registers_16_lib;
library address_registers_32_lib;
library calculate_address_lib;
--library local_address_lib;

use work.gpgpu_package.all;

    entity streaming_multiprocessor is
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
				decode_flag_check					: out std_logic; --///////////************
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
   end streaming_multiprocessor;

architecture arch of streaming_multiprocessor is

    --
    -- Component Declarations
    --
    component streaming_multiprocessor_configuration
        port (
            clk_in                      : in  std_logic;
            host_reset                  : in  std_logic;
         
            reg_threads_per_block_in    : in  std_logic_vector(11 downto 0);
            reg_num_blocks_in           : in  std_logic_vector(3 downto 0);
            reg_warps_per_block_in      : in  std_logic_vector(5 downto 0);
            reg_shmem_base_addr_in      : in  std_logic_vector(31 downto 0);
            reg_shmem_size_in           : in  std_logic_vector(31 downto 0);
            reg_parameter_size_in       : in  std_logic_vector(15 downto 0);
            reg_gprs_size_in            : in  std_logic_vector(8 downto 0);
            reg_block_x_in              : in  std_logic_vector(15 downto 0);
            reg_block_y_in              : in  std_logic_vector(15 downto 0);
            reg_block_z_in              : in  std_logic_vector(15 downto 0);
            reg_grid_x_in               : in  std_logic_vector(15 downto 0);
            reg_grid_y_in               : in  std_logic_vector(15 downto 0);
            reg_block_idx_in            : in  std_logic_vector(15 downto 0);
            
            reg_threads_per_block_ld    : in  std_logic;
            reg_num_blocks_ld           : in  std_logic;
            reg_warps_per_block_ld      : in  std_logic;
            reg_shmem_base_addr_ld      : in  std_logic;
            reg_shmem_size_ld           : in  std_logic;
            reg_parameter_size_ld       : in  std_logic;
            reg_gprs_size_ld            : in  std_logic;
            reg_block_x_ld              : in  std_logic;
            reg_block_y_ld              : in  std_logic;
            reg_block_z_ld              : in  std_logic;
            reg_grid_x_ld               : in  std_logic;
            reg_grid_y_ld               : in  std_logic;
            reg_block_idx_ld            : in  std_logic;
            
            reg_threads_per_block_out   : out std_logic_vector(11 downto 0);
            reg_num_blocks_out          : out std_logic_vector(3 downto 0);
            reg_warps_per_block_out     : out std_logic_vector(5 downto 0);
            reg_shmem_base_addr_out     : out std_logic_vector(31 downto 0);
            reg_shmem_size_out          : out std_logic_vector(31 downto 0);
            reg_parameter_size_out      : out std_logic_vector(15 downto 0);
            reg_gprs_size_out           : out std_logic_vector(8 downto 0);
            reg_block_x_out             : out std_logic_vector(15 downto 0);
            reg_block_y_out             : out std_logic_vector(15 downto 0);
            reg_block_z_out             : out std_logic_vector(15 downto 0);
            reg_grid_x_out              : out std_logic_vector(15 downto 0);
            reg_grid_y_out              : out std_logic_vector(15 downto 0);
            reg_block_idx_out           : out std_logic_vector(15 downto 0)
				
				
        );
    end component;
    
    component streaming_multiprocessor_cntlr
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
    end component;
    
    component warp_unit
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
    end component;

    component pipeline_fetch
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
    end component;
    
    component pipeline_decode
        generic (
            SHMEM_ADDR_SIZE             : integer := 14
        );
        port (
            reset                       : in  std_logic;
            clk_in                      : in  std_logic;
         
            en                          : in  std_logic;
            pipeline_stall_in           : in  std_logic;
            
            program_cntr_in             : in  std_logic_vector(31 downto 0);
            warp_id_in                  : in  std_logic_vector(4 downto 0);
            warp_lane_id_in             : in  std_logic_vector(1 downto 0);
            cta_id_in                   : in  std_logic_vector(3 downto 0);
            initial_mask_in             : in  std_logic_vector(31 downto 0);
            current_mask_in             : in  std_logic_vector(31 downto 0);
            shmem_base_addr_in          : in  std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
            gprs_size_in                : in  std_logic_vector(8 downto 0);
            gprs_base_addr_in           : in  std_logic_vector(8 downto 0);
            next_pc_in                  : in  std_logic_vector(31 downto 0);
            instruction_in              : in  std_logic_vector(63 downto 0);
            
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
            
            instr_opcode_type_out       : out instr_opcode_type;
            instr_subop_type_out        : out std_logic_vector(2 downto 0);
            alu_opcode_out              : out alu_opcode_type;
            mov_opcode_out              : out mov_opcode_type;
            flow_opcode_out             : out flow_opcode_type;
            instr_marker_type_out       : out instr_marker_type;
         
            instr_src1_shared_out       : out std_logic;
            instr_src2_const_out        : out std_logic;
            instr_src3_const_out        : out std_logic;
   
            pred_reg_out                : out std_logic_vector(1 downto 0);
            pred_cond_out               : out std_logic_vector(4 downto 0);
            set_pred_out                : out std_logic;
            set_pred_reg_out            : out std_logic_vector(1 downto 0);
            output_reg_out              : out std_logic;
            write_pred_out              : out std_logic;
            
            is_full_normal_out          : out std_logic;
            is_signed_out               : out std_logic;
            w32_out                     : out std_logic;
            f64_out                     : out std_logic;
            saturate_out                : out std_logic;
            abs_saturate_out            : out std_logic_vector(1 downto 0);
            cvt_round_out               : out std_logic_vector(1 downto 0);
            cvt_type_out                : out std_logic_vector(2 downto 0);
            cvt_neg_out                 : out std_logic;
            condition_out               : out std_logic_vector(2 downto 0);
            addr_hi_out                 : out std_logic;
            addr_lo_out                 : out std_logic_vector(1 downto 0);
            addr_reg_out                : out std_logic_vector(2 downto 0);
            hi_out                      : out std_logic;
            full_out                    : out std_logic;
            addr_incr_out               : out std_logic;
            mov_size_out                : out std_logic_vector(2 downto 0);
            alt_out                     : out std_logic;
            const_segment_out           : out std_logic_vector(6 downto 0);
            mem_type_out                : out std_logic_vector(2 downto 0);
            sm_type_out                 : out std_logic_vector(1 downto 0);
            imm_hi_out                  : out std_logic_vector(25 downto 0);
            addr_imm_out                : out std_logic;
    
            src1_shared_out             : out std_logic;
         
            src1_mem_type_out           : out mem_type;
            src2_mem_type_out           : out mem_type;
            src3_mem_type_out           : out mem_type;
            dest_mem_type_out           : out mem_type;
            
            src1_mem_opcode_type_out    : out mem_opcode_type;
            src2_mem_opcode_type_out    : out mem_opcode_type;
            src3_mem_opcode_type_out    : out mem_opcode_type;
            dest_mem_opcode_type_out    : out mem_opcode_type;
            
            src1_neg_out                : out std_logic;
            src2_neg_out                : out std_logic;
            src3_neg_out                : out std_logic;
         
            target_addr_out             : out std_logic_vector(18 downto 0);

            src1_data_type_out          : out data_type;
            src2_data_type_out          : out data_type;
            src3_data_type_out          : out data_type;
            dest_data_type_out          : out data_type;
            
            src1_out                    : out std_logic_vector(31 downto 0);
            src2_out                    : out std_logic_vector(31 downto 0);
            src3_out                    : out std_logic_vector(31 downto 0);
            dest_out                    : out std_logic_vector(31 downto 0);
            
            -- stats
            stats_reset                 : in  std_logic;
            stats_out                   : out stat_record;
            
            pipeline_stall_out          : out std_logic;
            pipeline_reg_ld             : out std_logic;
				decode_flag_check_out			:out std_logic --////////////////***************
      );
   end component;
   
    component pipeline_read
        generic (
            CORE_ID                     : std_logic_vector(7 downto 0) := x"00";
            SHMEM_ADDR_SIZE             : integer := 32;
            CMEM_ADDR_SIZE              : integer := 32;
            LMEM_ADDR_SIZE              : integer := 32;
            GMEM_ADDR_SIZE              : integer := 32
        );
        port (
            reset                       : in  std_logic;
            clk_in                      : in  std_logic;
         
            en                          : in  std_logic;
            pipeline_stall_in           : in  std_logic;
            
            num_warps_in                : in  std_logic_vector(4 downto 0); 
            
            warp_id_in                  : in  std_logic_vector(4 downto 0);
            warp_lane_id_in             : in  std_logic_vector(1 downto 0);
            cta_id_in                   : in  std_logic_vector(3 downto 0);
            initial_mask_in             : in  std_logic_vector(31 downto 0);
            current_mask_in             : in  std_logic_vector(31 downto 0);
            shmem_base_addr_in          : in  std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
            gprs_size_in                : in  std_logic_vector(8 downto 0);
            gprs_base_addr_in           : in  std_logic_vector(8 downto 0);
            next_pc_in                  : in  std_logic_vector(31 downto 0);
            
            instr_opcode_type_in        : in  instr_opcode_type;
            instr_subop_type_in         : in  std_logic_vector(2 downto 0);
            alu_opcode_in               : in  alu_opcode_type;
            flow_opcode_type_in         : in  flow_opcode_type;
            mov_opcode_type_in          : in  mov_opcode_type;
            instr_marker_type_in        : in  instr_marker_type;
            
            pred_reg_in                 : in  std_logic_vector(1 downto 0);
            pred_cond_in                : in  std_logic_vector(4 downto 0);
            set_pred_in                 : in  std_logic;
            set_pred_reg_in             : in  std_logic_vector(1 downto 0);
            write_pred_in               : in  std_logic;
            
            is_full_normal_in           : in  std_logic;
            is_signed_in                : in  std_logic;
            w32_in                      : in  std_logic;
            f64_in                      : in  std_logic;
            saturate_in                 : in  std_logic;
            abs_saturate_in             : in  std_logic_vector(1 downto 0);
            cvt_round_in                : in  std_logic_vector(1 downto 0);
            cvt_type_in                 : in  std_logic_vector(2 downto 0);
            cvt_neg_in                  : in  std_logic;
            condition_in                : in std_logic_vector(2 downto 0);
            addr_hi_in                  : in  std_logic;
            addr_lo_in                  : in  std_logic_vector(1 downto 0);
            addr_reg_in                 : in  std_logic_vector(1 downto 0);
            hi_in                       : in  std_logic;
            addr_incr_in                : in  std_logic;
            mov_size_in                 : in  std_logic_vector(2 downto 0);
            const_segment_in            : in  std_logic_vector(6 downto 0);
            mem_type_in                 : in  std_logic_vector(2 downto 0);
            sm_type_in                  : in  std_logic_vector(1 downto 0);
            imm_hi_in                   : in  std_logic_vector(25 downto 0);
            addr_imm_in                 : in  std_logic;
    
            src1_shared_in              : in  std_logic;
         
            src1_mem_type_in            : in  mem_type;
            src2_mem_type_in            : in  mem_type;
            src3_mem_type_in            : in  mem_type;
            dest_mem_type_in            : in  mem_type;
            
            src1_mem_opcode_type_in     : in  mem_opcode_type;
            src2_mem_opcode_type_in     : in  mem_opcode_type;
            src3_mem_opcode_type_in     : in  mem_opcode_type;
            dest_mem_opcode_type_in     : in  mem_opcode_type;
            
            src1_neg_in                 : in  std_logic;
            src2_neg_in                 : in  std_logic;
            src3_neg_in                 : in  std_logic;
         
            target_addr_in              : in  std_logic_vector(18 downto 0);

            src1_data_type_in           : in  data_type;
            src2_data_type_in           : in  data_type;
            src3_data_type_in           : in  data_type;
            dest_data_type_in           : in  data_type;
            
            src1_in                     : in  std_logic_vector(31 downto 0);
            src2_in                     : in  std_logic_vector(31 downto 0);
            src3_in                     : in  std_logic_vector(31 downto 0);
            dest_in                     : in  std_logic_vector(31 downto 0);
            
            gprs_base_addr_out          : out gprs_addr_array; 
            gprs_reg_num_out            : out gprs_reg_array;
            gprs_lane_id_out            : out warp_lane_id_array; 
            gprs_wr_en_out              : out wr_en_array;
            gprs_wr_data_out            : out vector_register;
            gprs_rd_data_in             : in  vector_register;
            
            pred_regs_warp_id_out       : out warp_id_array; 
            pred_regs_warp_lane_id_out  : out warp_lane_id_array;
            pred_regs_reg_num_out       : out reg_num_array;
            pred_regs_wr_en_out         : out wr_en_array;
            pred_regs_wr_data_out       : out vector_flag_register;
            pred_regs_rd_data_in        : in  vector_flag_register;
            
            addr_regs_warp_id_out       : out warp_id_array; 
            addr_regs_warp_lane_id_out  : out warp_lane_id_array;
            addr_regs_reg_num_out       : out reg_num_array;
            addr_regs_wr_en_out         : out wr_en_array;
            addr_regs_wr_data_out       : out vector_register;
            addr_regs_rd_data_in        : in  vector_register;
            
            warp_div_req_out            : out std_logic;
            warp_div_ack_out            : out std_logic;
            warp_div_grant_in           : in  std_logic;
            
            warp_div_stack_en           : out warp_div_std_logic_array;
            warp_div_rd_data_in         : in  warp_div_data_array;
            warp_div_wr_data_out        : out warp_div_data_array;
            warp_div_push_en            : out warp_div_std_logic_array;
            warp_div_stack_full         : in  warp_div_std_logic_array;
            warp_div_stack_empty        : in  warp_div_std_logic_array;
            
            shmem_addr_out              : out std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
            shmem_wr_en_out             : out std_logic_vector(0 downto 0);
            shmem_wr_data_out           : out std_logic_vector(7 downto 0);
            shmem_rd_data_in            : in  std_logic_vector(7 downto 0);
            
            cmem_addr_out               : out std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
            cmem_wr_en_out              : out std_logic_vector(0 downto 0);
            cmem_wr_data_out            : out std_logic_vector(7 downto 0);
            cmem_rd_data_in             : in  std_logic_vector(7 downto 0);
            
            gmem_addr_out               : out std_logic_vector(GMEM_ADDR_SIZE-1 downto 0);
            gmem_wr_en_out              : out std_logic_vector(0 downto 0);
            gmem_wr_data_out            : out std_logic_vector(7 downto 0);
            gmem_rd_data_in             : in  std_logic_vector(7 downto 0);
            
            lmem_addr_out               : out std_logic_vector(LMEM_ADDR_SIZE-1 downto 0);
            lmem_wr_en_out              : out std_logic_vector(0 downto 0);
            lmem_wr_data_out            : out std_logic_vector(7 downto 0);
            lmem_rd_data_in             : in  std_logic_vector(7 downto 0);
            
            warp_id_out                 : out std_logic_vector(4 downto 0);
            warp_lane_id_out            : out std_logic_vector(1 downto 0);
            cta_id_out                  : out std_logic_vector(3 downto 0);
            initial_mask_out            : out std_logic_vector(31 downto 0);
            current_mask_out            : out std_logic_vector(31 downto 0);
            shmem_base_addr_out         : out std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
            gprs_size_out               : out std_logic_vector(8 downto 0);
            gprs_addr_out               : out std_logic_vector(8 downto 0);
            instruction_mask_out        : out std_logic_vector(31 downto 0);
            next_pc_out                 : out std_logic_vector(31 downto 0);
            
            instr_opcode_type_out       : out instr_opcode_type;
            instr_subop_type_out        : out std_logic_vector(2 downto 0);
            alu_opcode_out              : out alu_opcode_type;
            flow_opcode_type_out        : out flow_opcode_type;
            mov_opcode_type_out         : out mov_opcode_type;
            instr_marker_type_out       : out instr_marker_type;
            
            set_pred_out                : out std_logic;
            set_pred_reg_out            : out std_logic_vector(1 downto 0);
            write_pred_out              : out std_logic;
            
            is_full_normal_out          : out std_logic;
            is_signed_out               : out std_logic;
            w32_out                     : out std_logic;
            f64_out                     : out std_logic;
            saturate_out                : out std_logic;
            abs_saturate_out            : out std_logic_vector(1 downto 0);
            cvt_round_out               : out std_logic_vector(1 downto 0);
            cvt_type_out                : out std_logic_vector(2 downto 0);
            cvt_neg_out                 : out std_logic;
            condition_out               : out std_logic_vector(2 downto 0);
            addr_hi_out                 : out std_logic;
            addr_lo_out                 : out std_logic_vector(1 downto 0);
            addr_incr_out               : out std_logic;
            mov_size_out                : out std_logic_vector(2 downto 0);                 
            mem_type_out                : out std_logic_vector(2 downto 0);
            sm_type_out                 : out std_logic_vector(1 downto 0);
            addr_imm_out                : out std_logic;
         
            dest_mem_type_out           : out mem_type;
            
            dest_mem_opcode_type_out    : out mem_opcode_type;
            
            src1_neg_out                : out std_logic;
            src2_neg_out                : out std_logic;
            src3_neg_out                : out std_logic;
         
            target_addr_out             : out std_logic_vector(18 downto 0);

            dest_data_type_out          : out data_type;
            
            src1_out                    : out std_logic_vector(31 downto 0);
            
            dest_out                    : out std_logic_vector(31 downto 0);
                        
            pred_flags_out              : out vector_flag_register;
            temp_vector_register_out    : out temp_vector_register;
            
            -- stats
            stats_reset                 : in  std_logic;
            stats_out                   : out stat_record;
            
            pipeline_stall_out          : out std_logic;
            pipeline_reg_ld             : out std_logic;
				read_check_out					 : out std_logic_vector(9 downto 0);
				
				write_en_noc_ram_in : std_logic_vector(0 downto 0);
				addr_noc_ram_in : std_logic_vector(2 downto 0);
				data_noc_ram_in : std_logic_vector(31 downto 0)
        );
    end component;
    
    component pipeline_execute
        generic (
            SHMEM_ADDR_SIZE             : integer := 14
        );
        port (
            reset                       : in  std_logic;
            clk_in                      : in  std_logic;
            
            en                          : in  std_logic;
            pipeline_stall_in           : in  std_logic;
            
            warp_id_in                  : in  std_logic_vector(4 downto 0);
            warp_lane_id_in             : in  std_logic_vector(1 downto 0);
            cta_id_in                   : in  std_logic_vector(3 downto 0);
            initial_mask_in             : in  std_logic_vector(31 downto 0);
            current_mask_in             : in  std_logic_vector(31 downto 0);
            shmem_base_addr_in          : in  std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
            gprs_size_in                : in  std_logic_vector(8 downto 0);
            gprs_base_addr_in           : in  std_logic_vector(8 downto 0);
            instr_mask_in               : in  std_logic_vector(31 downto 0);
            next_pc_in                  : in  std_logic_vector(31 downto 0);
            
            instr_opcode_type_in        : in  instr_opcode_type;
            instr_subop_type_in         : in  std_logic_vector(2 downto 0);
            alu_opcode_type_in          : in  alu_opcode_type;
            flow_opcode_type_in         : in  flow_opcode_type;
            mov_opcode_type_in          : in  mov_opcode_type;
            instr_marker_type_in        : in  instr_marker_type;
             
            set_pred_in                 : in  std_logic;
            set_pred_reg_in             : in  std_logic_vector(1 downto 0);
            write_pred_in               : in  std_logic;
            
            is_full_normal_in           : in  std_logic;
            is_signed_in                : in  std_logic;
            w32_in                      : in  std_logic;
            f64_in                      : in  std_logic;
            saturate_in                 : in  std_logic;
            abs_saturate_in             : in  std_logic_vector(1 downto 0);
            cvt_round_in                : in  std_logic_vector(1 downto 0);
            cvt_type_in                 : in  std_logic_vector(2 downto 0);
            cvt_neg_in                  : in  std_logic;
            set_cond_in                 : in  std_logic_vector(2 downto 0);
            addr_hi_in                  : in  std_logic;
            addr_lo_in                  : in  std_logic_vector(1 downto 0);
            addr_incr_in                : in  std_logic;
            mov_size_in                 : in  std_logic_vector(2 downto 0);                 
            mem_type_in                 : in  std_logic_vector(2 downto 0);
            sm_type_in                  : in  std_logic_vector(1 downto 0);
            addr_imm_in                 : in  std_logic;
         
            dest_mem_type_in            : in  mem_type;
            
            dest_mem_opcode_type_in     : in  mem_opcode_type;
            
            src1_neg_in                 : in  std_logic;
            src2_neg_in                 : in  std_logic;
            src3_neg_in                 : in  std_logic;
         
            target_addr_in              : in  std_logic_vector(18 downto 0);

            dest_data_type_in           : in  data_type;
            
            src1_in                     : in  std_logic_vector(31 downto 0);
            
            dest_in                     : in  std_logic_vector(31 downto 0);
                        
            pred_flags_in               : in  vector_flag_register;
            temp_vector_register_in     : in  temp_vector_register;
            
            warp_div_req_out            : out std_logic;
            warp_div_ack_out            : out std_logic;
            warp_div_grant_in           : in  std_logic;
            
            warp_div_stack_en_out       : out warp_div_std_logic_array;
            warp_div_wr_data_out        : out warp_div_data_array;
            warp_div_rd_data_in         : in  warp_div_data_array;
            warp_div_push_en_out        : out warp_div_std_logic_array;
            warp_div_stack_full_in      : in  warp_div_std_logic_array;
            warp_div_stack_empty_in     : in  warp_div_std_logic_array;
            
            warp_id_out                 : out std_logic_vector(4 downto 0);
            warp_lane_id_out            : out std_logic_vector(1 downto 0);
            cta_id_out                  : out std_logic_vector(3 downto 0);
            initial_mask_out            : out std_logic_vector(31 downto 0);
            current_mask_out            : out std_logic_vector(31 downto 0);
            shmem_base_addr_out         : out std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
            gprs_size_out               : out std_logic_vector(8 downto 0);
            gprs_base_addr_out          : out std_logic_vector(8 downto 0);
            instr_mask_out              : out std_logic_vector(31 downto 0);
            use_next_pc_out             : out std_logic;
            next_pc_out                 : out std_logic_vector(31 downto 0);
            warp_state_out              : out warp_state_type;
            
            instr_opcode_type_out       : out instr_opcode_type;
             
            set_pred_out                : out std_logic;
            set_pred_reg_out            : out std_logic_vector(1 downto 0);
            write_pred_out              : out std_logic;
            
            addr_hi_out                 : out std_logic;
            addr_lo_out                 : out std_logic_vector(1 downto 0);
            addr_incr_out               : out std_logic;
            mov_size_out                : out std_logic_vector(2 downto 0);                
            sm_type_out                 : out std_logic_vector(1 downto 0);
            addr_imm_out                : out std_logic;
         
            src1_out                    : out std_logic_vector(31 downto 0);
            
            dest_mem_type_out           : out mem_type;
            dest_mem_opcode_type_out    : out mem_opcode_type;
            dest_data_type_out          : out data_type;
            dest_out                    : out std_logic_vector(31 downto 0);
       
            pred_flags_out              : out vector_flag_register;
            temp_vector_register_out    : out temp_vector_register;
            
            -- stats
            stats_reset                 : in  std_logic;
            stats_out                   : out stat_record;
            stats_instructions_out      : out stat_record;
            
            pipeline_stall_out          : out std_logic;
            pipeline_reg_ld             : out std_logic
        );
    end component;
    
    component pipeline_write
        generic (
            CORE_ID                     : std_logic_vector(7 downto 0) := x"00";
            SHMEM_ADDR_SIZE             : integer := 32;
            CMEM_ADDR_SIZE              : integer := 32;
            LMEM_ADDR_SIZE              : integer := 32;
            GMEM_ADDR_SIZE              : integer := 32
        );
        port (
            reset                       : in  std_logic;
            clk_in                      : in  std_logic;
         
            en                          : in  std_logic;
            pipeline_stall_in           : in  std_logic;
            
            num_warps_in                : in  std_logic_vector(4 downto 0); 
            
            warp_id_in                  : in  std_logic_vector(4 downto 0);
            warp_lane_id_in             : in  std_logic_vector(1 downto 0);
            cta_id_in                   : in  std_logic_vector(3 downto 0);
            initial_mask_in             : in  std_logic_vector(31 downto 0);
            current_mask_in             : in  std_logic_vector(31 downto 0);
            shmem_base_addr_in          : in  std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
            gprs_size_in                : in  std_logic_vector(8 downto 0);                   
            gprs_base_addr_in           : in  std_logic_vector(8 downto 0);
            next_pc_in                  : in  std_logic_vector(31 downto 0);
            warp_state_in               : in  warp_state_type;
                        
            instr_opcode_type_in        : in  instr_opcode_type;
            
            temp_vector_register_in     : in  temp_vector_register;
            dest_in                     : in  std_logic_vector(31 downto 0);
            instruction_mask_in         : in  std_logic_vector(31 downto 0);
            instruction_flags_in        : in  vector_flag_register;
            dest_data_type_in           : in  data_type;
            dest_mem_type_in            : in  mem_type;
            dest_mem_opcode_type_in     : in  mem_opcode_type;
            
            addr_hi_in                  : in  std_logic;
            addr_lo_in                  : in  std_logic_vector(1 downto 0);
            addr_imm_in                 : in  std_logic;
            addr_inc_in                 : in  std_logic;
            mov_size_in                 : in  std_logic_vector(2 downto 0);
            write_pred_in               : in  std_logic;
            set_pred_in                 : in  std_logic;
            set_pred_reg_in             : in  std_logic_vector(1 downto 0);
            sm_type_in					: in  std_logic_vector(1 downto 0);
            
            src1_in                     : in  std_logic_vector(31 downto 0);
            
            gprs_base_addr_out          : out gprs_addr_array; 
            gprs_reg_num_out            : out gprs_reg_array;
            gprs_lane_id_out            : out warp_lane_id_array; 
            gprs_wr_en_out              : out wr_en_array;
            gprs_wr_data_out            : out vector_register;
            gprs_rd_data_in             : in  vector_register;
            
            pred_regs_warp_id_out       : out warp_id_array; 
            pred_regs_warp_lane_id_out  : out warp_lane_id_array;
            pred_regs_reg_num_out       : out reg_num_array;
            pred_regs_wr_en_out         : out wr_en_array;
            pred_regs_wr_data_out       : out vector_flag_register;
            pred_regs_rd_data_in        : in  vector_flag_register;
            
            addr_regs_warp_id_out       : out warp_id_array; 
            addr_regs_warp_lane_id_out  : out warp_lane_id_array;
            addr_regs_reg_num_out       : out reg_num_array;
            addr_regs_wr_en_out         : out wr_en_array;
            addr_regs_wr_data_out       : out vector_register;
            addr_regs_rd_data_in        : in  vector_register;
            
            shmem_addr_out              : out std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
            shmem_wr_en_out             : out std_logic_vector(0 downto 0);
            shmem_wr_data_out           : out std_logic_vector(7 downto 0);
            shmem_rd_data_in            : in  std_logic_vector(7 downto 0);
            
            cmem_addr_out               : out std_logic_vector(CMEM_ADDR_SIZE-1 downto 0);
            cmem_wr_en_out              : out std_logic_vector(0 downto 0);
            cmem_wr_data_out            : out std_logic_vector(7 downto 0);
            cmem_rd_data_in             : in  std_logic_vector(7 downto 0);
            
            gmem_addr_out               : out std_logic_vector(GMEM_ADDR_SIZE-1 downto 0);
            gmem_wr_en_out              : out std_logic_vector(0 downto 0);
            gmem_wr_data_out            : out std_logic_vector(7 downto 0);
            gmem_rd_data_in             : in  std_logic_vector(7 downto 0);
            
            lmem_addr_out               : out std_logic_vector(LMEM_ADDR_SIZE-1 downto 0);
            lmem_wr_en_out              : out std_logic_vector(0 downto 0);
            lmem_wr_data_out            : out std_logic_vector(7 downto 0);
            lmem_rd_data_in             : in  std_logic_vector(7 downto 0);
            
            warp_id_out                 : out std_logic_vector(4 downto 0);
            warp_lane_id_out            : out std_logic_vector(1 downto 0);
            cta_id_out                  : out std_logic_vector(3 downto 0);
            initial_mask_out            : out std_logic_vector(31 downto 0);
            current_mask_out            : out std_logic_vector(31 downto 0);
            shmem_base_addr_out         : out std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
            gprs_addr_out               : out std_logic_vector(8 downto 0);
            next_pc_out                 : out std_logic_vector(31 downto 0);
            warp_state_out              : out warp_state_type;
            
            -- stats
            stats_reset                 : in  std_logic;
            stats_out                   : out stat_record;
            
            pipeline_stall_out          : out std_logic;
            pipeline_reg_ld             : out std_logic;
				check_dest_reg					 : out std_logic_vector(8 downto 0);--///////////************
				
				rd_en_fifo_in :  in STD_LOGIC;
				valid_fifo_out : out STD_LOGIC;
				dout_fifo_out : out std_logic_vector(31 downto 0);
				not_empty_out : out std_logic
        );   
    end component;
    
    component arbiter
        generic ( 
            CNT : integer := 7 
        );
        port (
            clk            : in    std_logic;
            rst_n          : in    std_logic;

            req            : in    std_logic_vector(CNT-1 downto 0);
            ack            : in    std_logic;
            grant          : out   std_logic_vector(CNT-1 downto 0)
        );
    end component;
    
    component stack
        generic (
            STACK_DEPTH     : integer := 256;
            DATA_WIDTH      : integer := 64
        );
        port (
            clk_in          : in std_logic;  --Clock for the stack.
            reset           : in std_logic;
            stack_en        : in std_logic;  --Enable the stack. Otherwise neither push nor pop will happen.
            data_in         : in std_logic_vector(DATA_WIDTH-1 downto 0);  --Data to be pushed to stack
            data_out        : out std_logic_vector(DATA_WIDTH-1 downto 0);  --Data popped from the stack.
            push_en         : in std_logic;  --active low for POP and active high for PUSH.
            stack_full      : out std_logic;  --Goes high when the stack is full.
            stack_empty     : out std_logic  --Goes high when the stack is empty.
        );
    end component;
    
    component vector_register_file_8  
        port (
            ce_1                        : in std_logic; 
            clk_1                       : in std_logic;
            warp_lane_id_a              : in std_logic_vector(1 downto 0); 
            base_addr_a                 : in std_logic_vector(8 downto 0);
            reg_num_a                   : in std_logic_vector(8 downto 0);
            we_a                        : in std_logic; 
            din_a                       : in std_logic_vector(31 downto 0);
            dout_a                      : out std_logic_vector(31 downto 0);
            warp_lane_id_b              : in std_logic_vector(1 downto 0); 
            base_addr_b                 : in std_logic_vector(8 downto 0);
            reg_num_b                   : in std_logic_vector(8 downto 0);
            we_b                        : in std_logic; 
            din_b                       : in std_logic_vector(31 downto 0);
            dout_b                      : out std_logic_vector(31 downto 0)
        );
    end component;
	 
	 component vector_register_file_16  
        port (
            ce_1                        : in std_logic; 
            clk_1                       : in std_logic;
            warp_lane_id_a              : in std_logic; 
            base_addr_a                 : in std_logic_vector(8 downto 0);
            reg_num_a                   : in std_logic_vector(8 downto 0);
            we_a                        : in std_logic; 
            din_a                       : in std_logic_vector(31 downto 0);
            dout_a                      : out std_logic_vector(31 downto 0);
            warp_lane_id_b              : in std_logic; 
            base_addr_b                 : in std_logic_vector(8 downto 0);
            reg_num_b                   : in std_logic_vector(8 downto 0);
            we_b                        : in std_logic; 
            din_b                       : in std_logic_vector(31 downto 0);
            dout_b                      : out std_logic_vector(31 downto 0)
        );
    end component;
	 
	 component vector_register_file_32  
        port (
            ce_1                        : in std_logic; 
            clk_1                       : in std_logic;
            base_addr_a                 : in std_logic_vector(8 downto 0);
            reg_num_a                   : in std_logic_vector(8 downto 0);
            we_a                        : in std_logic; 
            din_a                       : in std_logic_vector(31 downto 0);
            dout_a                      : out std_logic_vector(31 downto 0);
            base_addr_b                 : in std_logic_vector(8 downto 0);
            reg_num_b                   : in std_logic_vector(8 downto 0);
            we_b                        : in std_logic; 
            din_b                       : in std_logic_vector(31 downto 0);
            dout_b                      : out std_logic_vector(31 downto 0)
        );
    end component;

    component predicate_registers_8  
        port (
            ce_1                        : in std_logic; 
            clk_1                       : in std_logic;
            warp_id_a                   : in std_logic_vector(4 downto 0);
            warp_lane_id_a              : in std_logic_vector(1 downto 0);
            reg_addr_a                  : in std_logic_vector(1 downto 0);
            wr_en_a                     : in std_logic; 
            din_a                       : in std_logic_vector(3 downto 0);
            dout_a                      : out std_logic_vector(3 downto 0); 
            warp_id_b                   : in std_logic_vector(4 downto 0);
            warp_lane_id_b              : in std_logic_vector(1 downto 0);
            reg_addr_b                  : in std_logic_vector(1 downto 0);
            wr_en_b                     : in std_logic; 
            din_b                       : in std_logic_vector(3 downto 0);
            dout_b                      : out std_logic_vector(3 downto 0)
        );
    end component;

    component predicate_registers_16  
        port (
            ce_1                        : in std_logic; 
            clk_1                       : in std_logic;
            warp_id_a                   : in std_logic_vector(4 downto 0);
            warp_lane_id_a              : in std_logic;
            reg_addr_a                  : in std_logic_vector(1 downto 0);
            wr_en_a                     : in std_logic; 
            din_a                       : in std_logic_vector(3 downto 0);
            dout_a                      : out std_logic_vector(3 downto 0); 
            warp_id_b                   : in std_logic_vector(4 downto 0);
            warp_lane_id_b              : in std_logic;
            reg_addr_b                  : in std_logic_vector(1 downto 0);
            wr_en_b                     : in std_logic; 
            din_b                       : in std_logic_vector(3 downto 0);
            dout_b                      : out std_logic_vector(3 downto 0)
        );
    end component;

    component predicate_registers_32
        port (
            ce_1                        : in std_logic; 
            clk_1                       : in std_logic;
            warp_id_a                   : in std_logic_vector(4 downto 0);
            reg_addr_a                  : in std_logic_vector(1 downto 0);
            wr_en_a                     : in std_logic; 
            din_a                       : in std_logic_vector(3 downto 0);
            dout_a                      : out std_logic_vector(3 downto 0); 
            warp_id_b                   : in std_logic_vector(4 downto 0);
            reg_addr_b                  : in std_logic_vector(1 downto 0);
            wr_en_b                     : in std_logic; 
            din_b                       : in std_logic_vector(3 downto 0);
            dout_b                      : out std_logic_vector(3 downto 0)
        );
    end component;

    component address_registers_8  
        port (
            ce_1                        : in std_logic; 
            clk_1                       : in std_logic;
            warp_id_a                   : in std_logic_vector(4 downto 0);
            warp_lane_id_a              : in std_logic_vector(1 downto 0);
            reg_addr_a                  : in std_logic_vector(1 downto 0);
            wr_en_a                     : in std_logic; 
            din_a                       : in std_logic_vector(31 downto 0);
            dout_a                      : out std_logic_vector(31 downto 0); 
            warp_id_b                   : in std_logic_vector(4 downto 0);
            warp_lane_id_b              : in std_logic_vector(1 downto 0);
            reg_addr_b                  : in std_logic_vector(1 downto 0);
            wr_en_b                     : in std_logic; 
            din_b                       : in std_logic_vector(31 downto 0);
            dout_b                      : out std_logic_vector(31 downto 0)
        );
    end component;

    component address_registers_16  
        port (
            ce_1                        : in std_logic; 
            clk_1                       : in std_logic;
            warp_id_a                   : in std_logic_vector(4 downto 0);
            warp_lane_id_a              : in std_logic;
            reg_addr_a                  : in std_logic_vector(1 downto 0);
            wr_en_a                     : in std_logic; 
            din_a                       : in std_logic_vector(31 downto 0);
            dout_a                      : out std_logic_vector(31 downto 0); 
            warp_id_b                   : in std_logic_vector(4 downto 0);
            warp_lane_id_b              : in std_logic;
            reg_addr_b                  : in std_logic_vector(1 downto 0);
            wr_en_b                     : in std_logic; 
            din_b                       : in std_logic_vector(31 downto 0);
            dout_b                      : out std_logic_vector(31 downto 0)
        );
    end component;

    component address_registers_32  
        port (
            ce_1                        : in std_logic; 
            clk_1                       : in std_logic;
            warp_id_a                   : in std_logic_vector(4 downto 0);
            reg_addr_a                  : in std_logic_vector(1 downto 0);
            wr_en_a                     : in std_logic; 
            din_a                       : in std_logic_vector(31 downto 0);
            dout_a                      : out std_logic_vector(31 downto 0); 
            warp_id_b                   : in std_logic_vector(4 downto 0);
            reg_addr_b                  : in std_logic_vector(1 downto 0);
            wr_en_b                     : in std_logic; 
            din_b                       : in std_logic_vector(31 downto 0);
            dout_b                      : out std_logic_vector(31 downto 0)
        );
    end component;


    component ram_8x16384
        port (
            clka                        : in std_logic;
            addra                       : in std_logic_vector(13 downto 0);
            wea                         : in std_logic_vector(0 downto 0);
            dina                        : in std_logic_vector(7 downto 0);
            douta                       : out std_logic_vector(7 downto 0);
            clkb                        : in std_logic;
            addrb                       : in std_logic_vector(13 downto 0);
            web                         : in std_logic_vector(0 downto 0);
            dinb                        : in std_logic_vector(7 downto 0);
            doutb                       : out std_logic_vector(7 downto 0)
        );
    end component;

--    component ram_8x65536
--        port (
--            clka                        : in std_logic;
--            addra                       : in std_logic_vector(15 downto 0);
--            wea                         : in std_logic_vector(0 downto 0);
--            dina                        : in std_logic_vector(7 downto 0);
--            douta                       : out std_logic_vector(7 downto 0);
--            clkb                        : in std_logic;
--            addrb                       : in std_logic_vector(15 downto 0);
--            web                         : in std_logic_vector(0 downto 0);
--            dinb                        : in std_logic_vector(7 downto 0);
--            doutb                       : out std_logic_vector(7 downto 0)
--        );
--    end component;
	
    --
    -- Constant Declarations
    --
    constant SHMEM_ADDR_SIZE                : integer := 14;
    constant LMEM_ADDR_SIZE                 : integer := 16;
    
    --
    -- Signal Declarations
    --
    signal num_warps                        : std_logic_vector(4 downto 0);
    
    -- SMP Configuration
    signal reg_threads_per_block            : std_logic_vector(11 downto 0);
    signal reg_num_blocks                   : std_logic_vector(3 downto 0);
    signal reg_warps_per_block              : std_logic_vector(5 downto 0);
    signal reg_shmem_base_addr              : std_logic_vector(31 downto 0);
    signal reg_shmem_size                   : std_logic_vector(31 downto 0);
    signal reg_parameter_size               : std_logic_vector(15 downto 0);
    signal reg_gprs_size                    : std_logic_vector(8 downto 0);
    signal reg_block_x                      : std_logic_vector(15 downto 0);
    signal reg_block_y                      : std_logic_vector(15 downto 0);
    signal reg_block_z                      : std_logic_vector(15 downto 0);
    signal reg_grid_x                       : std_logic_vector(15 downto 0);
    signal reg_grid_y                       : std_logic_vector(15 downto 0);
    signal reg_block_idx                    : std_logic_vector(15 downto 0);
    
    -- SMP Controller
    signal warps_per_block                  : std_logic_vector(5 downto 0);
    signal warps_per_block_ld               : std_logic;
    signal smp_configuration_en             : std_logic;
            
    -- Warp
    signal warp_generator_en                : std_logic;
    signal check_warp_en                    : std_logic;
    signal pc_incr                          : std_logic_vector(3 downto 0);
    signal warp_generator_done              : std_logic;
    signal pipeline_wf_reg_ld	            : std_logic;
    signal pipeline_wf_reg_ld_reg	        : std_logic;
    signal warp_scheduler_done              : std_logic;
    signal warp_scheduler_stall             : std_logic;
	signal fetch_en						    : std_logic;
	signal fetch_en_reg 					: std_logic;
    
    signal program_cntr_wf_reg_d            : std_logic_vector(31 downto 0);
    signal warp_id_wf_reg_d                 : std_logic_vector(4 downto 0);
    signal warp_lane_id_wf_reg_d            : std_logic_vector(1 downto 0);
    signal cta_id_wf_reg_d                  : std_logic_vector(3 downto 0);
    signal initial_mask_wf_reg_d            : std_logic_vector(31 downto 0);
    signal current_mask_wf_reg_d            : std_logic_vector(31 downto 0);
    signal shmem_base_addr_wf_reg_d         : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal gprs_size_wf_reg_d               : std_logic_vector(8 downto 0);
    signal gprs_base_addr_wf_reg_d          : std_logic_vector(8 downto 0);
    signal pipeline_warp_stall              : std_logic;
    
    -- Warp / Fetch Register
    signal program_cntr_wf_reg_q            : std_logic_vector(31 downto 0);
    signal warp_id_wf_reg_q                 : std_logic_vector(4 downto 0);
    signal warp_lane_id_wf_reg_q            : std_logic_vector(1 downto 0);
    signal cta_id_wf_reg_q                  : std_logic_vector(3 downto 0);
    signal initial_mask_wf_reg_q            : std_logic_vector(31 downto 0);
    signal current_mask_wf_reg_q            : std_logic_vector(31 downto 0);
    signal shmem_base_addr_wf_reg_q         : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal gprs_size_wf_reg_q               : std_logic_vector(8 downto 0);
    signal gprs_base_addr_wf_reg_q          : std_logic_vector(8 downto 0);
    
    -- Fetch
    signal program_cntr_fd_reg_d            : std_logic_vector(31 downto 0);
    signal warp_id_fd_reg_d                 : std_logic_vector(4 downto 0);
    signal warp_lane_id_fd_reg_d            : std_logic_vector(1 downto 0);
    signal cta_id_fd_reg_d                  : std_logic_vector(3 downto 0);
    signal initial_mask_fd_reg_d            : std_logic_vector(31 downto 0);
    signal current_mask_fd_reg_d            : std_logic_vector(31 downto 0);
    signal shmem_base_addr_fd_reg_d         : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal gprs_size_fd_reg_d               : std_logic_vector(8 downto 0);
    signal gprs_base_addr_fd_reg_d          : std_logic_vector(8 downto 0);
    signal next_pc_fd_reg_d                 : std_logic_vector(31 downto 0);
    signal instruction_fd_reg_d             : std_logic_vector(63 downto 0);
    signal pipeline_fetch_stall             : std_logic;
    signal pipeline_fd_reg_ld               : std_logic;
    signal pipeline_fd_reg_ld_reg           : std_logic;

    -- Fetch / Decode Register
    signal instruction_fd_reg_q             : std_logic_vector(63 downto 0);
    signal program_cntr_fd_reg_q            : std_logic_vector(31 downto 0);
    signal next_pc_fd_reg_q                 : std_logic_vector(31 downto 0);
    signal warp_id_fd_reg_q                 : std_logic_vector(4 downto 0);
    signal warp_lane_id_fd_reg_q            : std_logic_vector(1 downto 0);
    signal cta_id_fd_reg_q                  : std_logic_vector(3 downto 0);
    signal initial_mask_fd_reg_q            : std_logic_vector(31 downto 0);
    signal current_mask_fd_reg_q            : std_logic_vector(31 downto 0);
    signal shmem_base_addr_fd_reg_q         : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal gprs_size_fd_reg_q               : std_logic_vector(8 downto 0);
    signal gprs_base_addr_fd_reg_q          : std_logic_vector(8 downto 0);

    -- Decode
    signal program_cntr_dr_reg_d            : std_logic_vector(31 downto 0);
    signal warp_id_dr_reg_d                 : std_logic_vector(4 downto 0);
    signal warp_lane_id_dr_reg_d            : std_logic_vector(1 downto 0);
    signal cta_id_dr_reg_d                  : std_logic_vector(3 downto 0);
    signal initial_mask_dr_reg_d            : std_logic_vector(31 downto 0);
    signal current_mask_dr_reg_d            : std_logic_vector(31 downto 0);
    signal shmem_base_addr_dr_reg_d         : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal gprs_size_dr_reg_d               : std_logic_vector(8 downto 0);
    signal gprs_base_addr_dr_reg_d          : std_logic_vector(8 downto 0);
    signal next_pc_dr_reg_d                 : std_logic_vector(31 downto 0);
    signal instr_opcode_type_dr_reg_d       : instr_opcode_type;
    signal instr_subop_type_dr_reg_d        : std_logic_vector(2 downto 0);
    signal alu_opcode_dr_reg_d              : alu_opcode_type;
    signal mov_opcode_dr_reg_d              : mov_opcode_type;
    signal flow_opcode_dr_reg_d             : flow_opcode_type;
    signal instr_marker_type_dr_reg_d       : instr_marker_type;
    signal instr_src1_shared_dr_reg_d       : std_logic;
    signal instr_src2_const_dr_reg_d        : std_logic;
    signal instr_src3_const_dr_reg_d        : std_logic;
    signal pred_reg_dr_reg_d                : std_logic_vector(1 downto 0);
    signal pred_cond_dr_reg_d               : std_logic_vector(4 downto 0);
    signal set_pred_dr_reg_d                : std_logic;
    signal set_pred_reg_dr_reg_d            : std_logic_vector(1 downto 0);
    signal write_pred_dr_reg_d              : std_logic;
    signal is_full_normal_dr_reg_d          : std_logic;
    signal is_signed_dr_reg_d               : std_logic;
    signal w32_dr_reg_d                     : std_logic;
    signal saturate_dr_reg_d                : std_logic;
    signal abs_saturate_dr_reg_d            : std_logic_vector(1 downto 0);
    signal cvt_round_dr_reg_d               : std_logic_vector(1 downto 0);
    signal cvt_type_dr_reg_d                : std_logic_vector(2 downto 0);
    signal cvt_neg_dr_reg_d                 : std_logic;
    signal condition_dr_reg_d               : std_logic_vector(2 downto 0);
    signal addr_hi_dr_reg_d                 : std_logic;
    signal addr_lo_dr_reg_d                 : std_logic_vector(1 downto 0);
    signal addr_incr_dr_reg_d               : std_logic;
    signal mov_size_dr_reg_d                : std_logic_vector(2 downto 0);
    signal const_segment_dr_reg_d           : std_logic_vector(6 downto 0);
    signal mem_type_dr_reg_d                : std_logic_vector(2 downto 0);
    signal sm_type_dr_reg_d                 : std_logic_vector(1 downto 0);
    signal imm_hi_dr_reg_d                  : std_logic_vector(25 downto 0);
    signal addr_imm_dr_reg_d                : std_logic;
    signal src1_shared_dr_reg_d             : std_logic;
    signal src1_mem_type_dr_reg_d           : mem_type;
    signal src2_mem_type_dr_reg_d           : mem_type;
    signal src3_mem_type_dr_reg_d           : mem_type;
    signal dest_mem_type_dr_reg_d           : mem_type;
    signal src1_mem_opcode_type_dr_reg_d    : mem_opcode_type;
    signal src2_mem_opcode_type_dr_reg_d    : mem_opcode_type;
    signal src3_mem_opcode_type_dr_reg_d    : mem_opcode_type;
    signal dest_mem_opcode_type_dr_reg_d    : mem_opcode_type;
    signal src1_neg_dr_reg_d                : std_logic;
    signal src2_neg_dr_reg_d                : std_logic;
    signal src3_neg_dr_reg_d                : std_logic;
    signal target_addr_dr_reg_d             : std_logic_vector(18 downto 0);
    signal src1_data_type_dr_reg_d          : data_type;
    signal src2_data_type_dr_reg_d          : data_type;
    signal src3_data_type_dr_reg_d          : data_type;
    signal dest_data_type_dr_reg_d          : data_type;
    signal src1_dr_reg_d                    : std_logic_vector(31 downto 0);
    signal src2_dr_reg_d                    : std_logic_vector(31 downto 0);
    signal src3_dr_reg_d                    : std_logic_vector(31 downto 0);
    signal dest_dr_reg_d                    : std_logic_vector(31 downto 0);
    signal pipeline_decode_stall            : std_logic;
    signal pipeline_dr_reg_ld               : std_logic;
    signal pipeline_dr_reg_ld_reg           : std_logic;

    -- Decode / Read Register
    signal instruction_dr_reg_q             : std_logic_vector(63 downto 0);
    signal program_cntr_dr_reg_q            : std_logic_vector(31 downto 0);
    signal next_pc_dr_reg_q                 : std_logic_vector(31 downto 0);
    signal warp_id_dr_reg_q                 : std_logic_vector(4 downto 0);
    signal warp_lane_id_dr_reg_q            : std_logic_vector(1 downto 0);
    signal cta_id_dr_reg_q                  : std_logic_vector(3 downto 0);
    signal initial_mask_dr_reg_q            : std_logic_vector(31 downto 0);
    signal current_mask_dr_reg_q            : std_logic_vector(31 downto 0);
    signal shmem_base_addr_dr_reg_q         : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal gprs_size_dr_reg_q               : std_logic_vector(8 downto 0);
    signal gprs_base_addr_dr_reg_q          : std_logic_vector(8 downto 0);
    
    signal instr_opcode_type_dr_reg_q       : instr_opcode_type;
    signal instr_subop_type_dr_reg_q        : std_logic_vector(2 downto 0);
    signal alu_opcode_dr_reg_q              : alu_opcode_type;
    signal mov_opcode_type_dr_reg_q         : mov_opcode_type;
    signal flow_opcode_type_dr_reg_q        : flow_opcode_type;
    signal instr_marker_type_dr_reg_q       : instr_marker_type;
    signal instr_src1_shared_dr_reg_q       : std_logic;
    signal instr_src2_const_dr_reg_q        : std_logic;
    signal instr_src3_const_dr_reg_q        : std_logic;
    signal pred_reg_dr_reg_q                : std_logic_vector(1 downto 0);
    signal pred_cond_dr_reg_q               : std_logic_vector(4 downto 0);
    signal set_pred_dr_reg_q                : std_logic;
    signal set_pred_reg_dr_reg_q            : std_logic_vector(1 downto 0);
    signal write_pred_dr_reg_q              : std_logic;
    signal is_full_normal_dr_reg_q          : std_logic;
    signal is_signed_dr_reg_q               : std_logic;
    signal w32_dr_reg_q                     : std_logic;
    signal f64_dr_reg_q                     : std_logic;
    signal saturate_dr_reg_q                : std_logic;
    signal abs_saturate_dr_reg_q            : std_logic_vector(1 downto 0);
    signal cvt_round_dr_reg_q               : std_logic_vector(1 downto 0);
    signal cvt_type_dr_reg_q                : std_logic_vector(2 downto 0);
    signal cvt_neg_dr_reg_q                 : std_logic;
    signal condition_dr_reg_q               : std_logic_vector(2 downto 0);
    signal addr_hi_dr_reg_q                 : std_logic;
    signal addr_lo_dr_reg_q                 : std_logic_vector(1 downto 0);
    signal addr_reg_dr_reg_q                : std_logic_vector(1 downto 0);
    signal hi_dr_reg_q                      : std_logic;
    signal addr_incr_dr_reg_q               : std_logic;
    signal mov_size_dr_reg_q                : std_logic_vector(2 downto 0);
    signal const_segment_dr_reg_q           : std_logic_vector(6 downto 0);
    signal mem_type_dr_reg_q                : std_logic_vector(2 downto 0);
    signal sm_type_dr_reg_q                 : std_logic_vector(1 downto 0);
    signal imm_hi_dr_reg_q                  : std_logic_vector(25 downto 0);
    signal addr_imm_dr_reg_q                : std_logic;
    signal src1_shared_dr_reg_q             : std_logic;
    signal src1_mem_type_dr_reg_q           : mem_type;
    signal src2_mem_type_dr_reg_q           : mem_type;
    signal src3_mem_type_dr_reg_q           : mem_type;
    signal dest_mem_type_dr_reg_q           : mem_type;
    signal src1_mem_opcode_type_dr_reg_q    : mem_opcode_type;
    signal src2_mem_opcode_type_dr_reg_q    : mem_opcode_type;
    signal src3_mem_opcode_type_dr_reg_q    : mem_opcode_type;
    signal dest_mem_opcode_type_dr_reg_q    : mem_opcode_type;
    signal src1_neg_dr_reg_q                : std_logic;
    signal src2_neg_dr_reg_q                : std_logic;
    signal src3_neg_dr_reg_q                : std_logic;
    signal target_addr_dr_reg_q             : std_logic_vector(18 downto 0);
    signal src1_data_type_dr_reg_q          : data_type;
    signal src2_data_type_dr_reg_q          : data_type;
    signal src3_data_type_dr_reg_q          : data_type;
    signal dest_data_type_dr_reg_q          : data_type;
    signal src1_dr_reg_q                    : std_logic_vector(31 downto 0);
    signal src2_dr_reg_q                    : std_logic_vector(31 downto 0);
    signal src3_dr_reg_q                    : std_logic_vector(31 downto 0);
    signal dest_dr_reg_q                    : std_logic_vector(31 downto 0);
    
    -- Read
    signal warp_id_re_reg_d                 : std_logic_vector(4 downto 0);
    signal warp_lane_id_re_reg_d            : std_logic_vector(1 downto 0);
    signal cta_id_re_reg_d                  : std_logic_vector(3 downto 0);
    signal initial_mask_re_reg_d            : std_logic_vector(31 downto 0);
    signal current_mask_re_reg_d            : std_logic_vector(31 downto 0);
    signal shmem_base_addr_re_reg_d         : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal gprs_size_re_reg_d               : std_logic_vector(8 downto 0);
    signal gprs_base_addr_re_reg_d          : std_logic_vector(8 downto 0);
    signal instruction_mask_re_reg_d        : std_logic_vector(31 downto 0);
    signal next_pc_re_reg_d                 : std_logic_vector(31 downto 0); 
    signal instr_opcode_type_re_reg_d       : instr_opcode_type;
    signal instr_subop_type_re_reg_d        : std_logic_vector(2 downto 0);
    signal alu_opcode_re_reg_d              : alu_opcode_type;
    signal flow_opcode_type_re_reg_d        : flow_opcode_type;
    signal mov_opcode_type_re_reg_d         : mov_opcode_type;
    signal instr_marker_type_re_reg_d       : instr_marker_type;
    signal set_pred_re_reg_d                : std_logic;
    signal set_pred_reg_re_reg_d            : std_logic_vector(1 downto 0);
    signal write_pred_re_reg_d              : std_logic;
    signal is_full_normal_re_reg_d          : std_logic;
    signal is_signed_re_reg_d               : std_logic;
    signal w32_re_reg_d                     : std_logic;
    signal f64_re_reg_d                     : std_logic;
    signal saturate_re_reg_d                : std_logic;
    signal abs_saturate_re_reg_d            : std_logic_vector(1 downto 0);
    signal cvt_round_re_reg_d               : std_logic_vector(1 downto 0);
    signal cvt_type_re_reg_d                : std_logic_vector(2 downto 0);
    signal cvt_neg_re_reg_d                 : std_logic;
    signal condition_re_reg_d               : std_logic_vector(2 downto 0);
    signal addr_hi_re_reg_d                 : std_logic;
    signal addr_lo_re_reg_d                 : std_logic_vector(1 downto 0);
    signal addr_incr_re_reg_d               : std_logic;
    signal mov_size_re_reg_d                : std_logic_vector(2 downto 0);                 
    signal mem_type_re_reg_d                : std_logic_vector(2 downto 0);
    signal sm_type_re_reg_d                 : std_logic_vector(1 downto 0);
    signal addr_imm_re_reg_d                : std_logic;
    signal dest_mem_type_re_reg_d           : mem_type;
    signal dest_mem_opcode_type_re_reg_d    : mem_opcode_type;
    signal src1_neg_re_reg_d                : std_logic;
    signal src2_neg_re_reg_d                : std_logic;
    signal src3_neg_re_reg_d                : std_logic;
    signal target_addr_re_reg_d             : std_logic_vector(18 downto 0);
    signal dest_data_type_re_reg_d          : data_type;
    signal src1_re_reg_d                    : std_logic_vector(31 downto 0);
    signal dest_re_reg_d                    : std_logic_vector(31 downto 0);            
    signal pred_flags_re_reg_d              : vector_flag_register;
    signal temp_vector_register_re_reg_d    : temp_vector_register;
    signal pipeline_read_stall              : std_logic;
    signal pipeline_re_reg_ld               : std_logic;
    signal pipeline_re_reg_ld_reg           : std_logic;
    
    -- Read / Execute Register
    signal warp_id_re_reg_q                 : std_logic_vector(4 downto 0);
    signal warp_lane_id_re_reg_q            : std_logic_vector(1 downto 0);
    signal cta_id_re_reg_q                  : std_logic_vector(3 downto 0);
    signal initial_mask_re_reg_q            : std_logic_vector(31 downto 0);
    signal current_mask_re_reg_q            : std_logic_vector(31 downto 0);
    signal shmem_base_addr_re_reg_q         : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal gprs_size_re_reg_q               : std_logic_vector(8 downto 0);
    signal gprs_base_addr_re_reg_q          : std_logic_vector(8 downto 0);
    signal instruction_mask_re_reg_q        : std_logic_vector(31 downto 0);
    signal next_pc_re_reg_q                 : std_logic_vector(31 downto 0); 
    signal instr_opcode_type_re_reg_q       : instr_opcode_type;
    signal instr_subop_type_re_reg_q        : std_logic_vector(2 downto 0);
    signal alu_opcode_re_reg_q              : alu_opcode_type;
    signal flow_opcode_type_re_reg_q        : flow_opcode_type;
    signal mov_opcode_type_re_reg_q         : mov_opcode_type;
    signal instr_marker_type_re_reg_q       : instr_marker_type;
    signal set_pred_re_reg_q                : std_logic;
    signal set_pred_reg_re_reg_q            : std_logic_vector(1 downto 0);
    signal write_pred_re_reg_q              : std_logic;
    signal is_full_normal_re_reg_q          : std_logic;
    signal is_signed_re_reg_q               : std_logic;
    signal w32_re_reg_q                     : std_logic;
    signal f64_re_reg_q                     : std_logic;
    signal saturate_re_reg_q                : std_logic;
    signal abs_saturate_re_reg_q            : std_logic_vector(1 downto 0);
    signal cvt_round_re_reg_q               : std_logic_vector(1 downto 0);
    signal cvt_type_re_reg_q                : std_logic_vector(2 downto 0);
    signal cvt_neg_re_reg_q                 : std_logic;
    signal condition_re_reg_q               : std_logic_vector(2 downto 0);
    signal addr_hi_re_reg_q                 : std_logic;
    signal addr_lo_re_reg_q                 : std_logic_vector(1 downto 0);
    signal addr_incr_re_reg_q               : std_logic;
    signal mov_size_re_reg_q                : std_logic_vector(2 downto 0);                 
    signal mem_type_re_reg_q                : std_logic_vector(2 downto 0);
    signal sm_type_re_reg_q                 : std_logic_vector(1 downto 0);
    signal addr_imm_re_reg_q                : std_logic;
    signal dest_mem_type_re_reg_q           : mem_type;
    signal dest_mem_opcode_type_re_reg_q    : mem_opcode_type;
    signal src1_neg_re_reg_q                : std_logic;
    signal src2_neg_re_reg_q                : std_logic;
    signal src3_neg_re_reg_q                : std_logic;
    signal target_addr_re_reg_q             : std_logic_vector(18 downto 0);
    signal dest_data_type_re_reg_q          : data_type;
    signal src1_re_reg_q                    : std_logic_vector(31 downto 0);
    signal dest_re_reg_q                    : std_logic_vector(31 downto 0);            
    signal pred_flags_re_reg_q              : vector_flag_register;
    signal temp_vector_register_re_reg_q    : temp_vector_register;
   
    -- Execute
    signal warp_id_ew_reg_d                 : std_logic_vector(4 downto 0);
    signal warp_lane_id_ew_reg_d            : std_logic_vector(1 downto 0);
    signal cta_id_ew_reg_d                  : std_logic_vector(3 downto 0);
    signal initial_mask_ew_reg_d            : std_logic_vector(31 downto 0);
    signal current_mask_ew_reg_d            : std_logic_vector(31 downto 0);
    signal shmem_base_addr_ew_reg_d         : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal gprs_size_ew_reg_d               : std_logic_vector(8 downto 0);
    signal gprs_base_addr_ew_reg_d          : std_logic_vector(8 downto 0);
    signal instr_mask_ew_reg_d              : std_logic_vector(31 downto 0);
    signal next_pc_ew_reg_d                 : std_logic_vector(31 downto 0);
    signal warp_state_ew_reg_d              : warp_state_type;
    signal instr_opcode_type_ew_reg_d       : instr_opcode_type;        
    signal set_pred_ew_reg_d                : std_logic;
    signal set_pred_reg_ew_reg_d            : std_logic_vector(1 downto 0);
    signal write_pred_ew_reg_d              : std_logic;
    signal addr_hi_ew_reg_d                 : std_logic;
    signal addr_lo_ew_reg_d                 : std_logic_vector(1 downto 0);
    signal addr_incr_ew_reg_d               : std_logic;
    signal mov_size_ew_reg_d                : std_logic_vector(2 downto 0);
    signal sm_type_ew_reg_d                 : std_logic_vector(1 downto 0);
    signal addr_imm_ew_reg_d                : std_logic;
    signal src1_ew_reg_d                    : std_logic_vector(31 downto 0);
    signal dest_mem_type_ew_reg_d           : mem_type;
    signal dest_mem_opcode_type_ew_reg_d    : mem_opcode_type;
    signal dest_data_type_ew_reg_d          : data_type;
    signal dest_ew_reg_d                    : std_logic_vector(31 downto 0);
    signal pred_flags_ew_reg_d              : vector_flag_register;
    signal temp_vector_register_ew_reg_d    : temp_vector_register;
    signal pipeline_execute_stall           : std_logic;
    signal pipeline_ew_reg_ld               : std_logic;
    signal pipeline_ew_reg_ld_reg           : std_logic;
    
    -- Execute / Write Register
    signal warp_id_ew_reg_q                 : std_logic_vector(4 downto 0);
    signal warp_lane_id_ew_reg_q            : std_logic_vector(1 downto 0);
    signal cta_id_ew_reg_q                  : std_logic_vector(3 downto 0);
    signal initial_mask_ew_reg_q            : std_logic_vector(31 downto 0);
    signal current_mask_ew_reg_q            : std_logic_vector(31 downto 0);
    signal shmem_base_addr_ew_reg_q         : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal gprs_size_ew_reg_q               : std_logic_vector(8 downto 0);
    signal gprs_base_addr_ew_reg_q          : std_logic_vector(8 downto 0);
    signal instr_mask_ew_reg_q              : std_logic_vector(31 downto 0);
    signal use_next_pc_ew_reg_q             : std_logic;
    signal next_pc_ew_reg_q                 : std_logic_vector(31 downto 0);
    signal warp_state_ew_reg_q              : warp_state_type;
    signal instr_opcode_type_ew_reg_q       : instr_opcode_type;        
    signal set_pred_ew_reg_q                : std_logic;
    signal set_pred_reg_ew_reg_q            : std_logic_vector(1 downto 0);
    signal write_pred_ew_reg_q              : std_logic;
    signal addr_hi_ew_reg_q                 : std_logic;
    signal addr_lo_ew_reg_q                 : std_logic_vector(1 downto 0);
    signal addr_incr_ew_reg_q               : std_logic;
    signal mov_size_ew_reg_q                : std_logic_vector(2 downto 0);
    signal sm_type_ew_reg_q                 : std_logic_vector(1 downto 0);
    signal addr_imm_ew_reg_q                : std_logic;
    signal src1_ew_reg_q                    : std_logic_vector(31 downto 0);
    signal dest_mem_type_ew_reg_q           : mem_type;
    signal dest_mem_opcode_type_ew_reg_q    : mem_opcode_type;
    signal dest_data_type_ew_reg_q          : data_type;
    signal dest_ew_reg_q                    : std_logic_vector(31 downto 0);
    signal pred_flags_ew_reg_q              : vector_flag_register;
    signal temp_vector_register_ew_reg_q    : temp_vector_register;
    
    -- Write
    signal warp_id_ww_reg_d                 : std_logic_vector(4 downto 0);
    signal warp_lane_id_ww_reg_d            : std_logic_vector(1 downto 0);
    signal cta_id_ww_reg_d                  : std_logic_vector(3 downto 0);
    signal initial_mask_ww_reg_d            : std_logic_vector(31 downto 0);
    signal current_mask_ww_reg_d            : std_logic_vector(31 downto 0);
    signal shmem_base_addr_ww_reg_d         : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal gprs_base_addr_ww_reg_d          : std_logic_vector(8 downto 0);
    signal next_pc_ww_reg_d                 : std_logic_vector(31 downto 0);
    signal warp_state_ww_reg_d              : warp_state_type;
    signal pipeline_write_stall             : std_logic;
    signal pipeline_ww_reg_ld               : std_logic;
    signal pipeline_ww_reg_ld_reg           : std_logic;
    
    -- Write / Warp Register
    signal warp_id_ww_reg_q                 : std_logic_vector(4 downto 0);
    signal warp_lane_id_ww_reg_q            : std_logic_vector(1 downto 0);
    signal cta_id_ww_reg_q                  : std_logic_vector(3 downto 0);
    signal initial_mask_ww_reg_q            : std_logic_vector(31 downto 0);
    signal current_mask_ww_reg_q            : std_logic_vector(31 downto 0);
    signal shmem_base_addr_ww_reg_q         : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal gprs_base_addr_ww_reg_q          : std_logic_vector(8 downto 0);
    signal next_pc_ww_reg_q                 : std_logic_vector(31 downto 0);
    signal warp_state_ww_reg_q              : warp_state_type;
          
    -- Warp Divergence Stack
    constant ARB_WARP_DIV_STACK_CNT         : integer := 2;
    signal arb_warp_div_stack_req           : std_logic_vector(ARB_WARP_DIV_STACK_CNT-1 downto 0);
    signal arb_warp_div_stack_ack           : std_logic;
    signal arb_warp_div_stack_ack_o         : std_logic_vector(ARB_WARP_DIV_STACK_CNT-1 downto 0);
    signal arb_warp_div_stack_grant         : std_logic_vector(ARB_WARP_DIV_STACK_CNT-1 downto 0);
    
    signal warp_div_stack_en                : warp_div_std_logic_array;
    signal warp_div_data_i                  : warp_div_data_array;
    signal warp_div_data_o                  : warp_div_data_array;
    signal warp_div_push_en                 : warp_div_std_logic_array;    
    signal warp_div_stack_full              : warp_div_std_logic_array;
    signal warp_div_stack_empty             : warp_div_std_logic_array;
                
    signal pipeline_read_warp_div_stack_en  : warp_div_std_logic_array;
    signal pipeline_read_warp_div_rd_data   : warp_div_data_array;
    signal pipeline_read_warp_div_wr_data   : warp_div_data_array;
    signal pipeline_read_warp_div_push_en   : warp_div_std_logic_array;  
    
    signal pipeline_exec_warp_div_stack_en  : warp_div_std_logic_array;
    signal pipeline_exec_warp_div_rd_data   : warp_div_data_array;
    signal pipeline_exec_warp_div_wr_data   : warp_div_data_array;
    signal pipeline_exec_warp_div_push_en   : warp_div_std_logic_array;  
    
    -- Vector Register File
    signal pipeline_read_gprs_lane_id_a                   : warp_lane_id_array;
    signal pipeline_read_gprs_addr_a                      : gprs_addr_array;
    signal pipeline_read_gprs_reg_num_a                   : gprs_reg_array;
    signal pipeline_read_gprs_wr_en_a                     : wr_en_array;
    signal pipeline_read_gprs_wr_data_a                   : vector_register;
    signal pipeline_read_gprs_rd_data_a                   : vector_register;
    signal smp_controller_gprs_lane_id_a      : warp_lane_id_array;
    signal smp_controller_gprs_addr_a         : gprs_addr_array;
    signal smp_controller_gprs_reg_num_a      : gprs_reg_array;
    signal smp_controller_gprs_wr_en_a        : wr_en_array;
    signal smp_controller_gprs_wr_data_a      : vector_register;
    signal gprs_lane_id_a                   : warp_lane_id_array;
    signal gprs_addr_a                      : gprs_addr_array;
    signal gprs_reg_num_a                   : gprs_reg_array;
    signal gprs_wr_en_a                     : wr_en_array;
    signal gprs_wr_data_a                   : vector_register;
    signal gprs_rd_data_a                   : vector_register;
    signal smp_controller_gprs_lane_id      : warp_lane_id_array;
    signal smp_controller_gprs_addr         : gprs_addr_array;
    signal smp_controller_gprs_reg_num      : gprs_reg_array;
    signal smp_controller_gprs_wr_en        : wr_en_array;
    signal smp_controller_gprs_wr_data      : vector_register;
    signal smp_controller_gprs_rd_data      : vector_register;
    signal pipeline_read_gprs_lane_id       : warp_lane_id_array;
    signal pipeline_read_gprs_addr          : gprs_addr_array;
    signal pipeline_read_gprs_reg_num       : gprs_reg_array;
    signal pipeline_read_gprs_wr_en         : wr_en_array;
    signal pipeline_read_gprs_wr_data       : vector_register;
    signal pipeline_read_gprs_rd_data       : vector_register;
    signal gprs_lane_id_b                   : warp_lane_id_array;
    signal gprs_addr_b                      : gprs_addr_array;
    signal gprs_reg_num_b                   : gprs_reg_array;
    signal gprs_wr_en_b                     : wr_en_array;
    signal gprs_wr_data_b                   : vector_register;
    signal gprs_rd_data_b                   : vector_register;

    -- Address Registers
    signal addr_regs_warp_id_a              : warp_id_array; 
    signal addr_regs_warp_lane_id_a         : warp_lane_id_array;
    signal addr_regs_addr_a                 : reg_num_array;
    signal addr_regs_wr_en_a                : wr_en_array;
    signal addr_regs_wr_data_a              : vector_register;
    signal addr_regs_rd_data_a              : vector_register;
    signal addr_regs_warp_id_b              : warp_id_array; 
    signal addr_regs_warp_lane_id_b         : warp_lane_id_array;
    signal addr_regs_addr_b                 : reg_num_array;
    signal addr_regs_wr_en_b                : wr_en_array;
    signal addr_regs_wr_data_b              : vector_register;
    signal addr_regs_rd_data_b              : vector_register;
    
    -- Predicate Flag Registers
    signal pred_regs_warp_id_a              : warp_id_array; 
    signal pred_regs_warp_lane_id_a         : warp_lane_id_array;
    signal pred_regs_addr_a                 : reg_num_array;
    signal pred_regs_wr_en_a                : wr_en_array;
    signal pred_regs_wr_data_a              : vector_flag_register;
    signal pred_regs_rd_data_a              : vector_flag_register;
    signal pred_regs_warp_id_b              : warp_id_array; 
    signal pred_regs_warp_lane_id_b         : warp_lane_id_array;
    signal pred_regs_addr_b                 : reg_num_array;
    signal pred_regs_wr_en_b                : wr_en_array;
    signal pred_regs_wr_data_b              : vector_flag_register;
    signal pred_regs_rd_data_b              : vector_flag_register;
    
    -- Shared Memory
    signal shmem_addr_a                     : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal shmem_wr_en_a                    : std_logic_vector(0 downto 0);
    signal shmem_wr_data_a                  : std_logic_vector(7 downto 0);
    signal shmem_rd_data_a                  : std_logic_vector(7 downto 0);
    signal smp_controller_shmem_addr        : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal smp_controller_shmem_wr_en       : std_logic_vector(0 downto 0);
    signal smp_controller_shmem_wr_data     : std_logic_vector(7 downto 0);
    signal smp_controller_shmem_rd_data     : std_logic_vector(7 downto 0);
    signal pipeline_read_shmem_addr         : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal pipeline_read_shmem_wr_en        : std_logic_vector(0 downto 0);
    signal pipeline_read_shmem_wr_data      : std_logic_vector(7 downto 0);
    signal pipeline_read_shmem_rd_data      : std_logic_vector(7 downto 0);
	signal shmem_addr_b                     : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal shmem_wr_en_b                    : std_logic_vector(0 downto 0);
    signal shmem_wr_data_b                  : std_logic_vector(7 downto 0);
    signal shmem_rd_data_b                  : std_logic_vector(7 downto 0); 
    
    -- Local Memory
    signal lmem_addr_a                      : std_logic_vector(LMEM_ADDR_SIZE-1 downto 0);
    signal lmem_wr_en_a                     : std_logic_vector(0 downto 0);
    signal lmem_wr_data_a                   : std_logic_vector(7 downto 0);
    signal lmem_rd_data_a                   : std_logic_vector(7 downto 0);
	signal lmem_addr_b                      : std_logic_vector(LMEM_ADDR_SIZE-1 downto 0);
    signal lmem_wr_en_b                     : std_logic_vector(0 downto 0);
    signal lmem_wr_data_b                   : std_logic_vector(7 downto 0);
    signal lmem_rd_data_b                   : std_logic_vector(7 downto 0); 

    signal host_reset_n                     : std_logic;
	 
	 signal decode_flag_check_out			:std_logic; --//////////////////***************
signal    rd_en_fifo_i :  STD_LOGIC;
signal     valid_fifo_i : STD_LOGIC;
signal     dout_fifo_i :  STD_LOGIC_VECTOR(31 DOWNTO 0);

signal write_en_noc_ram_i : std_logic_vector(0 downto 0);
signal addr_noc_ram_i : std_logic_vector(2 downto 0);
signal data_noc_ram_i : std_logic_vector(31 downto 0);

signal not_empty_i: std_logic;
	
begin
    rd_en_fifo_i <= rd_en_fifo_in;
	 valid_fifo_out <= valid_fifo_i;
    dout_fifo_out <=dout_fifo_i;
	 not_empty <= not_empty_i;
	 
	 write_en_noc_ram_i <= write_en_noc_ram_in;
	 addr_noc_ram_i <= addr_noc_ram_in;
	 data_noc_ram_i <= data_noc_ram_in;
	 --
    -- SMP Configuration
    --
    uSMPConfiguration : streaming_multiprocessor_configuration
        port map (
            clk_in                      => clk_in,
			host_reset                  => host_reset,
            
            reg_threads_per_block_in    => threads_per_block_in,
            reg_num_blocks_in           => num_blocks_in,
            reg_warps_per_block_in      => warps_per_block,
            reg_shmem_base_addr_in      => shmem_base_addr_in,
            reg_shmem_size_in           => shmem_size_in,
            reg_parameter_size_in       => parameter_size_in,
            reg_gprs_size_in            => gprs_size_in,
            reg_block_x_in              => block_x_in,
            reg_block_y_in              => block_y_in,
            reg_block_z_in              => block_z_in,
            reg_grid_x_in               => grid_x_in,
            reg_grid_y_in               => grid_y_in,
            reg_block_idx_in            => block_idx_in,
            
            reg_threads_per_block_ld    => threads_per_block_ld,
            reg_num_blocks_ld           => num_blocks_ld,
            reg_warps_per_block_ld      => warps_per_block_ld,
            reg_shmem_base_addr_ld      => shmem_base_addr_ld,
            reg_shmem_size_ld           => shmem_size_ld,
            reg_parameter_size_ld       => parameter_size_ld,
            reg_gprs_size_ld            => gprs_size_ld,
            reg_block_x_ld              => block_x_ld,
            reg_block_y_ld              => block_y_ld,
            reg_block_z_ld              => block_z_ld,
            reg_grid_x_ld               => grid_x_ld,
            reg_grid_y_ld               => grid_y_ld,
            reg_block_idx_ld            => block_idx_ld,
            
            reg_threads_per_block_out   => reg_threads_per_block,
            reg_num_blocks_out          => reg_num_blocks,
            reg_warps_per_block_out     => reg_warps_per_block,
            reg_shmem_base_addr_out     => reg_shmem_base_addr,
            reg_shmem_size_out          => reg_shmem_size,
            reg_parameter_size_out      => reg_parameter_size,
            reg_gprs_size_out           => reg_gprs_size,
            reg_block_x_out             => reg_block_x,
            reg_block_y_out             => reg_block_y,
            reg_block_z_out             => reg_block_z,
            reg_grid_x_out              => reg_grid_x,
            reg_grid_y_out              => reg_grid_y,
            reg_block_idx_out           => reg_block_idx
        );
        
    --
    -- SMP Controller
    --
    uSMPController : streaming_multiprocessor_cntlr
        generic map (
            SHMEM_ADDR_SIZE                 => SHMEM_ADDR_SIZE
        )
        port map (
            clk_in                          => clk_in,
            host_reset                      => host_reset,
            
            smp_run_en                      => smp_run_en,
            warp_generator_done             => warp_generator_done,
            warp_scheduler_done             => warp_scheduler_done,
            
            threads_per_block_in            => reg_threads_per_block,
            num_blocks_in                   => reg_num_blocks,
            shmem_base_addr_in              => reg_shmem_base_addr,
            shmem_size_in                   => reg_shmem_size,
            parameter_size_in               => reg_parameter_size,
            gprs_size_in                    => reg_gprs_size,
            block_x_in                      => reg_block_x,
            block_y_in                      => reg_block_y,
            block_z_in                      => reg_block_z,
            grid_x_in                       => reg_grid_x,
            grid_y_in                       => reg_grid_y,
            block_idx_in                    => reg_block_idx,
            
            gpgpu_config_reg_cs_out         => gpgpu_config_reg_cs,
            gpgpu_config_reg_rw_out         => gpgpu_config_reg_rw,
            gpgpu_config_reg_adr_out        => gpgpu_config_reg_adr,
            gpgpu_config_reg_rd_data_in     => gpgpu_config_reg_rd_data,
            gpgpu_config_reg_wr_data_out    => gpgpu_config_reg_wr_data,
            
            shmem_addr_out                  => smp_controller_shmem_addr,
            shmem_wr_en_out                 => smp_controller_shmem_wr_en,
            shmem_wr_data_out               => smp_controller_shmem_wr_data,
            shmem_rd_data_in                => smp_controller_shmem_rd_data,
            
            gprs_base_addr_out              => smp_controller_gprs_addr,
            gprs_reg_num_out                => smp_controller_gprs_reg_num,
            gprs_lane_id_out                => smp_controller_gprs_lane_id,
            gprs_wr_en_out                  => smp_controller_gprs_wr_en,
            gprs_wr_data_out                => smp_controller_gprs_wr_data,
            gprs_rd_data_in                 => smp_controller_gprs_rd_data,
            
            warps_per_block_out             => warps_per_block,
            warps_per_block_ld              => warps_per_block_ld,
            
            smp_configuration_en            => smp_configuration_en,
            warp_generator_en               => warp_generator_en,
            smp_done                        => smp_done
        );
    
    --
    -- Warp Unit
    --
    uWarpUnit : warp_unit
        generic map (
            SHMEM_ADDR_SIZE                 => SHMEM_ADDR_SIZE
        )
        port map (
            clk_in                          => clk_in,
            host_reset                      => host_reset,
            warp_scheduler_reset            => smp_configuration_en,
            
            warp_generator_en               => warp_generator_en,
            check_warp_en                   => pipeline_ww_reg_ld_reg,
            pipeline_stall_in               => pipeline_fetch_stall,
            
            threads_per_block_in            => reg_threads_per_block,
            num_blocks_in                   => reg_num_blocks,
            warps_per_block_in              => reg_warps_per_block,
            shared_mem_base_addr_in         => reg_shmem_base_addr,
            shared_mem_size_in              => reg_shmem_size,
            gprs_size_in                    => reg_gprs_size,
            block_x_in                      => reg_block_x,
            block_y_in                      => reg_block_y,
            block_z_in                      => reg_block_z,
            grid_x_in                       => reg_grid_x,
            grid_y_in                       => reg_grid_y,
            block_idx_in                    => reg_block_idx,
            
            warp_id_in                      => warp_id_ww_reg_q,
            warp_lane_id_in                 => warp_lane_id_ww_reg_q,
            cta_id_in                       => cta_id_ww_reg_q,
            initial_mask_in                 => initial_mask_ww_reg_q,
            current_mask_in                 => current_mask_ww_reg_q,
            shmem_base_addr_in              => shmem_base_addr_ww_reg_q,
            gprs_base_addr_in               => gprs_base_addr_ww_reg_q,
            next_pc_in                      => next_pc_ww_reg_q,
            warp_state_in                   => warp_state_ww_reg_q,
            
            program_cntr_out                => program_cntr_wf_reg_d,
            warp_id_out                     => warp_id_wf_reg_d,
            warp_lane_id_out                => warp_lane_id_wf_reg_d,
            cta_id_out                      => cta_id_wf_reg_d,
            initial_mask_out                => initial_mask_wf_reg_d,
            current_mask_out                => current_mask_wf_reg_d,
            shmem_base_addr_out             => shmem_base_addr_wf_reg_d,
            gprs_size_out                   => gprs_size_wf_reg_d,
            gprs_base_addr_out              => gprs_base_addr_wf_reg_d,
            
            num_warps_out                   => num_warps,
            warp_generator_done             => warp_generator_done,
            
            pipeline_stall_out              => pipeline_warp_stall,
            warp_scheduler_done             => warp_scheduler_done,
            
            -- stats
            stats_reset                     => stats_reset,
            stats_warp_generator_out        => smp_stats_out(stat_stages(WARP_GENERATOR_STATS)),
            stats_warp_scheduler_out        => smp_stats_out(stat_stages(WARP_SCHEDULER_STATS)),
            stats_warp_checker_out          => smp_stats_out(stat_stages(WARP_CHECKER_STATS)),
            stats_smp_out                   => smp_stats_out(stat_stages(SMP_STATS)),
            
            pipeline_reg_ld	                => pipeline_wf_reg_ld,
			fetch_en						=> fetch_en
        );   
    
    --
    -- Warp / Fetch Register
    --
    pWarpToFetchRegister : process(clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (host_reset = '1') then
                fetch_en_reg				        <= '0';
            else
                pipeline_wf_reg_ld_reg              <= pipeline_wf_reg_ld;
				fetch_en_reg				   	    <= fetch_en;
                    if (pipeline_wf_reg_ld = '1') then
                        program_cntr_wf_reg_q       <= program_cntr_wf_reg_d;
                        warp_id_wf_reg_q            <= warp_id_wf_reg_d;
                        warp_lane_id_wf_reg_q       <= warp_lane_id_wf_reg_d;
                        cta_id_wf_reg_q             <= cta_id_wf_reg_d;
                        initial_mask_wf_reg_q       <= initial_mask_wf_reg_d;
                        current_mask_wf_reg_q       <= current_mask_wf_reg_d;
                        shmem_base_addr_wf_reg_q    <= shmem_base_addr_wf_reg_d;
                        gprs_size_wf_reg_q          <= gprs_size_wf_reg_d;
                        gprs_base_addr_wf_reg_q     <= gprs_base_addr_wf_reg_d;
                    end if;
            end if;
        end if;
    end process;
    
    --
    -- Fetch Stage
    --
    uPipelineFetch : pipeline_fetch
        generic map (
            MEM_ADDR_SIZE                   => SYSMEM_ADDR_SIZE
        )
        port map (
            reset                           => host_reset,
            clk_in                          => clk_in,
         
            fetch_en                        => fetch_en_reg,
			pass_en							=> pipeline_wf_reg_ld_reg,

            pipeline_stall_in               => pipeline_decode_stall,
            
            program_cntr_in                 => program_cntr_wf_reg_q,
            warp_id_in                      => warp_id_wf_reg_q,
            warp_lane_id_in                 => warp_lane_id_wf_reg_q,
            cta_id_in                       => cta_id_wf_reg_q,
            initial_mask_in                 => initial_mask_wf_reg_q,
            current_mask_in                 => current_mask_wf_reg_q,
            shmem_base_addr_in              => shmem_base_addr_wf_reg_q,
            gprs_size_in                    => gprs_size_wf_reg_q,
            gprs_base_addr_in               => gprs_base_addr_wf_reg_q,
            
            mem_wr_data_a_out			    => open,
			mem_addr_a_out				    => sysmem_addr_a,
			mem_wr_en_a_out				    => sysmem_wr_en_a,
			mem_rd_data_a_in			    => sysmem_rd_data_a,
					
			mem_wr_data_b_out			    => open,
			mem_addr_b_out				    => sysmem_addr_b,
			mem_wr_en_b_out				    => sysmem_wr_en_b,
			mem_rd_data_b_in			    => sysmem_rd_data_b,
			
            program_cntr_out                => program_cntr_fd_reg_d,
            warp_id_out                     => warp_id_fd_reg_d,
            warp_lane_id_out                => warp_lane_id_fd_reg_d,
            cta_id_out                      => cta_id_fd_reg_d,
            initial_mask_out                => initial_mask_fd_reg_d,
            current_mask_out                => current_mask_fd_reg_d,
            shmem_base_addr_out             => shmem_base_addr_fd_reg_d,
            gprs_size_out                   => gprs_size_fd_reg_d,
            gprs_base_addr_out              => gprs_base_addr_fd_reg_d,
            next_pc_out                     => next_pc_fd_reg_d,
            instruction_out                 => instruction_fd_reg_d,
			
            -- stats
            stats_reset                     => stats_reset,
            stats_out                       => smp_stats_out(stat_stages(PIPELINE_FETCH_STATS)),
            
            pipeline_stall_out              => pipeline_fetch_stall,
			pipeline_reg_ld	                => pipeline_fd_reg_ld
        );
        
    --
    -- Fetch / Decode Register
    --
    pFetchToDecodeRegister : process(clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (host_reset = '1') then
                pipeline_fd_reg_ld_reg          <= '0';
            else
                pipeline_fd_reg_ld_reg          <= pipeline_fd_reg_ld;
                if (pipeline_fd_reg_ld = '1') then
                    program_cntr_fd_reg_q       <= program_cntr_fd_reg_d;
                    next_pc_fd_reg_q            <= next_pc_fd_reg_d;
                    warp_id_fd_reg_q            <= warp_id_fd_reg_d;
                    warp_lane_id_fd_reg_q       <= warp_lane_id_fd_reg_d;
                    cta_id_fd_reg_q             <= cta_id_fd_reg_d;
                    initial_mask_fd_reg_q       <= initial_mask_fd_reg_d;
                    current_mask_fd_reg_q       <= current_mask_fd_reg_d;
                    shmem_base_addr_fd_reg_q    <= shmem_base_addr_fd_reg_d;
                    gprs_size_fd_reg_q          <= gprs_size_fd_reg_d;
                    gprs_base_addr_fd_reg_q     <= gprs_base_addr_fd_reg_d;
                    instruction_fd_reg_q        <= instruction_fd_reg_d;
                end if;
            end if;
        end if;
    end process;
    
    --
    -- Decode Stage
    --
    uPipelineDecode : pipeline_decode
        port map (
            reset                           => host_reset,
            clk_in                          => clk_in,
       
            en                              => pipeline_fd_reg_ld_reg,
            pipeline_stall_in               => pipeline_read_stall,
            
            program_cntr_in                 => program_cntr_fd_reg_q,
            warp_id_in                      => warp_id_fd_reg_q,
            warp_lane_id_in                 => warp_lane_id_fd_reg_q,
            cta_id_in                       => cta_id_fd_reg_q,
            initial_mask_in                 => initial_mask_fd_reg_q,
            current_mask_in                 => current_mask_fd_reg_q,
            shmem_base_addr_in              => shmem_base_addr_fd_reg_q,
            gprs_size_in                    => gprs_size_fd_reg_q,
            gprs_base_addr_in               => gprs_base_addr_fd_reg_q,
            next_pc_in                      => next_pc_fd_reg_q,
            instruction_in                  => instruction_fd_reg_q,
            
            program_cntr_out                => program_cntr_dr_reg_d,
            warp_id_out                     => warp_id_dr_reg_d,
            warp_lane_id_out                => warp_lane_id_dr_reg_d,
            cta_id_out                      => cta_id_dr_reg_d,
            initial_mask_out                => initial_mask_dr_reg_d,
            current_mask_out                => current_mask_dr_reg_d,
            shmem_base_addr_out             => shmem_base_addr_dr_reg_d,
            gprs_size_out                   => gprs_size_dr_reg_d,
            gprs_base_addr_out              => gprs_base_addr_dr_reg_d,
            next_pc_out                     => next_pc_dr_reg_d,
                                    
            instr_opcode_type_out           => instr_opcode_type_dr_reg_d,
            instr_subop_type_out            => instr_subop_type_dr_reg_d,
            alu_opcode_out                  => alu_opcode_dr_reg_d,
            mov_opcode_out                  => mov_opcode_dr_reg_d,
            flow_opcode_out                 => flow_opcode_dr_reg_d,
            instr_marker_type_out           => instr_marker_type_dr_reg_d,
         
            instr_src1_shared_out           => open,
            instr_src2_const_out            => open,
            instr_src3_const_out            => open,
   
            pred_reg_out                    => pred_reg_dr_reg_d,
            pred_cond_out                   => pred_cond_dr_reg_d,
            set_pred_out                    => set_pred_dr_reg_d,
            set_pred_reg_out                => set_pred_reg_dr_reg_d,
            output_reg_out                  => open,
            write_pred_out                  => write_pred_dr_reg_d,
            
            is_full_normal_out              => is_full_normal_dr_reg_d,
            is_signed_out                   => is_signed_dr_reg_d,
            w32_out                         => w32_dr_reg_d,
            f64_out                         => open,
            saturate_out                    => saturate_dr_reg_d,
            abs_saturate_out                => abs_saturate_dr_reg_d,
            cvt_round_out                   => cvt_round_dr_reg_d,
            cvt_type_out                    => cvt_type_dr_reg_d,
            cvt_neg_out                     => cvt_neg_dr_reg_d,
            condition_out                   => condition_dr_reg_d,
            addr_hi_out                     => addr_hi_dr_reg_d,
            addr_lo_out                     => addr_lo_dr_reg_d,
            addr_reg_out                    => open,
            hi_out                          => open,
            full_out                        => open,
            addr_incr_out                   => addr_incr_dr_reg_d,
            mov_size_out                    => mov_size_dr_reg_d,
            alt_out                         => open,
            const_segment_out               => const_segment_dr_reg_d,
            mem_type_out                    => mem_type_dr_reg_d,
            sm_type_out                     => sm_type_dr_reg_d,
            imm_hi_out                      => imm_hi_dr_reg_d,
            addr_imm_out                    => addr_imm_dr_reg_d,
    
            src1_shared_out                 => open,
         
            src1_mem_type_out               => src1_mem_type_dr_reg_d,
            src2_mem_type_out               => src2_mem_type_dr_reg_d,
            src3_mem_type_out               => src3_mem_type_dr_reg_d,
            dest_mem_type_out               => dest_mem_type_dr_reg_d,
            
            src1_mem_opcode_type_out        => src1_mem_opcode_type_dr_reg_d,
            src2_mem_opcode_type_out        => src2_mem_opcode_type_dr_reg_d,
            src3_mem_opcode_type_out        => src3_mem_opcode_type_dr_reg_d,
            dest_mem_opcode_type_out        => dest_mem_opcode_type_dr_reg_d,
            
            src1_neg_out                    => src1_neg_dr_reg_d,
            src2_neg_out                    => src2_neg_dr_reg_d,
            src3_neg_out                    => src3_neg_dr_reg_d,
         
            target_addr_out                 => target_addr_dr_reg_d,

            src1_data_type_out              => src1_data_type_dr_reg_d,
            src2_data_type_out              => src2_data_type_dr_reg_d,
            src3_data_type_out              => src3_data_type_dr_reg_d,
            dest_data_type_out              => dest_data_type_dr_reg_d,
            
            src1_out                        => src1_dr_reg_d,
            src2_out                        => src2_dr_reg_d,
            src3_out                        => src3_dr_reg_d,
            dest_out                        => dest_dr_reg_d,
            
            -- stats
            stats_reset                     => stats_reset,
            stats_out                       => smp_stats_out(stat_stages(PIPELINE_DECODE_STATS)),
            
            pipeline_stall_out              => pipeline_decode_stall,
            pipeline_reg_ld                 => pipeline_dr_reg_ld,
				decode_flag_check_out				=> decode_flag_check --//////////////************
				
      );

    --
    -- Decode / Read Register
    --
    pDecodeToReadRegister : process(clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (host_reset = '1') then
                pipeline_dr_reg_ld_reg              <= '0';
            else
                pipeline_dr_reg_ld_reg              <= pipeline_dr_reg_ld;
                if (pipeline_dr_reg_ld = '1') then
                    program_cntr_dr_reg_q           <= program_cntr_dr_reg_d;
                    next_pc_dr_reg_q                <= next_pc_dr_reg_d;
                    warp_id_dr_reg_q                <= warp_id_dr_reg_d;
                    warp_lane_id_dr_reg_q           <= warp_lane_id_dr_reg_d;
                    cta_id_dr_reg_q                 <= cta_id_dr_reg_d;
                    initial_mask_dr_reg_q           <= initial_mask_dr_reg_d;
                    current_mask_dr_reg_q           <= current_mask_dr_reg_d;
                    shmem_base_addr_dr_reg_q        <= shmem_base_addr_dr_reg_d;
                    gprs_size_dr_reg_q              <= gprs_size_dr_reg_d;
                    gprs_base_addr_dr_reg_q         <= gprs_base_addr_dr_reg_d;
                    instr_opcode_type_dr_reg_q      <= instr_opcode_type_dr_reg_d;
                    instr_subop_type_dr_reg_q       <= instr_subop_type_dr_reg_d;
                    alu_opcode_dr_reg_q             <= alu_opcode_dr_reg_d;
                    mov_opcode_type_dr_reg_q        <= mov_opcode_dr_reg_d;
                    flow_opcode_type_dr_reg_q       <= flow_opcode_dr_reg_d;
                    instr_marker_type_dr_reg_q      <= instr_marker_type_dr_reg_d;
                    pred_reg_dr_reg_q               <= pred_reg_dr_reg_d;
                    pred_cond_dr_reg_q              <= pred_cond_dr_reg_d;
                    set_pred_dr_reg_q               <= set_pred_dr_reg_d;
                    set_pred_reg_dr_reg_q           <= set_pred_reg_dr_reg_d;
                    write_pred_dr_reg_q             <= write_pred_dr_reg_d;
                    is_full_normal_dr_reg_q         <= is_full_normal_dr_reg_d;
                    is_signed_dr_reg_q              <= is_signed_dr_reg_d;
                    w32_dr_reg_q                    <= w32_dr_reg_d;
                    saturate_dr_reg_q               <= saturate_dr_reg_d;
                    abs_saturate_dr_reg_q           <= abs_saturate_dr_reg_d;
                    cvt_round_dr_reg_q              <= cvt_round_dr_reg_d;
                    cvt_type_dr_reg_q               <= cvt_type_dr_reg_d;
                    cvt_neg_dr_reg_q                <= cvt_neg_dr_reg_d;
                    condition_dr_reg_q              <= condition_dr_reg_d;
                    addr_hi_dr_reg_q                <= addr_hi_dr_reg_d;
                    addr_lo_dr_reg_q                <= addr_lo_dr_reg_d;
                    addr_incr_dr_reg_q              <= addr_incr_dr_reg_d;
                    mov_size_dr_reg_q               <= mov_size_dr_reg_d;
                    const_segment_dr_reg_q          <= const_segment_dr_reg_d;
                    mem_type_dr_reg_q               <= mem_type_dr_reg_d;
                    sm_type_dr_reg_q                <= sm_type_dr_reg_d;
                    imm_hi_dr_reg_q                 <= imm_hi_dr_reg_d;
                    addr_imm_dr_reg_q               <= addr_imm_dr_reg_d;
                    src1_mem_type_dr_reg_q          <= src1_mem_type_dr_reg_d;
                    src2_mem_type_dr_reg_q          <= src2_mem_type_dr_reg_d;
                    src3_mem_type_dr_reg_q          <= src3_mem_type_dr_reg_d;
                    dest_mem_type_dr_reg_q          <= dest_mem_type_dr_reg_d;
                    src1_mem_opcode_type_dr_reg_q   <= src1_mem_opcode_type_dr_reg_d;
                    src2_mem_opcode_type_dr_reg_q   <= src2_mem_opcode_type_dr_reg_d;
                    src3_mem_opcode_type_dr_reg_q   <= src3_mem_opcode_type_dr_reg_d;
                    dest_mem_opcode_type_dr_reg_q   <= dest_mem_opcode_type_dr_reg_d;
                    src1_neg_dr_reg_q               <= src1_neg_dr_reg_d;
                    src2_neg_dr_reg_q               <= src2_neg_dr_reg_d;
                    src3_neg_dr_reg_q               <= src3_neg_dr_reg_d;
                    target_addr_dr_reg_q            <= target_addr_dr_reg_d;
                    src1_data_type_dr_reg_q         <= src1_data_type_dr_reg_d;
                    src2_data_type_dr_reg_q         <= src2_data_type_dr_reg_d;
                    src3_data_type_dr_reg_q         <= src3_data_type_dr_reg_d;
                    dest_data_type_dr_reg_q         <= dest_data_type_dr_reg_d;
                    src1_dr_reg_q                   <= src1_dr_reg_d;
                    src2_dr_reg_q                   <= src2_dr_reg_d;
                    src3_dr_reg_q                   <= src3_dr_reg_d;
                    dest_dr_reg_q                   <= dest_dr_reg_d;
                end if; 
            end if;
        end if;
    end process;
    
    --
    -- Read Stage
    --
    uPipelineRead : pipeline_read
        generic map (
            CORE_ID                         => STREAMING_MULTIPROCESSOR_ID,
            SHMEM_ADDR_SIZE                 => SHMEM_ADDR_SIZE,
            CMEM_ADDR_SIZE                  => CMEM_ADDR_SIZE,
            LMEM_ADDR_SIZE                  => LMEM_ADDR_SIZE,
            GMEM_ADDR_SIZE                  => GMEM_ADDR_SIZE
        )
        port map (
            reset                           => host_reset,
            clk_in                          => clk_in,
         
            en                              => pipeline_dr_reg_ld_reg,
            pipeline_stall_in               => pipeline_execute_stall,
            
            num_warps_in                    => num_warps,
            
            warp_id_in                      => warp_id_dr_reg_q,
            warp_lane_id_in                 => warp_lane_id_dr_reg_q,
            cta_id_in                       => cta_id_dr_reg_q,
            initial_mask_in                 => initial_mask_dr_reg_q,
            current_mask_in                 => current_mask_dr_reg_q,
            shmem_base_addr_in              => shmem_base_addr_dr_reg_q,
            gprs_size_in                    => gprs_size_dr_reg_q,
            gprs_base_addr_in               => gprs_base_addr_dr_reg_q,
            next_pc_in                      => next_pc_dr_reg_q,
            
            instr_opcode_type_in            => instr_opcode_type_dr_reg_q,
            instr_subop_type_in             => instr_subop_type_dr_reg_q,
            alu_opcode_in                   => alu_opcode_dr_reg_q,
            flow_opcode_type_in             => flow_opcode_type_dr_reg_q,
            mov_opcode_type_in              => mov_opcode_type_dr_reg_q,
            instr_marker_type_in            => instr_marker_type_dr_reg_q,
            
            pred_reg_in                     => pred_reg_dr_reg_q,
            pred_cond_in                    => pred_cond_dr_reg_q,
            set_pred_in                     => set_pred_dr_reg_q,
            set_pred_reg_in                 => set_pred_reg_dr_reg_q,
            write_pred_in                   => write_pred_dr_reg_q,
            
            is_full_normal_in               => is_full_normal_dr_reg_q,
            is_signed_in                    => is_signed_dr_reg_q,
            w32_in                          => w32_dr_reg_q,
            f64_in                          => f64_dr_reg_q,
            saturate_in                     => saturate_dr_reg_q,
            abs_saturate_in                 => abs_saturate_dr_reg_q,
            cvt_round_in                    => cvt_round_dr_reg_q,
            cvt_type_in                     => cvt_type_dr_reg_q,
            cvt_neg_in                      => cvt_neg_dr_reg_q,
            condition_in                    => condition_dr_reg_q,
            addr_hi_in                      => addr_hi_dr_reg_q,
            addr_lo_in                      => addr_lo_dr_reg_q,
            addr_reg_in                     => addr_reg_dr_reg_q,
            hi_in                           => hi_dr_reg_q,
            addr_incr_in                    => addr_incr_dr_reg_q,
            mov_size_in                     => mov_size_dr_reg_q,
            const_segment_in                => const_segment_dr_reg_q,
            mem_type_in                     => mem_type_dr_reg_q,
            sm_type_in                      => sm_type_dr_reg_q,
            imm_hi_in                       => imm_hi_dr_reg_q,
            addr_imm_in                     => addr_imm_dr_reg_q,
        
            src1_shared_in                  => src1_shared_dr_reg_q,
         
            src1_mem_type_in                => src1_mem_type_dr_reg_q,
            src2_mem_type_in                => src2_mem_type_dr_reg_q,
            src3_mem_type_in                => src3_mem_type_dr_reg_q,
            dest_mem_type_in                => dest_mem_type_dr_reg_q,
            
            src1_mem_opcode_type_in         => src1_mem_opcode_type_dr_reg_q,
            src2_mem_opcode_type_in         => src2_mem_opcode_type_dr_reg_q,
            src3_mem_opcode_type_in         => src3_mem_opcode_type_dr_reg_q,
            dest_mem_opcode_type_in         => dest_mem_opcode_type_dr_reg_q,
            
            src1_neg_in                     => src1_neg_dr_reg_q,
            src2_neg_in                     => src2_neg_dr_reg_q,
            src3_neg_in                     => src3_neg_dr_reg_q,
         
            target_addr_in                  => target_addr_dr_reg_q,

            src1_data_type_in               => src1_data_type_dr_reg_q,
            src2_data_type_in               => src2_data_type_dr_reg_q,
            src3_data_type_in               => src3_data_type_dr_reg_q,
            dest_data_type_in               => dest_data_type_dr_reg_q,
            
            src1_in                         => src1_dr_reg_q,
            src2_in                         => src2_dr_reg_q,
            src3_in                         => src3_dr_reg_q,
            dest_in                         => dest_dr_reg_q,
  
            gprs_base_addr_out              => pipeline_read_gprs_addr,
            gprs_reg_num_out                => pipeline_read_gprs_reg_num,
            gprs_lane_id_out                => pipeline_read_gprs_lane_id,
            gprs_wr_en_out                  => pipeline_read_gprs_wr_en,
            gprs_wr_data_out                => pipeline_read_gprs_wr_data,
            gprs_rd_data_in                 => pipeline_read_gprs_rd_data,
            
            pred_regs_warp_id_out           => pred_regs_warp_id_a,
            pred_regs_warp_lane_id_out      => pred_regs_warp_lane_id_a,
            pred_regs_reg_num_out           => pred_regs_addr_a,
            pred_regs_wr_en_out             => pred_regs_wr_en_a,
            pred_regs_wr_data_out           => pred_regs_wr_data_a,
            pred_regs_rd_data_in            => pred_regs_rd_data_a,
            
            addr_regs_warp_id_out           => addr_regs_warp_id_a,
            addr_regs_warp_lane_id_out      => addr_regs_warp_lane_id_a,
            addr_regs_reg_num_out           => addr_regs_addr_a,
            addr_regs_wr_en_out             => addr_regs_wr_en_a,
            addr_regs_wr_data_out           => addr_regs_wr_data_a,
            addr_regs_rd_data_in            => addr_regs_rd_data_a,
            
            warp_div_req_out                => arb_warp_div_stack_req(0),
            warp_div_ack_out                => arb_warp_div_stack_ack_o(0),
            warp_div_grant_in               => arb_warp_div_stack_grant(0),
            
            warp_div_stack_en               => pipeline_read_warp_div_stack_en,
            warp_div_rd_data_in             => pipeline_read_warp_div_rd_data,
            warp_div_wr_data_out            => pipeline_read_warp_div_wr_data,
            warp_div_push_en                => pipeline_read_warp_div_push_en,
            warp_div_stack_full             => warp_div_stack_full,
            warp_div_stack_empty            => warp_div_stack_empty,
            
            shmem_addr_out                  => pipeline_read_shmem_addr,
            shmem_wr_en_out                 => pipeline_read_shmem_wr_en,
            shmem_wr_data_out               => pipeline_read_shmem_wr_data,
            shmem_rd_data_in                => pipeline_read_shmem_rd_data,
            
            cmem_addr_out                   => cmem_addr_a,
            cmem_wr_en_out                  => cmem_wr_en_a,
            cmem_wr_data_out                => cmem_wr_data_a,
            cmem_rd_data_in                 => cmem_rd_data_a,
            
            gmem_addr_out                   => gmem_addr_a,
            gmem_wr_en_out                  => gmem_wr_en_a,
            gmem_wr_data_out                => gmem_wr_data_a,
            gmem_rd_data_in                 => gmem_rd_data_a,
            
            lmem_addr_out                   => lmem_addr_a,
            lmem_wr_en_out                  => lmem_wr_en_a,
            lmem_wr_data_out                => lmem_wr_data_a,
            lmem_rd_data_in                 => lmem_rd_data_a,
            
            warp_id_out                     => warp_id_re_reg_d,
            warp_lane_id_out                => warp_lane_id_re_reg_d,
            cta_id_out                      => cta_id_re_reg_d,
            initial_mask_out                => initial_mask_re_reg_d,
            current_mask_out                => current_mask_re_reg_d,
            shmem_base_addr_out             => shmem_base_addr_re_reg_d,
            gprs_size_out                   => gprs_size_re_reg_d,
            gprs_addr_out                   => gprs_base_addr_re_reg_d,
            instruction_mask_out            => instruction_mask_re_reg_d,
            next_pc_out                     => next_pc_re_reg_d,
            
            instr_opcode_type_out           => instr_opcode_type_re_reg_d,
            instr_subop_type_out            => instr_subop_type_re_reg_d,
            alu_opcode_out                  => alu_opcode_re_reg_d,
            flow_opcode_type_out            => flow_opcode_type_re_reg_d,
            mov_opcode_type_out             => mov_opcode_type_re_reg_d,
            instr_marker_type_out           => instr_marker_type_re_reg_d,
            
            set_pred_out                    => set_pred_re_reg_d,
            set_pred_reg_out                => set_pred_reg_re_reg_d,
            write_pred_out                  => write_pred_re_reg_d,
            
            is_full_normal_out              => is_full_normal_re_reg_d,
            is_signed_out                   => is_signed_re_reg_d,
            w32_out                         => w32_re_reg_d,
            f64_out                         => f64_re_reg_d,
            saturate_out                    => saturate_re_reg_d,
            abs_saturate_out                => abs_saturate_re_reg_d,
            cvt_round_out                   => cvt_round_re_reg_d,
            cvt_type_out                    => cvt_type_re_reg_d,
            cvt_neg_out                     => cvt_neg_re_reg_d,
            condition_out                   => condition_re_reg_d,
            addr_hi_out                     => addr_hi_re_reg_d,
            addr_lo_out                     => addr_lo_re_reg_d,
            addr_incr_out                   => addr_incr_re_reg_d,
            mov_size_out                    => mov_size_re_reg_d,               
            mem_type_out                    => mem_type_re_reg_d,
            sm_type_out                     => sm_type_re_reg_d,
            addr_imm_out                    => addr_imm_re_reg_d,
         
            dest_mem_type_out               => dest_mem_type_re_reg_d,
            
            dest_mem_opcode_type_out        => dest_mem_opcode_type_re_reg_d,
            
            src1_neg_out                    => src1_neg_re_reg_d,
            src2_neg_out                    => src2_neg_re_reg_d,
            src3_neg_out                    => src3_neg_re_reg_d,
         
            target_addr_out                 => target_addr_re_reg_d,

            dest_data_type_out              => dest_data_type_re_reg_d,
            
            src1_out                        => src1_re_reg_d,
            
            dest_out                        => dest_re_reg_d,
            
            pred_flags_out                  => pred_flags_re_reg_d,
            temp_vector_register_out        => temp_vector_register_re_reg_d,
            
            -- stats
            stats_reset                     => stats_reset,
            stats_out                       => smp_stats_out(stat_stages(PIPELINE_READ_STATS)),
            
            pipeline_stall_out              => pipeline_read_stall,
            pipeline_reg_ld                 => pipeline_re_reg_ld,
				read_check_out						  => read_check_out_out,
				
				 write_en_noc_ram_in => write_en_noc_ram_i,
	 addr_noc_ram_in => addr_noc_ram_i,
	 data_noc_ram_in => data_noc_ram_i
        );
    
    --
    -- Read / Execute Register
    --
    pReadToExecuteRegister : process(clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (host_reset = '1') then
                pipeline_re_reg_ld_reg                  <= '0';
            else
                pipeline_re_reg_ld_reg                  <= pipeline_re_reg_ld;
                if (pipeline_re_reg_ld = '1') then
                    warp_id_re_reg_q                    <= warp_id_re_reg_d;
                    warp_lane_id_re_reg_q               <= warp_lane_id_re_reg_d;
                    cta_id_re_reg_q                     <= cta_id_re_reg_d;
                    initial_mask_re_reg_q               <= initial_mask_re_reg_d;
                    current_mask_re_reg_q               <= current_mask_re_reg_d;
                    shmem_base_addr_re_reg_q            <= shmem_base_addr_re_reg_d;
                    gprs_size_re_reg_q                  <= gprs_size_re_reg_d;
                    gprs_base_addr_re_reg_q             <= gprs_base_addr_re_reg_d;
                    instruction_mask_re_reg_q           <= instruction_mask_re_reg_d;
                    next_pc_re_reg_q                    <= next_pc_re_reg_d;
                    instr_opcode_type_re_reg_q          <= instr_opcode_type_re_reg_d;
                    instr_subop_type_re_reg_q           <= instr_subop_type_re_reg_d;
                    alu_opcode_re_reg_q                 <= alu_opcode_re_reg_d;
                    flow_opcode_type_re_reg_q           <= flow_opcode_type_re_reg_d;
                    mov_opcode_type_re_reg_q            <= mov_opcode_type_re_reg_d;
                    instr_marker_type_re_reg_q          <= instr_marker_type_re_reg_d;
                    set_pred_re_reg_q                   <= set_pred_re_reg_d;
                    set_pred_reg_re_reg_q               <= set_pred_reg_re_reg_d;
                    write_pred_re_reg_q                 <= write_pred_re_reg_d;
                    is_full_normal_re_reg_q             <= is_full_normal_re_reg_d;
                    is_signed_re_reg_q                  <= is_signed_re_reg_d;
                    w32_re_reg_q                        <= w32_re_reg_d;
                    f64_re_reg_q                        <= f64_re_reg_d;
                    saturate_re_reg_q                   <= saturate_re_reg_d;
                    abs_saturate_re_reg_q               <= abs_saturate_re_reg_d;
                    cvt_round_re_reg_q                  <= cvt_round_re_reg_d;
                    cvt_type_re_reg_q                   <= cvt_type_re_reg_d;
                    cvt_neg_re_reg_q                    <= cvt_neg_re_reg_d;
                    condition_re_reg_q                  <= condition_re_reg_d;
                    addr_hi_re_reg_q                    <= addr_hi_re_reg_d;
                    addr_lo_re_reg_q                    <= addr_lo_re_reg_d;
                    addr_incr_re_reg_q                  <= addr_incr_re_reg_d;
                    mov_size_re_reg_q                   <= mov_size_re_reg_d;           
                    mem_type_re_reg_q                   <= mem_type_re_reg_d;
                    sm_type_re_reg_q                    <= sm_type_re_reg_d;
                    addr_imm_re_reg_q                   <= addr_imm_re_reg_d;
                    dest_mem_type_re_reg_q              <= dest_mem_type_re_reg_d;
                    dest_mem_opcode_type_re_reg_q       <= dest_mem_opcode_type_re_reg_d;
                    src1_neg_re_reg_q                   <= src1_neg_re_reg_d;
                    src2_neg_re_reg_q                   <= src2_neg_re_reg_d;
                    src3_neg_re_reg_q                   <= src3_neg_re_reg_d;
                    target_addr_re_reg_q                <= target_addr_re_reg_d;
                    dest_data_type_re_reg_q             <= dest_data_type_re_reg_d;
                    src1_re_reg_q                       <= src1_re_reg_d;
                    dest_re_reg_q                       <= dest_re_reg_d;
                    pred_flags_re_reg_q                 <= pred_flags_re_reg_d;
                    temp_vector_register_re_reg_q       <= temp_vector_register_re_reg_d;
                end if;
             end if;
        end if;
    end process;
    
    --
    -- Execute Stage
    --
    uPipelineExecute : pipeline_execute
        port map (
            reset                           => host_reset,
            clk_in                          => clk_in,
            
            en                              => pipeline_re_reg_ld_reg,
            pipeline_stall_in               => pipeline_write_stall,
            
            warp_id_in                      => warp_id_re_reg_q,
            warp_lane_id_in                 => warp_lane_id_re_reg_q,
            cta_id_in                       => cta_id_re_reg_q,
            initial_mask_in                 => initial_mask_re_reg_q,
            current_mask_in                 => current_mask_re_reg_q,
            shmem_base_addr_in              => shmem_base_addr_re_reg_q,
            gprs_size_in                    => gprs_size_re_reg_q,
            gprs_base_addr_in               => gprs_base_addr_re_reg_q,
            instr_mask_in                   => instruction_mask_re_reg_q,
            next_pc_in                      => next_pc_re_reg_q,
            
            instr_opcode_type_in            => instr_opcode_type_re_reg_q,
            instr_subop_type_in             => instr_subop_type_re_reg_q,
            alu_opcode_type_in              => alu_opcode_re_reg_q,
            flow_opcode_type_in             => flow_opcode_type_re_reg_q,
            mov_opcode_type_in              => mov_opcode_type_re_reg_q,
            instr_marker_type_in            => instr_marker_type_re_reg_q,
            
            set_pred_in                     => set_pred_re_reg_q,
            set_pred_reg_in                 => set_pred_reg_re_reg_q,
            write_pred_in                   => write_pred_re_reg_q,
            
            is_full_normal_in               => is_full_normal_re_reg_q,
            is_signed_in                    => is_signed_re_reg_q,
            w32_in                          => w32_re_reg_q,
            f64_in                          => f64_re_reg_q,
            saturate_in                     => saturate_re_reg_q,
            abs_saturate_in                 => abs_saturate_re_reg_q,
            cvt_round_in                    => abs_saturate_re_reg_q,
            cvt_type_in                     => cvt_type_re_reg_q,
            cvt_neg_in                      => cvt_neg_re_reg_q,
            set_cond_in                     => condition_re_reg_q,
            addr_hi_in                      => addr_hi_re_reg_q,
            addr_lo_in                      => addr_lo_re_reg_q,
            addr_incr_in                    => addr_incr_re_reg_q,
            mov_size_in                     => mov_size_re_reg_q,              
            mem_type_in                     => mem_type_re_reg_q,
            sm_type_in                      => sm_type_re_reg_q,
            addr_imm_in                     => addr_imm_re_reg_q,
         
            dest_mem_type_in                => dest_mem_type_re_reg_q,
            
            dest_mem_opcode_type_in         => dest_mem_opcode_type_re_reg_q,
            
            src1_neg_in                     => src1_neg_re_reg_q,
            src2_neg_in                     => src2_neg_re_reg_q,
            src3_neg_in                     => src3_neg_re_reg_q,
         
            target_addr_in                  => target_addr_re_reg_q,

            dest_data_type_in               => dest_data_type_re_reg_q,
            
            src1_in                         => src1_re_reg_q,
            
            dest_in                         => dest_re_reg_q,
                        
            pred_flags_in                   => pred_flags_re_reg_q,
            temp_vector_register_in         => temp_vector_register_re_reg_q,
            
            warp_div_req_out                => arb_warp_div_stack_req(1),
            warp_div_ack_out                => arb_warp_div_stack_ack_o(1),
            warp_div_grant_in               => arb_warp_div_stack_grant(1),
            
            warp_div_stack_en_out           => pipeline_exec_warp_div_stack_en,
            warp_div_wr_data_out            => pipeline_exec_warp_div_wr_data,
            warp_div_rd_data_in             => pipeline_exec_warp_div_rd_data,
            warp_div_push_en_out            => pipeline_exec_warp_div_push_en,
            warp_div_stack_full_in          => warp_div_stack_full,
            warp_div_stack_empty_in         => warp_div_stack_empty,
            
            warp_id_out                     => warp_id_ew_reg_d,
            warp_lane_id_out                => warp_lane_id_ew_reg_d,
            cta_id_out                      => cta_id_ew_reg_d,
            initial_mask_out                => initial_mask_ew_reg_d,
            current_mask_out                => current_mask_ew_reg_d,
            shmem_base_addr_out             => shmem_base_addr_ew_reg_d,
            gprs_size_out                   => gprs_size_ew_reg_d,
            gprs_base_addr_out              => gprs_base_addr_ew_reg_d,
            instr_mask_out                  => instr_mask_ew_reg_d,
            use_next_pc_out                 => open,
            next_pc_out                     => next_pc_ew_reg_d,
            warp_state_out                  => warp_state_ew_reg_d,
            
            instr_opcode_type_out           => instr_opcode_type_ew_reg_d,
             
            set_pred_out                    => set_pred_ew_reg_d,
            set_pred_reg_out                => set_pred_reg_ew_reg_d,
            write_pred_out                  => write_pred_ew_reg_d,
            
            addr_hi_out                     => addr_hi_ew_reg_d,
            addr_lo_out                     => addr_lo_ew_reg_d,
            addr_incr_out                   => addr_incr_ew_reg_d,
            mov_size_out                    => mov_size_ew_reg_d,              
            sm_type_out                     => sm_type_ew_reg_d,
            addr_imm_out                    => addr_imm_ew_reg_d,
         
            src1_out                        => src1_ew_reg_d,
            
            dest_mem_type_out               => dest_mem_type_ew_reg_d,
            dest_mem_opcode_type_out        => dest_mem_opcode_type_ew_reg_d,
            dest_data_type_out              => dest_data_type_ew_reg_d,
            dest_out                        => dest_ew_reg_d,
       
            pred_flags_out                  => pred_flags_ew_reg_d,
            temp_vector_register_out        => temp_vector_register_ew_reg_d,
            
            -- stats
            stats_reset                     => stats_reset,
            stats_out                       => smp_stats_out(stat_stages(PIPELINE_EXECUTE_STATS)),
            stats_instructions_out          => smp_stats_out(stat_stages(INSTRUCTION_STATS)),
            
            pipeline_stall_out              => pipeline_execute_stall,
            pipeline_reg_ld                 => pipeline_ew_reg_ld
        );
    
    --
    -- Execute / Write Register
    --
    pExecuteToWriteRegister : process(clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (host_reset = '1') then
                pipeline_ew_reg_ld_reg              <= '0';
            else
                pipeline_ew_reg_ld_reg              <= pipeline_ew_reg_ld;
                if (pipeline_ew_reg_ld = '1') then
                    warp_id_ew_reg_q                <= warp_id_ew_reg_d;
                    warp_lane_id_ew_reg_q           <= warp_lane_id_ew_reg_d;
                    cta_id_ew_reg_q                 <= cta_id_ew_reg_d;
                    initial_mask_ew_reg_q           <= initial_mask_ew_reg_d;
                    current_mask_ew_reg_q           <= current_mask_ew_reg_d;
                    shmem_base_addr_ew_reg_q        <= shmem_base_addr_ew_reg_d;
                    gprs_size_ew_reg_q              <= gprs_size_ew_reg_d;
                    gprs_base_addr_ew_reg_q         <= gprs_base_addr_ew_reg_d;
                    instr_mask_ew_reg_q             <= instr_mask_ew_reg_d;
                    next_pc_ew_reg_q                <= next_pc_ew_reg_d;
                    warp_state_ew_reg_q             <= warp_state_ew_reg_d;
                    instr_opcode_type_ew_reg_q      <= instr_opcode_type_ew_reg_d;
                    set_pred_ew_reg_q               <= set_pred_ew_reg_d;
                    set_pred_reg_ew_reg_q           <= set_pred_reg_ew_reg_d;
                    write_pred_ew_reg_q             <= write_pred_ew_reg_d;
                    addr_hi_ew_reg_q                <= addr_hi_ew_reg_d;
                    addr_lo_ew_reg_q                <= addr_lo_ew_reg_d;
                    addr_incr_ew_reg_q              <= addr_incr_ew_reg_d;
                    mov_size_ew_reg_q               <= mov_size_ew_reg_d;
                    sm_type_ew_reg_q                <= sm_type_ew_reg_d;
                    addr_imm_ew_reg_q               <= addr_imm_ew_reg_d;
                    dest_mem_type_ew_reg_q          <= dest_mem_type_ew_reg_d;
                    dest_mem_opcode_type_ew_reg_q   <= dest_mem_opcode_type_ew_reg_d;
                    dest_data_type_ew_reg_q         <= dest_data_type_ew_reg_d;
                    src1_ew_reg_q                   <= src1_ew_reg_d;
                    dest_ew_reg_q                   <= dest_ew_reg_d;
                    pred_flags_ew_reg_q             <= pred_flags_ew_reg_d;
                    temp_vector_register_ew_reg_q   <= temp_vector_register_ew_reg_d;
                end if;
            end if;
        end if;
    end process;
    
    --
    -- Write Stage
    --
    uPipelineWrite : pipeline_write
        generic map (
            CORE_ID                         => STREAMING_MULTIPROCESSOR_ID,
            SHMEM_ADDR_SIZE                 => SHMEM_ADDR_SIZE,
            CMEM_ADDR_SIZE                  => CMEM_ADDR_SIZE,
            LMEM_ADDR_SIZE                  => LMEM_ADDR_SIZE,
            GMEM_ADDR_SIZE                  => GMEM_ADDR_SIZE
        )
        port map (
            reset                           => host_reset,
            clk_in                          => clk_in,
         
            en                              => pipeline_ew_reg_ld_reg,
            pipeline_stall_in               => pipeline_warp_stall,
            
            num_warps_in                    => num_warps,
            
            warp_id_in                      => warp_id_ew_reg_q,
            warp_lane_id_in                 => warp_lane_id_ew_reg_q,
            cta_id_in                       => cta_id_ew_reg_q,
            initial_mask_in                 => initial_mask_ew_reg_q,
            current_mask_in                 => current_mask_ew_reg_q,
            shmem_base_addr_in              => shmem_base_addr_ew_reg_q,
            gprs_size_in                    => gprs_size_ew_reg_q,                 
            gprs_base_addr_in               => gprs_base_addr_ew_reg_q,
            next_pc_in                      => next_pc_ew_reg_q,
            warp_state_in                   => warp_state_ew_reg_q,
            
            instr_opcode_type_in            => instr_opcode_type_ew_reg_q,
            
            temp_vector_register_in         => temp_vector_register_ew_reg_q,
            dest_in                         => dest_ew_reg_q,
            instruction_mask_in             => instr_mask_ew_reg_q,
            instruction_flags_in            => pred_flags_ew_reg_q,
            dest_data_type_in               => dest_data_type_ew_reg_q,
            dest_mem_type_in                => dest_mem_type_ew_reg_q,
            dest_mem_opcode_type_in         => dest_mem_opcode_type_ew_reg_q,
            
            addr_hi_in                      => addr_hi_ew_reg_q,
            addr_lo_in                      => addr_lo_ew_reg_q,
            addr_imm_in                     => addr_imm_ew_reg_q,
            addr_inc_in                     => addr_incr_ew_reg_q,
            mov_size_in                     => mov_size_ew_reg_q,
            write_pred_in                   => write_pred_ew_reg_q,
            set_pred_in                     => set_pred_ew_reg_q,
            set_pred_reg_in                 => set_pred_reg_ew_reg_q,
            sm_type_in					    => sm_type_ew_reg_q,
            
            src1_in                         => src1_ew_reg_q,
            
            gprs_base_addr_out              => gprs_addr_b,
            gprs_reg_num_out                => gprs_reg_num_b,
            gprs_lane_id_out                => gprs_lane_id_b,
            gprs_wr_en_out                  => gprs_wr_en_b,
            gprs_wr_data_out                => gprs_wr_data_b,
            gprs_rd_data_in                 => gprs_rd_data_b,
            
            pred_regs_warp_id_out           => pred_regs_warp_id_b,
            pred_regs_warp_lane_id_out      => pred_regs_warp_lane_id_b,
            pred_regs_reg_num_out           => pred_regs_addr_b,
            pred_regs_wr_en_out             => pred_regs_wr_en_b,
            pred_regs_wr_data_out           => pred_regs_wr_data_b,
            pred_regs_rd_data_in            => pred_regs_rd_data_b,
            
            addr_regs_warp_id_out           => addr_regs_warp_id_b,
            addr_regs_warp_lane_id_out      => addr_regs_warp_lane_id_b,
            addr_regs_reg_num_out           => addr_regs_addr_b,
            addr_regs_wr_en_out             => addr_regs_wr_en_b,
            addr_regs_wr_data_out           => addr_regs_wr_data_b,
            addr_regs_rd_data_in            => addr_regs_rd_data_b,
            
            shmem_addr_out                  => shmem_addr_b,
            shmem_wr_en_out                 => shmem_wr_en_b,
            shmem_wr_data_out               => shmem_wr_data_b,
            shmem_rd_data_in                => shmem_rd_data_b,
            
            cmem_addr_out                   => cmem_addr_b,
            cmem_wr_en_out                  => cmem_wr_en_b,
            cmem_wr_data_out                => cmem_wr_data_b,
            cmem_rd_data_in                 => cmem_rd_data_b,
            
            gmem_addr_out                   => gmem_addr_b,
            gmem_wr_en_out                  => gmem_wr_en_b,
            gmem_wr_data_out                => gmem_wr_data_b,
            gmem_rd_data_in                 => gmem_rd_data_b,
            
            lmem_addr_out                   => lmem_addr_b,
            lmem_wr_en_out                  => lmem_wr_en_b,
            lmem_wr_data_out                => lmem_wr_data_b,
            lmem_rd_data_in                 => lmem_rd_data_b,
            
            warp_id_out                     => warp_id_ww_reg_d,
            warp_lane_id_out                => warp_lane_id_ww_reg_d,
            cta_id_out                      => cta_id_ww_reg_d,
            initial_mask_out                => initial_mask_ww_reg_d,
            current_mask_out                => current_mask_ww_reg_d,
            shmem_base_addr_out             => shmem_base_addr_ww_reg_d,
            gprs_addr_out                   => gprs_base_addr_ww_reg_d,
            next_pc_out                     => next_pc_ww_reg_d,
            warp_state_out                  => warp_state_ww_reg_d,
            
            -- stats
            stats_reset                     => stats_reset,
            stats_out                       => smp_stats_out(stat_stages(PIPELINE_WRITE_STATS)),
            
            pipeline_stall_out              => pipeline_write_stall,
            pipeline_reg_ld                 => pipeline_ww_reg_ld,
				check_dest_reg						  => check_dest_reg_out,
				
				rd_en_fifo_in => rd_en_fifo_i,
				valid_fifo_out => valid_fifo_i,
				dout_fifo_out => dout_fifo_i,
				not_empty_out => not_empty_i
        );
    
    --
    -- Write / Warp Register
    --
    pWriteToWarpRegister : process(clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (host_reset = '1') then
                pipeline_ww_reg_ld_reg              <= '0';
            else
                pipeline_ww_reg_ld_reg              <= pipeline_ww_reg_ld;
                if (pipeline_ww_reg_ld = '1') then
                    warp_id_ww_reg_q                <= warp_id_ww_reg_d;  
                    warp_lane_id_ww_reg_q           <= warp_lane_id_ww_reg_d;
                    cta_id_ww_reg_q                 <= cta_id_ww_reg_d; 
                    initial_mask_ww_reg_q           <= initial_mask_ww_reg_d; 
                    current_mask_ww_reg_q           <= current_mask_ww_reg_d;
                    shmem_base_addr_ww_reg_q        <= shmem_base_addr_ww_reg_d;
                    gprs_base_addr_ww_reg_q         <= gprs_base_addr_ww_reg_d;
                    next_pc_ww_reg_q                <= next_pc_ww_reg_d; 
                    warp_state_ww_reg_q             <= warp_state_ww_reg_d; 
                end if;
            end if;
        end if;
    end process;
    
    --
    -- Vector Register File
    --
    
    gprs_lane_id_a <=
        smp_controller_gprs_lane_id when (smp_configuration_en = '1') else
        pipeline_read_gprs_lane_id;
    
    gprs_addr_a <=
        smp_controller_gprs_addr when (smp_configuration_en = '1') else
        pipeline_read_gprs_addr;
    
    gprs_reg_num_a <=
        smp_controller_gprs_reg_num when (smp_configuration_en = '1') else
        pipeline_read_gprs_reg_num;
    
    gprs_wr_en_a <=
        smp_controller_gprs_wr_en when (smp_configuration_en = '1') else
        pipeline_read_gprs_wr_en;
    
    gprs_wr_data_a <=
        smp_controller_gprs_wr_data when (smp_configuration_en = '1') else
        pipeline_read_gprs_wr_data;
        
    smp_controller_gprs_rd_data        <= gprs_rd_data_a when (smp_configuration_en = '1') else (others => (others => '0'));
    pipeline_read_gprs_rd_data         <= gprs_rd_data_a when (smp_configuration_en = '0') else (others => (others => '0'));
    
    --
    -- Vector Register File
    --
    gRegisterFile : for i in 0 to CORES-1 generate
	 
        gRegisterFile8 : if (CORES = 8) generate
            uRegisterFile8 : vector_register_file_8
                port map (
                    ce_1                        => '1',
                    clk_1                       => clk_in,
                    warp_lane_id_a              => gprs_lane_id_a(i),
                    base_addr_a                 => gprs_addr_a(i),
                    reg_num_a                   => gprs_reg_num_a(i),
                    we_a                        => gprs_wr_en_a(i),
                    din_a                       => gprs_wr_data_a(i),
                    dout_a                      => gprs_rd_data_a(i),
                    warp_lane_id_b              => gprs_lane_id_b(i),
                    base_addr_b                 => gprs_addr_b(i),
                    reg_num_b                   => gprs_reg_num_b(i),
                    we_b                        => gprs_wr_en_b(i),
                    din_b                       => gprs_wr_data_b(i),
                    dout_b                      => gprs_rd_data_b(i)  
                );
        end generate gRegisterFile8;
		
		gRegisterFile16 : if (CORES = 16) generate
            uRegisterFile16 : vector_register_file_16
                port map (
                    ce_1                        => '1',
                    clk_1                       => clk_in,
                    warp_lane_id_a              => gprs_lane_id_a(i)(0),
                    base_addr_a                 => gprs_addr_a(i),
                    reg_num_a                   => gprs_reg_num_a(i),
                    we_a                        => gprs_wr_en_a(i),
                    din_a                       => gprs_wr_data_a(i),
                    dout_a                      => gprs_rd_data_a(i),
                    warp_lane_id_b              => gprs_lane_id_b(i)(0),
                    base_addr_b                 => gprs_addr_b(i),
                    reg_num_b                   => gprs_reg_num_b(i),
                    we_b                        => gprs_wr_en_b(i),
                    din_b                       => gprs_wr_data_b(i),
                    dout_b                      => gprs_rd_data_b(i)  
                );
        end generate gRegisterFile16;
   
        gRegisterFile32: if (CORES = 32) generate
            uRegisterFile32 : vector_register_file_32
                port map (
                    ce_1                        => '1',
                    clk_1                       => clk_in,
                    base_addr_a                 => gprs_addr_a(i),
                    reg_num_a                   => gprs_reg_num_a(i),
                    we_a                        => gprs_wr_en_a(i),
                    din_a                       => gprs_wr_data_a(i),
                    dout_a                      => gprs_rd_data_a(i),
                    base_addr_b                 => gprs_addr_b(i),
                    reg_num_b                   => gprs_reg_num_b(i),
                    we_b                        => gprs_wr_en_b(i),
                    din_b                       => gprs_wr_data_b(i),
                    dout_b                      => gprs_rd_data_b(i)  
                );
        end generate gRegisterFile32;
        
	end generate gRegisterFile;

	host_reset_n            <= not host_reset;	

    --
    -- Warp Stack Arbiter
    --
    uWarpDivergenceStackArbiter : arbiter
        generic map ( 
            CNT                             => ARB_WARP_DIV_STACK_CNT
        )
        port map (
            clk                             => clk_in,
            rst_n                           => host_reset_n,
    
            req                             => arb_warp_div_stack_req,
            ack                             => arb_warp_div_stack_ack,
            grant                           => arb_warp_div_stack_grant
        );
    
    arb_warp_div_stack_ack  <= arb_warp_div_stack_ack_o(0) or arb_warp_div_stack_ack_o(1);
    
    --
    -- Warp Stack
    --
    gWarpDivergenceStack : for i in 0 to MAX_WARPS-1 generate
        uWarpDivergenceStack : stack
            generic map (
                STACK_DEPTH                 => STACK_DEPTH,
                DATA_WIDTH                  => STACK_DATA_WIDTH
            )
            port map (
                clk_in                      => clk_in,
                reset                       => host_reset,
                stack_en                    => warp_div_stack_en(i),
                data_in                     => warp_div_data_i(i),
                data_out                    => warp_div_data_o(i),
                push_en                     => warp_div_push_en(i),
                stack_full                  => warp_div_stack_full(i),
                stack_empty                 => warp_div_stack_empty(i)
            );
    end generate;
    
    warp_div_stack_en   <=
        pipeline_read_warp_div_stack_en  when (arb_warp_div_stack_grant(0) = '1') else
        pipeline_exec_warp_div_stack_en  when (arb_warp_div_stack_grant(1) = '1') else
        (others => '0');
    
    warp_div_data_i     <=
        pipeline_exec_warp_div_wr_data  when (arb_warp_div_stack_grant(0) = '1') else
        pipeline_exec_warp_div_wr_data  when (arb_warp_div_stack_grant(1) = '1') else
        (others => (others => '0'));
    
    pipeline_read_warp_div_rd_data      <= warp_div_data_o when (arb_warp_div_stack_grant(0) = '1') else (others => (others => '0'));    
    pipeline_exec_warp_div_rd_data      <= warp_div_data_o when (arb_warp_div_stack_grant(1) = '1') else (others => (others => '0'));
    
    warp_div_push_en    <=
        pipeline_exec_warp_div_push_en  when (arb_warp_div_stack_grant(0) = '1') else
        pipeline_exec_warp_div_push_en  when (arb_warp_div_stack_grant(1) = '1') else
        (others => '0');
    
    --
    -- Address Registers
    --
    gAddressRegisters : for i in 0 to CORES-1 generate
		
        gAddressRegisters8 : if (CORES = 8) generate 
            uAddressRegisters8 : address_registers_8
                port map (
                    ce_1                        => '1',
                    clk_1                       => clk_in,
                    warp_id_a                   => addr_regs_warp_id_a(i),
                    warp_lane_id_a              => addr_regs_warp_lane_id_a(i),
                    reg_addr_a                  => addr_regs_addr_a(i),
                    wr_en_a                     => addr_regs_wr_en_a(i),
                    din_a                       => addr_regs_wr_data_a(i),
                    dout_a                      => addr_regs_rd_data_a(i),
                    warp_id_b                   => addr_regs_warp_id_b(i),
                    warp_lane_id_b              => addr_regs_warp_lane_id_b(i),
                    reg_addr_b                  => addr_regs_addr_b(i),
                    wr_en_b                     => addr_regs_wr_en_b(i),
                    din_b                       => addr_regs_wr_data_b(i),
                    dout_b                      => addr_regs_rd_data_b(i)
                );
        end generate gAddressRegisters8;

		gAddressRegisters16 : if (CORES = 16) generate 
            uAddressRegisters16 : address_registers_16
                port map (
                    ce_1                        => '1',
                    clk_1                       => clk_in,
                    warp_id_a                   => addr_regs_warp_id_a(i),
                    warp_lane_id_a              => addr_regs_warp_lane_id_a(i)(0),
                    reg_addr_a                  => addr_regs_addr_a(i),
                    wr_en_a                     => addr_regs_wr_en_a(i),
                    din_a                       => addr_regs_wr_data_a(i),
                    dout_a                      => addr_regs_rd_data_a(i),
                    warp_id_b                   => addr_regs_warp_id_b(i),
                    warp_lane_id_b              => addr_regs_warp_lane_id_b(i)(0),
                    reg_addr_b                  => addr_regs_addr_b(i),
                    wr_en_b                     => addr_regs_wr_en_b(i),
                    din_b                       => addr_regs_wr_data_b(i),
                    dout_b                      => addr_regs_rd_data_b(i)
                );
        end generate gAddressRegisters16;

		gAddressRegisters32 : if (CORES = 32) generate 
            uAddressRegisters32 : address_registers_32
                port map (
                    ce_1                        => '1',
                    clk_1                       => clk_in,
                    warp_id_a                   => addr_regs_warp_id_a(i),
                    reg_addr_a                  => addr_regs_addr_a(i),
                    wr_en_a                     => addr_regs_wr_en_a(i),
                    din_a                       => addr_regs_wr_data_a(i),
                    dout_a                      => addr_regs_rd_data_a(i),
                    warp_id_b                   => addr_regs_warp_id_b(i),
                    reg_addr_b                  => addr_regs_addr_b(i),
                    wr_en_b                     => addr_regs_wr_en_b(i),
                    din_b                       => addr_regs_wr_data_b(i),
                    dout_b                      => addr_regs_rd_data_b(i)
                );
        end generate gAddressRegisters32;
	
    end generate gAddressRegisters;
    
    --
    -- Predicate Registers
    --
    gPredicateRegisters : for i in 0 to CORES-1 generate
	 
        gPredicateRegisters8 : if (CORES = 8) generate
            uPredicateRegisters8 : predicate_registers_8
                port map (
                    ce_1                        => '1',
                    clk_1                       => clk_in,
                    warp_id_a                   => pred_regs_warp_id_a(i),
                    warp_lane_id_a              => pred_regs_warp_lane_id_a(i),
                    reg_addr_a                  => pred_regs_addr_a(i),
                    wr_en_a                     => pred_regs_wr_en_a(i),
                    din_a                       => pred_regs_wr_data_a(i),
                    dout_a                      => pred_regs_rd_data_a(i),
                    warp_id_b                   => pred_regs_warp_id_b(i),
                    warp_lane_id_b              => pred_regs_warp_lane_id_b(i),
                    reg_addr_b                  => pred_regs_addr_b(i),
                    wr_en_b                     => pred_regs_wr_en_b(i),
                    din_b                       => pred_regs_wr_data_b(i),
                    dout_b                      => pred_regs_rd_data_b(i)
                );
        end generate gPredicateRegisters8;

        gPredicateRegisters16 : if (CORES = 16) generate
            uPredicateRegisters16 : predicate_registers_16
                port map (
                    ce_1                        => '1',
                    clk_1                       => clk_in,
                    warp_id_a                   => pred_regs_warp_id_a(i),
                    warp_lane_id_a              => pred_regs_warp_lane_id_a(i)(0),
                    reg_addr_a                  => pred_regs_addr_a(i),
                    wr_en_a                     => pred_regs_wr_en_a(i),
                    din_a                       => pred_regs_wr_data_a(i),
                    dout_a                      => pred_regs_rd_data_a(i),
                    warp_id_b                   => pred_regs_warp_id_b(i),
                    warp_lane_id_b              => pred_regs_warp_lane_id_b(i)(0),
                    reg_addr_b                  => pred_regs_addr_b(i),
                    wr_en_b                     => pred_regs_wr_en_b(i),
                    din_b                       => pred_regs_wr_data_b(i),
                    dout_b                      => pred_regs_rd_data_b(i)
                );
        end generate gPredicateRegisters16;
    
        gPredicateRegisters32 : if (CORES = 32) generate
            uPredicateRegisters32 : predicate_registers_32
                port map (
                    ce_1                        => '1',
                    clk_1                       => clk_in,
                    warp_id_a                   => pred_regs_warp_id_a(i),
                    reg_addr_a                  => pred_regs_addr_a(i),
                    wr_en_a                     => pred_regs_wr_en_a(i),
                    din_a                       => pred_regs_wr_data_a(i),
                    dout_a                      => pred_regs_rd_data_a(i),
                    warp_id_b                   => pred_regs_warp_id_b(i),
                    reg_addr_b                  => pred_regs_addr_b(i),
                    wr_en_b                     => pred_regs_wr_en_b(i),
                    din_b                       => pred_regs_wr_data_b(i),
                    dout_b                      => pred_regs_rd_data_b(i)
                );
        end generate gPredicateRegisters32;
	 
    end generate gPredicateRegisters;

    --
    -- Shared Memory
    --

    shmem_addr_a <=
        smp_controller_shmem_addr when (smp_configuration_en = '1') else
        pipeline_read_shmem_addr;
    
    shmem_wr_en_a <=
        smp_controller_shmem_wr_en when (smp_configuration_en = '1') else
        pipeline_read_shmem_wr_en;
    
    shmem_wr_data_a <=
        smp_controller_shmem_wr_data when (smp_configuration_en = '1') else
        pipeline_read_shmem_wr_data;
    
    smp_controller_shmem_rd_data        <= shmem_rd_data_a when (smp_configuration_en = '1') else (others => '0');
    pipeline_read_shmem_rd_data         <= shmem_rd_data_a when (smp_configuration_en = '0') else (others => '0');
        
    uSharedMemory : ram_8x16384
		port map (
			clka                            => clk_in,
            addra                           => shmem_addr_a,
			wea                             => shmem_wr_en_a,
			dina                            => shmem_wr_data_a,
			douta                           => shmem_rd_data_a,
			clkb                            => clk_in,
            addrb                           => shmem_addr_b,
			web                             => shmem_wr_en_b,
			dinb                            => shmem_wr_data_b,
			doutb                           => shmem_rd_data_b
        );

--    --
--    -- Local Memory
--    --
--    uLocalMemory : ram_8x65536
--		port map (
--			clka                            => clk_in,
--          addra                           => lmem_addr_a,
--			wea                             => lmem_wr_en_a,
--			dina                            => lmem_wr_data_a,
--			douta                           => lmem_rd_data_a,
--			clkb                            => clk_in,
--          addrb                           => lmem_addr_b,
--			web                             => lmem_wr_en_b,
--			dinb                            => lmem_wr_data_b,
--			doutb                           => lmem_rd_data_b
--        );

end arch;

