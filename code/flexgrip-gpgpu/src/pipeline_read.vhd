----------------------------------------------------------------------------------
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
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.gpgpu_package.all;

    entity pipeline_read is
        generic (
            CORE_ID                     : std_logic_vector(7 downto 0) := x"00";
            SHMEM_ADDR_SIZE             : integer := 14;
            CMEM_ADDR_SIZE              : integer := 18;
            LMEM_ADDR_SIZE              : integer := 16;
            GMEM_ADDR_SIZE              : integer := 18
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
				read_check_out						: out std_logic_vector(9 downto 0);
				
				write_en_noc_ram_in : in std_logic_vector(0 downto 0);
				addr_noc_ram_in : in std_logic_vector(2 downto 0);
				data_noc_ram_in : in std_logic_vector(31 downto 0)
        );
    end pipeline_read;

architecture arch of pipeline_read is
    
    component read_source_ops
        generic (
            SRC_NUM                             : integer range 1 to 3 := 1
        );
        port (
            reset                               : in  std_logic;
            clk_in                              : in  std_logic;
            
            en                                  : in  std_logic;
            
            instr_opcode_type_in                : in  instr_opcode_type;
            alu_opcode_in               		: in  alu_opcode_type;
            instr_marker_type_in                : in  instr_marker_type;
            
            addr_in                             : in  std_logic_vector(31 downto 0);
            mask_in                             : in  std_logic_vector(CORES-1 downto 0);
            addr_reg_in                         : in  std_logic_vector(2 downto 0);
            addr_imm_in                         : in  std_logic;
            pred_reg_in                         : in  std_logic_vector(1 downto 0);
            mov_size_in                         : in  std_logic_vector(2 downto 0);
            sm_type_in                          : in  std_logic_vector(1 downto 0);
            mem_type_in                         : in  std_logic_vector(2 downto 0);
            const_segment_in                    : in  std_logic_vector(6 downto 0);
            imm_hi_in                           : in  std_logic_vector(25 downto 0);
            
            src_mem_type_in                     : in  mem_type;
            src_data_type_in                    : in  data_type;
            src_mem_opcode_type_in              : in  mem_opcode_type;
            dest_mem_type_in            		: in  mem_type;
            
            gprs_req_out                        : out std_logic;
            gprs_ack_out                        : out std_logic;
            gprs_grant_in                       : in  std_logic;
            
            addr_regs_req_out                   : out std_logic;
            addr_regs_ack_out                   : out std_logic;
            addr_regs_grant_in                  : in  std_logic;
            
            pred_regs_req_out                   : out std_logic;
            pred_regs_ack_out                   : out std_logic;
            pred_regs_grant_in                  : in  std_logic;
            
            shmem_req_out                       : out std_logic;
            shmem_ack_out                       : out std_logic;
            shmem_grant_in                      : in  std_logic;
            
            cmem_req_out                        : out std_logic;
            cmem_ack_out                        : out std_logic;
            cmem_grant_in                       : in  std_logic;
            
            gmem_req_out                        : out std_logic;
            gmem_ack_out                        : out std_logic;
            gmem_grant_in                       : in  std_logic;
            
            lmem_req_out                        : out std_logic;
            lmem_ack_out                        : out std_logic;
            lmem_grant_in                       : in  std_logic;
            
            effaddr_gprs_req_out                : out std_logic;
            effaddr_gprs_ack_out                : out std_logic;
            effaddr_gprs_grant_in               : in  std_logic;
            
            effaddr_addr_regs_req_out           : out std_logic;
            effaddr_addr_regs_ack_out           : out std_logic;
            effaddr_addr_regs_grant_in          : in  std_logic;
            
            gprs_en_out                         : out std_logic;
            gprs_reg_num_out                    : out std_logic_vector(8 downto 0);
            gprs_rd_wr_en_out                   : out std_logic;
            gprs_wr_data_out                    : out vector_word_register_array;
            gprs_data_type_out                  : out data_type;
            gprs_mask_out                       : out std_logic_vector(CORES-1 downto 0);
            gprs_rd_data_in                     : in  vector_word_register_array;
            gprs_rdy_in                         : in  std_logic;
            
            addr_regs_en_out                    : out std_logic;
            addr_regs_reg_num_out               : out std_logic_vector(1 downto 0);
            addr_regs_rd_wr_en_out              : out std_logic;
            addr_regs_wr_data_out               : out vector_register;
            addr_regs_rd_data_in                : in  vector_register;
            addr_regs_rdy_in                    : in  std_logic;
            
            pred_regs_en_out                    : out std_logic;
            pred_regs_reg_num_out               : out std_logic_vector(1 downto 0);
            pred_regs_rd_wr_en_out              : out std_logic;
            pred_regs_wr_data_out               : out vector_flag_register;
            pred_regs_rd_data_in                : in  vector_flag_register;
            pred_regs_rdy_in                    : in  std_logic;
            
            shmem_en_out                        : out std_logic;
            shmem_addr_out                      : out std_logic_vector(31 downto 0);
            shmem_rd_wr_type_out                : out mem_opcode_type;
            shmem_sm_type_out                   : out sm_type;
            shmem_mask_out                      : out std_logic_vector(CORES-1 downto 0);
            shmem_rd_data_in			        : in  vector_word_register_array;
            shmem_rdy_in                        : in  std_logic;
            
            cmem_en_out                         : out std_logic;
            cmem_addr_out                       : out std_logic_vector(31 downto 0);
            cmem_rd_wr_type_out                 : out mem_opcode_type;
            cmem_sm_type_out                    : out sm_type;
            cmem_segment_out                    : out std_logic_vector(6 downto 0);
            cmem_mask_out                       : out std_logic_vector(CORES-1 downto 0);
            cmem_rd_data_in			            : in  vector_word_register_array;
            cmem_rdy_in                         : in  std_logic;
            
            gmem_en_out                         : out std_logic;
            gmem_addr_out                       : out std_logic_vector(31 downto 0);
            gmem_rd_wr_type_out                 : out mem_opcode_type;
            gmem_data_type_out                  : out data_type;
            gmem_mask_out                       : out std_logic_vector(CORES-1 downto 0);
            gmem_rd_data_in			            : in  vector_word_register_array;
            gmem_rdy_in                         : in  std_logic;
            
            lmem_en_out                         : out std_logic;
            lmem_addr_out                       : out std_logic_vector(31 downto 0);
            lmem_rd_wr_type_out                 : out mem_opcode_type;
            lmem_data_type_out                  : out data_type;
            lmem_mask_out                       : out std_logic_vector(CORES-1 downto 0);
            lmem_rd_data_in			            : in  vector_word_register_array;
            lmem_rdy_in                         : in  std_logic;
            
            effaddr_gprs_en_out                 : out std_logic;
            effaddr_gprs_reg_num_out            : out std_logic_vector(8 downto 0);
            effaddr_gprs_data_type_out          : out data_type;
            effaddr_gprs_mask_out               : out std_logic_vector(CORES-1 downto 0);
            effaddr_gprs_rd_wr_en_out           : out std_logic;
            effaddr_gprs_rd_data_in             : in  vector_word_register_array;
            effaddr_gprs_rdy_in                 : in  std_logic;
            
            effaddr_addr_regs_en_out            : out std_logic;
            effaddr_addr_regs_reg_out           : out std_logic_vector(1 downto 0);
            effaddr_addr_regs_mask_out          : out std_logic_vector(CORES-1 downto 0);
            effaddr_addr_regs_rd_wr_en_out      : out std_logic;
            effaddr_addr_regs_rd_data_in        : in  vector_register;
            effaddr_addr_regs_rdy_in            : in  std_logic;
            
            data_out                            : out vector_word_register_array;
            rdy_out                             : out std_logic
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
    
    component vector_register_controller
        port (
            reset                   : in  std_logic;
            clk_in                  : in  std_logic;
            en                      : in  std_logic;
            
            lane_id_in              : in  std_logic_vector(1 downto 0); 
            base_addr_in            : in  std_logic_vector(8 downto 0);
            reg_num_in              : in  std_logic_vector(8 downto 0);
            data_in                 : in  vector_word_register_array;
            data_type_in            : in  data_type;
            mask_in                 : in  std_logic_vector(CORES-1 downto 0);
            rd_wr_en_in             : in  std_logic;
            
            gprs_base_addr_out      : out gprs_addr_array; 
            gprs_reg_num_out        : out gprs_reg_array;
            gprs_lane_id_out        : out warp_lane_id_array; 
            gprs_wr_en_out          : out wr_en_array;
            gprs_wr_data_out        : out vector_register;
            gprs_rd_data_in         : in  vector_register;
            
            data_out                : out vector_word_register_array;
            
            rdy_out                 : out std_logic
        );
    end component;
    
    component predicate_register_controller
        port (
            reset                       : in  std_logic;
            clk_in                      : in  std_logic;
            
            en                          : in  std_logic;
            
            warp_id_in                  : in  std_logic_vector(4 downto 0); 
            lane_id_in                  : in  std_logic_vector(1 downto 0); 
            reg_num_in                  : in  std_logic_vector(1 downto 0);
            data_in                     : in  vector_flag_register;
			mask_in                     : in  std_logic_vector(CORES-1 downto 0);
            rd_wr_en_in                 : in  std_logic;
            
            pred_regs_warp_id_out       : out warp_id_array; 
            pred_regs_warp_lane_id_out  : out warp_lane_id_array;
            pred_regs_reg_num_out       : out reg_num_array;
            pred_regs_wr_en_out         : out wr_en_array;
            pred_regs_wr_data_out       : out vector_flag_register;
            pred_regs_rd_data_in        : in  vector_flag_register;
            
            data_out                    : out vector_flag_register;
            
            rdy_out                     : out std_logic
        );
    end component;
    
    component address_register_controller
        port (
            reset                       : in  std_logic;
            clk_in                      : in  std_logic;
            
            en                          : in  std_logic;
            
            warp_id_in                  : in  std_logic_vector(4 downto 0); 
            lane_id_in                  : in  std_logic_vector(1 downto 0); 
            reg_num_in                  : in  std_logic_vector(1 downto 0);
            data_in                     : in  vector_register;
			mask_in                     : in  std_logic_vector(CORES-1 downto 0);
            rd_wr_en_in                 : in  std_logic;
            
            addr_regs_warp_id_out       : out warp_id_array; 
            addr_regs_warp_lane_id_out  : out warp_lane_id_array;
            addr_regs_reg_num_out       : out reg_num_array;
            addr_regs_wr_en_out         : out wr_en_array;
            addr_regs_wr_data_out       : out vector_register;
            addr_regs_rd_data_in        : in  vector_register;
            
            data_out                    : out vector_register;
            
            rdy_out                     : out std_logic
        );
    end component;
    
    component shared_memory_controller
		generic (
            ADDRESS_SIZE                : integer := 32;
            ARB_GPRS_EN                 : std_logic := '0';
            ARB_ADDR_REGS_EN            : std_logic := '0'
        );
		port (
			reset                       : in  std_logic;
			clk_in                      : in  std_logic;
			en						    : in  std_logic;
            
            data_in                     : in  vector_word_register_array;
            base_addr_in                : in  std_logic_vector(ADDRESS_SIZE-1 downto 0);
			addr_in						: in  std_logic_vector(31 downto 0);
			mask_in                     : in  std_logic_vector(CORES-1 downto 0);
            rd_wr_type_in               : in  mem_opcode_type;
            sm_type_in					: in  sm_type;
            
			addr_lo_in					: in  std_logic_vector(1 downto 0);
			addr_hi_in					: in  std_logic;
			addr_imm_in					: in  std_logic;
			
            gprs_req_out                : out std_logic;
            gprs_ack_out                : out std_logic;
            gprs_grant_in               : in  std_logic;
            
            gprs_en_out                 : out std_logic;
            gprs_reg_num_out            : out std_logic_vector(8 downto 0);
            gprs_data_type_out          : out data_type;
            gprs_mask_out               : out std_logic_vector(CORES-1 downto 0);
            gprs_rd_wr_en_out           : out std_logic;
            gprs_rd_data_in             : in  vector_word_register_array;
            gprs_rdy_in                 : in  std_logic;
            
            addr_regs_req_out           : out std_logic;
            addr_regs_ack_out           : out std_logic;
            addr_regs_grant_in          : in  std_logic;
            
            addr_regs_en_out            : out std_logic;
            addr_regs_reg_out           : out std_logic_vector(1 downto 0);
            addr_regs_mask_out          : out std_logic_vector(CORES-1 downto 0);
            addr_regs_rd_wr_en_out      : out std_logic;
            addr_regs_rd_data_in        : in  vector_register;
            addr_regs_rdy_in            : in  std_logic;
            
            shmem_addr_out              : out std_logic_vector(ADDRESS_SIZE-1 downto 0);
            shmem_wr_en_out             : out std_logic_vector(0 downto 0);
            shmem_wr_data_out           : out std_logic_vector(7 downto 0);
            shmem_rd_data_in            : in  std_logic_vector(7 downto 0);
            
			data_out			        : out vector_word_register_array;
			rdy_out		                : out std_logic
		);
	end component;
    
    component constant_memory_controller
		generic (
            ADDRESS_SIZE                : integer := 32;
            ARB_GPRS_EN                 : std_logic := '0';
            ARB_ADDR_REGS_EN            : std_logic := '0'
        );
		port (
			reset                       : in  std_logic;
			clk_in                      : in  std_logic;
			en						    : in  std_logic;
            
            data_in                     : in  vector_word_register_array;
            addr_in                     : in  vector_register;
			mask_in                     : in  std_logic_vector(CORES-1 downto 0);
            rd_wr_type_in               : in  mem_opcode_type;
            sm_type_in					: in  sm_type;
            
            segment_in                  : in  std_logic_vector(6 downto 0);
			addr_lo_in					: in  std_logic_vector(1 downto 0);
			addr_hi_in					: in  std_logic;
			addr_imm_in					: in  std_logic;
            
            gprs_req_out                : out std_logic;
            gprs_ack_out                : out std_logic;
            gprs_grant_in               : in  std_logic;
            
            gprs_en_out                 : out std_logic;
            gprs_reg_num_out            : out std_logic_vector(8 downto 0);
            gprs_data_type_out          : out data_type;
            gprs_mask_out               : out std_logic_vector(CORES-1 downto 0);
            gprs_rd_wr_en_out           : out std_logic;
            gprs_rd_data_in             : in  vector_word_register_array;
            gprs_rdy_in                 : in  std_logic;
            
            addr_regs_req_out           : out std_logic;
            addr_regs_ack_out           : out std_logic;
            addr_regs_grant_in          : in  std_logic;
            
            addr_regs_en_out            : out std_logic;
            addr_regs_reg_out           : out std_logic_vector(1 downto 0);
            addr_regs_mask_out          : out std_logic_vector(CORES-1 downto 0);
            addr_regs_rd_wr_en_out      : out std_logic;
            addr_regs_rd_data_in        : in  vector_register;
            addr_regs_rdy_in            : in  std_logic;
            
            cmem_addr_out               : out std_logic_vector(ADDRESS_SIZE-1 downto 0);
            cmem_wr_en_out              : out std_logic_vector(0 downto 0);
            cmem_wr_data_out            : out std_logic_vector(7 downto 0);
            cmem_rd_data_in             : in  std_logic_vector(7 downto 0);
            
			data_out			        : out vector_word_register_array;
			rdy_out		                : out std_logic
		);
	end component;
    
    component global_memory_controller
		generic (
            ADDRESS_SIZE                : integer := 32;
            ARB_GPRS_EN                 : std_logic := '0';
            ARB_ADDR_REGS_EN            : std_logic := '0'
        );
		port (
			reset                       : in  std_logic;
			clk_in                      : in  std_logic;
			en						    : in  std_logic;
			
            data_in                     : in  vector_word_register_array;
			addr_in						: in  std_logic_vector(31 downto 0);
			mask_in                     : in  std_logic_vector(CORES-1 downto 0);
            rd_wr_type_in               : in  mem_opcode_type;
            data_type_in			    : in  data_type;
            
			addr_lo_in					: in  std_logic_vector(1 downto 0);
			addr_hi_in					: in  std_logic;
			addr_imm_in					: in  std_logic;
			
            gprs_req_out                : out std_logic;
            gprs_ack_out                : out std_logic;
            gprs_grant_in               : in  std_logic;
            
            gprs_en_out                 : out std_logic;
            gprs_reg_num_out            : out std_logic_vector(8 downto 0);
            gprs_data_type_out          : out data_type;
            gprs_mask_out               : out std_logic_vector(CORES-1 downto 0);
            gprs_rd_wr_en_out           : out std_logic;
            gprs_rd_data_in             : in  vector_word_register_array;
            gprs_rdy_in                 : in  std_logic;
            
            addr_regs_req_out           : out std_logic;
            addr_regs_ack_out           : out std_logic;
            addr_regs_grant_in          : in  std_logic;
            
            addr_regs_en_out            : out std_logic;
            addr_regs_reg_out           : out std_logic_vector(1 downto 0);
            addr_regs_mask_out          : out std_logic_vector(CORES-1 downto 0);
            addr_regs_rd_wr_en_out      : out std_logic;
            addr_regs_rd_data_in        : in  vector_register;
            addr_regs_rdy_in            : in  std_logic;
            
            gmem_addr_out               : out std_logic_vector(ADDRESS_SIZE-1 downto 0);
            gmem_wr_en_out              : out std_logic_vector(0 downto 0);
            gmem_wr_data_out            : out std_logic_vector(7 downto 0);
            gmem_rd_data_in             : in  std_logic_vector(7 downto 0);
            
			data_out			        : out vector_word_register_array;
			rdy_out		                : out std_logic
		);
	end component;
	
	COMPONENT mailbox_ram
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    douta : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    clkb : IN STD_LOGIC;
    web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addrb : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
    dinb : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;
    
--    component local_memory_controller
--		generic (
--            ADDRESS_SIZE                : integer := 32;
--            ARB_GPRS_EN                 : std_logic := '0';
--            ARB_ADDR_REGS_EN            : std_logic := '0'
--        );
--		port (
--			reset                       : in  std_logic;
--			clk_in                      : in  std_logic;
--			en						    : in  std_logic;
--			
--            core_id_in                  : in  std_logic_vector(7 downto 0); 
--            num_warps_in                : in  std_logic_vector(4 downto 0); 
--            warp_id_in                  : in  std_logic_vector(4 downto 0);
--            warp_lane_id_in             : in  std_logic_vector(1 downto 0);
--            
--            data_in                     : in  vector_word_register_array;
--            addr_in						: in  std_logic_vector(31 downto 0);
--			mask_in                     : in  std_logic_vector(7 downto 0);
--            rd_wr_type_in               : in  mem_opcode_type;
--            data_type_in			    : in  data_type;
--            
--			addr_lo_in					: in  std_logic_vector(1 downto 0);
--			addr_hi_in					: in  std_logic;
--			addr_imm_in					: in  std_logic;
--			
--            gprs_req_out                : out std_logic;
--            gprs_ack_out                : out std_logic;
--            gprs_grant_in               : in  std_logic;
--            
--            gprs_en_out                 : out std_logic;
--            gprs_reg_num_out            : out std_logic_vector(8 downto 0);
--            gprs_data_type_out          : out data_type;
--            gprs_mask_out               : out std_logic_vector(CORES-1 downto 0);
--            gprs_rd_wr_en_out           : out std_logic;
--            gprs_rd_data_in             : in  vector_word_register_array;
--            gprs_rdy_in                 : in  std_logic;
--            
--            addr_regs_req_out           : out std_logic;
--            addr_regs_ack_out           : out std_logic;
--            addr_regs_grant_in          : in  std_logic;
--            
--            addr_regs_en_out            : out std_logic;
--            addr_regs_reg_out           : out std_logic_vector(1 downto 0);
--            addr_regs_mask_out          : out std_logic_vector(CORES-1 downto 0);
--            addr_regs_rd_wr_en_out      : out std_logic;
--            addr_regs_rd_data_in        : in  vector_register;
--            addr_regs_rdy_in            : in  std_logic;
--            
--            lmem_addr_out               : out std_logic_vector(ADDRESS_SIZE-1 downto 0);
--            lmem_wr_en_out              : out std_logic_vector(0 downto 0);
--            lmem_wr_data_out            : out std_logic_vector(7 downto 0);
--            lmem_rd_data_in             : in  std_logic_vector(7 downto 0);
--            
--			data_out			        : out vector_word_register_array;
--			rdy_out		                : out std_logic
--		);
--	end component;

    component predicate_lut
        port (
            clk_in              : in  std_logic;
            host_reset          : in  std_logic;
            
            pred_reg_lut_addr   : in  std_logic_vector(4 downto 0);
            pred_reg_lut_bit    : in  std_logic_vector(3 downto 0);
            pred_reg_lut_data   : out std_logic
        );
    end component;
    
    type read_state_type is (IDLE, PRED_REGS_MASK_REQUEST, READ_PRED_REGS_MASK, WAIT_PRED_LUT_DATA, GET_PRED_REGS_MASK, CALC_MASK, CHECK_JOIN, REQUEST_STACK, READ_STACK_WAIT, READ_STACK, CHECK_PRED_FLAGS, PRED_REGS_FLAGS_REQUEST, READ_PRED_REGS_FLAGS, READ_OPS, READ_OPS_WAIT, READ_OPS_DONE);
    signal read_state_machine                       : read_state_type;
    signal read_state_machine_cs                    : std_logic_vector(3 downto 0);
	 
	 type mailbox_state_type is (IDLE, READ_EN, DONE);
    signal mailbox_state_machine                       : mailbox_state_type;
    
    constant ARB_GPRS_CNT                           : integer := 9;
    constant ARB_ADDR_REGS_CNT                      : integer := 9;
    constant ARB_PRED_REGS_CNT                      : integer := 4;
    constant ARB_SHMEM_CNT                          : integer := 3;
    constant ARB_CMEM_CNT                           : integer := 3;
    constant ARB_GMEM_CNT                           : integer := 3;
    constant ARB_LMEM_CNT                           : integer := 3;
    
	signal not_reset								: std_logic;
    signal en_reg                                   : std_logic;
    
    signal warp_id_i                                : std_logic_vector(4 downto 0);
    signal warp_lane_id_i                           : std_logic_vector(1 downto 0);
    signal current_mask_i                           : std_logic_vector(31 downto 0);
    signal initial_mask_i                           : std_logic_vector(31 downto 0);
    signal cta_id_i                                 : std_logic_vector(3 downto 0);
    signal shmem_base_addr_i                        : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal gprs_size_i                              : std_logic_vector(8 downto 0);
    signal instr_opcode_type_i                      : instr_opcode_type;
    signal instr_subop_type_i                       : std_logic_vector(2 downto 0);
    signal alu_opcode_i                             : alu_opcode_type;
    signal flow_opcode_type_i                       : flow_opcode_type;
    signal mov_opcode_type_i                        : mov_opcode_type;
    signal instr_marker_type_i                      : instr_marker_type;
    
    signal mask_i                                   : std_logic_vector(CORES-1 downto 0);
    signal addr_reg_i                               : std_logic_vector(2 downto 0);
    signal addr_imm_i                               : std_logic;
    signal addr_hi_i_3                              : std_logic_vector(2 downto 0);
    signal addr_hi_i                                : std_logic;
    signal addr_lo_i                                : std_logic_vector(1 downto 0);
    signal sm_type_i                                : std_logic_vector(1 downto 0);
    signal mem_type_i                               : std_logic_vector(2 downto 0);
    signal mov_size_i                               : std_logic_vector(2 downto 0);
    signal const_segment_i                          : std_logic_vector(6 downto 0);
    signal imm_hi_i                                 : std_logic_vector(25 downto 0);
    
    signal src1_shared_i                            : std_logic;
    signal dest_mem_type_i                          : mem_type;
    signal dest_mem_opcode_type_i                   : mem_opcode_type;
    signal src1_neg_i                               : std_logic;
    signal src2_neg_i                               : std_logic;
    signal src3_neg_i                               : std_logic;
    signal target_addr_i                            : std_logic_vector(18 downto 0);
    signal dest_data_type_i                         : data_type;
    signal dest_i                                   : std_logic_vector(31 downto 0);
    
    signal pred_regs_en                             : std_logic;
    signal pred_reg_i                               : std_logic_vector(1 downto 0);
    signal set_pred_i                               : std_logic;
    signal set_pred_reg_i                           : std_logic_vector(1 downto 0);
    signal write_pred_i                             : std_logic;
    
    signal is_full_normal_i                         : std_logic;
    signal is_signed_i                              : std_logic;
    signal w32_i                                    : std_logic;
    signal f64_i                                    : std_logic;
    signal saturate_i                               : std_logic;
    signal abs_saturate_i                           : std_logic_vector(1 downto 0);
    signal cvt_round_i                              : std_logic_vector(1 downto 0);
    signal cvt_type_i                               : std_logic_vector(2 downto 0);
    signal cvt_neg_i                                : std_logic;
    signal condition_i                              : std_logic_vector(2 downto 0);
    signal hi_i                                     : std_logic;
    signal addr_incr_i                              : std_logic;
            
    signal pred_regs_reg_num                        : std_logic_vector(1 downto 0);
    signal pred_regs_rd_data                        : vector_flag_register;
    signal pred_regs_wr_data                        : vector_flag_register;
    signal pred_regs_rd_wr_en                       : std_logic;
    signal pred_regs_cntr                           : std_logic_vector(2 downto 0);
    signal pred_cond_i                              : std_logic_vector(4 downto 0);
    signal pred_regs_data                           : vector_pred_register;
    signal pred_lut_data_o                          : std_logic_vector(31 downto 0);
    signal instruction_mask_i                       : std_logic_vector(31 downto 0);
    signal warp_id_addr                             : integer range 0 to MAX_WARPS;
    signal next_pc                                  : std_logic_vector(31 downto 0);
    signal pred_flags_i                             : vector_flag_register;
        
    signal arb_gprs_req                             : std_logic_vector(ARB_GPRS_CNT-1 downto 0);
    signal arb_gprs_ack                             : std_logic;
    signal arb_gprs_ack_o                           : std_logic_vector(ARB_GPRS_CNT-1 downto 0);
    signal arb_gprs_grant                           : std_logic_vector(ARB_GPRS_CNT-1 downto 0);
    signal arb_gprs_grant1                    	 	: std_logic_vector(ARB_GPRS_CNT-1 downto 0);
	--signal arb_gprs_grant1                        : std_logic_vector(ARB_GPRS_CNT-1 downto 0);
	
    signal arb_addr_regs_req                        : std_logic_vector(ARB_ADDR_REGS_CNT-1 downto 0);
    signal arb_addr_regs_ack                        : std_logic;
    signal arb_addr_regs_ack_o                      : std_logic_vector(ARB_ADDR_REGS_CNT-1 downto 0);
    signal arb_addr_regs_grant                      : std_logic_vector(ARB_ADDR_REGS_CNT-1 downto 0);
    signal arb_addr_regs_grant1                     : std_logic_vector(ARB_ADDR_REGS_CNT-1 downto 0);
    
    signal arb_pred_regs_req                        : std_logic_vector(ARB_PRED_REGS_CNT-1 downto 0);
    signal arb_pred_regs_ack                        : std_logic;
    signal arb_pred_regs_ack_o                      : std_logic_vector(ARB_PRED_REGS_CNT-1 downto 0);
    signal arb_pred_regs_grant                      : std_logic_vector(ARB_PRED_REGS_CNT-1 downto 0);
    signal arb_pred_regs_grant1                     : std_logic_vector(ARB_PRED_REGS_CNT-1 downto 0);
	 
    signal arb_shmem_req                            : std_logic_vector(ARB_SHMEM_CNT-1 downto 0);
    signal arb_shmem_ack                            : std_logic;
    signal arb_shmem_ack_o                          : std_logic_vector(ARB_SHMEM_CNT-1 downto 0);
    signal arb_shmem_grant                          : std_logic_vector(ARB_SHMEM_CNT-1 downto 0);
    
    signal arb_cmem_req                             : std_logic_vector(ARB_CMEM_CNT-1 downto 0);
    signal arb_cmem_ack                             : std_logic;
    signal arb_cmem_ack_o                           : std_logic_vector(ARB_CMEM_CNT-1 downto 0);
    signal arb_cmem_grant                           : std_logic_vector(ARB_CMEM_CNT-1 downto 0);

    signal arb_gmem_req                             : std_logic_vector(ARB_GMEM_CNT-1 downto 0);
    signal arb_gmem_ack                             : std_logic;
    signal arb_gmem_ack_o                           : std_logic_vector(ARB_GMEM_CNT-1 downto 0);
    signal arb_gmem_grant                           : std_logic_vector(ARB_GMEM_CNT-1 downto 0);
    
    signal arb_lmem_req                             : std_logic_vector(ARB_LMEM_CNT-1 downto 0);
    signal arb_lmem_ack                             : std_logic;
    signal arb_lmem_ack_o                           : std_logic_vector(ARB_LMEM_CNT-1 downto 0);
    signal arb_lmem_grant                           : std_logic_vector(ARB_LMEM_CNT-1 downto 0);
    
    signal gprs_en_i                                : std_logic;
    signal gprs_en_i_reg                            : std_logic;
    signal base_addr_i                              : std_logic_vector(8 downto 0);
    signal gprs_reg_num_i                           : std_logic_vector(8 downto 0);
    signal gprs_data_i                              : vector_word_register_array;
    signal gprs_rd_wr_en_i                          : std_logic;
    signal gprs_data_type_i                         : data_type;
    signal gprs_mask_i                              : std_logic_vector(CORES-1 downto 0);
    signal gprs_data_o                              : vector_word_register_array;
    signal gprs_rdy_o                               : std_logic;
    
    signal pred_regs_en_i                           : std_logic;
    signal pred_regs_reg_num_i                      : std_logic_vector(1 downto 0);
    signal pred_regs_rd_wr_en_i                     : std_logic;
    signal pred_regs_data_i                         : vector_flag_register;
    signal pred_mask                                : std_logic_vector(31 downto 0);
	signal pred_regs_mask_in						: std_logic_vector(CORES-1 downto 0);
    signal pred_regs_data_o                         : vector_flag_register;
    signal pred_regs_rdy_o                          : std_logic;
    
    signal addr_regs_en_i                           : std_logic;
    signal addr_regs_num_i                          : std_logic_vector(1 downto 0);
    signal addr_regs_data_i                         : vector_register;
    signal addr_regs_rd_wr_en_i                     : std_logic;
    signal addr_regs_data_o                         : vector_register;
    signal addr_regs_rdy_o                          : std_logic;
    signal addr_regs_mask_in								 : std_logic_vector(CORES-1 downto 0);
	 
    signal shmem_gprs_en                            : std_logic;
    signal cmem_gprs_en                             : std_logic;
    signal gmem_gprs_en                             : std_logic;
    signal lmem_gprs_en                             : std_logic;
   
    signal shmem_gprs_reg_num                       : std_logic_vector(8 downto 0);
    signal cmem_gprs_reg_num                        : std_logic_vector(8 downto 0);
    signal gmem_gprs_reg_num                        : std_logic_vector(8 downto 0);
    signal lmem_gprs_reg_num                        : std_logic_vector(8 downto 0);
    
    signal shmem_gprs_data_type                     : data_type;
    signal cmem_gprs_data_type                      : data_type;
    signal gmem_gprs_data_type                      : data_type;
    signal lmem_gprs_data_type                      : data_type;
     
    signal shmem_gprs_mask                          : std_logic_vector(CORES-1 downto 0);
    signal cmem_gprs_mask                           : std_logic_vector(CORES-1 downto 0);
    signal gmem_gprs_mask                           : std_logic_vector(CORES-1 downto 0);
    signal lmem_gprs_mask                           : std_logic_vector(CORES-1 downto 0);
    
    signal shmem_gprs_rd_wr_en                      : std_logic;
    signal cmem_gprs_rd_wr_en                       : std_logic;
    signal gmem_gprs_rd_wr_en                       : std_logic;
    signal lmem_gprs_rd_wr_en                       : std_logic;
    
    signal shmem_gprs_rd_data                       : vector_word_register_array;
    signal cmem_gprs_rd_data                        : vector_word_register_array;
    signal gmem_gprs_rd_data                        : vector_word_register_array;
    signal lmem_gprs_rd_data                        : vector_word_register_array;
    
    signal shmem_gprs_rdy                           : std_logic;
    signal cmem_gprs_rdy                            : std_logic;
    signal gmem_gprs_rdy                            : std_logic;
    signal lmem_gprs_rdy                            : std_logic;
    
    signal shmem_addr_regs_en                       : std_logic;
    signal cmem_addr_regs_en                        : std_logic;
    signal gmem_addr_regs_en                        : std_logic;
    signal lmem_addr_regs_en                        : std_logic;
    
    signal shmem_addr_regs_reg                      : std_logic_vector(1 downto 0);
    signal cmem_addr_regs_reg                       : std_logic_vector(1 downto 0);
    signal gmem_addr_regs_reg                       : std_logic_vector(1 downto 0);
    signal lmem_addr_regs_reg                       : std_logic_vector(1 downto 0);
    
    signal shmem_addr_regs_mask                     : std_logic_vector(CORES-1 downto 0);
    signal cmem_addr_regs_mask                      : std_logic_vector(CORES-1 downto 0);
    signal gmem_addr_regs_mask                      : std_logic_vector(CORES-1 downto 0);
    signal lmem_addr_regs_mask                      : std_logic_vector(CORES-1 downto 0);
    
    signal shmem_addr_regs_rd_wr_en                 : std_logic;
    signal cmem_addr_regs_rd_wr_en                  : std_logic;
    signal gmem_addr_regs_rd_wr_en                  : std_logic;
    signal lmem_addr_regs_rd_wr_en                  : std_logic;
    
    signal shmem_addr_regs_rd_data                  : vector_register;
    signal cmem_addr_regs_rd_data                   : vector_register;
    signal gmem_addr_regs_rd_data                   : vector_register;
    signal lmem_addr_regs_rd_data                   : vector_register;
    
    signal shmem_addr_regs_rdy                      : std_logic;
    signal cmem_addr_regs_rdy                       : std_logic;
    signal gmem_addr_regs_rdy                       : std_logic;
    signal lmem_addr_regs_rdy                       : std_logic;
    
    signal shmem_en_i                               : std_logic;
    signal cmem_en_i                                : std_logic;
    signal gmem_en_i                                : std_logic;
    signal lmem_en_i                                : std_logic;
    
    signal shmem_wr_data_i                          : vector_word_register_array;
    signal shmem_rd_wr_type_i                       : mem_opcode_type;
    signal shmem_addr_i                             : std_logic_vector(31 downto 0);
    signal shmem_mask_i                             : std_logic_vector(CORES-1 downto 0);
    signal shmem_sm_type_i                          : sm_type;
    
    signal cmem_wr_data_i                           : vector_word_register_array;
    signal cmem_rd_wr_type_i                        : mem_opcode_type;
    signal cmem_addr_i                              : vector_register;
    signal cmem_mask_i                              : std_logic_vector(CORES-1 downto 0);
    signal cmem_sm_type_i                           : sm_type;
    signal cmem_segment_i                           : std_logic_vector(6 downto 0);
    
    signal gmem_wr_data_i                           : vector_word_register_array;
    signal gmem_rd_wr_type_i                        : mem_opcode_type;
    signal gmem_addr_i                              : std_logic_vector(31 downto 0);
    signal gmem_mask_i                              : std_logic_vector(CORES-1 downto 0);
    
    signal lmem_wr_data_i                           : vector_word_register_array;
    signal lmem_rd_wr_type_i                        : mem_opcode_type;
    signal lmem_addr_i                              : std_logic_vector(31 downto 0);
    signal lmem_mask_i                              : std_logic_vector(CORES-1 downto 0);
    
    signal shmem_rd_data_o                          : vector_word_register_array;
	signal shmem_rdy_o                              : std_logic;
    
    signal cmem_rd_data_o                           : vector_word_register_array;
	signal cmem_rdy_o                               : std_logic;
    
    signal gmem_rd_data_o                           : vector_word_register_array;
	signal gmem_rdy_o                               : std_logic;
    
    signal lmem_rd_data_o                           : vector_word_register_array;
	signal lmem_rdy_o                               : std_logic;
    
    signal is_vector_addr_i                         : std_logic;
    signal segment_i                                : std_logic_vector(1 downto 0);
    signal gmem_data_type_i                         : data_type;
    signal num_warps_i                              : std_logic_vector(4 downto 0);
    signal lmem_data_type_i                         : data_type;
            
    signal src1_read_en                             : std_logic;     
    signal src1_addr_i                              : std_logic_vector(31 downto 0);
    signal src1_mem_type_i                          : mem_type;
    signal src1_data_type_i                         : data_type;
    signal src1_mem_opcode_type_i                   : mem_opcode_type;
    signal src1_gprs_en                             : std_logic;
    signal src1_gprs_reg_num                        : std_logic_vector(8 downto 0);
    signal src1_gprs_rd_wr_en                       : std_logic;
    signal src1_gprs_wr_data                        : vector_word_register_array;
    signal src1_gprs_data_type                      : data_type;
    signal src1_gprs_mask                           : std_logic_vector(CORES-1 downto 0);  
    signal src1_gprs_rd_data                        : vector_word_register_array;
    signal src1_gprs_rdy                            : std_logic;
    signal src1_addr_regs_en                        : std_logic;
    signal src1_addr_regs_reg_num                   : std_logic_vector(1 downto 0);
    signal src1_addr_regs_rd_wr_en                  : std_logic;
    signal src1_addr_regs_wr_data                   : vector_register;
    signal src1_addr_regs_rd_data                   : vector_register;
    signal src1_addr_regs_rdy                       : std_logic;
    signal src1_pred_regs_en                        : std_logic;
    signal src1_pred_regs_reg_num                   : std_logic_vector(1 downto 0);
    signal src1_pred_regs_rd_wr_en                  : std_logic;
    signal src1_pred_regs_wr_data                   : vector_flag_register;
    signal src1_pred_regs_rd_data                   : vector_flag_register;
    signal src1_pred_regs_rdy                       : std_logic;
    signal src1_shmem_en                            : std_logic;
    signal src1_shmem_addr                          : std_logic_vector(31 downto 0);
    signal src1_shmem_sm_type                       : sm_type;
    signal src1_shmem_rd_wr_type                    : mem_opcode_type;
    signal src1_shmem_data_type                     : data_type;
    signal src1_shmem_mask                          : std_logic_vector(CORES-1 downto 0);  
    signal src1_shmem_rd_data                       : vector_word_register_array;
    signal src1_shmem_rdy                           : std_logic;
    signal src1_cmem_en                             : std_logic;
    signal src1_cmem_addr                           : std_logic_vector(31 downto 0);
    signal src1_cmem_sm_type                        : sm_type;
    signal src1_cmem_segment                        : std_logic_vector(6 downto 0);
    signal src1_cmem_rd_wr_type                     : mem_opcode_type;
    signal src1_cmem_data_type                      : data_type;
    signal src1_cmem_mask                           : std_logic_vector(CORES-1 downto 0); 
    signal src1_cmem_rd_data                        : vector_word_register_array;
    signal src1_cmem_rdy                            : std_logic;
    signal src1_gmem_en                             : std_logic;
    signal src1_gmem_addr                           : std_logic_vector(31 downto 0);
    signal src1_gmem_rd_wr_type                     : mem_opcode_type;
    signal src1_gmem_data_type                      : data_type;
    signal src1_gmem_mask                           : std_logic_vector(CORES-1 downto 0); 
    signal src1_gmem_rd_data                        : vector_word_register_array;
    signal src1_gmem_rdy                            : std_logic;
    signal src1_lmem_en                             : std_logic;
    signal src1_lmem_addr                           : std_logic_vector(31 downto 0);
    signal src1_lmem_rd_wr_type                     : mem_opcode_type;
    signal src1_lmem_data_type                      : data_type;
    signal src1_lmem_mask                           : std_logic_vector(CORES-1 downto 0); 
    signal src1_lmem_rd_data                        : vector_word_register_array;
    signal src1_lmem_rdy                            : std_logic;
    signal src1_effaddr_gprs_en                     : std_logic;
    signal src1_effaddr_gprs_reg_num                : std_logic_vector(8 downto 0);
    signal src1_effaddr_gprs_data_type              : data_type;
    signal src1_effaddr_gprs_mask                   : std_logic_vector(CORES-1 downto 0);
    signal src1_effaddr_gprs_rd_wr_en               : std_logic;
    signal src1_effaddr_gprs_rd_data                : vector_word_register_array;
    signal src1_effaddr_gprs_rdy                    : std_logic;
    signal src1_effaddr_addr_regs_en                : std_logic;
    signal src1_effaddr_addr_regs_reg               : std_logic_vector(1 downto 0);
    signal src1_effaddr_addr_regs_mask              : std_logic_vector(CORES-1 downto 0);
    signal src1_effaddr_addr_regs_rd_wr_en          : std_logic;
    signal src1_effaddr_addr_regs_rd_data           : vector_register;
    signal src1_effaddr_addr_regs_rdy               : std_logic;
    signal src1_data_o                              : vector_word_register_array;
    signal src1_rdy_o                               : std_logic;
    
    signal src2_read_en                             : std_logic;     
    signal src2_addr_i                              : std_logic_vector(31 downto 0);
    signal src2_mem_type_i                          : mem_type;
    signal src2_data_type_i                         : data_type;
    signal src2_mem_opcode_type_i                   : mem_opcode_type;
    signal src2_gprs_en                             : std_logic;
    signal src2_gprs_reg_num                        : std_logic_vector(8 downto 0);
    signal src2_gprs_rd_wr_en                       : std_logic;
    signal src2_gprs_wr_data                        : vector_word_register_array;
    signal src2_gprs_data_type                      : data_type;
    signal src2_gprs_mask                           : std_logic_vector(CORES-1 downto 0);  
    signal src2_gprs_rd_data                        : vector_word_register_array;
    signal src2_gprs_rdy                            : std_logic;
    signal src2_addr_regs_en                        : std_logic;
    signal src2_addr_regs_reg_num                   : std_logic_vector(1 downto 0);
    signal src2_addr_regs_rd_wr_en                  : std_logic;
    signal src2_addr_regs_wr_data                   : vector_register;
    signal src2_addr_regs_rd_data                   : vector_register;
    signal src2_addr_regs_rdy                       : std_logic;
    signal src2_pred_regs_en                        : std_logic;
    signal src2_pred_regs_reg_num                   : std_logic_vector(1 downto 0);
    signal src2_pred_regs_rd_wr_en                  : std_logic;
    signal src2_pred_regs_wr_data                   : vector_flag_register;
    signal src2_pred_regs_rd_data                   : vector_flag_register;
    signal src2_pred_regs_rdy                       : std_logic;
    signal src2_shmem_en                            : std_logic;
    signal src2_shmem_addr                          : std_logic_vector(31 downto 0);
    signal src2_shmem_sm_type                       : sm_type;
    signal src2_cmem_segment                        : std_logic_vector(6 downto 0);
    signal src2_shmem_rd_wr_type                    : mem_opcode_type;
    signal src2_shmem_data_type                     : data_type;
    signal src2_shmem_mask                          : std_logic_vector(CORES-1 downto 0);  
    signal src2_shmem_rd_data                       : vector_word_register_array;
    signal src2_shmem_rdy                           : std_logic;
    signal src2_cmem_en                             : std_logic;
    signal src2_cmem_addr                           : std_logic_vector(31 downto 0);
    signal src2_cmem_sm_type                        : sm_type;
    signal src2_cmem_rd_wr_type                     : mem_opcode_type;
    signal src2_cmem_data_type                      : data_type;
    signal src2_cmem_mask                           : std_logic_vector(CORES-1 downto 0); 
    signal src2_cmem_rd_data                        : vector_word_register_array;
    signal src2_cmem_rdy                            : std_logic;
    signal src2_gmem_en                             : std_logic;
    signal src2_gmem_addr                           : std_logic_vector(31 downto 0);
    signal src2_gmem_rd_wr_type                     : mem_opcode_type;
    signal src2_gmem_data_type                      : data_type;
    signal src2_gmem_mask                           : std_logic_vector(CORES-1 downto 0); 
    signal src2_gmem_rd_data                        : vector_word_register_array;
    signal src2_gmem_rdy                            : std_logic;
    signal src2_lmem_en                             : std_logic;
    signal src2_lmem_addr                           : std_logic_vector(31 downto 0);
    signal src2_lmem_rd_wr_type                     : mem_opcode_type;
    signal src2_lmem_data_type                      : data_type;
    signal src2_lmem_mask                           : std_logic_vector(CORES-1 downto 0); 
    signal src2_lmem_rd_data                        : vector_word_register_array;
    signal src2_lmem_rdy                            : std_logic;
    signal src2_effaddr_gprs_en                     : std_logic;
    signal src2_effaddr_gprs_reg_num                : std_logic_vector(8 downto 0);
    signal src2_effaddr_gprs_data_type              : data_type;
    signal src2_effaddr_gprs_mask                   : std_logic_vector(CORES-1 downto 0);
    signal src2_effaddr_gprs_rd_wr_en               : std_logic;
    signal src2_effaddr_gprs_rd_data                : vector_word_register_array;
    signal src2_effaddr_gprs_rdy                    : std_logic;
    signal src2_effaddr_addr_regs_en                : std_logic;
    signal src2_effaddr_addr_regs_reg               : std_logic_vector(1 downto 0);
    signal src2_effaddr_addr_regs_mask              : std_logic_vector(CORES-1 downto 0);
    signal src2_effaddr_addr_regs_rd_wr_en          : std_logic;
    signal src2_effaddr_addr_regs_rd_data           : vector_register;
    signal src2_effaddr_addr_regs_rdy               : std_logic;
    signal src2_data_o                              : vector_word_register_array;
    signal src2_rdy_o                               : std_logic;
    
    signal src3_read_en                             : std_logic;     
    signal src3_addr_i                              : std_logic_vector(31 downto 0);
    signal src3_mem_type_i                          : mem_type;
    signal src3_data_type_i                         : data_type;
    signal src3_mem_opcode_type_i                   : mem_opcode_type;
    signal src3_gprs_en                             : std_logic;
    signal src3_gprs_reg_num                        : std_logic_vector(8 downto 0);
    signal src3_gprs_rd_wr_en                       : std_logic;
    signal src3_gprs_wr_data                        : vector_word_register_array;
    signal src3_gprs_data_type                      : data_type;
    signal src3_gprs_mask                           : std_logic_vector(CORES-1 downto 0);  
    signal src3_gprs_rd_data                        : vector_word_register_array;
    signal src3_gprs_rdy                            : std_logic;
    signal src3_addr_regs_en                        : std_logic;
    signal src3_addr_regs_reg_num                   : std_logic_vector(1 downto 0);
    signal src3_addr_regs_rd_wr_en                  : std_logic;
    signal src3_addr_regs_wr_data                   : vector_register;
    signal src3_addr_regs_rd_data                   : vector_register;
    signal src3_addr_regs_rdy                       : std_logic;
    signal src3_pred_regs_en                        : std_logic;
    signal src3_pred_regs_reg_num                   : std_logic_vector(1 downto 0);
    signal src3_pred_regs_rd_wr_en                  : std_logic;
    signal src3_pred_regs_wr_data                   : vector_flag_register;
    signal src3_pred_regs_rd_data                   : vector_flag_register;
    signal src3_pred_regs_rdy                       : std_logic;
    signal src3_shmem_en                            : std_logic;
    signal src3_shmem_addr                          : std_logic_vector(31 downto 0);
    signal src3_shmem_sm_type                       : sm_type;
    signal src3_shmem_rd_wr_type                    : mem_opcode_type;
    signal src3_shmem_data_type                     : data_type;
    signal src3_shmem_mask                          : std_logic_vector(CORES-1 downto 0);  
    signal src3_shmem_rd_data                       : vector_word_register_array;
    signal src3_shmem_rdy                           : std_logic;
    signal src3_cmem_en                             : std_logic;
    signal src3_cmem_addr                           : std_logic_vector(31 downto 0);
    signal src3_cmem_sm_type                        : sm_type;
    signal src3_cmem_segment                        : std_logic_vector(6 downto 0);
    signal src3_cmem_rd_wr_type                     : mem_opcode_type;
    signal src3_cmem_data_type                      : data_type;
    signal src3_cmem_mask                           : std_logic_vector(CORES-1 downto 0); 
    signal src3_cmem_rd_data                        : vector_word_register_array;
    signal src3_cmem_rdy                            : std_logic;
    signal src3_gmem_en                             : std_logic;
    signal src3_gmem_addr                           : std_logic_vector(31 downto 0);
    signal src3_gmem_rd_wr_type                     : mem_opcode_type;
    signal src3_gmem_data_type                      : data_type;
    signal src3_gmem_mask                           : std_logic_vector(CORES-1 downto 0); 
    signal src3_gmem_rd_data                        : vector_word_register_array;
    signal src3_gmem_rdy                            : std_logic;
    signal src3_lmem_en                             : std_logic;
    signal src3_lmem_addr                           : std_logic_vector(31 downto 0);
    signal src3_lmem_rd_wr_type                     : mem_opcode_type;
    signal src3_lmem_data_type                      : data_type;
    signal src3_lmem_mask                           : std_logic_vector(CORES-1 downto 0); 
    signal src3_lmem_rd_data                        : vector_word_register_array;
    signal src3_lmem_rdy                            : std_logic;
    signal src3_effaddr_gprs_en                     : std_logic;
    signal src3_effaddr_gprs_reg_num                : std_logic_vector(8 downto 0);
    signal src3_effaddr_gprs_data_type              : data_type;
    signal src3_effaddr_gprs_mask                   : std_logic_vector(CORES-1 downto 0);
    signal src3_effaddr_gprs_rd_wr_en               : std_logic;    
    signal src3_effaddr_gprs_rd_data                : vector_word_register_array;
    signal src3_effaddr_gprs_rdy                    : std_logic;
    signal src3_effaddr_addr_regs_en                : std_logic;
    signal src3_effaddr_addr_regs_reg               : std_logic_vector(1 downto 0);
    signal src3_effaddr_addr_regs_mask              : std_logic_vector(CORES-1 downto 0);
    signal src3_effaddr_addr_regs_rd_wr_en          : std_logic;
    signal src3_effaddr_addr_regs_rd_data           : vector_register;
    signal src3_effaddr_addr_regs_rdy               : std_logic;
    signal src3_data_o                              : vector_word_register_array;
    signal src3_rdy_o                               : std_logic;
    
    signal src1_rdy_reg                             : std_logic;
    signal src2_rdy_reg                             : std_logic;
    signal src3_rdy_reg                             : std_logic;
    
    signal temp_vector_register_i                   : temp_vector_register;
	 signal mailbox_temp										 : vector_word_register_array;
    --
    -- Stats
    --
    signal stat_idle_cnt                            : integer range 0 to 2147483647;
    signal stat_idle_total_cnt                      : integer range 0 to 2147483647;
    signal stat_proc_cnt                            : integer range 0 to 2147483647;
    signal stat_proc_total_cnt                      : integer range 0 to 2147483647;
    signal stat_stall_cnt                           : integer range 0 to 2147483647;
    signal stat_stall_total_cnt                     : integer range 0 to 2147483647;
	 
	  
    signal wea : STD_LOGIC_VECTOR(0 DOWNTO 0);
    signal addra : STD_LOGIC_VECTOR(2 DOWNTO 0);
    signal dina :  STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal douta : STD_LOGIC_VECTOR(31 DOWNTO 0);
    
    signal web :  STD_LOGIC_VECTOR(0 DOWNTO 0);
    signal addrb :  STD_LOGIC_VECTOR(2 DOWNTO 0);
    signal dinb :  STD_LOGIC_VECTOR(31 DOWNTO 0);
    signal doutb :  STD_LOGIC_VECTOR(31 DOWNTO 0);
	 
	 signal read_check_i : std_logic_vector(9 downto 0);
	 signal read_status : std_logic := '0';
	 
	 signal write_en_noc_ram_i : std_logic_vector(0 downto 0);
			signal 	addr_noc_ram_i :  std_logic_vector(2 downto 0);
			signal	data_noc_ram_i :  std_logic_vector(31 downto 0);
	
    
begin
	write_en_noc_ram_i <= write_en_noc_ram_in;
	addr_noc_ram_i <= addr_noc_ram_in;
	data_noc_ram_i <= data_noc_ram_in;
	
    addr_hi_i_3     <= "00" & addr_hi_in;
    addr_reg_i      <= (to_stdlogicvector(to_bitvector(addr_hi_i_3) sll 2)) or ("0" & addr_lo_in);
    read_check_out <= read_check_i;
    not_reset		<= not(reset);
	 
    pPipelineRead : process(clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (reset = '1') then
                addr_imm_i                                          	<= '0';
                warp_id_addr                                            <= 0;
                warp_id_i                                               <= (others => '0');
                warp_lane_id_i                                          <= (others => '0');
                cta_id_i                                                <= (others => '0');
                current_mask_i                                          <= (others => '0');
                initial_mask_i                                          <= (others => '0');
                shmem_base_addr_i                                       <= (others => '0');
                gprs_size_i                                             <= (others => '0');
                instruction_mask_i                                      <= (others => '0');
                next_pc                                                 <= (others => '0');
                instr_opcode_type_i                                     <= UNKNOWN;
                instr_subop_type_i                                      <= (others => '0');
                alu_opcode_i                                            <= UNKNOWN;
                flow_opcode_type_i                                      <= UNKNOWN;
                mov_opcode_type_i                                       <= UNKNOWN;
                instr_marker_type_i                                     <= UNKNOWN;        
                pred_reg_i                                              <= (others => '0');
                pred_cond_i                                             <= (others => '0');
                set_pred_i                                              <= '0';
                set_pred_reg_i                                          <= (others => '0');
                write_pred_i                                            <= '0';
                is_full_normal_i                                        <= '0';
                is_signed_i                                             <= '0';
                w32_i                                                   <= '0';
                f64_i                                                   <= '0';
                saturate_i                                              <= '0';
                abs_saturate_i                                          <= (others => '0');
                cvt_round_i                                             <= (others => '0');
                cvt_type_i                                              <= (others => '0');
                cvt_neg_i                                               <= '0';
                addr_hi_i                                               <= '0';
                addr_lo_i                                               <= (others => '0');
                hi_i                                                    <= '0';
                addr_incr_i                                             <= '0';
                mov_size_i                                              <= (others => '0');
                const_segment_i                                         <= (others => '0');
                mem_type_i                                              <= (others => '0');
                sm_type_i                                               <= (others => '0');
                imm_hi_i                                                <= (others => '0');
                addr_imm_i                                              <= '0';
                src1_shared_i                                           <= '0';
                src1_mem_type_i                                         <= UNKNOWN;
                src2_mem_type_i                                         <= UNKNOWN;
                src3_mem_type_i                                         <= UNKNOWN;
                dest_mem_type_i                                         <= UNKNOWN;
                src1_mem_opcode_type_i                                  <= READ;
                src2_mem_opcode_type_i                                  <= READ;
                src3_mem_opcode_type_i                                  <= READ;
                dest_mem_opcode_type_i                                  <= READ;
                src1_neg_i                                              <= '0';
                src2_neg_i                                              <= '0';
                src3_neg_i                                              <= '0';
                target_addr_i                                           <= (others => '0');
                src1_data_type_i                                        <= DT_UNKNOWN;
                src2_data_type_i                                        <= DT_UNKNOWN;
                src3_data_type_i                                        <= DT_UNKNOWN;
                dest_data_type_i                                        <= DT_UNKNOWN;
                src1_addr_i                                             <= (others => '0');
                src2_addr_i                                             <= (others => '0');
                src3_addr_i                                             <= (others => '0');
                dest_i                                                  <= (others => '0');         
                warp_div_req_out                                        <= '0';
                warp_div_ack_out                                        <= '0';
                arb_pred_regs_req(0)                                    <= '0';
                arb_pred_regs_ack_o(0)                                  <= '0';
                pred_regs_en                                            <= '0';
                pred_regs_reg_num                                       <= (others => '0');
                pred_regs_data                                          <= (others => (others => '0'));
                pred_regs_wr_data                                       <= (others => (others => '0'));
                pred_regs_rd_wr_en                                      <= '0';
                pred_regs_cntr                                          <= (others => '0');
                pred_mask                                               <= (others => '0');
                pred_flags_i                                            <= (others => (others => '0'));
                src1_rdy_reg                                            <= '0';
                src2_rdy_reg                                            <= '0';
                src3_rdy_reg                                            <= '0';
                en_reg                                                  <= '0';
                warp_id_out                                             <= (others => '0');
                warp_lane_id_out                                        <= (others => '0');
                cta_id_out                                              <= (others => '0');
                initial_mask_out                                        <= (others => '0');
                current_mask_out                                        <= (others => '0');
                shmem_base_addr_out                                     <= (others => '0');
                gprs_size_out                                           <= (others => '0');
                gprs_addr_out                                           <= (others => '0');
                instruction_mask_out                                    <= (others => '0');
                next_pc_out                                             <= (others => '0');
                instr_opcode_type_out                                   <= UNKNOWN;
                instr_subop_type_out                                    <= (others => '0');
                alu_opcode_out                                          <= UNKNOWN;
                flow_opcode_type_out                                    <= UNKNOWN;
                mov_opcode_type_out                                     <= UNKNOWN;
                instr_marker_type_out                                   <= UNKNOWN;
                set_pred_out                                            <= '0';
                set_pred_reg_out                                        <= (others => '0');
                write_pred_out                                          <= '0';
                warp_div_push_en	     							    <= (others => '0');
                warp_div_stack_en										<= (others => '0');
                is_full_normal_out                                      <= '0';
                is_signed_out                                           <= '0';
                w32_out                                                 <= '0';
                f64_out                                                 <= '0';
                saturate_out                                            <= '0';
                abs_saturate_out                                        <= (others => '0');
                cvt_round_out                                           <= (others => '0');
                cvt_type_out                                            <= (others => '0');
                cvt_neg_out                                             <= '0';
                addr_hi_out                                             <= '0';
                addr_lo_out                                             <= (others => '0');
                addr_incr_out                                           <= '0';
                mov_size_out                                            <= (others => '0');
                mem_type_out                                            <= (others => '0');
                sm_type_out                                             <= (others => '0');
                addr_imm_out                                            <= '0';
                dest_mem_type_out                                       <= UNKNOWN;
                dest_mem_opcode_type_out                                <= READ;
                src1_neg_out                                            <= '0';
                src2_neg_out                                            <= '0';
                src3_neg_out                                            <= '0';
                target_addr_out                                         <= (others => '0');
                dest_data_type_out                                      <= DT_UNKNOWN;
                src1_out                                                <= (others => '0');
                dest_out                                                <= (others => '0');
                pred_flags_out                                          <= (others => (others => '0'));
                temp_vector_register_out                                <= (others => (others => (others => (others => '0'))));        
                pipeline_stall_out                                      <= '0';
                pipeline_reg_ld                                         <= '0';
            else
                case read_state_machine is 
                    when IDLE =>
                        pipeline_reg_ld                                 <= '0';
                        en_reg                                          <= en;
                        src1_read_en                            		<= '0';
                        src2_read_en                                    <= '0';
                        src3_read_en                            		<= '0';
                        --arb_gprs_grant_reg						    <= '0';
                        if (en_reg = '0' and en = '1') then
                            pipeline_stall_out                          <= '1';
									 read_status <= '1';
                            if (instr_opcode_type_in = NOP and instr_marker_type_in /= FULL_JOIN) then
                                warp_id_i                               <= warp_id_in;
                                warp_id_addr                            <= conv_integer(warp_id_in);
                                warp_lane_id_i                          <= warp_lane_id_in;
                                base_addr_i							    <= gprs_base_addr_in;
                                cta_id_i                                <= cta_id_in;
                                shmem_base_addr_i                       <= shmem_base_addr_in;
                                gprs_size_i                             <= gprs_size_in;
                                instr_opcode_type_i                     <= instr_opcode_type_in;
                                instr_subop_type_i                      <= instr_subop_type_in;
                                alu_opcode_i                            <= alu_opcode_in;
                                flow_opcode_type_i                      <= flow_opcode_type_in;
                                mov_opcode_type_i                       <= mov_opcode_type_in;
                                instr_marker_type_i                     <= instr_marker_type_in;
                                set_pred_i                              <= set_pred_in;
                                set_pred_reg_i                          <= set_pred_reg_in;
                                write_pred_i                            <= write_pred_in;
                                is_full_normal_i                        <= is_full_normal_in;
                                is_signed_i                             <= is_signed_in;
                                w32_i                                   <= w32_in;
                                f64_i                                   <= f64_in;
                                saturate_i                              <= saturate_in;
                                abs_saturate_i                          <= abs_saturate_in;
                                cvt_round_i                             <= cvt_round_in;
                                cvt_type_i                              <= cvt_type_in;
                                cvt_neg_i                               <= cvt_neg_in;
                                condition_i                             <= condition_in;
                                addr_hi_i                               <= addr_hi_in;
                                addr_lo_i                               <= addr_lo_in;
                                hi_i                                    <= hi_in;
                                addr_incr_i                             <= addr_incr_in;
                                imm_hi_i                                <= imm_hi_in;
                                addr_imm_i                              <= addr_imm_in;
                                src1_shared_i                           <= src1_shared_in;
                                src1_mem_type_i                         <= src1_mem_type_in;
                                src2_mem_type_i                         <= src2_mem_type_in;
                                src3_mem_type_i                         <= src3_mem_type_in;
                                dest_mem_type_i                         <= dest_mem_type_in;
                                src1_mem_opcode_type_i                  <= src1_mem_opcode_type_in;
                                src2_mem_opcode_type_i                  <= src2_mem_opcode_type_in;
                                src3_mem_opcode_type_i                  <= src3_mem_opcode_type_in;
                                dest_mem_opcode_type_i                  <= dest_mem_opcode_type_in;
                                src1_neg_i                              <= src1_neg_in;
                                src2_neg_i                              <= src2_neg_in;
                                src3_neg_i                              <= src3_neg_in;
                                target_addr_i                           <= target_addr_in;
                                src1_data_type_i                        <= src1_data_type_in;
                                src2_data_type_i                        <= src2_data_type_in;
                                src3_data_type_i                        <= src3_data_type_in;
                                dest_data_type_i                        <= dest_data_type_in;
                                warp_div_req_out                        <= '0';
                                warp_div_ack_out                        <= '0';
                                pred_cond_i                             <= pred_cond_in;
                                pred_reg_i                              <= pred_reg_in;
                                sm_type_i                               <= sm_type_in;
                                mem_type_i                              <= mem_type_in;
                                mov_size_i                              <= mov_size_in;
                                src1_addr_i                             <= src1_in;
                                src2_addr_i                             <= src2_in;
                                src3_addr_i                             <= src3_in;
                                dest_i                                  <= dest_in;
                                const_segment_i                         <= const_segment_in;
                                pred_flags_i                            <= (others => (others => '0'));
                                if (warp_lane_id_in = "00") then
                                    current_mask_i                      <= current_mask_in;
                                    initial_mask_i                      <= initial_mask_in;
                                    next_pc                             <= next_pc_in;
                                end if;		  		 
                                read_state_machine                      <= READ_OPS_DONE;
                            else
                                warp_id_i                               <= warp_id_in;
                                warp_id_addr                            <= conv_integer(warp_id_in);
                                warp_lane_id_i                          <= warp_lane_id_in;
                                base_addr_i							    <= gprs_base_addr_in;
                                cta_id_i                                <= cta_id_in;
                                shmem_base_addr_i                       <= shmem_base_addr_in;
                                gprs_size_i                             <= gprs_size_in;
                                instr_opcode_type_i                     <= instr_opcode_type_in;
                                instr_subop_type_i                      <= instr_subop_type_in;
                                alu_opcode_i                            <= alu_opcode_in;
                                flow_opcode_type_i                      <= flow_opcode_type_in;
                                mov_opcode_type_i                       <= mov_opcode_type_in;
                                instr_marker_type_i                     <= instr_marker_type_in;
                                set_pred_i                              <= set_pred_in;
                                set_pred_reg_i                          <= set_pred_reg_in;
                                write_pred_i                            <= write_pred_in;
                                is_full_normal_i                        <= is_full_normal_in;
                                is_signed_i                             <= is_signed_in;
                                w32_i                                   <= w32_in;
                                f64_i                                   <= f64_in;
                                saturate_i                              <= saturate_in;
                                abs_saturate_i                          <= abs_saturate_in;
                                cvt_round_i                             <= cvt_round_in;
                                cvt_type_i                              <= cvt_type_in;
                                cvt_neg_i                               <= cvt_neg_in;
                                condition_i                             <= condition_in;
                                addr_hi_i                               <= addr_hi_in;
                                addr_lo_i                               <= addr_lo_in;
                                hi_i                                    <= hi_in;
                                addr_incr_i                             <= addr_incr_in;
                                imm_hi_i                                <= imm_hi_in;
                                addr_imm_i                              <= addr_imm_in;
                                src1_shared_i                           <= src1_shared_in;
                                src1_mem_type_i                         <= src1_mem_type_in;
                                src2_mem_type_i                         <= src2_mem_type_in;
                                src3_mem_type_i                         <= src3_mem_type_in;
                                dest_mem_type_i                         <= dest_mem_type_in;
                                src1_mem_opcode_type_i                  <= src1_mem_opcode_type_in;
                                src2_mem_opcode_type_i                  <= src2_mem_opcode_type_in;
                                src3_mem_opcode_type_i                  <= src3_mem_opcode_type_in;
                                dest_mem_opcode_type_i                  <= dest_mem_opcode_type_in;
                                src1_neg_i                              <= src1_neg_in;
                                src2_neg_i                              <= src2_neg_in;
                                src3_neg_i                              <= src3_neg_in;
                                target_addr_i                           <= target_addr_in;
                                src1_data_type_i                        <= src1_data_type_in;
                                src2_data_type_i                        <= src2_data_type_in;
                                src3_data_type_i                        <= src3_data_type_in;
                                dest_data_type_i                        <= dest_data_type_in;
                                warp_div_req_out                        <= '0';
                                warp_div_ack_out                        <= '0';
                                pred_cond_i                             <= pred_cond_in;
                                pred_reg_i                              <= pred_reg_in;
                                sm_type_i                               <= sm_type_in;
                                mem_type_i                              <= mem_type_in;
                                mov_size_i                              <= mov_size_in;
                                src1_addr_i                             <= src1_in;
                                src2_addr_i                             <= src2_in;
                                src3_addr_i                             <= src3_in;
                                dest_i                                  <= dest_in;
                                const_segment_i                         <= const_segment_in;
                                pred_flags_i                            <= (others => (others => '0'));
                                if (warp_lane_id_in = "00") then
                                    current_mask_i                      <= current_mask_in;
                                    initial_mask_i                      <= initial_mask_in;
                                    next_pc                             <= next_pc_in;
                                    if (instr_opcode_type_in = FLOW) then
                                        if (pred_cond_in = "01111") then -- CD_TR
                                            arb_pred_regs_req(0)        <= '0';
                                            pred_mask                   <= x"FFFFFFFF";
                                            read_state_machine          <= CALC_MASK;
                                        else
                                            arb_pred_regs_req(0)        <= '1';
                                            pred_regs_cntr              <= pred_regs_cntr + "01";
                                            read_state_machine          <= PRED_REGS_MASK_REQUEST;
                                        end if;
                                    else
                                        if ((instr_marker_type_in = IMM) or (instr_marker_type_in = HALF)) then
                                            arb_pred_regs_req(0)        <= '0';
                                            pred_mask                   <= x"FFFFFFFF";
                                            read_state_machine          <= CALC_MASK;
                                        else
                                            arb_pred_regs_req(0)        <= '1';
                                            pred_regs_cntr              <= pred_regs_cntr + "01";
                                            read_state_machine          <= PRED_REGS_MASK_REQUEST;
                                        end if;
                                    end if;
                                else
                                    arb_pred_regs_req(0)                <= '0';
                                    read_state_machine                  <= CHECK_PRED_FLAGS;
                                end if;
                            end if;
                        else
                            pipeline_stall_out                          <= '0';
									 read_status <= '0';
                        end if;
                        
                    when PRED_REGS_MASK_REQUEST =>
                        if (arb_pred_regs_grant(0) = '1') then
                            arb_pred_regs_req(0)                        <= '0';
                            pred_regs_en                                <= '1';
                            pred_regs_reg_num                           <= pred_reg_in;
                            pred_regs_rd_wr_en                          <= '0';
                            pred_regs_wr_data                           <= (others => (others => '0'));
                            --pred_regs_cntr                              <= pred_regs_cntr + "01";
                            read_state_machine                          <= READ_PRED_REGS_MASK;
                        end if;
                        
                    when READ_PRED_REGS_MASK =>
                        if (pred_regs_rdy_o = '1') then
                            if (warp_lane_id_i = "00") then
                                for i in 0 to CORES-1 loop
                                    pred_regs_data(i)                   <= pred_regs_rd_data(i);
                                end loop;
--                                pred_regs_data(0)                       <= pred_regs_rd_data(0);
--                                pred_regs_data(1)                       <= pred_regs_rd_data(1);
--                                pred_regs_data(2)                       <= pred_regs_rd_data(2);
--                                pred_regs_data(3)                       <= pred_regs_rd_data(3);
--                                pred_regs_data(4)                       <= pred_regs_rd_data(4);
--                                pred_regs_data(5)                       <= pred_regs_rd_data(5);
--                                pred_regs_data(6)                       <= pred_regs_rd_data(6);
--                                pred_regs_data(7)                       <= pred_regs_rd_data(7);
                                if (CORES = 16) then
--                                     pred_regs_data(8)                  <= pred_regs_rd_data(8);
--                                     pred_regs_data(9)                  <= pred_regs_rd_data(9);
--                                     pred_regs_data(10)                 <= pred_regs_rd_data(10);
--                                     pred_regs_data(11)                 <= pred_regs_rd_data(11);
--                                     pred_regs_data(12)                 <= pred_regs_rd_data(12);
--                                     pred_regs_data(13)                 <= pred_regs_rd_data(13);
--                                     pred_regs_data(14)                 <= pred_regs_rd_data(14);
--                                     pred_regs_data(15)                 <= pred_regs_rd_data(15);
                                     pred_regs_en                       <= '1';
                                     warp_lane_id_i                     <= pred_regs_cntr(1 downto 0);
                                     pred_regs_cntr                     <= pred_regs_cntr + "01";
                                 elsif (CORES = 32) then
--                                     pred_regs_data(8)                  <= pred_regs_rd_data(8);
--                                     pred_regs_data(9)                  <= pred_regs_rd_data(9);
--                                     pred_regs_data(10)                 <= pred_regs_rd_data(10);
--                                     pred_regs_data(11)                 <= pred_regs_rd_data(11);
--                                     pred_regs_data(12)                 <= pred_regs_rd_data(12);
--                                     pred_regs_data(13)                 <= pred_regs_rd_data(13);
--                                     pred_regs_data(14)                 <= pred_regs_rd_data(14);
--                                     pred_regs_data(15)                 <= pred_regs_rd_data(15);
--                                     pred_regs_data(16)                 <= pred_regs_rd_data(16);
--                                     pred_regs_data(17)                 <= pred_regs_rd_data(17);
--                                     pred_regs_data(18)                 <= pred_regs_rd_data(18);
--                                     pred_regs_data(19)                 <= pred_regs_rd_data(19);
--                                     pred_regs_data(20)                 <= pred_regs_rd_data(20);
--                                     pred_regs_data(21)                 <= pred_regs_rd_data(21);
--                                     pred_regs_data(22)                 <= pred_regs_rd_data(22);
--                                     pred_regs_data(23)                 <= pred_regs_rd_data(23);
--                                     pred_regs_data(24)                 <= pred_regs_rd_data(24);
--                                     pred_regs_data(25)                 <= pred_regs_rd_data(25);
--                                     pred_regs_data(26)                 <= pred_regs_rd_data(26);
--                                     pred_regs_data(27)                 <= pred_regs_rd_data(27);
--                                     pred_regs_data(28)                 <= pred_regs_rd_data(28);
--                                     pred_regs_data(29)                 <= pred_regs_rd_data(29);
--                                     pred_regs_data(30)                 <= pred_regs_rd_data(30);
--                                     pred_regs_data(31)                 <= pred_regs_rd_data(31);
                                    pred_regs_en                        <= '0';
                                    arb_pred_regs_ack_o(0)              <= '1';
                                    pred_regs_cntr                      <= (others => '0');
                                    warp_lane_id_i                      <= warp_lane_id_in;
                                    read_state_machine                  <= WAIT_PRED_LUT_DATA;
                                else
                                    pred_regs_en                        <= '1';
                                    warp_lane_id_i                      <= pred_regs_cntr(1 downto 0);
                                    pred_regs_cntr                      <= pred_regs_cntr + "01";
                                end if;
                            elsif (warp_lane_id_i = "01") then
                                if (CORES = 16) then
                                    for i in 0 to 15 loop
                                        pred_regs_data(16+i)               <= pred_regs_rd_data(i);
                                    end loop;
--                                    pred_regs_data(16)                  <= pred_regs_rd_data(0);
--                                    pred_regs_data(17)                  <= pred_regs_rd_data(1);
--                                    pred_regs_data(18)                  <= pred_regs_rd_data(2);
--                                    pred_regs_data(19)                  <= pred_regs_rd_data(3);
--                                    pred_regs_data(20)                  <= pred_regs_rd_data(4);
--                                    pred_regs_data(21)                  <= pred_regs_rd_data(5);
--                                    pred_regs_data(22)                  <= pred_regs_rd_data(6);
--                                    pred_regs_data(23)                  <= pred_regs_rd_data(7);
--                                    pred_regs_data(24)                  <= pred_regs_rd_data(8);
--                                    pred_regs_data(25)                  <= pred_regs_rd_data(9);
--                                    pred_regs_data(26)                  <= pred_regs_rd_data(10);
--                                    pred_regs_data(27)                  <= pred_regs_rd_data(11);
--                                    pred_regs_data(28)                  <= pred_regs_rd_data(12);
--                                    pred_regs_data(29)                  <= pred_regs_rd_data(13);
--                                    pred_regs_data(30)                  <= pred_regs_rd_data(14);
--                                    pred_regs_data(31)                  <= pred_regs_rd_data(15);
                                    pred_regs_en                        <= '0';
                                    arb_pred_regs_ack_o(0)              <= '1';
                                    pred_regs_cntr                      <= (others => '0');
                                    warp_lane_id_i                      <= warp_lane_id_in;
                                    read_state_machine                  <= WAIT_PRED_LUT_DATA;
                                 else
                                    for i in 0 to 7 loop
                                        pred_regs_data(8+i)             <= pred_regs_rd_data(i);
                                    end loop;
--                                     pred_regs_data(8)                  <= pred_regs_rd_data(0);
--                                     pred_regs_data(9)                  <= pred_regs_rd_data(1);
--                                     pred_regs_data(10)                 <= pred_regs_rd_data(2);
--                                     pred_regs_data(11)                 <= pred_regs_rd_data(3);
--                                     pred_regs_data(12)                 <= pred_regs_rd_data(4);
--                                     pred_regs_data(13)                 <= pred_regs_rd_data(5);
--                                     pred_regs_data(14)                 <= pred_regs_rd_data(6);
--                                     pred_regs_data(15)                 <= pred_regs_rd_data(7);
                                     pred_regs_en                       <= '1';
                                     warp_lane_id_i                     <= pred_regs_cntr(1 downto 0);
                                     pred_regs_cntr                     <= pred_regs_cntr + "01";
                                 end if;
                            elsif (warp_lane_id_i = "10") then
                                for i in 0 to 7 loop
                                    pred_regs_data(16+i)                <= pred_regs_rd_data(i);
                                end loop;
--                                pred_regs_data(16)                      <= pred_regs_rd_data(0);
--                                pred_regs_data(17)                      <= pred_regs_rd_data(1);
--                                pred_regs_data(18)                      <= pred_regs_rd_data(2);
--                                pred_regs_data(19)                      <= pred_regs_rd_data(3);
--                                pred_regs_data(20)                      <= pred_regs_rd_data(4);
--                                pred_regs_data(21)                      <= pred_regs_rd_data(5);
--                                pred_regs_data(22)                      <= pred_regs_rd_data(6);
--                                pred_regs_data(23)                      <= pred_regs_rd_data(7);
                                pred_regs_en                            <= '1';
                                warp_lane_id_i                          <= pred_regs_cntr(1 downto 0);
                                pred_regs_cntr                          <= pred_regs_cntr + "01";
                            else
                                for i in 0 to 7 loop
                                    pred_regs_data(24+i)                <= pred_regs_rd_data(i);
                                end loop;
--                                pred_regs_data(24)                      <= pred_regs_rd_data(0);
--                                pred_regs_data(25)                      <= pred_regs_rd_data(1);
--                                pred_regs_data(26)                      <= pred_regs_rd_data(2);
--                                pred_regs_data(27)                      <= pred_regs_rd_data(3);
--                                pred_regs_data(28)                      <= pred_regs_rd_data(4);
--                                pred_regs_data(29)                      <= pred_regs_rd_data(5);
--                                pred_regs_data(30)                      <= pred_regs_rd_data(6);
--                                pred_regs_data(31)                      <= pred_regs_rd_data(7);
                                pred_regs_en                            <= '0';
                                arb_pred_regs_ack_o(0)                  <= '1';
                                pred_regs_cntr                          <= (others => '0');
                                warp_lane_id_i                          <= warp_lane_id_in;
                                read_state_machine                      <= WAIT_PRED_LUT_DATA;
                            end if;
                        else
                            pred_regs_en                                <= '0';
                        end if;
                              
                        when WAIT_PRED_LUT_DATA =>
                            read_state_machine                          <= GET_PRED_REGS_MASK;
                              
                    when GET_PRED_REGS_MASK =>
                        arb_pred_regs_ack_o(0)                          <= '0';
                        pred_mask                                       <= pred_lut_data_o;
                        read_state_machine                              <= CALC_MASK;
                              
                    when CALC_MASK =>
                        instruction_mask_i                              <= current_mask_i and pred_mask;
                        read_state_machine                              <= CHECK_JOIN;
                              
                    when CHECK_JOIN =>
                        if (instr_marker_type_in = FULL_JOIN) then
                            if (warp_div_stack_empty(warp_id_addr) = '1') then
                                current_mask_i                          <= initial_mask_i;
                                instruction_mask_i                      <= initial_mask_i;
                                read_state_machine                      <= CHECK_PRED_FLAGS;
                            else
                                warp_div_req_out                        <= '1';
                                read_state_machine                      <= REQUEST_STACK;
                            end if;
                        else
                            read_state_machine                          <= CHECK_PRED_FLAGS;
                        end if;
                              
                    when REQUEST_STACK =>
                        if (warp_div_grant_in = '1') then
                            warp_div_req_out                            <= '0';
                            warp_div_stack_en(warp_id_addr)             <= '1';
                            warp_div_push_en(warp_id_addr)              <= '0';
                            read_state_machine                          <= READ_STACK_WAIT;
                        end if;
                             
                    when READ_STACK_WAIT =>
                            warp_div_stack_en(warp_id_addr)             <= '0';
                            read_state_machine                          <= READ_STACK;
                              
                    when READ_STACK =>
                        warp_div_ack_out                                <= '1';
                        warp_div_stack_en(warp_id_addr)                 <= '0';
                        current_mask_i                                  <= warp_div_rd_data_in(warp_id_addr)(65 downto 34);
                        if (warp_div_rd_data_in(warp_id_addr)(33 downto 32) = encode_warp_stack_token(ID_SYNC)) then
                            instruction_mask_i                          <= warp_div_rd_data_in(warp_id_addr)(65 downto 34);
                        elsif (warp_div_stack_empty(warp_id_addr) = '0') then    --MM: Modified to pop the diverged branch addresses.
                            next_pc                                     <= warp_div_rd_data_in(warp_id_addr)(31 downto 0);
                            instruction_mask_i                          <= warp_div_rd_data_in(warp_id_addr)(65 downto 34);
                        else
                            instruction_mask_i                          <= x"00000000";
                        end if;
                        read_state_machine                              <= CHECK_PRED_FLAGS;
                              
                    when CHECK_PRED_FLAGS =>
                        warp_div_ack_out                                <= '0';
                        if (alu_opcode_in = IADDC) then
                            pred_regs_reg_num                           <= "00";
                            arb_pred_regs_req(0)                        <= '1';
                            read_state_machine                          <= PRED_REGS_FLAGS_REQUEST;
                        elsif (alu_opcode_in = IMAD24C) then
                            pred_regs_reg_num                           <= "01";
                            arb_pred_regs_req(0)                        <= '1';
                            read_state_machine                          <= PRED_REGS_FLAGS_REQUEST;
                        else
                            arb_pred_regs_req(0)                        <= '0';
                            if (instr_opcode_type_in = FLOW) then
                                read_state_machine                      <= READ_OPS_DONE;
                            else
                                read_state_machine                      <= READ_OPS;
                            end if;
                        end if;
                              
                    when PRED_REGS_FLAGS_REQUEST =>
                        if (arb_pred_regs_grant(0) = '1') then
                            arb_pred_regs_req(0)                        <= '0';
                            pred_regs_en                                <= '1';
                            pred_regs_rd_wr_en                          <= '0';
                            pred_regs_wr_data                           <= (others => (others => '0'));
                            read_state_machine                          <= READ_PRED_REGS_FLAGS;
                        end if;
                              
                    when READ_PRED_REGS_FLAGS =>
                        if (pred_regs_rdy_o = '1') then
                            pred_flags_i                                <= pred_regs_rd_data;
                            pred_regs_en                                <= '0';
                            arb_pred_regs_ack_o(0)                      <= '1';
                            if (instr_opcode_type_in = FLOW) then
                                read_state_machine                      <= READ_OPS_DONE;
                            else
                                read_state_machine                      <= READ_OPS;
                            end if;
                        end if;
                              
                    when READ_OPS =>
							
                        arb_pred_regs_ack_o(0)                          <= '0';
								--if((src1_mem_type_in = MAILBOX_BUF) and (mov_opcode_type_in = RECV)) then
								--src1_read_en                                    <= '0';
                        --src2_read_en                                    <= '0';
                        --src3_read_en                                    <= '0';
								--else
                        src1_read_en                                    <= '1';
                        src2_read_en                                    <= '1';
                        src3_read_en                                    <= '1';
								--end if;
								
                        read_state_machine                              <= READ_OPS_WAIT;
                              
                    when READ_OPS_WAIT =>
                        src1_read_en                                    <= '0';
                        src2_read_en                                    <= '0';
                        src3_read_en                                    <= '0';
                        
								if((src1_mem_type_in = MAILBOX_BUF) and (mov_opcode_type_in = RECV)) then
								
									if(mailbox_state_machine = DONE) then
										for i in 0 to CORES-1 loop
                                temp_vector_register_i(i)(0) <=  mailbox_temp(i);
										  end loop;
										read_state_machine    <= READ_OPS_DONE;
									end if;
								else
								if (src1_rdy_o = '1') then
                            src1_rdy_reg                                <= '1';
                        end if;
                        if (src2_rdy_o = '1') then
                            src2_rdy_reg                                <= '1';
                        end if;
                        if (src3_rdy_o = '1') then
                            src3_rdy_reg                                <= '1';
                        end if;
                        if (src1_rdy_reg = '1' and src2_rdy_reg = '1' and src3_rdy_reg = '1') then
                            src1_rdy_reg                                <= '0';
                            src2_rdy_reg                                <= '0';
                            src3_rdy_reg                                <= '0';
									 
									-- if((src1_mem_type_in = MAILBOX_BUF) and (mov_opcode_type_in = RECV)) then
								
									  --  if(mailbox_state_machine = DONE) then
										 --   for i in 0 to CORES-1 loop
                                 --    temp_vector_register_i(i)(0) <=  mailbox_temp(i);
								 	     	--end loop;
									    	--read_state_machine    <= READ_OPS_DONE;
									     --end if;
								  	--else
									
                            for i in 0 to CORES-1 loop
                                temp_vector_register_i(i)(0)		    <= src1_data_o(i);
                                temp_vector_register_i(i)(2)			<= src2_data_o(i);
                                temp_vector_register_i(i)(4)			<= src3_data_o(i);
                            end loop;
									 read_state_machine                          <= READ_OPS_DONE;
									 --end if;
									 
                            --read_state_machine                          <= READ_OPS_DONE;
								end if;
								
                        end if;
                              
                    when READ_OPS_DONE =>
                        if (pipeline_stall_in = '0') then
                            warp_id_out                                 <= warp_id_i;
                            warp_lane_id_out                            <= warp_lane_id_i;
                            cta_id_out                                  <= cta_id_i;
                            current_mask_out                            <= current_mask_i;
                            initial_mask_out                            <= initial_mask_i;
                            shmem_base_addr_out                         <= shmem_base_addr_i;
                            gprs_size_out                               <= gprs_size_i;
                            gprs_addr_out							   	<= base_addr_i;
                            next_pc_out                                 <= next_pc;
                            arb_pred_regs_ack_o(0)                      <= '0';
                            instruction_mask_out                        <= instruction_mask_i;
                            instr_opcode_type_out                       <= instr_opcode_type_i;
                            instr_subop_type_out                        <= instr_subop_type_i;
                            alu_opcode_out                              <= alu_opcode_i;
                            flow_opcode_type_out                        <= flow_opcode_type_i;
                            mov_opcode_type_out                         <= mov_opcode_type_i;
                            instr_marker_type_out                       <= instr_marker_type_i;
                            set_pred_out                                <= set_pred_i;
                            set_pred_reg_out                            <= set_pred_reg_i;
                            write_pred_out                              <= write_pred_i;
                            is_full_normal_out                          <= is_full_normal_i;
                            is_signed_out                               <= is_signed_i;
                            w32_out                                     <= w32_i;
                            f64_out                                     <= f64_i;
                            saturate_out                                <= saturate_i;
                            abs_saturate_out                            <= abs_saturate_i;
                            cvt_round_out                               <= cvt_round_i;
                            cvt_type_out                                <= cvt_type_i;
                            cvt_neg_out                                 <= cvt_neg_i;
                            condition_out                               <= condition_i;
                            addr_hi_out                                 <= addr_hi_i;
                            addr_lo_out                                 <= addr_lo_i;
                            addr_incr_out                               <= addr_incr_i;
                            mov_size_out                                <= mov_size_i;
                            mem_type_out                                <= mem_type_i;
                            sm_type_out                                 <= sm_type_i;
                            addr_imm_out                                <= addr_imm_i;
                            dest_mem_type_out                           <= dest_mem_type_i;
                            dest_mem_opcode_type_out                    <= dest_mem_opcode_type_i;
                            src1_neg_out                                <= src1_neg_i;
                            src2_neg_out                                <= src2_neg_i;
                            src3_neg_out                                <= src3_neg_i;
                            target_addr_out                             <= target_addr_i;
                            dest_data_type_out                          <= dest_data_type_i;
                            src1_out                                    <= src1_addr_i;
                            dest_out                                    <= dest_in;                               
                            pred_flags_out                              <= pred_flags_i;
                            temp_vector_register_out                    <= temp_vector_register_i;
                            pipeline_reg_ld                             <= '1';
                            read_state_machine                          <= IDLE;
                        end if;
                    when OTHERS =>
                        read_state_machine                              <= IDLE;
                end case;
            end if;
        end if;
    end process;
    
    gMask8: if (CORES = 8) generate 
        pMask8 : process(warp_lane_id_in)
        begin
            case warp_lane_id_in is
                when "00" =>
                    mask_i(7 downto 0)  <= instruction_mask_i(7 downto 0);
                when "01" =>
                    mask_i(7 downto 0)  <= instruction_mask_i(15 downto 8);
                when "10" =>
                    mask_i(7 downto 0)  <= instruction_mask_i(23 downto 16);
                when "11" =>
                    mask_i(7 downto 0)  <= instruction_mask_i(31 downto 24);
                when others =>
                    mask_i(7 downto 0)  <= instruction_mask_i(7 downto 0);
            end case;
        end process;
    end generate;
    
    gMask16: if (CORES = 16) generate 
        pMask16 : process(warp_lane_id_in)
        begin
            case warp_lane_id_in is
                when "00" =>
                    for i in 0 to CORES-1 loop
                        mask_i(i)       <= instruction_mask_i(i);
                    end loop;
                    --mask_i(CORES-1 downto 0)   <= instruction_mask_i(15 downto 0);
                when "01" =>
                    for i in 0 to CORES-1 loop
                        mask_i(i)       <= instruction_mask_i(i+16);
                    end loop;
                    --mask_i(CORES-1 downto 0)   <= instruction_mask_i(31 downto 16);
                when others =>
                    for i in 0 to CORES-1 loop
                        mask_i(i)       <= instruction_mask_i(i);
                    end loop;
                    --mask_i(CORES-1 downto 0)   <= instruction_mask_i(15 downto 0);
            end case;
        end process;
    end generate;
    
    gMask32: if (CORES = 32) generate
        mask_i          <= instruction_mask_i;
    end generate;
    
    uReadSource1 : read_source_ops
        generic map (
            SRC_NUM                             => 1
        )
        port map (
            reset                               => reset,
            clk_in                              => clk_in,
            
            en                                  => src1_read_en,
            
            instr_opcode_type_in                => instr_opcode_type_in,
            alu_opcode_in                       => alu_opcode_i,
            instr_marker_type_in                => instr_marker_type_in,
            
            addr_in                             => src1_addr_i,
            mask_in                             => mask_i,
            addr_reg_in                         => addr_reg_i,
            addr_imm_in                         => addr_imm_i,
            pred_reg_in                         => pred_reg_i,
            mov_size_in                         => mov_size_i,
            sm_type_in                          => sm_type_i,
            mem_type_in                         => mem_type_i,
            const_segment_in                    => const_segment_i,
            imm_hi_in                           => imm_hi_i,
            
            src_mem_type_in                     => src1_mem_type_in,
            src_data_type_in                    => src1_data_type_in,
            src_mem_opcode_type_in              => src1_mem_opcode_type_in,
            dest_mem_type_in           			=> dest_mem_type_in,
            
            gprs_req_out                        => arb_gprs_req(0),
            gprs_ack_out                        => arb_gprs_ack_o(0),
            gprs_grant_in                       => arb_gprs_grant(0),
            
            addr_regs_req_out                   => arb_addr_regs_req(0),
            addr_regs_ack_out                   => arb_addr_regs_ack_o(0),
            addr_regs_grant_in                  => arb_addr_regs_grant(0),
            
            pred_regs_req_out                   => arb_pred_regs_req(1),
            pred_regs_ack_out                   => arb_pred_regs_ack_o(1),
            pred_regs_grant_in                  => arb_pred_regs_grant(1),
            
            shmem_req_out                       => arb_shmem_req(0),
            shmem_ack_out                       => arb_shmem_ack_o(0),
            shmem_grant_in                      => arb_shmem_grant(0),
            
            cmem_req_out                        => arb_cmem_req(0),
            cmem_ack_out                        => arb_cmem_ack_o(0),
            cmem_grant_in                       => arb_cmem_grant(0),
            
            gmem_req_out                        => arb_gmem_req(0),
            gmem_ack_out                        => arb_gmem_ack_o(0),
            gmem_grant_in                       => arb_gmem_grant(0),
            
            lmem_req_out                        => arb_lmem_req(0),
            lmem_ack_out                        => arb_lmem_ack_o(0),
            lmem_grant_in                       => arb_lmem_grant(0),
            
            effaddr_gprs_req_out                => arb_gprs_req(3),
            effaddr_gprs_ack_out                => arb_gprs_ack_o(3),
            effaddr_gprs_grant_in               => arb_gprs_grant(3),
            
            effaddr_addr_regs_req_out           => arb_addr_regs_req(3),
            effaddr_addr_regs_ack_out           => arb_addr_regs_ack_o(3),
            effaddr_addr_regs_grant_in          => arb_addr_regs_grant(3),
            
            gprs_en_out                         => src1_gprs_en,
            gprs_reg_num_out                    => src1_gprs_reg_num,
            gprs_rd_wr_en_out                   => src1_gprs_rd_wr_en,
            gprs_wr_data_out                    => src1_gprs_wr_data,
            gprs_data_type_out                  => src1_gprs_data_type,
            gprs_mask_out                       => src1_gprs_mask,
            gprs_rd_data_in                     => src1_gprs_rd_data,
            gprs_rdy_in                         => src1_gprs_rdy,
            
            addr_regs_en_out                    => src1_addr_regs_en,
            addr_regs_reg_num_out               => src1_addr_regs_reg_num,
            addr_regs_rd_wr_en_out              => src1_addr_regs_rd_wr_en,
            addr_regs_wr_data_out               => src1_addr_regs_wr_data,
            addr_regs_rd_data_in                => src1_addr_regs_rd_data,
            addr_regs_rdy_in                    => src1_addr_regs_rdy,
            
            pred_regs_en_out                    => src1_pred_regs_en,
            pred_regs_reg_num_out               => src1_pred_regs_reg_num,
            pred_regs_rd_wr_en_out              => src1_pred_regs_rd_wr_en,
            pred_regs_wr_data_out               => src1_pred_regs_wr_data,
            pred_regs_rd_data_in                => src1_pred_regs_rd_data,
            pred_regs_rdy_in                    => src1_pred_regs_rdy,
            
            shmem_en_out                        => src1_shmem_en,
            shmem_addr_out                      => src1_shmem_addr,
            shmem_rd_wr_type_out                => src1_shmem_rd_wr_type,
            shmem_sm_type_out                   => src1_shmem_sm_type,
            shmem_mask_out                      => src1_shmem_mask,
            shmem_rd_data_in			        => src1_shmem_rd_data,
            shmem_rdy_in                        => src1_shmem_rdy,
            
            cmem_en_out                         => src1_cmem_en,
            cmem_addr_out                       => src1_cmem_addr,
            cmem_rd_wr_type_out                 => src1_cmem_rd_wr_type,
            cmem_sm_type_out                    => src1_cmem_sm_type,
            cmem_segment_out                    => src1_cmem_segment,
            cmem_mask_out                       => src1_cmem_mask,
            cmem_rd_data_in			            => src1_cmem_rd_data,
            cmem_rdy_in                         => src1_cmem_rdy,
            
            gmem_en_out                         => src1_gmem_en,
            gmem_addr_out                       => src1_gmem_addr,
            gmem_rd_wr_type_out                 => src1_gmem_rd_wr_type,
            gmem_data_type_out                  => src1_gmem_data_type,
            gmem_mask_out                       => src1_gmem_mask,
            gmem_rd_data_in			            => src1_gmem_rd_data,
            gmem_rdy_in                         => src1_gmem_rdy,
            
            lmem_en_out                         => src1_lmem_en,
            lmem_addr_out                       => src1_lmem_addr,
            lmem_rd_wr_type_out                 => src1_lmem_rd_wr_type,
            lmem_data_type_out                  => src1_lmem_data_type,
            lmem_mask_out                       => src1_lmem_mask,
            lmem_rd_data_in			            => src1_lmem_rd_data,
            lmem_rdy_in                         => src1_lmem_rdy,
            
            effaddr_gprs_en_out                 => src1_effaddr_gprs_en,
            effaddr_gprs_reg_num_out            => src1_effaddr_gprs_reg_num,
            effaddr_gprs_data_type_out          => src1_effaddr_gprs_data_type,
            effaddr_gprs_mask_out               => src1_effaddr_gprs_mask,
            effaddr_gprs_rd_wr_en_out           => src1_effaddr_gprs_rd_wr_en,
            effaddr_gprs_rd_data_in             => src1_effaddr_gprs_rd_data,
            effaddr_gprs_rdy_in                 => src1_effaddr_gprs_rdy,
            
            effaddr_addr_regs_en_out            => src1_effaddr_addr_regs_en,
            effaddr_addr_regs_reg_out           => src1_effaddr_addr_regs_reg,
            effaddr_addr_regs_mask_out          => src1_effaddr_addr_regs_mask,
            effaddr_addr_regs_rd_wr_en_out      => src1_effaddr_addr_regs_rd_wr_en,
            effaddr_addr_regs_rd_data_in        => src1_effaddr_addr_regs_rd_data,
            effaddr_addr_regs_rdy_in            => src1_effaddr_addr_regs_rdy,
            
            data_out                            => src1_data_o,
            rdy_out                             => src1_rdy_o
        );
    
    uReadSource2 : read_source_ops
        generic map (
            SRC_NUM                             => 2
        )
        port map (
            reset                               => reset,
            clk_in                              => clk_in,
            
            en                                  => src2_read_en,
            
            instr_opcode_type_in                => instr_opcode_type_in,
            alu_opcode_in                       => alu_opcode_i,
            instr_marker_type_in                => instr_marker_type_in,
            
            addr_in                             => src2_addr_i,
            mask_in                             => mask_i,
            addr_reg_in                         => addr_reg_i,
            addr_imm_in                         => addr_imm_i,
            pred_reg_in                         => pred_reg_i,
            mov_size_in                         => mov_size_i,
            sm_type_in                          => sm_type_i,
            mem_type_in                         => mem_type_i,
            const_segment_in                    => const_segment_i,
            imm_hi_in                           => imm_hi_i,
            
            src_mem_type_in                     => src2_mem_type_in,
            src_data_type_in                    => src2_data_type_in,
            src_mem_opcode_type_in              => src2_mem_opcode_type_in,
            dest_mem_type_in           			=> dest_mem_type_in,
				
            gprs_req_out                        => arb_gprs_req(1),
            gprs_ack_out                        => arb_gprs_ack_o(1),
            gprs_grant_in                       => arb_gprs_grant(1),
            
            addr_regs_req_out                   => arb_addr_regs_req(1),
            addr_regs_ack_out                   => arb_addr_regs_ack_o(1),
            addr_regs_grant_in                  => arb_addr_regs_grant(1),
            
            pred_regs_req_out                   => arb_pred_regs_req(2),
            pred_regs_ack_out                   => arb_pred_regs_ack_o(2),
            pred_regs_grant_in                  => arb_pred_regs_grant(2),
            
            shmem_req_out                       => arb_shmem_req(1),
            shmem_ack_out                       => arb_shmem_ack_o(1),
            shmem_grant_in                      => arb_shmem_grant(1),
            
            cmem_req_out                        => arb_cmem_req(1),
            cmem_ack_out                        => arb_cmem_ack_o(1),
            cmem_grant_in                       => arb_cmem_grant(1),
            
            gmem_req_out                        => arb_gmem_req(1),
            gmem_ack_out                        => arb_gmem_ack_o(1),
            gmem_grant_in                       => arb_gmem_grant(1),
            
            lmem_req_out                        => arb_lmem_req(1),
            lmem_ack_out                        => arb_lmem_ack_o(1),
            lmem_grant_in                       => arb_lmem_grant(1),
            
            effaddr_gprs_req_out                => arb_gprs_req(4),
            effaddr_gprs_ack_out                => arb_gprs_ack_o(4),
            effaddr_gprs_grant_in               => arb_gprs_grant(4),
            
            effaddr_addr_regs_req_out           => arb_addr_regs_req(4),
            effaddr_addr_regs_ack_out           => arb_addr_regs_ack_o(4),
            effaddr_addr_regs_grant_in          => arb_addr_regs_grant(4),
            
            gprs_en_out                         => src2_gprs_en,
            gprs_reg_num_out                    => src2_gprs_reg_num,
            gprs_rd_wr_en_out                   => src2_gprs_rd_wr_en,
            gprs_wr_data_out                    => src2_gprs_wr_data,
            gprs_data_type_out                  => src2_gprs_data_type,
            gprs_mask_out                       => src2_gprs_mask,
            gprs_rd_data_in                     => src2_gprs_rd_data,
            gprs_rdy_in                         => src2_gprs_rdy,
            
            addr_regs_en_out                    => src2_addr_regs_en,
            addr_regs_reg_num_out               => src2_addr_regs_reg_num,
            addr_regs_rd_wr_en_out              => src2_addr_regs_rd_wr_en,
            addr_regs_wr_data_out               => src2_addr_regs_wr_data,
            addr_regs_rd_data_in                => src2_addr_regs_rd_data,
            addr_regs_rdy_in                    => src2_addr_regs_rdy,
           
            pred_regs_en_out                    => src2_pred_regs_en,
            pred_regs_reg_num_out               => src2_pred_regs_reg_num,
            pred_regs_rd_wr_en_out              => src2_pred_regs_rd_wr_en,
            pred_regs_wr_data_out               => src2_pred_regs_wr_data,
            pred_regs_rd_data_in                => src2_pred_regs_rd_data,
            pred_regs_rdy_in                    => src2_pred_regs_rdy,
            
            shmem_en_out                        => src2_shmem_en,
            shmem_addr_out                      => src2_shmem_addr,
            shmem_rd_wr_type_out                => src2_shmem_rd_wr_type,
            shmem_sm_type_out                   => src2_shmem_sm_type,
            shmem_mask_out                      => src2_shmem_mask,
            shmem_rd_data_in			        => src2_shmem_rd_data,
            shmem_rdy_in                        => src2_shmem_rdy,
            
            cmem_en_out                         => src2_cmem_en,
            cmem_addr_out                       => src2_cmem_addr,
            cmem_rd_wr_type_out                 => src2_cmem_rd_wr_type,
            cmem_sm_type_out                    => src2_cmem_sm_type,
            cmem_segment_out                    => src2_cmem_segment,
            cmem_mask_out                       => src2_cmem_mask,
            cmem_rd_data_in			            => src2_cmem_rd_data,
            cmem_rdy_in                         => src2_cmem_rdy,
            
            gmem_en_out                         => src2_gmem_en,
            gmem_addr_out                       => src2_gmem_addr,
            gmem_rd_wr_type_out                 => src2_gmem_rd_wr_type,
            gmem_data_type_out                  => src2_gmem_data_type,
            gmem_mask_out                       => src2_gmem_mask,
            gmem_rd_data_in			            => src2_gmem_rd_data,
            gmem_rdy_in                         => src2_gmem_rdy,
            
            lmem_en_out                         => src2_lmem_en,
            lmem_addr_out                       => src2_lmem_addr,
            lmem_rd_wr_type_out                 => src2_lmem_rd_wr_type,
            lmem_data_type_out                  => src2_lmem_data_type,
            lmem_mask_out                       => src2_lmem_mask,
            lmem_rd_data_in			            => src2_lmem_rd_data,
            lmem_rdy_in                         => src2_lmem_rdy,
            
            effaddr_gprs_en_out                 => src2_effaddr_gprs_en,
            effaddr_gprs_reg_num_out            => src2_effaddr_gprs_reg_num,
            effaddr_gprs_data_type_out          => src2_effaddr_gprs_data_type,
            effaddr_gprs_mask_out               => src2_effaddr_gprs_mask,
            effaddr_gprs_rd_wr_en_out           => src2_effaddr_gprs_rd_wr_en,
            effaddr_gprs_rd_data_in             => src2_effaddr_gprs_rd_data,
            effaddr_gprs_rdy_in                 => src2_effaddr_gprs_rdy,
            
            effaddr_addr_regs_en_out            => src2_effaddr_addr_regs_en,
            effaddr_addr_regs_reg_out           => src2_effaddr_addr_regs_reg,
            effaddr_addr_regs_mask_out          => src2_effaddr_addr_regs_mask,
            effaddr_addr_regs_rd_wr_en_out      => src2_effaddr_addr_regs_rd_wr_en,
            effaddr_addr_regs_rd_data_in        => src2_effaddr_addr_regs_rd_data,
            effaddr_addr_regs_rdy_in            => src2_effaddr_addr_regs_rdy,
            
            data_out                            => src2_data_o,
            rdy_out                             => src2_rdy_o
        );
     
     uReadSource3 : read_source_ops
        generic map (
            SRC_NUM                             => 3
        )
        port map (
            reset                               => reset,
            clk_in                              => clk_in,
            
            en                                  => src3_read_en,
            
            instr_opcode_type_in                => instr_opcode_type_in,
            alu_opcode_in                       => alu_opcode_i,
            instr_marker_type_in                => instr_marker_type_in,
            
            addr_in                             => src3_addr_i,
            mask_in                             => mask_i,
            addr_reg_in                         => addr_reg_i,
            addr_imm_in                         => addr_imm_i,
            pred_reg_in                         => pred_reg_i,
            mov_size_in                         => mov_size_i,
            sm_type_in                          => sm_type_i,
            mem_type_in                         => mem_type_i,
            const_segment_in                    => const_segment_i,
            imm_hi_in                           => imm_hi_i,
            
            src_mem_type_in                     => src3_mem_type_in,
            src_data_type_in                    => src3_data_type_in,
            src_mem_opcode_type_in              => src3_mem_opcode_type_in,
            dest_mem_type_in           			=> dest_mem_type_in,
            
            gprs_req_out                        => arb_gprs_req(2),
            gprs_ack_out                        => arb_gprs_ack_o(2),
            gprs_grant_in                       => arb_gprs_grant(2),
            
            addr_regs_req_out                   => arb_addr_regs_req(2),
            addr_regs_ack_out                   => arb_addr_regs_ack_o(2),
            addr_regs_grant_in                  => arb_addr_regs_grant(2),
            
            pred_regs_req_out                   => arb_pred_regs_req(3),
            pred_regs_ack_out                   => arb_pred_regs_ack_o(3),
            pred_regs_grant_in                  => arb_pred_regs_grant(3),
            
            shmem_req_out                       => arb_shmem_req(2),
            shmem_ack_out                       => arb_shmem_ack_o(2),
            shmem_grant_in                      => arb_shmem_grant(2),
            
            cmem_req_out                        => arb_cmem_req(2),
            cmem_ack_out                        => arb_cmem_ack_o(2),
            cmem_grant_in                       => arb_cmem_grant(2),
            
            gmem_req_out                        => arb_gmem_req(2),
            gmem_ack_out                        => arb_gmem_ack_o(2),
            gmem_grant_in                       => arb_gmem_grant(2),
            
            lmem_req_out                        => arb_lmem_req(2),
            lmem_ack_out                        => arb_lmem_ack_o(2),
            lmem_grant_in                       => arb_lmem_grant(2),
            
            effaddr_gprs_req_out                => arb_gprs_req(5),
            effaddr_gprs_ack_out                => arb_gprs_ack_o(5),
            effaddr_gprs_grant_in               => arb_gprs_grant(5),
            
            effaddr_addr_regs_req_out           => arb_addr_regs_req(5),
            effaddr_addr_regs_ack_out           => arb_addr_regs_ack_o(5),
            effaddr_addr_regs_grant_in          => arb_addr_regs_grant(5),
            
            gprs_en_out                         => src3_gprs_en,
            gprs_reg_num_out                    => src3_gprs_reg_num,
            gprs_rd_wr_en_out                   => src3_gprs_rd_wr_en,
            gprs_wr_data_out                    => src3_gprs_wr_data,
            gprs_data_type_out                  => src3_gprs_data_type,
            gprs_mask_out                       => src3_gprs_mask,
            gprs_rd_data_in                     => src3_gprs_rd_data,
            gprs_rdy_in                         => src3_gprs_rdy,
            
            addr_regs_en_out                    => src3_addr_regs_en,
            addr_regs_reg_num_out               => src3_addr_regs_reg_num,
            addr_regs_rd_wr_en_out              => src3_addr_regs_rd_wr_en,
            addr_regs_wr_data_out               => src3_addr_regs_wr_data,
            addr_regs_rd_data_in                => src3_addr_regs_rd_data,
            addr_regs_rdy_in                    => src3_addr_regs_rdy,
           
            pred_regs_en_out                    => src3_pred_regs_en,
            pred_regs_reg_num_out               => src3_pred_regs_reg_num,
            pred_regs_rd_wr_en_out              => src3_pred_regs_rd_wr_en,
            pred_regs_wr_data_out               => src3_pred_regs_wr_data,
            pred_regs_rd_data_in                => src3_pred_regs_rd_data,
            pred_regs_rdy_in                    => src3_pred_regs_rdy,
            
            shmem_en_out                        => src3_shmem_en,
            shmem_addr_out                      => src3_shmem_addr,
            shmem_rd_wr_type_out                => src3_shmem_rd_wr_type,
            shmem_sm_type_out                   => src3_shmem_sm_type,
            shmem_mask_out                      => src3_shmem_mask,
            shmem_rd_data_in			       	   => src3_shmem_rd_data,
            shmem_rdy_in                        => src3_shmem_rdy,
            
            cmem_en_out                         => src3_cmem_en,
            cmem_addr_out                       => src3_cmem_addr,
            cmem_rd_wr_type_out                 => src3_cmem_rd_wr_type,
            cmem_sm_type_out                    => src3_cmem_sm_type,
            cmem_segment_out                    => src3_cmem_segment,
            cmem_mask_out                       => src3_cmem_mask,
            cmem_rd_data_in			            => src3_cmem_rd_data,
            cmem_rdy_in                         => src3_cmem_rdy,
            
            gmem_en_out                         => src3_gmem_en,
            gmem_addr_out                       => src3_gmem_addr,
            gmem_rd_wr_type_out                 => src3_gmem_rd_wr_type,
            gmem_data_type_out                  => src3_gmem_data_type,
            gmem_mask_out                       => src3_gmem_mask,
            gmem_rd_data_in			            => src3_gmem_rd_data,
            gmem_rdy_in                         => src3_gmem_rdy,
            
            lmem_en_out                         => src3_lmem_en,
            lmem_addr_out                       => src3_lmem_addr,
            lmem_rd_wr_type_out                 => src3_lmem_rd_wr_type,
            lmem_data_type_out                  => src3_lmem_data_type,
            lmem_mask_out                       => src3_lmem_mask,
            lmem_rd_data_in			            => src3_lmem_rd_data,
            lmem_rdy_in                         => src3_lmem_rdy,
            
            effaddr_gprs_en_out                 => src3_effaddr_gprs_en,
            effaddr_gprs_reg_num_out            => src3_effaddr_gprs_reg_num,
            effaddr_gprs_data_type_out          => src3_effaddr_gprs_data_type,
            effaddr_gprs_mask_out               => src3_effaddr_gprs_mask,
            effaddr_gprs_rd_wr_en_out           => src3_effaddr_gprs_rd_wr_en,
            effaddr_gprs_rd_data_in             => src3_effaddr_gprs_rd_data,
            effaddr_gprs_rdy_in                 => src3_effaddr_gprs_rdy,
            
            effaddr_addr_regs_en_out            => src3_effaddr_addr_regs_en,
            effaddr_addr_regs_reg_out           => src3_effaddr_addr_regs_reg,
            effaddr_addr_regs_mask_out          => src3_effaddr_addr_regs_mask,
            effaddr_addr_regs_rd_wr_en_out      => src3_effaddr_addr_regs_rd_wr_en,
            effaddr_addr_regs_rd_data_in        => src3_effaddr_addr_regs_rd_data,
            effaddr_addr_regs_rdy_in            => src3_effaddr_addr_regs_rdy,
            
            data_out                            => src3_data_o,
            rdy_out                             => src3_rdy_o
        );
        
    uVectorRegisterArbiter : arbiter
        generic map ( 
            CNT                         => ARB_GPRS_CNT
        )
        port map (
            clk                         => clk_in,
            rst_n                       => not_reset,

            req                         => arb_gprs_req,
            ack                         => arb_gprs_ack,
            grant                       => arb_gprs_grant
        );
    
    arb_gprs_ack <= arb_gprs_ack_o(0) or arb_gprs_ack_o(1) or arb_gprs_ack_o(2) or arb_gprs_ack_o(3) or arb_gprs_ack_o(4) or
                    arb_gprs_ack_o(5) or arb_gprs_ack_o(6) or arb_gprs_ack_o(7) or arb_gprs_ack_o(8);
                    
    uVectorRegisterFileController : vector_register_controller
        port map (
            reset                       => reset,
            clk_in                      => clk_in,
            en                          => gprs_en_i_reg,
            
            lane_id_in                  => warp_lane_id_i,
            base_addr_in                => base_addr_i,
            reg_num_in                  => gprs_reg_num_i,
            data_in                     => gprs_data_i,
            data_type_in                => gprs_data_type_i,
            mask_in                     => gprs_mask_i,
            rd_wr_en_in                 => gprs_rd_wr_en_i,
            
            gprs_base_addr_out          => gprs_base_addr_out,
            gprs_reg_num_out            => gprs_reg_num_out,
            gprs_lane_id_out            => gprs_lane_id_out,
            gprs_wr_en_out              => gprs_wr_en_out,
            gprs_wr_data_out            => gprs_wr_data_out,
            gprs_rd_data_in             => gprs_rd_data_in,
            
            data_out                    => gprs_data_o,
            
            rdy_out                     => gprs_rdy_o
        );
    
	 pGrantRegister : process(clk_in)
	 begin
		if (rising_edge(clk_in)) then
            arb_pred_regs_grant1		  <= arb_pred_regs_grant;
			gprs_en_i_reg				  <= gprs_en_i;
		end if;
	 end process;

    gprs_en_i <= 
        src1_gprs_en                when (arb_gprs_grant(0) = '1') else
        src2_gprs_en                when (arb_gprs_grant(1) = '1') else
        src3_gprs_en                when (arb_gprs_grant(2) = '1') else
        src1_effaddr_gprs_en        when (arb_gprs_grant(3) = '1') else
        src2_effaddr_gprs_en        when (arb_gprs_grant(4) = '1') else
        src3_effaddr_gprs_en        when (arb_gprs_grant(5) = '1') else
        shmem_gprs_en               when (arb_gprs_grant(6) = '1') else
        cmem_gprs_en                when (arb_gprs_grant(7) = '1') else
        gmem_gprs_en                when (arb_gprs_grant(8) = '1') else
--        lmem_gprs_en                when (arb_gprs_grant(9) = '1') else
        '0';
    
    gprs_reg_num_i <=
        src1_gprs_reg_num           when (arb_gprs_grant(0) = '1') else
        src2_gprs_reg_num           when (arb_gprs_grant(1) = '1') else
        src3_gprs_reg_num           when (arb_gprs_grant(2) = '1') else
        src1_effaddr_gprs_reg_num   when (arb_gprs_grant(3) = '1') else
        src2_effaddr_gprs_reg_num   when (arb_gprs_grant(4) = '1') else
        src3_effaddr_gprs_reg_num   when (arb_gprs_grant(5) = '1') else
        shmem_gprs_reg_num          when (arb_gprs_grant(6) = '1') else
        cmem_gprs_reg_num           when (arb_gprs_grant(7) = '1') else
        gmem_gprs_reg_num           when (arb_gprs_grant(8) = '1') else
--        lmem_gprs_reg_num           when (arb_gprs_grant(9) = '1') else
        (others => '0');
    
    gprs_rd_wr_en_i <=  
        src1_gprs_rd_wr_en         when (arb_gprs_grant(0) = '1') else 
        src2_gprs_rd_wr_en         when (arb_gprs_grant(1) = '1') else 
        src3_gprs_rd_wr_en         when (arb_gprs_grant(2) = '1') else 
        '0';
    
    gprs_data_type_i <=
        src1_gprs_data_type         when (arb_gprs_grant(0) = '1') else
        src2_gprs_data_type         when (arb_gprs_grant(1) = '1') else
        src3_gprs_data_type         when (arb_gprs_grant(2) = '1') else
        src1_effaddr_gprs_data_type when (arb_gprs_grant(3) = '1') else
        src2_effaddr_gprs_data_type when (arb_gprs_grant(4) = '1') else
        src3_effaddr_gprs_data_type when (arb_gprs_grant(5) = '1') else
        shmem_gprs_data_type        when (arb_gprs_grant(6) = '1') else
        cmem_gprs_data_type         when (arb_gprs_grant(7) = '1') else
        gmem_gprs_data_type         when (arb_gprs_grant(8) = '1') else
--        lmem_gprs_data_type         when (arb_gprs_grant(9) = '1') else
        DT_U32;
    
    gprs_mask_i <=          
        src1_gprs_mask              when (arb_gprs_grant(0) = '1') else
        src2_gprs_mask              when (arb_gprs_grant(1) = '1') else
        src3_gprs_mask              when (arb_gprs_grant(2) = '1') else
        src1_effaddr_gprs_mask      when (arb_gprs_grant(3) = '1') else
        src2_effaddr_gprs_mask      when (arb_gprs_grant(4) = '1') else
        src3_effaddr_gprs_mask      when (arb_gprs_grant(5) = '1') else
        shmem_gprs_mask             when (arb_gprs_grant(6) = '1') else
        cmem_gprs_mask              when (arb_gprs_grant(7) = '1') else
        gmem_gprs_mask              when (arb_gprs_grant(8) = '1') else
--        lmem_gprs_mask              when (arb_gprs_grant(9) = '1') else
        (others => '0');
    
    gprs_data_i <= (others => (others => (others => '0')));
    
    src1_gprs_rd_data               <= gprs_data_o when (arb_gprs_grant(0) = '1') else (others => (others => (others => '0')));
    src2_gprs_rd_data               <= gprs_data_o when (arb_gprs_grant(1) = '1') else (others => (others => (others => '0')));
    src3_gprs_rd_data               <= gprs_data_o when (arb_gprs_grant(2) = '1') else (others => (others => (others => '0')));
    src1_effaddr_gprs_rd_data       <= gprs_data_o when (arb_gprs_grant(3) = '1') else (others => (others => (others => '0')));
    src2_effaddr_gprs_rd_data       <= gprs_data_o when (arb_gprs_grant(4) = '1') else (others => (others => (others => '0')));
    src3_effaddr_gprs_rd_data       <= gprs_data_o when (arb_gprs_grant(5) = '1') else (others => (others => (others => '0')));
    shmem_gprs_rd_data              <= gprs_data_o when (arb_gprs_grant(6) = '1') else (others => (others => (others => '0')));
    cmem_gprs_rd_data               <= gprs_data_o when (arb_gprs_grant(7) = '1') else (others => (others => (others => '0')));
    gmem_gprs_rd_data               <= gprs_data_o when (arb_gprs_grant(8) = '1') else (others => (others => (others => '0')));
--    lmem_gprs_rd_data               <= gprs_data_o when (arb_gprs_grant(9) = '1') else (others => (others => (others => '0')));
    
    src1_gprs_rdy                   <= gprs_rdy_o when (arb_gprs_grant(0) = '1') else '0';
    src2_gprs_rdy                   <= gprs_rdy_o when (arb_gprs_grant(1) = '1') else '0';
    src3_gprs_rdy                   <= gprs_rdy_o when (arb_gprs_grant(2) = '1') else '0';
    src1_effaddr_gprs_rdy           <= gprs_rdy_o when (arb_gprs_grant(3) = '1') else '0';
    src2_effaddr_gprs_rdy           <= gprs_rdy_o when (arb_gprs_grant(4) = '1') else '0';
    src3_effaddr_gprs_rdy           <= gprs_rdy_o when (arb_gprs_grant(5) = '1') else '0';
    shmem_gprs_rdy                  <= gprs_rdy_o when (arb_gprs_grant(6) = '1') else '0';
    cmem_gprs_rdy                   <= gprs_rdy_o when (arb_gprs_grant(7) = '1') else '0';
    gmem_gprs_rdy                   <= gprs_rdy_o when (arb_gprs_grant(8) = '1') else '0';
--    lmem_gprs_rdy                   <= gprs_rdy_o when (arb_gprs_grant(9) = '1') else '0';
    
    uPredicateRegisterArbiter : arbiter
        generic map ( 
            CNT                         => ARB_PRED_REGS_CNT
        )
        port map (
            clk                         => clk_in,
            rst_n                       => not_reset,

            req                         => arb_pred_regs_req,
            ack                         => arb_pred_regs_ack,
            grant                       => arb_pred_regs_grant
        );
    
    arb_pred_regs_ack <= arb_pred_regs_ack_o(0) or arb_pred_regs_ack_o(1) or arb_pred_regs_ack_o(2) or arb_pred_regs_ack_o(3);
    
    uPredicateRegsiterController : predicate_register_controller
        port map (
            reset                       => reset,
            clk_in                      => clk_in,
            
            en                          => pred_regs_en_i,
            
            warp_id_in                  => warp_id_i,
            lane_id_in                  => warp_lane_id_i,
            reg_num_in                  => pred_regs_reg_num_i,
            data_in                     => pred_regs_data_i,
			mask_in					    => pred_regs_mask_in,
            rd_wr_en_in                 => pred_regs_rd_wr_en_i,
            
            pred_regs_warp_id_out       => pred_regs_warp_id_out,
            pred_regs_warp_lane_id_out  => pred_regs_warp_lane_id_out,
            pred_regs_reg_num_out       => pred_regs_reg_num_out,
            pred_regs_wr_en_out         => pred_regs_wr_en_out,
            pred_regs_wr_data_out       => pred_regs_wr_data_out,
            pred_regs_rd_data_in        => pred_regs_rd_data_in,
            
            data_out                    => pred_regs_data_o,
            
            rdy_out                     => pred_regs_rdy_o
        );
    
    pred_regs_en_i <=
        pred_regs_en                when (arb_pred_regs_grant(0) = '1') else
        src1_pred_regs_en           when (arb_pred_regs_grant(1) = '1') else
        src2_pred_regs_en           when (arb_pred_regs_grant(2) = '1') else
        src3_pred_regs_en           when (arb_pred_regs_grant(3) = '1') else
        '0';
        
    pred_regs_reg_num_i <=
        pred_regs_reg_num           when (arb_pred_regs_grant(0) = '1') else
        src1_pred_regs_reg_num      when (arb_pred_regs_grant(1) = '1') else
        src2_pred_regs_reg_num      when (arb_pred_regs_grant(2) = '1') else
        src3_pred_regs_reg_num      when (arb_pred_regs_grant(3) = '1') else
        (others => '0');
        
    pred_regs_data_i <=
        pred_regs_wr_data           when (arb_pred_regs_grant(0) = '1') else
        src1_pred_regs_wr_data      when (arb_pred_regs_grant(1) = '1') else
        src2_pred_regs_wr_data      when (arb_pred_regs_grant(2) = '1') else
        src3_pred_regs_wr_data      when (arb_pred_regs_grant(3) = '1') else
        (others => (others => '0'));
        
    pred_regs_rd_wr_en_i <=
        pred_regs_rd_wr_en          when (arb_pred_regs_grant(0) = '1') else
        src1_pred_regs_rd_wr_en     when (arb_pred_regs_grant(1) = '1') else
        src2_pred_regs_rd_wr_en     when (arb_pred_regs_grant(2) = '1') else
        src3_pred_regs_rd_wr_en     when (arb_pred_regs_grant(3) = '1') else
        '0';


	src1_pred_regs_rdy				<=	pred_regs_rdy_o  when (arb_pred_regs_grant(1) = '1') else '0';
	src2_pred_regs_rdy				<=	pred_regs_rdy_o  when (arb_pred_regs_grant(2) = '1') else '0';
	src3_pred_regs_rdy				<=	pred_regs_rdy_o  when (arb_pred_regs_grant(3) = '1') else '0';

	 
    pred_regs_rd_data               <= pred_regs_data_o when (arb_pred_regs_grant(0) = '1') else (others => (others => '0'));
    src1_pred_regs_rd_data          <= pred_regs_data_o when (arb_pred_regs_grant(1) = '1') else (others => (others => '0'));
    src2_pred_regs_rd_data          <= pred_regs_data_o when (arb_pred_regs_grant(2) = '1') else (others => (others => '0'));
    src3_pred_regs_rd_data          <= pred_regs_data_o when (arb_pred_regs_grant(3) = '1') else (others => (others => '0'));
    
    uAddressRegisterArbiter : arbiter
        generic map ( 
            CNT                         => ARB_ADDR_REGS_CNT
        )
        port map (
            clk                         => clk_in,
            rst_n                       => not_reset,
    
            req                         => arb_addr_regs_req,
            ack                         => arb_addr_regs_ack,
            grant                       => arb_addr_regs_grant
        );
    
    arb_addr_regs_ack <= arb_addr_regs_ack_o(0) or arb_addr_regs_ack_o(1) or arb_addr_regs_ack_o(2) or arb_addr_regs_ack_o(3) or arb_addr_regs_ack_o(4) or
                         arb_addr_regs_ack_o(5) or arb_addr_regs_ack_o(6) or arb_addr_regs_ack_o(7) or arb_addr_regs_ack_o(8);
                         
    uAddressRegisterController : address_register_controller
        port map (
            reset                       => reset,
            clk_in                      => clk_in,
            
            en                          => addr_regs_en_i,
            
            warp_id_in                  => warp_id_i,
            lane_id_in                  => warp_lane_id_i,
            reg_num_in                  => addr_regs_num_i,
            data_in                     => addr_regs_data_i,
			mask_in					    => addr_regs_mask_in,
            rd_wr_en_in                 => addr_regs_rd_wr_en_i,
            
            addr_regs_warp_id_out       => addr_regs_warp_id_out,
            addr_regs_warp_lane_id_out  => addr_regs_warp_lane_id_out,
            addr_regs_reg_num_out       => addr_regs_reg_num_out,
            addr_regs_wr_en_out         => addr_regs_wr_en_out,
            addr_regs_wr_data_out       => addr_regs_wr_data_out,
            addr_regs_rd_data_in        => addr_regs_rd_data_in,
            
            data_out                    => addr_regs_data_o,
            
            rdy_out                     => addr_regs_rdy_o
        );
    
	 addr_regs_mask_in <= mask_i;
	 

    addr_regs_en_i <= 
        src1_addr_regs_en           when (arb_addr_regs_grant(0) = '1') else
        src2_addr_regs_en           when (arb_addr_regs_grant(1) = '1') else
        src3_addr_regs_en           when (arb_addr_regs_grant(2) = '1') else
        src1_effaddr_addr_regs_en   when (arb_addr_regs_grant(3) = '1') else
        src2_effaddr_addr_regs_en   when (arb_addr_regs_grant(4) = '1') else
        src3_effaddr_addr_regs_en   when (arb_addr_regs_grant(5) = '1') else
        shmem_addr_regs_en          when (arb_addr_regs_grant(6) = '1') else
        cmem_addr_regs_en           when (arb_addr_regs_grant(7) = '1') else
        gmem_addr_regs_en           when (arb_addr_regs_grant(8) = '1') else
--        lmem_addr_regs_en           when (arb_addr_regs_grant(9) = '1') else
        '0';
	 
    addr_regs_num_i <=
        src1_addr_regs_reg_num      when (arb_addr_regs_grant(0) = '1') else
        src2_addr_regs_reg_num      when (arb_addr_regs_grant(1) = '1') else
        src3_addr_regs_reg_num      when (arb_addr_regs_grant(2) = '1') else
        src1_effaddr_addr_regs_reg  when (arb_addr_regs_grant(3) = '1') else
        src2_effaddr_addr_regs_reg  when (arb_addr_regs_grant(4) = '1') else
        src3_effaddr_addr_regs_reg  when (arb_addr_regs_grant(5) = '1') else
        shmem_addr_regs_reg         when (arb_addr_regs_grant(6) = '1') else
        cmem_addr_regs_reg          when (arb_addr_regs_grant(7) = '1') else
        gmem_addr_regs_reg          when (arb_addr_regs_grant(8) = '1') else
--        lmem_addr_regs_reg          when (arb_addr_regs_grant(9) = '1') else
        (others => '0');
    
    addr_regs_rd_wr_en_i <=  
        src1_addr_regs_rd_wr_en         when (arb_addr_regs_grant(0) = '1') else 
        src2_addr_regs_rd_wr_en         when (arb_addr_regs_grant(1) = '1') else 
        src3_addr_regs_rd_wr_en         when (arb_addr_regs_grant(2) = '1') else 
        src1_effaddr_addr_regs_rd_wr_en when (arb_addr_regs_grant(3) = '1') else
        src2_effaddr_addr_regs_rd_wr_en when (arb_addr_regs_grant(4) = '1') else
        src3_effaddr_addr_regs_rd_wr_en when (arb_addr_regs_grant(5) = '1') else
        shmem_addr_regs_rd_wr_en        when (arb_addr_regs_grant(6) = '1') else
        cmem_addr_regs_rd_wr_en         when (arb_addr_regs_grant(7) = '1') else
        gmem_addr_regs_rd_wr_en         when (arb_addr_regs_grant(8) = '1') else
--        lmem_addr_regs_rd_wr_en         when (arb_addr_regs_grant(9) = '1') else
        '0';
    
    addr_regs_data_i <= (others => (others => '0'));
    
    src1_addr_regs_rd_data          <= addr_regs_data_o when (arb_addr_regs_grant(0) = '1') else (others => (others => '0'));
    src2_addr_regs_rd_data          <= addr_regs_data_o when (arb_addr_regs_grant(1) = '1') else (others => (others => '0'));
    src3_addr_regs_rd_data          <= addr_regs_data_o when (arb_addr_regs_grant(2) = '1') else (others => (others => '0'));
    src1_effaddr_addr_regs_rd_data  <= addr_regs_data_o when (arb_addr_regs_grant(3) = '1') else (others => (others => '0'));
    src2_effaddr_addr_regs_rd_data  <= addr_regs_data_o when (arb_addr_regs_grant(4) = '1') else (others => (others => '0'));
    src3_effaddr_addr_regs_rd_data  <= addr_regs_data_o when (arb_addr_regs_grant(5) = '1') else (others => (others => '0'));
    shmem_addr_regs_rd_data         <= addr_regs_data_o when (arb_addr_regs_grant(6) = '1') else (others => (others => '0'));
    cmem_addr_regs_rd_data          <= addr_regs_data_o when (arb_addr_regs_grant(7) = '1') else (others => (others => '0'));
    gmem_addr_regs_rd_data          <= addr_regs_data_o when (arb_addr_regs_grant(8) = '1') else (others => (others => '0'));
--    lmem_addr_regs_rd_data          <= addr_regs_data_o when (arb_addr_regs_grant(9) = '1') else (others => (others => '0'));
    
    src1_addr_regs_rdy              <= addr_regs_rdy_o when (arb_addr_regs_grant(0) = '1') else '0';
    src2_addr_regs_rdy              <= addr_regs_rdy_o when (arb_addr_regs_grant(1) = '1') else '0';
    src3_addr_regs_rdy              <= addr_regs_rdy_o when (arb_addr_regs_grant(2) = '1') else '0';
    src1_effaddr_addr_regs_rdy      <= addr_regs_rdy_o when (arb_addr_regs_grant(3) = '1') else '0';
    src2_effaddr_addr_regs_rdy      <= addr_regs_rdy_o when (arb_addr_regs_grant(4) = '1') else '0';
    src3_effaddr_addr_regs_rdy      <= addr_regs_rdy_o when (arb_addr_regs_grant(5) = '1') else '0';
    shmem_addr_regs_rdy             <= addr_regs_rdy_o when (arb_addr_regs_grant(6) = '1') else '0';
    cmem_addr_regs_rdy              <= addr_regs_rdy_o when (arb_addr_regs_grant(7) = '1') else '0';
    gmem_addr_regs_rdy              <= addr_regs_rdy_o when (arb_addr_regs_grant(8) = '1') else '0';
--    lmem_addr_regs_rdy              <= addr_regs_rdy_o when (arb_addr_regs_grant(9) = '1') else '0';
    
    uSharedMemoryArbiter : arbiter
        generic map ( 
            CNT                         => ARB_SHMEM_CNT
        )
        port map (
            clk                         => clk_in,
            rst_n                       => not_reset,

            req                         => arb_shmem_req,
            ack                         => arb_shmem_ack,
            grant                       => arb_shmem_grant
        );
    
    arb_shmem_ack <= arb_shmem_ack_o(0) or arb_shmem_ack_o(1) or arb_shmem_ack_o(2);
    
    uSharedMemoryController : shared_memory_controller
		generic map (
            ADDRESS_SIZE                => SHMEM_ADDR_SIZE,
            ARB_GPRS_EN                 => '1',
            ARB_ADDR_REGS_EN            => '1'
        )
		port map (
			reset                       => reset,
			clk_in                      => clk_in,
			en						    => shmem_en_i,
            
            data_in                     => shmem_wr_data_i,
            base_addr_in                => shmem_base_addr_i,
            addr_in						=> shmem_addr_i,
            mask_in                     => shmem_mask_i,
            rd_wr_type_in               => shmem_rd_wr_type_i,
            sm_type_in					=> shmem_sm_type_i,
            
			addr_lo_in					=> addr_lo_i,
			addr_hi_in					=> addr_hi_i,
			addr_imm_in					=> addr_imm_i,
			
            gprs_req_out                => arb_gprs_req(6),
            gprs_ack_out                => arb_gprs_ack_o(6),
            gprs_grant_in               => arb_gprs_grant(6),
            
            gprs_en_out                 => shmem_gprs_en,
            gprs_reg_num_out            => shmem_gprs_reg_num,
            gprs_data_type_out          => shmem_gprs_data_type,
            gprs_mask_out               => shmem_gprs_mask,
            gprs_rd_wr_en_out           => shmem_gprs_rd_wr_en,
            gprs_rd_data_in             => shmem_gprs_rd_data,
            gprs_rdy_in                 => shmem_gprs_rdy,
            
            addr_regs_req_out           => arb_addr_regs_req(6),
            addr_regs_ack_out           => arb_addr_regs_ack_o(6),
            addr_regs_grant_in          => arb_addr_regs_grant(6),
            
            addr_regs_en_out            => shmem_addr_regs_en,
            addr_regs_reg_out           => shmem_addr_regs_reg,
            addr_regs_mask_out          => shmem_addr_regs_mask,
            addr_regs_rd_wr_en_out      => shmem_addr_regs_rd_wr_en,
            addr_regs_rd_data_in        => shmem_addr_regs_rd_data,
            addr_regs_rdy_in            => shmem_addr_regs_rdy,
            
            shmem_addr_out              => shmem_addr_out,
            shmem_wr_en_out             => shmem_wr_en_out,
            shmem_wr_data_out           => shmem_wr_data_out,
            shmem_rd_data_in            => shmem_rd_data_in,
            
			data_out			        => shmem_rd_data_o,
			rdy_out		                => shmem_rdy_o
		);
    
    shmem_en_i <=
        src1_shmem_en                   when (arb_shmem_grant(0) = '1') else
        src2_shmem_en                   when (arb_shmem_grant(1) = '1') else
        src3_shmem_en                   when (arb_shmem_grant(2) = '1') else
        '0';
    
    shmem_wr_data_i     <= (others => (others => (others => '0')));
    
    shmem_rd_wr_type_i  <=
        src1_shmem_rd_wr_type           when (arb_shmem_grant(0) = '1') else
        src2_shmem_rd_wr_type           when (arb_shmem_grant(1) = '1') else
        src3_shmem_rd_wr_type           when (arb_shmem_grant(2) = '1') else
        READ;
    
    shmem_addr_i <=
        src1_shmem_addr                 when (arb_shmem_grant(0) = '1') else
        src2_shmem_addr                 when (arb_shmem_grant(1) = '1') else
        src3_shmem_addr                 when (arb_shmem_grant(2) = '1') else
        (others => '0');
    
    shmem_mask_i <=
        src1_shmem_mask                 when (arb_shmem_grant(0) = '1') else
        src2_shmem_mask                 when (arb_shmem_grant(1) = '1') else
        src3_shmem_mask                 when (arb_shmem_grant(2) = '1') else
        (others => '0');
    
    shmem_sm_type_i <=
        src1_shmem_sm_type              when (arb_shmem_grant(0) = '1') else
        src2_shmem_sm_type              when (arb_shmem_grant(1) = '1') else
        src3_shmem_sm_type              when (arb_shmem_grant(2) = '1') else
        SM_NONE;
        
    src1_shmem_rd_data                  <= shmem_rd_data_o when (arb_shmem_grant(0) = '1') else (others => (others => (others => '0')));
    src2_shmem_rd_data                  <= shmem_rd_data_o when (arb_shmem_grant(1) = '1') else (others => (others => (others => '0')));
    src3_shmem_rd_data                  <= shmem_rd_data_o when (arb_shmem_grant(2) = '1') else (others => (others => (others => '0')));
    
    src1_shmem_rdy                      <= shmem_rdy_o when (arb_shmem_grant(0) = '1') else '0';
    src2_shmem_rdy                      <= shmem_rdy_o when (arb_shmem_grant(1) = '1') else '0';
    src3_shmem_rdy                      <= shmem_rdy_o when (arb_shmem_grant(2) = '1') else '0';
    
    uConstantMemoryArbiter : arbiter
        generic map ( 
            CNT                         => ARB_CMEM_CNT
        )
        port map (
            clk                         => clk_in,
            rst_n                       => not_reset,

            req                         => arb_cmem_req,
            ack                         => arb_cmem_ack,
            grant                       => arb_cmem_grant
        );
    
    arb_cmem_ack <= arb_cmem_ack_o(0) or arb_cmem_ack_o(1) or arb_cmem_ack_o(2);
    
    uConstantMemoryController : constant_memory_controller
		generic map (
            ADDRESS_SIZE                => CMEM_ADDR_SIZE,
            ARB_GPRS_EN                 => '1',
            ARB_ADDR_REGS_EN            => '1'
        )
		port map (
            reset                       => reset,
            clk_in                      => clk_in,
            en						    => cmem_en_i,
			
            data_in                     => cmem_wr_data_i,
            addr_in                     => cmem_addr_i,
            mask_in                     => cmem_mask_i,
            rd_wr_type_in               => cmem_rd_wr_type_i,
            sm_type_in						 => cmem_sm_type_i,
            
            segment_in                  => cmem_segment_i,
            addr_lo_in				    => addr_lo_i,
            addr_hi_in					=> addr_hi_i,
            addr_imm_in					=> addr_imm_i,
			
            gprs_req_out                => arb_gprs_req(7),
            gprs_ack_out                => arb_gprs_ack_o(7),
            gprs_grant_in               => arb_gprs_grant(7),
            
            gprs_en_out                 => cmem_gprs_en,
            gprs_reg_num_out            => cmem_gprs_reg_num,
            gprs_data_type_out          => cmem_gprs_data_type,
            gprs_mask_out               => cmem_gprs_mask,
            gprs_rd_wr_en_out           => cmem_gprs_rd_wr_en,
            gprs_rd_data_in             => cmem_gprs_rd_data,
            gprs_rdy_in                 => cmem_gprs_rdy,
            
            addr_regs_req_out           => arb_addr_regs_req(7),
            addr_regs_ack_out           => arb_addr_regs_ack_o(7),
            addr_regs_grant_in          => arb_addr_regs_grant(7),
            
            addr_regs_en_out            => cmem_addr_regs_en,
            addr_regs_reg_out           => cmem_addr_regs_reg,
            addr_regs_mask_out          => cmem_addr_regs_mask,
            addr_regs_rd_wr_en_out      => cmem_addr_regs_rd_wr_en,
            addr_regs_rd_data_in        => cmem_addr_regs_rd_data,
            addr_regs_rdy_in            => cmem_addr_regs_rdy,
            
            cmem_addr_out               => cmem_addr_out,
            cmem_wr_en_out              => cmem_wr_en_out,
            cmem_wr_data_out            => cmem_wr_data_out,
            cmem_rd_data_in             => cmem_rd_data_in,
            
				data_out			       		 => cmem_rd_data_o,
				rdy_out		                => cmem_rdy_o
		);
    
    cmem_en_i <=
        src1_cmem_en                    when (arb_cmem_grant(0) = '1') else
        src2_cmem_en                    when (arb_cmem_grant(1) = '1') else
        src3_cmem_en                    when (arb_cmem_grant(2) = '1') else
        '0';
    
    cmem_rd_wr_type_i <=
        src1_cmem_rd_wr_type            when (arb_cmem_grant(0) = '1') else
        src2_cmem_rd_wr_type            when (arb_cmem_grant(1) = '1') else
        src3_cmem_rd_wr_type            when (arb_cmem_grant(2) = '1') else
        READ;
    
    cmem_addr_i(0)      <=
        src1_cmem_addr                  when (arb_cmem_grant(0) = '1') else
        src2_cmem_addr                  when (arb_cmem_grant(1) = '1') else
        src3_cmem_addr                  when (arb_cmem_grant(2) = '1') else
        (others => '0');
    
    cmem_sm_type_i  <=
        src1_cmem_sm_type               when (arb_cmem_grant(0) = '1') else
        src2_cmem_sm_type               when (arb_cmem_grant(1) = '1') else
        src3_cmem_sm_type               when (arb_cmem_grant(2) = '1') else
        SM_NONE;
        
    cmem_mask_i <=
        src1_cmem_mask                  when (arb_cmem_grant(0) = '1') else
        src2_cmem_mask                  when (arb_cmem_grant(1) = '1') else
        src3_cmem_mask                  when (arb_cmem_grant(2) = '1') else
        (others => '0');
    
    src1_cmem_rd_data                   <= cmem_rd_data_o when (arb_cmem_grant(0) = '1') else (others => (others => (others => '0')));
    src2_cmem_rd_data                   <= cmem_rd_data_o when (arb_cmem_grant(1) = '1') else (others => (others => (others => '0')));
    src3_cmem_rd_data                   <= cmem_rd_data_o when (arb_cmem_grant(2) = '1') else (others => (others => (others => '0')));
    
    src1_cmem_rdy                       <= cmem_rdy_o when (arb_cmem_grant(0) = '1') else '0';
    src2_cmem_rdy                       <= cmem_rdy_o when (arb_cmem_grant(1) = '1') else '0';
    src3_cmem_rdy                       <= cmem_rdy_o when (arb_cmem_grant(2) = '1') else '0';
    
    uGlobalMemoryArbiter : arbiter
        generic map ( 
            CNT                         => ARB_GMEM_CNT
        )
        port map (
            clk                         => clk_in,
            rst_n                       => not_reset,

            req                         => arb_gmem_req,
            ack                         => arb_gmem_ack,
            grant                       => arb_gmem_grant
        );
    
    arb_gmem_ack <= arb_gmem_ack_o(0) or arb_gmem_ack_o(1) or arb_gmem_ack_o(2);
    
    uGlobalMemoryController : global_memory_controller
		generic map (
            ADDRESS_SIZE                => GMEM_ADDR_SIZE,
            ARB_GPRS_EN                 => '1',
            ARB_ADDR_REGS_EN            => '1'
        )
		port map (
			reset                       => reset,
			clk_in                      => clk_in,
			en						   	=> gmem_en_i,
            
            data_in                     => gmem_wr_data_i,
            addr_in					    => gmem_addr_i,
            mask_in                     => gmem_mask_i,
			rd_wr_type_in               => gmem_rd_wr_type_i,
            data_type_in			    => gmem_data_type_i,
            
			addr_lo_in					=> addr_lo_i,
			addr_hi_in					=> addr_hi_i,
			addr_imm_in					=> addr_imm_i,
			
            gprs_req_out                => arb_gprs_req(8),
            gprs_ack_out                => arb_gprs_ack_o(8),
            gprs_grant_in               => arb_gprs_grant(8),
            
            gprs_en_out                 => gmem_gprs_en,
            gprs_reg_num_out            => gmem_gprs_reg_num,
            gprs_data_type_out          => gmem_gprs_data_type,
            gprs_mask_out               => gmem_gprs_mask,
            gprs_rd_wr_en_out           => gmem_gprs_rd_wr_en,
            gprs_rd_data_in             => gmem_gprs_rd_data,
            gprs_rdy_in                 => gmem_gprs_rdy,
            
            addr_regs_req_out           => arb_addr_regs_req(8),
            addr_regs_ack_out           => arb_addr_regs_ack_o(8),
            addr_regs_grant_in          => arb_addr_regs_grant(8),
            
            addr_regs_en_out            => gmem_addr_regs_en,
            addr_regs_reg_out           => gmem_addr_regs_reg,
            addr_regs_mask_out          => gmem_addr_regs_mask,
            addr_regs_rd_wr_en_out      => gmem_addr_regs_rd_wr_en,
            addr_regs_rd_data_in        => gmem_addr_regs_rd_data,
            addr_regs_rdy_in            => gmem_addr_regs_rdy,
            
            gmem_addr_out               => gmem_addr_out,
            gmem_wr_en_out              => gmem_wr_en_out,
            gmem_wr_data_out            => gmem_wr_data_out,
            gmem_rd_data_in             => gmem_rd_data_in,
            
			data_out			        => gmem_rd_data_o,
			rdy_out		                => gmem_rdy_o
		);
    
	 scroogie : mailbox_ram
  PORT MAP (
    clka => clk_in,
    wea => wea,
    addra => addra,
    dina => dina,
    douta => douta,
    clkb => clk_in,
    web => write_en_noc_ram_i,
    addrb => addr_noc_ram_i,
    dinb => data_noc_ram_i,
    doutb => doutb
  );
  

	
    gmem_en_i <=
        src1_gmem_en                    when (arb_gmem_grant(0) = '1') else
        src2_gmem_en                    when (arb_gmem_grant(1) = '1') else
        src3_gmem_en                    when (arb_gmem_grant(2) = '1') else
        '0';
    
    gmem_rd_wr_type_i <=
        src1_gmem_rd_wr_type            when (arb_gmem_grant(0) = '1') else
        src2_gmem_rd_wr_type            when (arb_gmem_grant(1) = '1') else
        src3_gmem_rd_wr_type            when (arb_gmem_grant(2) = '1') else
        READ;
    
    gmem_addr_i <=
        src1_gmem_addr                  when (arb_gmem_grant(0) = '1') else
        src2_gmem_addr                  when (arb_gmem_grant(1) = '1') else
        src3_gmem_addr                  when (arb_gmem_grant(2) = '1') else
        (others => '0');
    
    gmem_mask_i <=
        src1_gmem_mask                  when (arb_gmem_grant(0) = '1') else
        src2_gmem_mask                  when (arb_gmem_grant(1) = '1') else
        src3_gmem_mask                  when (arb_gmem_grant(2) = '1') else
        (others => '0');
    
    gmem_data_type_i    <=
        src1_gmem_data_type             when (arb_gmem_grant(0) = '1') else
        src2_gmem_data_type             when (arb_gmem_grant(1) = '1') else
        src3_gmem_data_type             when (arb_gmem_grant(2) = '1') else
        DT_NONE;
        
    src1_gmem_rd_data                   <= gmem_rd_data_o when (arb_gmem_grant(0) = '1') else (others => (others => (others => '0')));
    src2_gmem_rd_data                   <= gmem_rd_data_o when (arb_gmem_grant(1) = '1') else (others => (others => (others => '0')));
    src3_gmem_rd_data                   <= gmem_rd_data_o when (arb_gmem_grant(2) = '1') else (others => (others => (others => '0')));
    
    src1_gmem_rdy                       <= gmem_rdy_o when (arb_gmem_grant(0) = '1') else '0';
    src2_gmem_rdy                       <= gmem_rdy_o when (arb_gmem_grant(1) = '1') else '0';
    src3_gmem_rdy                       <= gmem_rdy_o when (arb_gmem_grant(2) = '1') else '0';
    
--    uLocalMemoryArbiter : arbiter
--        generic map ( 
--            CNT                         => ARB_LMEM_CNT
--        )
--        port map (
--            clk                         => clk_in,
--            rst_n                       => not_reset,
--
--            req                         => arb_lmem_req,
--            ack                         => arb_lmem_ack,
--            grant                       => arb_lmem_grant
--        );
--    
--    arb_lmem_ack <= arb_lmem_ack_o(0) or arb_lmem_ack_o(1) or arb_lmem_ack_o(2);
--    
--    uLocalMemoryController : local_memory_controller
--		generic map (
--            ADDRESS_SIZE                => LMEM_ADDR_SIZE,
--            ARB_GPRS_EN                 => '1',
--            ARB_ADDR_REGS_EN            => '1'
--        )
--		port map (
--			reset                       => reset,
--			clk_in                      => clk_in,
--			en						    => lmem_en_i,
--			
--            core_id_in                  => CORE_ID,
--            num_warps_in                => num_warps_i,
--            warp_id_in                  => warp_id_i,
--            warp_lane_id_in             => warp_lane_id_i,
--            
--            data_in                     => gmem_wr_data_i,
--            addr_in						=> lmem_addr_i,
--            mask_in                     => lmem_mask_i,
--            rd_wr_type_in               => lmem_rd_wr_type_i,
--            data_type_in			    => lmem_data_type_i,
--            
--			addr_lo_in					=> addr_lo_i,
--			addr_hi_in					=> addr_hi_i,
--			addr_imm_in					=> addr_imm_i,
--			
--            gprs_req_out                => arb_gprs_req(9),
--            gprs_ack_out                => arb_gprs_ack_o(9),
--            gprs_grant_in               => arb_gprs_req(9),
--            
--            gprs_en_out                 => lmem_gprs_en,
--            gprs_reg_num_out            => lmem_gprs_reg_num,
--            gprs_data_type_out          => lmem_gprs_data_type,
--            gprs_mask_out               => lmem_gprs_mask,
--            gprs_rd_wr_en_out           => lmem_gprs_rd_wr_en,
--            gprs_rd_data_in             => lmem_gprs_rd_data,
--            gprs_rdy_in                 => lmem_gprs_rdy,
--            
--            addr_regs_req_out           => arb_addr_regs_req(9),
--            addr_regs_ack_out           => arb_addr_regs_ack_o(9),
--            addr_regs_grant_in          => arb_addr_regs_grant(9),
--            
--            addr_regs_en_out            => lmem_addr_regs_en,
--            addr_regs_reg_out           => lmem_addr_regs_reg,
--            addr_regs_mask_out          => lmem_addr_regs_mask,
--            addr_regs_rd_wr_en_out      => lmem_addr_regs_rd_wr_en,
--            addr_regs_rd_data_in        => lmem_addr_regs_rd_data,
--            addr_regs_rdy_in            => lmem_addr_regs_rdy,
--            
--            lmem_addr_out               => lmem_addr_out,
--            lmem_wr_en_out              => lmem_wr_en_out,
--            lmem_wr_data_out            => lmem_wr_data_out,
--            lmem_rd_data_in             => lmem_rd_data_in,
--            
--			data_out			        => lmem_rd_data_o,
--			rdy_out		                => lmem_rdy_o
--		);
--    
--    lmem_en_i <=
--        src1_lmem_en                    when (arb_lmem_grant(0) = '1') else
--        src2_lmem_en                    when (arb_lmem_grant(1) = '1') else
--        src3_lmem_en                    when (arb_lmem_grant(2) = '1') else
--        '0';
--    
--    lmem_rd_wr_type_i <=
--        src1_lmem_rd_wr_type            when (arb_lmem_grant(0) = '1') else
--        src2_lmem_rd_wr_type            when (arb_lmem_grant(1) = '1') else
--        src3_lmem_rd_wr_type            when (arb_lmem_grant(2) = '1') else
--        READ;
--    
--    lmem_addr_i <=
--        src1_lmem_addr                  when (arb_lmem_grant(0) = '1') else
--        src2_lmem_addr                  when (arb_lmem_grant(1) = '1') else
--        src3_lmem_addr                  when (arb_lmem_grant(2) = '1') else
--        (others => '0');
--    
--    lmem_mask_i <=
--        src1_lmem_mask                  when (arb_lmem_grant(0) = '1') else
--        src2_lmem_mask                  when (arb_lmem_grant(1) = '1') else
--        src3_lmem_mask                  when (arb_lmem_grant(2) = '1') else
--        (others => '0');
--    
--    lmem_data_type_i    <=
--        src1_lmem_data_type             when (arb_lmem_grant(0) = '1') else
--        src2_lmem_data_type             when (arb_lmem_grant(1) = '1') else
--        src3_lmem_data_type             when (arb_lmem_grant(2) = '1') else
--        DT_NONE;
--        
--    src1_lmem_rd_data                   <= lmem_rd_data_o when (arb_lmem_grant(0) = '1') else (others => (others => (others => '0')));
--    src2_lmem_rd_data                   <= lmem_rd_data_o when (arb_lmem_grant(1) = '1') else (others => (others => (others => '0')));
--    src3_lmem_rd_data                   <= lmem_rd_data_o when (arb_lmem_grant(2) = '1') else (others => (others => (others => '0')));
--    
--    src1_lmem_rdy                       <= lmem_rdy_o when (arb_lmem_grant(0) = '1') else '0';
--    src2_lmem_rdy                       <= lmem_rdy_o when (arb_lmem_grant(1) = '1') else '0';
--    src3_lmem_rdy                       <= lmem_rdy_o when (arb_lmem_grant(2) = '1') else '0';
    
    gPredicateLUT : for n in 0 to 31 generate
    begin
        uPredicateLUT : predicate_lut
            port map (
                clk_in                  => clk_in,
                host_reset              => reset,
                
                pred_reg_lut_addr       => pred_cond_in,
                pred_reg_lut_bit        => pred_regs_data(n),
                pred_reg_lut_data       => pred_lut_data_o(n)
            );
    end generate;
    
    --
    -- Stats
    --
    stats_out.total_idle            <= std_logic_vector(to_unsigned(stat_idle_total_cnt, stats_out.total_idle'length));
    stats_out.total_processing      <= std_logic_vector(to_unsigned(stat_proc_total_cnt, stats_out.total_processing'length));
    stats_out.total_stall           <= std_logic_vector(to_unsigned(stat_stall_total_cnt, stats_out.total_stall'length));
    
    pPipelineReadStats: process(clk_in)
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
                if (read_state_machine = IDLE) then
                    if (en_reg = '0' and en = '1') then
                        stat_idle_cnt               <= 0;
                        stat_proc_cnt               <= stat_proc_cnt + 1;
                        stat_proc_total_cnt         <= stat_proc_total_cnt + 1;
                    else
                        stat_idle_cnt               <= stat_idle_cnt + 1;
                        stat_idle_total_cnt         <= stat_idle_total_cnt + 1;
                        stat_proc_cnt               <= 0;
                    end if;
                elsif (read_state_machine = READ_OPS_DONE) then
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
    read_check_i <= douta( 9 downto 0);
	 pPipelineReadMailbox: process(clk_in)
	 variable i : integer;
	 variable j : integer;
	 	begin
	if(rising_edge(clk_in)) then
            if (reset = '1') then 
					wea <= "0";
				
					mailbox_state_machine <= IDLE;
				else
				
				case mailbox_state_machine is
				when IDLE =>
				wea <= "0";
				
				--read_check_i <= "0000000001";
				i := 0;
				if((src1_mem_type_in = MAILBOX_BUF ) and (mov_opcode_type_in = RECV) and (read_status = '1')) then
				addra <= src1_in (2 downto 0);
				mailbox_state_machine <= READ_EN;
				--read_check_i <= "0000000010";
				end if;
				
				when READ_EN =>
				for i in 0 to CORES-1 loop
					--for j in 0 to 3 loop
						mailbox_temp(i)(0) <= douta;
						--read_check_i <= mailbox_temp(i)(0)(9 downto 0);
						
						--temp_vector_register_i(i)(0) <= mailbox_temp(i);
						--dummy <= douta;
					--end loop;
				end loop;
				--read_check_i <= "0000000011";
				mailbox_state_machine <= DONE;
				
				when DONE =>
				--read_check_i <= "0000000100";
					if((read_state_machine = IDLE) and (read_status = '0'))then 
					--read_check_i <= "0000000101";
						mailbox_state_machine <= IDLE;
					end if;
				when OTHERS =>
							mailbox_state_machine <= IDLE;
				end case;
		end if;
		end if;
	end process;
	
end arch;

