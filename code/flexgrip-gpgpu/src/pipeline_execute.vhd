----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      pipeline_scalar - arch 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.gpgpu_package.all;

    entity pipeline_execute is
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
    end pipeline_execute;

architecture arch of pipeline_execute is

    component convert_data_types is
        port (
            mov_size_in                 : in  std_logic_vector(2 downto 0);
            conv_type_in                : in  conv_type;
            reg_type_in                 : in  reg_type;
            data_type_in                : in  data_type;
            sm_type_in                  : in  std_logic_vector(1 downto 0);
            mem_type_in                 : in  std_logic_vector(2 downto 0);
            
            mv_size_to_sm_type_out      : out sm_type;
            data_type_to_sm_type_out    : out sm_type;
			sm_type_to_sm_type_out      : out sm_type;
            mem_type_to_sm_type_out     : out sm_type;
            conv_type_to_reg_type_out   : out reg_type;
            reg_type_to_data_type_out   : out data_type;
            mv_size_to_data_type_out    : out data_type;
            conv_type_to_data_type_out  : out data_type;
            sm_type_to_data_type_out    : out data_type;
            mem_type_to_data_type_out   : out data_type;
            sm_type_to_cvt_type_out     : out conv_type;
            mem_type_to_cvt_type_out    : out conv_type
            
        );
    end component;
    
    component branch_exec_unit
        port (
            clk_in                      : in  std_logic;
			host_reset                  : in  std_logic;
            
            branch_exec_en              : in std_logic;
            
            flow_opcode_type_in         : in  flow_opcode_type;
            
            warp_id_in                  : in  std_logic_vector(4 downto 0);
            warp_lane_id_in             : in  std_logic_vector(1 downto 0);
            initial_mask_in             : in  std_logic_vector(31 downto 0);
            current_mask_in             : in  std_logic_vector(31 downto 0);
            instr_mask_in               : in  std_logic_vector(31 downto 0);
            next_pc_in                  : in  std_logic_vector(31 downto 0);
            target_address_in           : in  std_logic_vector(18 downto 0);
            
            warp_div_req_out            : out std_logic;
            warp_div_ack_out            : out std_logic;
            warp_div_grant_in           : in  std_logic;
            
            warp_div_stack_en_out       : out warp_div_std_logic_array;
            warp_div_wr_data_out        : out warp_div_data_array;
            warp_div_rd_data_in         : in  warp_div_data_array;
            warp_div_push_en_out        : out warp_div_std_logic_array;
            warp_div_stack_full_in      : in  warp_div_std_logic_array;
            warp_div_stack_empty_in     : in  warp_div_std_logic_array;
            
            initial_mask_out            : out std_logic_vector(31 downto 0);
            current_mask_out            : out std_logic_vector(31 downto 0);
            instr_mask_out              : out std_logic_vector(31 downto 0);
            next_pc_out                 : out std_logic_vector(31 downto 0);
            warp_state_out              : out warp_state_type;
            
            branch_exec_done            : out std_logic
        );
    end component;
    
    component scalar_processor
        port (
            reset                       : in  std_logic;
            clk_in                      : in  std_logic;
            
            alu_opcode_type_in          : in  alu_opcode_type;
            instr_subop_type_in         : in  std_logic_vector(2 downto 0);
            
            src1_in                     : in  std_logic_vector(31 downto 0);
            src2_in                     : in  std_logic_vector(31 downto 0);
            src3_in                     : in  std_logic_vector(31 downto 0);
            
            src1_neg_in                 : in  std_logic;
            src2_neg_in                 : in  std_logic;
            src3_neg_in                 : in  std_logic;
            
            is_full_normal_in           : in  std_logic;
            carry_in                    : in  std_logic;
            saturate_in                 : in  std_logic;
            w32_in                      : in  std_logic;
            is_signed_in                : in  std_logic;
            abs_saturate_in             : in  std_logic_vector(1 downto 0);
            cvt_neg_in                  : in  std_logic;
            cvt_type_in                 : in  std_logic_vector(2 downto 0);
            set_cond_in                 : in  std_logic_vector(2 downto 0); 
            
            carry_out                   : out std_logic;
            overflow_out                : out std_logic;
            sign_out                    : out std_logic;
            zero_out                    : out std_logic;
            result_out                  : out std_logic_vector(31 downto 0)
        );
    end component;

    type pipeline_execute_state_type is (IDLE, ALU_EXEC, ALU_DONE, MOV_DONE, FLOW_EXEC, FLOW_DONE, NOP);
    signal pipeline_execute_state_machine               : pipeline_execute_state_type;
    signal pipeline_execute_state_machine_cs            : std_logic_vector(3 downto 0);
    
    signal en_reg                                       : std_logic;
    
    signal warp_id_reg                                  : std_logic_vector(4 downto 0);
    signal warp_lane_id_reg                             : std_logic_vector(1 downto 0);
    signal cta_id_reg                                   : std_logic_vector(3 downto 0);
    signal initial_mask_reg                             : std_logic_vector(31 downto 0);
    signal current_mask_reg                             : std_logic_vector(31 downto 0);
    signal shmem_base_addr_reg                          : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal gprs_size_reg                                : std_logic_vector(8 downto 0);
    signal gprs_base_addr_reg                           : std_logic_vector(8 downto 0);
    signal instr_mask_reg                               : std_logic_vector(31 downto 0);
    signal next_pc_reg                                  : std_logic_vector(31 downto 0);
    
    signal instr_opcode_type_i                          : instr_opcode_type;
    signal alu_opcode_type_i                            : alu_opcode_type;
    signal flow_opcode_type_i                           : flow_opcode_type;
    
    signal set_pred_i                                   : std_logic;
    signal set_pred_reg_i                               : std_logic_vector(1 downto 0);
    signal write_pred_i                                 : std_logic;
    
    signal addr_hi_i                                    : std_logic;
    signal addr_lo_i                                    : std_logic_vector(1 downto 0);
    signal addr_incr_i                                  : std_logic;
    signal mov_size_i                                   : std_logic_vector(2 downto 0);                 
    signal mem_type_i                                   : std_logic_vector(2 downto 0);
    signal sm_type_i                                    : std_logic_vector(1 downto 0);
    signal addr_imm_i                                   : std_logic;
 
    signal dest_mem_type_i                              : mem_type;
    signal dest_mem_opcode_type_i                       : mem_opcode_type;
    signal dest_data_type_i                             : data_type;
    signal src1_reg                                     : std_logic_vector(31 downto 0);
    signal dest_i                                       : std_logic_vector(31 downto 0);
    signal target_addr_i                                : std_logic_vector(18 downto 0);
    
    signal branch_exec_en                               : std_logic;
    signal sp_carry_o                                   : std_logic_vector(CORES-1 downto 0);
    signal sp_overflow_o                                : std_logic_vector(CORES-1 downto 0);
    signal sp_sign_o                                    : std_logic_vector(CORES-1 downto 0);
    signal sp_zero_o                                    : std_logic_vector(CORES-1 downto 0);
    signal sp_result_o                                  : vector_register;
    
    signal branch_exec_done                             : std_logic;
    signal initial_mask_o                               : std_logic_vector(31 downto 0);
    signal current_mask_o                               : std_logic_vector(31 downto 0);
    signal instr_mask_o                                 : std_logic_vector(31 downto 0);
    signal use_next_pc_o                                : std_logic;
    signal next_pc_o                                    : std_logic_vector(31 downto 0);
    signal warp_state_o                                 : warp_state_type;
    
    signal alu_latency                                  : std_logic_vector(4 downto 0);
    signal alu_latency_cntr                             : std_logic_vector(4 downto 0);
    
    signal src1_i                                       : vector_register;
    signal src2_i                                       : vector_register;
    signal src3_i                                       : vector_register;
   
    signal src1_neg_i                                   : std_logic;
    signal src2_neg_i                                   : std_logic;
    signal src3_neg_i                                   : std_logic;
    
    signal is_full_normal_i                             : std_logic;
    signal saturate_i                                   : std_logic;
    signal abs_saturate_i                               : std_logic_vector(1 downto 0);
    signal set_cond_i                                   : std_logic_vector(2 downto 0); 
    signal cvt_type_i                                   : std_logic_vector(2 downto 0);
    signal w32_i                                        : std_logic;
    signal is_signed_i                                  : std_logic;
    signal pred_flags_i                                 : vector_flag_register;
    signal mem_type_to_cvt_type_o                       : conv_type;
    signal data_type_i									: data_type;
    
    signal temp_vector_register_i                       : temp_vector_register;
	
    --
    -- Stats
    --
    signal stat_idle_cnt                                : integer range 0 to 2147483647;
    signal stat_idle_total_cnt                          : integer range 0 to 2147483647;
    signal stat_proc_cnt                                : integer range 0 to 2147483647;
    signal stat_proc_total_cnt                          : integer range 0 to 2147483647;
    signal stat_stall_cnt                               : integer range 0 to 2147483647;
    signal stat_stall_total_cnt                         : integer range 0 to 2147483647;
    signal stat_instructions_cnt                        : integer range 0 to 2147483647;
    signal stat_alu_cnt                                 : integer range 0 to 2147483647;
    signal stat_mov_cnt                                 : integer range 0 to 2147483647;
    signal stat_flow_cnt                                : integer range 0 to 2147483647;
    signal stat_nop_cnt                                 : integer range 0 to 2147483647;
    
begin

    pPipelineExecute: process(clk_in)
	begin
		if (rising_edge(clk_in)) then
            if (reset = '1') then
--                warp_id_reg                                                                 <= (others => '0');
--                warp_lane_id_reg                                                            <= (others => '0');
--                cta_id_reg                                                                  <= (others => '0');
--                initial_mask_reg                                                            <= (others => '0');
--                current_mask_reg                                                            <= (others => '0');
--                shmem_base_addr_reg                                                         <= (others => '0');
--                gprs_size_reg                                                               <= (others => '0');
--                gprs_base_addr_reg                                                          <= (others => '0');
--                instr_mask_reg                                                              <= (others => '0');
--                next_pc_reg                                                                 <= (others => '0');
--                instr_opcode_type_i                                                         <= UNKNOWN;
--                flow_opcode_type_i                                                          <= UNKNOWN;
--                alu_opcode_type_i                                                           <= UNKNOWN;
--                set_pred_i                                                                  <= '0';
--                set_pred_reg_i                                                              <= (others => '0');
--                write_pred_i                                                                <= '0';
--                addr_hi_i                                                                   <= '0';
--                addr_lo_i                                                                   <= (others => '0');
--                addr_incr_i                                                                 <= '0';
--                mov_size_i                                                                  <= (others => '0');            
--                mem_type_i                                                                  <= (others => '0');
--                sm_type_i                                                                   <= (others => '0');
--                addr_imm_i                                                                  <= '0';
--                target_addr_i                                                               <= (others => '0');
--                dest_mem_type_i                                                             <= UNKNOWN;
--                dest_mem_opcode_type_i                                                      <= READ;
--                dest_data_type_i                                                            <= DT_UNKNOWN;
--                dest_i                                                                      <= (others => '0');
--                temp_vector_register_i                                                      <= (others => (others => (others => (others => '0'))));
--                warp_lane_id_out                                                            <= (others => '0');
--                cta_id_out                                                                  <= (others => '0');
--                initial_mask_out                                                            <= (others => '0');
--                current_mask_out                                                            <= (others => '0');
--                shmem_base_addr_out                                                         <= (others => '0');
--                gprs_size_out                                                               <= (others => '0');
--                gprs_base_addr_out                                                          <= (others => '0');
--                instr_mask_out                                                              <= (others => '0');
--                use_next_pc_out                                                             <= '0';
--                next_pc_out                                                                 <= (others => '0');
--                instr_opcode_type_out                                                       <= UNKNOWN;
--                set_pred_out                                                                <= '0';
--                set_pred_reg_out                                                            <= (others => '0');
--                write_pred_out                                                              <= '0';
--                addr_hi_out                                                                 <= '0';
--                addr_lo_out                                                                 <= (others => '0');
--                addr_incr_out                                                               <= '0';
--                mov_size_out                                                                <= (others => '0');            
--                sm_type_out                                                                 <= (others => '0');
--                addr_imm_out                                                                <= '0';
--                src1_out                                                                    <= (others => '0');
--                dest_mem_type_out                                                           <= UNKNOWN;
--                dest_mem_opcode_type_out                                                    <= READ;
--                dest_data_type_out                                                          <= DT_UNKNOWN;
--                dest_out                                                                    <= (others => '0');
--                temp_vector_register_out                                                    <= (others => (others => (others => (others => '0'))));
--                src1_reg                                                                    <= (others => '0');
--                src1_i                                                                      <= (others => (others => '0'));
--                src2_i                                                                      <= (others => (others => '0'));
--                src3_i                                                                      <= (others => (others => '0'));
--                alu_latency_cntr                                                            <= (others => '0');
                en_reg                                                                      <= '0';
                pipeline_stall_out                                                          <= '0';
--                pipeline_reg_ld                                                             <= '0';
                pipeline_execute_state_machine			                                    <= IDLE;
            else
                case pipeline_execute_state_machine is 
                    when IDLE =>
                        alu_latency_cntr                                                    <= (others => '0');
                        pipeline_reg_ld                                                     <= '0';
                        en_reg                                                              <= en;
                        branch_exec_en		  											    <= '0';
                        if (en_reg = '0' and en = '1') then
                            pipeline_stall_out                                              <= '1';
                            warp_id_reg                                                     <= warp_id_in;
                            warp_lane_id_reg                                                <= warp_lane_id_in;
                            cta_id_reg                                                      <= cta_id_in;
                            initial_mask_reg                                                <= initial_mask_in;
                            current_mask_reg                                                <= current_mask_in;
                            shmem_base_addr_reg                                             <= shmem_base_addr_in;
                            gprs_size_reg                                                   <= gprs_size_in;
                            gprs_base_addr_reg                                              <= gprs_base_addr_in;
                            instr_mask_reg                                                  <= instr_mask_in;
                            next_pc_reg                                                     <= next_pc_in;
                            instr_opcode_type_i                                             <= instr_opcode_type_in;
                            flow_opcode_type_i                                              <= flow_opcode_type_in;
                            set_pred_i                                                      <= set_pred_in;
                            set_pred_reg_i                                                  <= set_pred_reg_in;
                            write_pred_i                                                    <= write_pred_in;
                            addr_hi_i                                                       <= addr_hi_in;
                            addr_lo_i                                                       <= addr_lo_in;
                            addr_incr_i                                                     <= addr_incr_in;
                            mov_size_i                                                      <= mov_size_in;            
                            mem_type_i                                                      <= mem_type_in;
                            sm_type_i                                                       <= sm_type_in;
                            target_addr_i                                                   <= target_addr_in;
                            addr_imm_i                                                      <= addr_imm_in;
                            dest_mem_type_i                                                 <= dest_mem_type_in;
                            dest_mem_opcode_type_i                                          <= dest_mem_opcode_type_in;
                            dest_data_type_i                                                <= dest_data_type_in;
                            src1_reg                                                        <= src1_in;
                            dest_i                                                          <= dest_in;
                            temp_vector_register_i                                          <= temp_vector_register_in;
                            for i in 0 to CORES-1 loop
                                src1_i(i)                                                   <= temp_vector_register_in(i)(0)(0);
                                src2_i(i)                                                   <= temp_vector_register_in(i)(2)(0);
                                src3_i(i)                                                   <= temp_vector_register_in(i)(4)(0);
                            end loop;
                            src1_neg_i                                                      <= src1_neg_in;
                            src2_neg_i                                                      <= src2_neg_in;
                            src3_neg_i                                                      <= src3_neg_in;
                            is_full_normal_i                                                <= is_full_normal_in;
                            saturate_i                                                      <= saturate_in;
                            abs_saturate_i                                                  <= abs_saturate_in;
                            set_cond_i                                                      <= set_cond_in;
                            if (instr_opcode_type_in = ALU) then
                                cvt_type_i                                                  <= cvt_type_in;
                                w32_i                                                       <= w32_in;
                                is_signed_i                                                 <= is_signed_in;
                                alu_opcode_type_i                                           <= alu_opcode_type_in;
                                pred_flags_i                                                <= pred_flags_in;
                                pipeline_execute_state_machine                              <= ALU_EXEC;
                            elsif (instr_opcode_type_in = MOV) then
                                if (mov_opcode_type_in = MOV) then
                                    if (dest_mem_type_in = REG) then
                                        if (is_full_normal_in = '1') then
                                            cvt_type_i                                      <= cvt_type_in;
                                            w32_i                                           <= w32_in;
                                            is_signed_i                                     <= is_signed_in;
                                            pred_flags_i                                    <= pred_flags_in;
                                            alu_opcode_type_i                               <= CVT;
                                            pipeline_execute_state_machine                  <= ALU_EXEC;
                                        elsif (instr_marker_type_in = IMM) then
                                            pred_flags_i                                    <= pred_flags_in;
                                            for i in 0 to CORES-1 loop
                                                temp_vector_register_out(i)(TEMP_REG_DEST)  <= temp_vector_register_in(i)(TEMP_REG_SRC2);
                                                temp_vector_register_out(i)(TEMP_REG_SRC2)  <= temp_vector_register_in(i)(TEMP_REG_SRC2);
                                                temp_vector_register_out(i)(TEMP_REG_SRC3)  <= temp_vector_register_in(i)(TEMP_REG_SRC3);
                                            end loop;
                                            pipeline_execute_state_machine                  <= MOV_DONE;
                                        else
                                            pred_flags_i                                    <= pred_flags_in;
                                            pipeline_execute_state_machine                  <= NOP;
                                        end if;
                                    else
                                        pred_flags_i                                        <= pred_flags_in;
                                        pipeline_execute_state_machine                      <= NOP;
                                    end if;
                                elsif (mov_opcode_type_in = LOAD) then
                                    if ((dest_mem_type_in = MEM_SHARED) or (dest_mem_type_in = MEM_CONST)) then
                                        cvt_type_i                                          <= encode_conv_type(mem_type_to_cvt_type_o);
                                        w32_i                                               <= w32_in;
                                        is_signed_i                                         <= is_signed_in;
                                        pred_flags_i                                        <= pred_flags_in;
                                        alu_opcode_type_i                                   <= CVT;
                                        pipeline_execute_state_machine                      <= ALU_EXEC;
    --                                elsif (dest_mem_type_in = ADDRESS_MEM) then
                                    elsif ((dest_mem_type_in = ADDRESS) and (temp_vector_register_in(0)(2)(0)/= x"00000000")) then  --Modified TO
                                        w32_i                                               <= '1';
                                        is_signed_i                                         <= '0';
                                        pred_flags_i                                        <= pred_flags_in;
                                        alu_opcode_type_i                                   <= SHL;
                                        pipeline_execute_state_machine                      <= ALU_EXEC;
                                    elsif ((dest_mem_type_in = ADDRESS_ADDRESS) or (dest_mem_type_in = FLAGS)) then
                                        pred_flags_i                                        <= pred_flags_in;
                                        pipeline_execute_state_machine                      <= NOP;
                                    else
                                        pipeline_execute_state_machine                      <= NOP;
                                    end if;
                                elsif (mov_opcode_type_in = STORE) then
                                    if (dest_mem_type_in = MEM_SHARED) then
                                        pred_flags_i                                        <= pred_flags_in;
                                        for i in 0 to CORES-1 loop
                                            temp_vector_register_out(i)(TEMP_REG_DEST)      <= temp_vector_register_in(i)(TEMP_REG_SRC3);
                                            temp_vector_register_out(i)(TEMP_REG_SRC2)      <= temp_vector_register_in(i)(TEMP_REG_SRC2);
                                            temp_vector_register_out(i)(TEMP_REG_SRC3)      <= temp_vector_register_in(i)(TEMP_REG_SRC3);
                                        end loop;
                                        pipeline_execute_state_machine                      <= MOV_DONE;
                                    elsif ((dest_mem_type_in = MEM_GLOBAL) or (dest_mem_type_in = MEM_LOCAL) or (dest_mem_type_in = ADDRESS)) then
                                        pred_flags_i                                        <= pred_flags_in;
                                        pipeline_execute_state_machine                      <= NOP;
                                    elsif (dest_mem_type_in = FLAGS) then
                                        for i in 0 to CORES-1 loop
                                            pred_flags_i(i)                                 <= temp_vector_register_in(i)(TEMP_REG_SRC2)(0)(3 downto 0);
                                        end loop;
                                        temp_vector_register_out                            <= temp_vector_register_in;
                                        pipeline_execute_state_machine                      <= MOV_DONE;
                                    else
                                        pred_flags_i                                        <= pred_flags_in;
                                        pipeline_execute_state_machine                      <= NOP;
                                    end if;
                                else
                                    pred_flags_i                                            <= pred_flags_in;
                                    pipeline_execute_state_machine                          <= NOP;
                                end if;
                            elsif (instr_opcode_type_in = FLOW) then
                                branch_exec_en                                              <= '1';
                                pred_flags_i                                                <= pred_flags_in;
                                pipeline_execute_state_machine                              <= FLOW_EXEC;
                            else
                                pred_flags_i                                                <= pred_flags_in;
                                pipeline_execute_state_machine                              <= NOP;
                            end if;
                        else
                            pipeline_stall_out                                              <= '0';
                        end if;
                    when ALU_EXEC =>
                        if (alu_latency_cntr < alu_latency) then
                            alu_latency_cntr                                                <= alu_latency_cntr + "01";
                        else
                            alu_latency_cntr                                                <= (others => '0');
                            pipeline_execute_state_machine                                  <= ALU_DONE;
                        end if;
                    when ALU_DONE =>
                        if (pipeline_stall_in = '0') then
                            warp_id_out														<= warp_id_reg;
                            warp_lane_id_out                                                <= warp_lane_id_reg;
                            cta_id_out                                                      <= cta_id_reg;
                            initial_mask_out                                                <= initial_mask_reg;
                            current_mask_out                                                <= current_mask_reg;
                            shmem_base_addr_out                                             <= shmem_base_addr_reg;
                            gprs_size_out                                                   <= gprs_size_reg;
                            gprs_base_addr_out                                              <= gprs_base_addr_reg;
                            use_next_pc_out                                                 <= '0';
                            instr_mask_out                                                  <= instr_mask_reg;
                            next_pc_out                                                     <= next_pc_reg;
                            warp_state_out                                                  <= ACTIVE;
                            instr_opcode_type_out                                           <= instr_opcode_type_i;
                            set_pred_out                                                    <= set_pred_i;
                            set_pred_reg_out                                                <= set_pred_reg_i;
                            write_pred_out                                                  <= write_pred_i;
                            addr_hi_out                                                     <= addr_hi_i;
                            addr_lo_out                                                     <= addr_lo_i;
                            addr_incr_out                                                   <= addr_incr_i;
                            mov_size_out                                                    <= mov_size_i;            
                            sm_type_out                                                     <= sm_type_i;
                            addr_imm_out                                                    <= addr_imm_i;
                            dest_mem_type_out                                               <= dest_mem_type_i;
                            dest_mem_opcode_type_out                                        <= dest_mem_opcode_type_i;
                            dest_data_type_out                                              <= dest_data_type_i;
                            src1_out                                                        <= src1_reg;
                            dest_out                                                        <= dest_i;
                            for i in 0 to CORES-1 loop
                                temp_vector_register_out(i)(TEMP_REG_DEST)(0)               <= sp_result_o(i);
                                temp_vector_register_out(i)(1)                              <= temp_vector_register_in(i)(1);
                                temp_vector_register_out(i)(2)                              <= temp_vector_register_in(i)(2);
                                temp_vector_register_out(i)(3)                              <= temp_vector_register_in(i)(3);
                                temp_vector_register_out(i)(4)                              <= temp_vector_register_in(i)(4);
                                temp_vector_register_out(i)(5)                              <= temp_vector_register_in(i)(5);
                            end loop;
                            pipeline_reg_ld                                                 <= '1';
                            pipeline_execute_state_machine                                  <= IDLE;
                        end if;
                    when FLOW_EXEC =>
                        branch_exec_en                                                      <= '0';
                        if (branch_exec_done = '1') then
                            pipeline_execute_state_machine                                  <= FLOW_DONE;
                        end if;
                    when FLOW_DONE =>
                        if (pipeline_stall_in = '0') then
                            warp_id_out														<= warp_id_reg;
                            warp_lane_id_out                                                <= warp_lane_id_reg;
                            cta_id_out                                                      <= cta_id_reg;
                            initial_mask_out                                                <= initial_mask_o;
                            current_mask_out                                                <= current_mask_o;
                            shmem_base_addr_out                                             <= shmem_base_addr_reg;
                            gprs_base_addr_out                                              <= gprs_base_addr_reg;
                            use_next_pc_out                                                 <= use_next_pc_o;
                            instr_mask_out                                                  <= instr_mask_o;
                            next_pc_out                                                     <= next_pc_o;
                            warp_state_out                                                  <= warp_state_o;
                            instr_opcode_type_out                                           <= instr_opcode_type_i;
                            set_pred_out                                                    <= set_pred_i;
                            set_pred_reg_out                                                <= set_pred_reg_i;
                            write_pred_out                                                  <= write_pred_i;
                            addr_hi_out                                                     <= addr_hi_i;
                            addr_lo_out                                                     <= addr_lo_i;
                            addr_incr_out                                                   <= addr_incr_i;
                            mov_size_out                                                    <= mov_size_i;            
                            sm_type_out                                                     <= sm_type_i;
                            addr_imm_out                                                    <= addr_imm_i;
                            dest_mem_type_out                                               <= dest_mem_type_i;
                            dest_mem_opcode_type_out                                        <= dest_mem_opcode_type_i;
                            dest_data_type_out                                              <= dest_data_type_i;
                            src1_out                                                        <= src1_reg;
                            dest_out                                                        <= dest_i;
                            temp_vector_register_out                                        <= temp_vector_register_i;
                            pipeline_reg_ld                                                 <= '1';
                            pipeline_execute_state_machine                                  <= IDLE;
                        end if;
                    when MOV_DONE =>
                        if (pipeline_stall_in = '0') then
                            warp_id_out														<= warp_id_reg;
                            warp_lane_id_out                                                <= warp_lane_id_reg;
                            cta_id_out                                                      <= cta_id_reg;
                            initial_mask_out                                                <= initial_mask_reg;
                            current_mask_out                                                <= current_mask_reg;
                            instr_mask_out                                                  <= instr_mask_reg;
                            shmem_base_addr_out                                             <= shmem_base_addr_reg;
                            gprs_base_addr_out                                              <= gprs_base_addr_reg;
                            use_next_pc_out                                                 <= '0';
                            next_pc_out                                                     <= next_pc_reg;
                            warp_state_out                                                  <= ACTIVE;
                            instr_opcode_type_out                                           <= instr_opcode_type_i;
                            set_pred_out                                                    <= set_pred_i;
                            set_pred_reg_out                                                <= set_pred_reg_i;
                            write_pred_out                                                  <= write_pred_i;
                            addr_hi_out                                                     <= addr_hi_i;
                            addr_lo_out                                                     <= addr_lo_i;
                            addr_incr_out                                                   <= addr_incr_i;
                            mov_size_out                                                    <= mov_size_i;            
                            sm_type_out                                                     <= sm_type_i;
                            addr_imm_out                                                    <= addr_imm_i;
                            dest_mem_type_out                                               <= dest_mem_type_i;
                            dest_mem_opcode_type_out                                        <= dest_mem_opcode_type_i;
                            dest_data_type_out                                              <= dest_data_type_i;
                            src1_out                                                        <= src1_reg;
                            dest_out                                                        <= dest_i;
                            pipeline_reg_ld                                                 <= '1';
                            pipeline_execute_state_machine                                  <= IDLE;
                        end if;
                    when NOP =>
                        if (pipeline_stall_in = '0') then
                            warp_id_out														<= warp_id_reg;
                            warp_lane_id_out                                                <= warp_lane_id_reg;
                            cta_id_out                                                      <= cta_id_reg;
                            initial_mask_out                                                <= initial_mask_reg;
                            current_mask_out                                                <= current_mask_reg;
                            instr_mask_out                                                  <= instr_mask_reg;
                            shmem_base_addr_out                                             <= shmem_base_addr_reg;
                            gprs_base_addr_out                                              <= gprs_base_addr_reg;
                            use_next_pc_out                                                 <= '0';
                            next_pc_out                                                     <= next_pc_reg;
                            warp_state_out                                                  <= ACTIVE;
                            instr_opcode_type_out                                           <= instr_opcode_type_i;
                            set_pred_out                                                    <= set_pred_i;
                            set_pred_reg_out                                                <= set_pred_reg_i;
                            write_pred_out                                                  <= write_pred_i;
                            addr_hi_out                                                     <= addr_hi_i;
                            addr_lo_out                                                     <= addr_lo_i;
                            addr_incr_out                                                   <= addr_incr_i;
                            mov_size_out                                                    <= mov_size_i;            
                            sm_type_out                                                     <= sm_type_i;
                            addr_imm_out                                                    <= addr_imm_i;
                            dest_mem_type_out                                               <= dest_mem_type_i;
                            dest_mem_opcode_type_out                                        <= dest_mem_opcode_type_i;
                            dest_data_type_out                                              <= dest_data_type_i;
                            src1_out                                                        <= src1_reg;
                            dest_out                                                        <= dest_i;
                            temp_vector_register_out                                        <= temp_vector_register_i;
                            pipeline_reg_ld                                                 <= '1';
                            pipeline_execute_state_machine                                  <= IDLE;
                        end if;
                    when others =>
                        pipeline_execute_state_machine                                      <= IDLE;
                end case;
            end if;
        end if;
    end process;
                        
    pALULatency: process(alu_opcode_type_i)
	begin
        case alu_opcode_type_i is
            when IMUL24 =>
                alu_latency             <= "01100";
            when IMAD24 =>
                alu_latency             <= "01110";
            when IMAD24C =>
                alu_latency             <= "01110";
            when IADD =>
                alu_latency             <= "00010";
            when IADDC =>
                alu_latency             <= "00010";
            when ISUB =>
                alu_latency             <= "00010";
            when others =>
                alu_latency             <= "00001";
        end case;
    end process;
    
    uConvertDataTypes : convert_data_types
        port map (
            mov_size_in                         => (others => '0'),
            conv_type_in                        => CT_NONE,
            reg_type_in                         => RT_NONE,
            data_type_in                		=> data_type_i,
            sm_type_in                          => (others => '0'),
	        mem_type_in                         => mem_type_i,
            
            mv_size_to_sm_type_out              => open,
            data_type_to_sm_type_out   			=> open,
			sm_type_to_sm_type_out              => open,
            mem_type_to_sm_type_out             => open,
            conv_type_to_reg_type_out           => open,
            reg_type_to_data_type_out           => open,
            mv_size_to_data_type_out            => open,
            conv_type_to_data_type_out          => open,
            sm_type_to_data_type_out            => open,
            mem_type_to_data_type_out           => open,
            sm_type_to_cvt_type_out             => open,
            mem_type_to_cvt_type_out            => mem_type_to_cvt_type_o
        );
        
    uBranchExecuteUnit : branch_exec_unit
        port map (
            clk_in                      => clk_in,
			host_reset                  => reset,
            
            branch_exec_en              => branch_exec_en,
            
            flow_opcode_type_in         => flow_opcode_type_i,
            
            warp_id_in                  => warp_id_reg,
            warp_lane_id_in             => warp_lane_id_reg,
            initial_mask_in             => initial_mask_reg,
            current_mask_in             => current_mask_reg,
            instr_mask_in               => instr_mask_reg,
            next_pc_in                  => next_pc_reg,
            target_address_in           => target_addr_i,
            
            warp_div_req_out            => warp_div_req_out,
            warp_div_ack_out            => warp_div_ack_out,
            warp_div_grant_in           => warp_div_grant_in,
            
            warp_div_stack_en_out       => warp_div_stack_en_out,
            warp_div_wr_data_out        => warp_div_wr_data_out,
            warp_div_rd_data_in         => warp_div_rd_data_in,
            warp_div_push_en_out        => warp_div_push_en_out,
            warp_div_stack_full_in      => warp_div_stack_full_in,
            warp_div_stack_empty_in     => warp_div_stack_empty_in,
            
            initial_mask_out            => initial_mask_o,
            current_mask_out            => current_mask_o,
            instr_mask_out              => instr_mask_o,
            next_pc_out                 => next_pc_o,
            warp_state_out              => warp_state_o,
            
            branch_exec_done            => branch_exec_done
        );
    
    gScalarProcessor : for i in 0 to CORES-1 generate
        uScalarProcessor : scalar_processor
            port map (
                reset                       => reset,
                clk_in                      => clk_in,
                
                alu_opcode_type_in          => alu_opcode_type_i,
                instr_subop_type_in         => instr_subop_type_in,
                
                src1_in                     => src1_i(i),
                src2_in                     => src2_i(i),
                src3_in                     => src3_i(i),
                
                src1_neg_in                 => src1_neg_i,
                src2_neg_in                 => src2_neg_i,
                src3_neg_in                 => src3_neg_i,
                
                is_full_normal_in           => is_full_normal_i,
                carry_in                    => pred_flags_i(i)(2),
                saturate_in                 => saturate_i,
                w32_in                      => w32_i,
                is_signed_in                => is_signed_i,
                abs_saturate_in             => abs_saturate_i,
                cvt_neg_in                  => cvt_neg_in,
                cvt_type_in                 => cvt_type_i,
                set_cond_in                 => set_cond_i,
                
                carry_out                   => sp_carry_o(i),
                overflow_out                => sp_overflow_o(i),
                sign_out                    => sp_sign_o(i),
                zero_out                    => sp_zero_o(i),
                result_out                  => sp_result_o(i)
            );
    end generate;
    
    gPredicateFlags : for i in 0 to CORES-1 generate
        pred_flags_out(i)(2)      <=
            sp_carry_o(i)      when (alu_opcode_type_i = IADD or alu_opcode_type_i = IADDC or alu_opcode_type_i = ISUB or alu_opcode_type_i = IMAD24 or alu_opcode_type_i = IMAD24C) else
            pred_flags_i(i)(2);
        
        pred_flags_out(i)(3)      <=
            sp_overflow_o(i)   when (alu_opcode_type_i = IADD or alu_opcode_type_i = IADDC or alu_opcode_type_i = ISUB or alu_opcode_type_i = IMAD24 or alu_opcode_type_i = IMAD24C) else
            pred_flags_i(i)(3);
        
        pred_flags_out(i)(1)      <=
            sp_sign_o(i)       when (alu_opcode_type_i = SET) else
            pred_flags_i(i)(1);
        
         pred_flags_out(i)(0)      <=
            sp_zero_o(i)       when (alu_opcode_type_i = SET) else
            pred_flags_i(i)(0);
    end generate;
    
    --
    -- Stats
    --
    stats_out.total_idle                            <= std_logic_vector(to_unsigned(stat_idle_total_cnt, stats_out.total_idle'length));
    stats_out.total_processing                      <= std_logic_vector(to_unsigned(stat_proc_total_cnt, stats_out.total_processing'length));
    stats_out.total_stall                           <= std_logic_vector(to_unsigned(stat_stall_total_cnt, stats_out.total_stall'length));
    
    stats_instructions_out.total_idle               <= std_logic_vector(to_unsigned(stat_mov_cnt, stats_instructions_out.total_idle'length));
    stats_instructions_out.total_processing         <= std_logic_vector(to_unsigned(stat_alu_cnt, stats_instructions_out.total_processing'length));
    stats_instructions_out.total_stall              <= std_logic_vector(to_unsigned(stat_flow_cnt, stats_instructions_out.total_stall'length));
    stats_instructions_out.total                    <= std_logic_vector(to_unsigned(stat_instructions_cnt, stats_instructions_out.total'length));
    
    pPipelineExecuteStats: process(clk_in)
	begin
		if(rising_edge(clk_in)) then
            if (reset = '1' or stats_reset = '1') then
                stat_idle_cnt                       <= 0;
                stat_idle_total_cnt                 <= 0;
                stat_proc_cnt                       <= 0;
                stat_proc_total_cnt                 <= 0;
                stat_stall_cnt                      <= 0;
                stat_stall_total_cnt                <= 0;
                stat_instructions_cnt               <= 0;
                stat_alu_cnt                        <= 0;
                stat_mov_cnt                        <= 0;
                stat_flow_cnt                       <= 0;
                stat_nop_cnt                        <= 0;
            else
                if (pipeline_execute_state_machine = IDLE) then
                    if (en_reg = '0' and en = '1') then
                        stat_idle_cnt               <= 0;
                        stat_proc_cnt               <= stat_proc_cnt + 1;
                        stat_proc_total_cnt         <= stat_proc_total_cnt + 1;
                    else
                        stat_idle_cnt               <= stat_idle_cnt + 1;
                        stat_idle_total_cnt         <= stat_idle_total_cnt + 1;
                        stat_proc_cnt               <= 0;
                    end if;
                elsif ((pipeline_execute_state_machine = ALU_DONE) or (pipeline_execute_state_machine = FLOW_DONE) or 
                       (pipeline_execute_state_machine = MOV_DONE) or (pipeline_execute_state_machine = NOP))then
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
                if (en_reg = '0' and en = '1') then
                    stat_instructions_cnt           <= stat_instructions_cnt + 1;
                    if (instr_opcode_type_in = ALU) then
                        stat_alu_cnt                <= stat_alu_cnt + 1;
                    elsif (instr_opcode_type_in = MOV) then
                        stat_mov_cnt                <= stat_mov_cnt + 1;
                    elsif (instr_opcode_type_in = FLOW) then
                        stat_flow_cnt               <= stat_flow_cnt + 1;
                    else
                        stat_nop_cnt                <= stat_nop_cnt + 1;
                    end if;
                end if;
            end if;
        end if;
    end process;
    
end arch;

