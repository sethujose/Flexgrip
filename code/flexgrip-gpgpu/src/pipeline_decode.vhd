----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      pipeline_decode - arch 
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

    entity pipeline_decode is
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
				decode_flag_check_out		: out std_logic --//////////************
      );
   end pipeline_decode;

architecture arch of pipeline_decode is  
   
    type decode_state_type is (IDLE, DECODE_INSTRUCTION);
    signal decode_state_machine     : decode_state_type;
    
    signal en_reg                   : std_logic;
    signal program_cntr_reg         : std_logic_vector(31 downto 0);
    signal warp_id_reg              : std_logic_vector(4 downto 0);
    signal warp_lane_id_reg         : std_logic_vector(1 downto 0);
    signal cta_id_reg               : std_logic_vector(3 downto 0);
    signal initial_mask_reg         : std_logic_vector(31 downto 0);
    signal current_mask_reg         : std_logic_vector(31 downto 0);
    signal shmem_base_addr_reg      : std_logic_vector(SHMEM_ADDR_SIZE-1 downto 0);
    signal gprs_size_reg            : std_logic_vector(8 downto 0);
    signal gprs_base_addr_reg       : std_logic_vector(8 downto 0);
    signal next_pc_reg              : std_logic_vector(31 downto 0);
    
    signal instr_opcode_i           : std_logic_vector(3 downto 0);
    signal instr_subop_i            : std_logic_vector(2 downto 0);
    signal instr_marker_i           : std_logic_vector(1 downto 0);
    signal instr_is_flow_i          : std_logic;
    signal instr_is_long_i          : std_logic;
    signal logic_type_i             : std_logic_vector(1 downto 0);
    signal is_carry_i               : std_logic;
    signal w32_i                    : std_logic;
    signal mov_size_i               : std_logic_vector(2 downto 0);
    signal cvt_type_i               : std_logic_vector(2 downto 0);
    signal mem_type_i               : std_logic_vector(2 downto 0);
    signal is_full_marker_i         : std_logic;
    signal addr_hi_i                : std_logic;
    signal addr_hi_i_3              : std_logic_vector(2 downto 0);
    signal addr_lo_i                : std_logic_vector(1 downto 0);
    signal addr_reg_i               : std_logic_vector(2 downto 0);
    signal src2_use_gather_i        : std_logic;
    signal set_pred_i               : std_logic;
    
    signal instr_src1_shared_i      : std_logic;
    signal instr_src2_const_i       : std_logic;
    signal instr_src3_const_i       : std_logic;
   
    signal instr_opcode_type_i      : instr_opcode_type;
    signal alu_opcode_i             : alu_opcode_type;
    signal mov_opcode_i             : mov_opcode_type;
    signal mov_mem_type_i           : mem_type;
    signal flow_opcode_i            : flow_opcode_type;
   
    signal instr_marker_type_i      : instr_marker_type;
   
    signal reg_to_data_type         : data_type;
    signal mov_size_to_data_type    : data_type;
    signal data_type_mov_size_i     : data_type;
    signal sm_type_to_data_type     : data_type;
    signal cvt_type_to_data_type    : data_type;
    signal subop_to_data_type       : data_type;
	 
    signal src1_mem_type_i          : mem_type;
    signal src2_mem_type_i          : mem_type;
    signal src3_mem_type_i          : mem_type;
    signal dest_mem_type_i          : mem_type;
    
    --
    -- Stats
    --
    signal stat_idle_cnt                            : integer range 0 to 2147483647;
    signal stat_idle_total_cnt                      : integer range 0 to 2147483647;
    signal stat_proc_cnt                            : integer range 0 to 2147483647;
    signal stat_proc_total_cnt                      : integer range 0 to 2147483647;
    signal stat_stall_cnt                           : integer range 0 to 2147483647;
    signal stat_stall_total_cnt                     : integer range 0 to 2147483647;
	 
	 signal decode_flag_check_out_i						: std_logic:='1';	--///////////////////******************
    
begin

    pDecode : process(clk_in)
    begin
        if(rising_edge(clk_in)) then
            if (reset = '1') then
                en_reg                              <= '0';
                pipeline_stall_out                  <= '0';
                pipeline_reg_ld                     <= '0';
                decode_state_machine                <= IDLE;
            else
                case decode_state_machine is
                    when IDLE =>
                        pipeline_reg_ld             <= '0';
                        en_reg                      <= en;
                        if (en_reg = '0' and en = '1') then
                            program_cntr_reg        <= program_cntr_in;
                            warp_id_reg             <= warp_id_in;
                            warp_lane_id_reg        <= warp_lane_id_in;
                            cta_id_reg              <= cta_id_in;
                            initial_mask_reg        <= initial_mask_in;
                            current_mask_reg        <= current_mask_in;
                            shmem_base_addr_reg     <= shmem_base_addr_in;
                            gprs_size_reg           <= gprs_size_in;
                            gprs_base_addr_reg      <= gprs_base_addr_in;
                            next_pc_reg             <= next_pc_in;
                            pipeline_stall_out      <= '1';
                            decode_state_machine    <= DECODE_INSTRUCTION;
                        else
                            program_cntr_reg        <= (others => '0');
                            warp_id_reg             <= (others => '0');
                            warp_lane_id_reg        <= (others => '0');
                            cta_id_reg              <= (others => '0');
                            initial_mask_reg        <= (others => '0');
                            current_mask_reg        <= (others => '0');
                            shmem_base_addr_reg     <= (others => '0');
                            gprs_size_reg           <= (others => '0');
                            gprs_base_addr_reg      <= (others => '0');
                            next_pc_reg             <= (others => '0');
                            pipeline_stall_out      <= '0';
                        end if;
                    when DECODE_INSTRUCTION =>
                        if (pipeline_stall_in = '0') then
                            program_cntr_out        <= program_cntr_reg;
                            warp_id_out             <= warp_id_reg;
                            warp_lane_id_out        <= warp_lane_id_reg;
                            cta_id_out              <= cta_id_reg;
                            initial_mask_out        <= initial_mask_reg;
                            current_mask_out        <= current_mask_reg;
                            shmem_base_addr_out     <= shmem_base_addr_reg;
                            gprs_size_out           <= gprs_size_reg;
                            gprs_base_addr_out      <= gprs_base_addr_reg;
                            next_pc_out             <= next_pc_reg;
                            pipeline_reg_ld         <= '1';
                            decode_state_machine    <= IDLE;
                        end if;
                    when others =>
                        decode_state_machine        <= IDLE;
                end case;
            end if;
        end if;
    end process;
    
    instr_subop_i                       <= instruction_in(63 downto 61);
    logic_type_i                        <= instruction_in(47 downto 46);
    instr_marker_i                      <= instruction_in(33 downto 32);
    instr_opcode_i                      <= instruction_in(31 downto 28);
    instr_is_flow_i                     <= instruction_in(1);
    instr_is_long_i                     <= instruction_in(0);
   
    instr_src1_shared_i                 <= instruction_in(13) when ((instr_opcode_type_i = ALU) and (instr_marker_type_i= IMM) and (alu_opcode_i = IMAD24) and (instr_is_long_i = '1')) else
														 instruction_in(53) when (instr_is_long_i = '1') else 
														 instruction_in(24);
														 
    instr_src2_const_i                  <= instruction_in(23);
	 
    instr_src3_const_i                  <= instruction_in(22) when ((instr_opcode_type_i = ALU) and (instr_marker_type_i= IMM) and (alu_opcode_i = IMAD24) and (instr_is_long_i = '1')) else
														 instruction_in(24);
   
    pred_reg_out                        <= instruction_in(45 downto 44);
    pred_cond_out                       <= instruction_in(43 downto 39);
    set_pred_i                          <= instruction_in(38);
    set_pred_reg_out                    <= instruction_in(37 downto 36);
    output_reg_out                      <= instruction_in(35);
   
    saturate_out                        <= instruction_in(59);
    abs_saturate_out                    <= instruction_in(52 downto 51);
    cvt_round_out                       <= instruction_in(50 downto 49);
    cvt_type_i                          <= instruction_in(48 downto 46);
    condition_out                       <= instruction_in(48 downto 46);
   
    addr_hi_i                           <= instruction_in(34) when (instr_is_long_i = '1') else '0';
    addr_lo_i                           <= instruction_in(27 downto 26);
    hi_out                              <= instruction_in(46);
    full_out                            <= instruction_in(8);
    addr_incr_out                       <= instruction_in(25);
    mem_type_i                          <= instruction_in(48 downto 46);
    mov_size_i                          <= instruction_in(55 downto 53);
    target_addr_out                     <= instruction_in(27 downto 9);
    imm_hi_out                          <= instruction_in(59 downto 34);
    
    src1_shared_out                     <= instr_src1_shared_i;

    src1_neg_out                        <= instruction_in(48);
    src2_neg_out                        <= instruction_in(22) when ((alu_opcode_i = IMUL24) and (instr_marker_i /= "11")) else instruction_in(49);
    src3_neg_out                        <= instruction_in(22);
      
    --ope_out                             <= instruction_in(27 downto 25);
    --bar_out                             <= instruction_in(24 downto 21);
    --arg_out                             <= instruction_in(20 downto 9);
   
		--decode_flag_check_out <= '1';
	decode_flag_check_out_i <= 
	'1' when (instr_opcode_i = "1100") else
	'0';													--//////////////*************
   

	is_carry_i  <= 
      '1'       when ((instr_opcode_i = "0011") and (instr_is_flow_i = '0') and (instruction_in(22) = '1')) else
      '1'       when (((instr_opcode_i = "0110") and (instr_marker_type_i /= IMM) and (instruction_in(59 downto 58) = "11")) and (instr_is_flow_i = '0')) else
      '0';
        
    instr_marker_type_i <=
      HALF        when (instr_is_long_i = '0') else
      FULL_NORM   when ((instr_marker_i = "00") and (instr_is_long_i = '1')) else
      FULL_END    when ((instr_marker_i = "01") and (instr_is_long_i = '1')) else
      FULL_JOIN   when ((instr_marker_i = "10") and (instr_is_long_i = '1')) else
      IMM         when (instr_marker_i = "11") else
      UNKNOWN;
   
    instr_opcode_type_i <=
      MOV         when (((instr_opcode_i = "0000") or (instr_opcode_i = "0001") or ((instr_opcode_i = "1101") and (instr_subop_i /= "000"))) and (instr_is_flow_i = '0')) else
      ALU         when (((instr_opcode_i = "0010") or (instr_opcode_i = "0011") or (instr_opcode_i = "0100") or (instr_opcode_i = "0110") or (instr_opcode_i = "1010") or ((instr_opcode_i = "1101") and (instr_subop_i = "000"))) and (instr_is_flow_i = '0')) else
      FLOW        when ((instr_is_flow_i = '1') and (instr_opcode_i /= "1111")) else
      MAILBOX     when ((instr_opcode_i = "1100") or (instr_opcode_i = "1110")) else  --***********
      NOP         when (instr_opcode_i = "1111") else
      UNKNOWN;
   
    mov_opcode_i <= 
      LOAD        when ((((instr_opcode_i = "0000") and ((instr_subop_i = "001") or (instr_subop_i = "110"))) or ((instr_opcode_i = "0001") and ((instr_subop_i = "001") or (instr_subop_i = "010"))) or ((instr_opcode_i = "1101") and ((instr_subop_i = "001") or (instr_subop_i = "010") or (instr_subop_i = "100")))) and (instr_is_flow_i = '0')) else
      STORE       when ((((instr_opcode_i = "0000") and ((instr_subop_i = "010") or (instr_subop_i = "101") or (instr_subop_i = "111"))) or ((instr_opcode_i = "1101") and ((instr_subop_i = "011") or (instr_subop_i = "101")))) and (instr_is_flow_i = '0')) else
      MOV         when (((instr_opcode_i = "0001") and ((instr_subop_i = "000") or (instr_is_long_i = '0'))) and (instr_is_flow_i = '0')) else
      SEND     when ((instr_opcode_i = "1100") and (instr_is_long_i = '0')) else  --***********
      RECV     when ((instr_opcode_i = "1110") and (instr_is_long_i = '0')) else  --***********
      UNKNOWN;
   
    mov_mem_type_i <=
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV)) else
	  MEM_SHARED        when ((instr_opcode_type_i = MOV) and (((instr_opcode_i = "0001") and (instr_subop_i = "010")) or ((instr_opcode_i = "0000") and (instr_subop_i = "111")))) else  
--		MEM_SHARED        when ((instr_opcode_type_i = MOV) and (((instr_opcode_i = "0001") and ((instr_subop_i = "010") or (instr_subop_i = "000"))) or ((instr_opcode_i = "0000") and (instr_subop_i = "111")))) else  --MM: Added (or (instr_subop_i = "000")) to decode
      MEM_CONST         when ((instr_opcode_type_i = MOV) and ((instr_opcode_i = "0001") and (instr_subop_i = "001"))) else																														  --    first MOV instruction correctly
      MEM_GLOBAL        when ((instr_opcode_type_i = MOV) and (((instr_opcode_i = "1101") and (instr_subop_i = "100")) or ((instr_opcode_i = "1101") and (instr_subop_i = "101")))) else
      MEM_LOCAL         when ((instr_opcode_type_i = MOV) and (((instr_opcode_i = "1101") and (instr_subop_i = "010")) or ((instr_opcode_i = "1101") and (instr_subop_i = "011")))) else
      ADDRESS_MEM       when ((instr_opcode_type_i = MOV) and ((instr_opcode_i = "0000") and (instr_subop_i = "110"))) else
      ADDRESS_ADDRESS   when ((instr_opcode_type_i = MOV) and ((instr_opcode_i = "1101") and (instr_subop_i = "001"))) else
      ADDRESS           when ((instr_opcode_type_i = MOV) and ((instr_opcode_i = "0000") and (instr_subop_i = "010"))) else
      FLAGS             when ((instr_opcode_type_i = MOV) and (((instr_opcode_i = "0000") and (instr_subop_i = "001")) or ((instr_opcode_i = "0000") and (instr_subop_i = "101")))) else
	MAILBOX_BUF             when ((instr_opcode_type_i = MAILBOX) and ((instr_opcode_i = "1100")  or (instr_opcode_i = "1110"))) else 
      UNKNOWN;
   
    alu_opcode_i <=
--      IADD        when (((instr_opcode_i = "0010") or ((instr_opcode_i = "0011") and (is_carry_i = '1'))) and (instr_is_flow_i = '0')) else  --modified_FROM
      IADD        when ((instr_opcode_i = "0010") and (instr_is_flow_i = '0')) 																		else       --modified_TO
	  IADDC       when (((instr_opcode_i = "0011") and (instr_subop_i = "000") and (is_carry_i = '1')) and (instr_is_flow_i = '0')) else
      IADDC       when (((instr_opcode_i = "0011") and (is_carry_i = '1') and (instr_is_long_i = '0')) and (instr_is_flow_i = '0')) else
      ISUB        when (((instr_opcode_i = "0011") and (instr_subop_i = "000") and (is_carry_i = '0')) and (instr_is_flow_i = '0')) else
      ISUB        when (((instr_opcode_i = "0011") and (is_carry_i = '0') and (instr_is_long_i = '0')) and (instr_is_flow_i = '0')) else
      SET         when (((instr_opcode_i = "0011") and (instr_subop_i = "011")) and (instr_is_flow_i = '0')) else
      MAX         when (((instr_opcode_i = "0011") and (instr_subop_i = "100")) and (instr_is_flow_i = '0')) else
      work.gpgpu_package.MIN         when (((instr_opcode_i = "0011") and (instr_subop_i = "101")) and (instr_is_flow_i = '0')) else
      SHL         when (((instr_opcode_i = "0011") and (instr_subop_i = "110")) and (instr_is_flow_i = '0')) else
      SHR         when (((instr_opcode_i = "0011") and (instr_subop_i = "111")) and (instr_is_flow_i = '0')) else
      IMUL24      when ((instr_opcode_i = "0100") and (instr_is_flow_i = '0')) else
      IMAD24      when ((instr_opcode_i = "0110") and (is_carry_i = '0') and (instr_is_flow_i = '0')) else
      IMAD24C     when ((instr_opcode_i = "0110") and (is_carry_i = '1') and (instr_is_flow_i = '0')) else
      CVT         when ((instr_opcode_i = "1010") and (instr_is_flow_i = '0')) else
      AND_OP      when (((instr_opcode_i = "1101") and (instr_subop_i = "000") and (logic_type_i = "00")) and (instr_is_flow_i = '0')) else
      OR_OP       when (((instr_opcode_i = "1101") and (instr_subop_i = "000") and (logic_type_i = "01")) and (instr_is_flow_i = '0')) else
      XOR_OP      when (((instr_opcode_i = "1101") and (instr_subop_i = "000") and (logic_type_i = "10")) and (instr_is_flow_i = '0')) else
      NEG_OP      when (((instr_opcode_i = "1101") and (instr_subop_i = "000") and (logic_type_i = "11")) and (instr_is_flow_i = '0')) else
      UNKNOWN;
   
    flow_opcode_i <=
      BRANCH      when ((instr_opcode_i = "0001") and (instr_is_flow_i = '1')) else
      CALL        when ((instr_opcode_i = "0010") and (instr_is_flow_i = '1')) else
      RET         when ((instr_opcode_i = "0011") and (instr_is_flow_i = '1')) else
      PREBREAK    when ((instr_opcode_i = "0100") and (instr_is_flow_i = '1')) else
      BREAK       when ((instr_opcode_i = "0101") and (instr_is_flow_i = '1')) else
      BAR         when ((instr_opcode_i = "1000") and (instr_is_flow_i = '1')) else
      JOIN        when ((instr_opcode_i = "1010") and (instr_is_flow_i = '1')) else
      UNKNOWN;
        
    is_full_normal_out <=
        '0'             when ((instr_marker_i = "11") or (instr_is_long_i = '0')) else
        '1';
    
    is_full_marker_i   <=
        '1'     when ((instr_marker_type_i = FULL_NORM) or (instr_marker_type_i = FULL_END) or (instr_marker_type_i = FULL_JOIN)) else
        '0';
        
    is_signed_out <=
      instruction_in(15) when (((instr_opcode_type_i = ALU) and (alu_opcode_i = IMUL24)) and ((instr_marker_type_i = IMM) or (instr_marker_type_i = HALF))) else
      instruction_in(59) when ((instr_opcode_type_i = ALU) and ((alu_opcode_i = SHL) or (alu_opcode_i = SHL) or (alu_opcode_i = CVT))) else
      instruction_in(47) when (((instr_opcode_type_i = ALU) and (alu_opcode_i = IMUL24)) and ((instr_marker_type_i = FULL_NORM) or (instr_marker_type_i = FULL_END) or (instr_marker_type_i = FULL_JOIN))) else
      '0';
      
    w32_i <=
        instruction_in(22) when ((instr_opcode_type_i = ALU) and (alu_opcode_i = IMUL24) and (instr_marker_type_i = IMM)) else
        instruction_in(48) when ((instr_opcode_type_i = ALU) and (alu_opcode_i = IMUL24) and (instr_marker_type_i /= IMM)) else
        instruction_in(58) when ((instr_opcode_type_i = ALU) and (alu_opcode_i = CVT)) else
        instruction_in(58) when ((instr_opcode_type_i = ALU) and (alu_opcode_i = IADD) and (is_full_marker_i = '1')) else
        instruction_in(58) when ((instr_opcode_type_i = ALU) and (alu_opcode_i = ISUB) and (is_full_marker_i = '1')) else
        instruction_in(58) when (((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG)) and (is_full_marker_i = '1')) else
        instruction_in(58) when (instr_opcode_type_i = MOV) and ((mov_opcode_i = LOAD) or (mov_opcode_i = STORE)) and (mov_mem_type_i = MEM_SHARED) else
        instruction_in(58) when (instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_CONST)  else
        instruction_in(58) when (instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM)  else
        instruction_in(15) when (((instr_opcode_type_i = ALU) and (alu_opcode_i = IADD)) and (is_full_marker_i = '0')) else 
        instruction_in(15) when (((instr_opcode_type_i = ALU) and (alu_opcode_i = ISUB)) and (is_full_marker_i = '0')) else 
        instruction_in(15) when (((instr_opcode_type_i = MOV) and (mov_mem_type_i = REG)) and (is_full_marker_i = '0')) else
		  instruction_in(15) when (((instr_opcode_type_i = MAILBOX) and (mov_mem_type_i = MAILBOX_BUF)) and (is_full_marker_i = '0')) else
        '0';
      
    f64_out <=
        instruction_in(54) when (((instr_opcode_type_i = ALU) and (alu_opcode_i = CVT) and (instr_subop_i = "010")) and (is_full_marker_i = '1')) else
        instruction_in(22) when (((instr_opcode_type_i = ALU) and (alu_opcode_i = CVT) and (instr_subop_i = "001")) and (is_full_marker_i = '1')) else
        instruction_in(22) when (instr_opcode_type_i = MOV) else
        '0';
   
    alt_out <= 
        instruction_in(57)  when ((instr_opcode_type_i = MOV) and (instr_is_long_i = '1')) else
        instruction_in(17)  when ((instr_opcode_type_i = MOV) and (instr_is_long_i = '0')) else
        '0';
   
    addr_imm_out <=
--		  instruction_in(53)  when (is_full_marker_i = '1' and instr_opcode_i = "0000" and instr_subop_i="111") else  -- For ST.SHARED memory instruction.Check again.
		instruction_in(58)  when (is_full_marker_i = '1' and (src1_mem_type_i = MEM_SHARED or dest_mem_type_i = MEM_SHARED) and (addr_reg_i /= "000")) else  -- MM: For SHARED memory scatter and gather operations
		instruction_in(15)  when (is_full_marker_i = '0' and (src1_mem_type_i = MEM_SHARED) and (addr_reg_i /= "000")) else  										  -- MM: For SHARED memory gather operations (half instr.)
		instruction_in(52)  when (is_full_marker_i = '1') else
        instruction_in(25);
   
    write_pred_out <=
        set_pred_i          when ((instr_is_flow_i = '0') and (instr_is_long_i = '1')) else
        '0'                 when ((instr_is_flow_i = '0') and (instr_is_long_i = '0')) else
        set_pred_i          when ((instr_is_flow_i = '1') and (instr_is_long_i = '1')) else
        '0';

--		MM: Investigate the cvt_neg_out signal purpose. (05/29/12)
  
--    cvt_neg_out <=
--        '1'     when ((instr_opcode_type_i = ALU) and (alu_opcode_i = CVT) and (is_full_marker_i = '1')) else
--        '0';
    
    cvt_neg_out <= '0';
 
		  
    sm_type_out <= 
        instruction_in(15 downto 14) when ((instr_src1_shared_i = '1') and (is_full_marker_i = '1') and (instr_is_flow_i = '0')) else
        instruction_in(14 downto 13) when ((instr_src1_shared_i = '1') and (is_full_marker_i = '0') and (instr_is_flow_i = '0')) else
        "00";
    
    const_segment_out   <= 
        "000" & instruction_in(57 downto 54)    when ((instr_opcode_type_i = ALU) and (is_full_marker_i = '1')) else
        "000" & instruction_in(57 downto 54)    when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_CONST) and (is_full_marker_i = '1')) else
        instruction_in(22 downto 16)            when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_GLOBAL) and (is_full_marker_i = '1')) else
        instruction_in(22 downto 16)            when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_GLOBAL) and (is_full_marker_i = '1')) else
        (others => '0');
        
    src1_out <=
      x"000000" & "00" & instruction_in(14 downto 9)        when (((instr_opcode_type_i = ALU) and (instr_src1_shared_i = '0')) and (instr_is_long_i = '0')) else
      x"000000" & "0" & instruction_in(15 downto 9)         when (((instr_opcode_type_i = ALU) and (instr_src1_shared_i = '0')) and (instr_is_long_i = '1') and (instr_marker_type_i/= IMM)) else
      x"000000" & "00" & instruction_in(14 downto 9)        when (((instr_opcode_type_i = ALU) and (instr_src1_shared_i = '0')) and (instr_is_long_i = '1') and (instr_marker_type_i= IMM)) else
	  x"000000" & "0000" & instruction_in(12 downto 9)      when (((instr_opcode_type_i = ALU) and (instr_src1_shared_i = '1')) and ((instr_is_long_i = '0') or ((instr_marker_type_i= IMM) and (alu_opcode_i = IMAD24)))) else
      x"000000" & "000" & instruction_in(13 downto 9)       when (((instr_opcode_type_i = ALU) and (instr_src1_shared_i = '1')) and (instr_is_long_i = '1')) else
      x"0000" & "00" & instruction_in(22 downto 9)          when (((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD)) and ((mov_mem_type_i = MEM_SHARED) or (mov_mem_type_i = MEM_LOCAL))) else
      x"0000" & "00" & instruction_in(22 downto 9)          when (((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE)) and (mov_mem_type_i = MEM_LOCAL)) else
      x"0000" & "00" & instruction_in(22 downto 9)          when (((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD)) and (mov_mem_type_i = ADDRESS_ADDRESS)) else
      x"000000" & "00" & instruction_in(14 downto 9)        when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM)) else
      x"000000" & "0" & instruction_in(15 downto 9)         when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_GLOBAL)) else 									--MM: Check again for the global memory case
      x"000000" & "0" & instruction_in(8 downto 2)          when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_GLOBAL)) else												
	  x"000000" & "000" & instruction_in(13 downto 9)       when (((instr_opcode_type_i = MOV) and (instr_src1_shared_i = '1')) and (instr_is_long_i = '1')) else      							--MM: MOV.U16 R0H, g [0x1].U16;
	  x"000000" & "0000" & instruction_in(12 downto 9)      when (((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and(instr_src1_shared_i = '1')) and (instr_is_long_i = '0')) else      							--MM: MOV32 R1, g [A1+0x8] (half instr.);
      x"000000" & "0" & instruction_in(15 downto 9)         when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (instr_src1_shared_i = '0')and (instr_is_long_i = '1')) else   --MM: MOV R6, R124
      x"000000" & "00" & instruction_in(14 downto 9)        when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (instr_src1_shared_i = '0') and (instr_is_long_i = '0')) else  --MM: MOV32 R0, R1

 x"000000" & "00" & instruction_in(14 downto 9)        when ((instr_opcode_type_i = MAILBOX) and ((mov_opcode_i = SEND) or (mov_opcode_i = RECV)) and (instr_is_long_i = '0')) else  --MM: MOV32 R0, R1 ******************************
		(others => '0');
   
    src2_out <=
      x"000000" & "00" & instruction_in(21 downto 16)       when ((instr_opcode_type_i = ALU) and ((instr_marker_type_i = IMM) or (instr_marker_type_i = HALF))) else
      x"000000" & "0" & instruction_in(52 downto 46)        when ((instr_opcode_type_i = ALU) and (alu_opcode_i = IADD) and (instr_is_long_i = '1') and (instr_marker_type_i /= IMM) ) else
	  x"000000" & "0" & instruction_in(22 downto 16)        when ((instr_opcode_type_i = ALU) and (instr_is_long_i = '1')) else
      x"0000" & "00" & instruction_in(22 downto 9)          when (((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD)) and (mov_mem_type_i = MEM_CONST)) else
      x"000000" & "0" & instruction_in(22 downto 16)        when (((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD)) and (mov_mem_type_i = ADDRESS_MEM)) else
      x"000000" & "00" & instruction_in (21 downto 16)      when (((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV)) and (instr_marker_type_i = IMM)) else										--MM: MVI R4, 0x2;
		(others => '0');
   
    src3_out <=
      x"000000" & "000" & instruction_in(27 downto 23)      when ((instr_opcode_type_i = ALU) and (instr_marker_type_i= IMM) and (alu_opcode_i = IMAD24) and (instr_is_long_i = '1')) else
      --??-- x"000000" & "0" & instruction_in(8 downto 2)      when ((instr_opcode_type_i = ALU) and (instr_marker_type_i= IMM) and (alu_opcode_i = IMAD24) and (instr_is_long_i = '1')) else
      x"000000" & "0" & instruction_in(52 downto 46)        when (instr_opcode_type_i = ALU) or ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED)) else
      (others => '0');
   
    dest_out <=
      x"000000" & "00" & instruction_in(7 downto 2)         when ((instr_opcode_type_i = ALU) and (instr_is_long_i = '0')) else
      x"000000" & "0" & instruction_in(8 downto 2)          when ((instr_opcode_type_i = ALU) and (instr_is_long_i = '1')) else
      x"0000" & "000" & instruction_in(21 downto 9)          when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED)) else
      x"000000" & "0" & instruction_in(8 downto 2)          when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_GLOBAL)) else
      x"000000" & "0" & instruction_in(15 downto 9)          when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_GLOBAL)) else
	  x"000000" & "0" & instruction_in(8 downto 2)          when ((instr_opcode_type_i = MOV) and ((mov_opcode_i = LOAD) or (mov_opcode_i = STORE)) and (mov_mem_type_i = MEM_LOCAL)) else
      x"000000" & "0" & instruction_in(8 downto 2)          when (((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD)) and (mov_mem_type_i = ADDRESS_MEM)) else
      x"000000" & "0" & instruction_in(8 downto 2)          when (((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD)) and (mov_mem_type_i = ADDRESS_ADDRESS)) else
      x"000000" & "0" & instruction_in(8 downto 2)          when (((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE)) and (mov_mem_type_i = ADDRESS)) else
      x"000000" & "0" & instruction_in(8 downto 2)          when (((instr_opcode_type_i = MAILBOX) and ((mov_opcode_i = SEND) or (mov_opcode_i = RECV))) and (mov_mem_type_i = MAILBOX_BUF)) else  --**************************
		
	  x"000000" & "000" & instruction_in(6 downto 2)		 	when   (instr_opcode_type_i = MOV) and  (mov_opcode_i = MOV) else
      (others => '0');
   
    addr_hi_i_3     <= "00" & addr_hi_i;
    addr_reg_i      <= (to_stdlogicvector(to_bitvector(addr_hi_i_3) sll 2)) or ("0" & addr_lo_i);
    
    src2_use_gather_i   <=
        '1'             when ((addr_reg_i /= "000") or (instr_src1_shared_i = '1')) else  --MM: addr_reg_i /= "000" (added "/" (not) condition)
        '0';
        
    src1_mem_type_i <=
      REG               when ((instr_opcode_type_i = ALU) and (instr_src1_shared_i = '0')) else
      MEM_SHARED        when ((instr_opcode_type_i = ALU) and (instr_src1_shared_i = '1')) else
      MEM_SHARED        when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (instr_src1_shared_i = '1')) else  -- MM: Added condition for first MOV instruction
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG)) else
      REG               when ((instr_opcode_type_i = MAILBOX) and (mov_opcode_i = SEND) and (mov_mem_type_i = MAILBOX_BUF)) else --***************
		MAILBOX_BUF       when ((instr_opcode_type_i = MAILBOX) and (mov_opcode_i = RECV) and (mov_mem_type_i = MAILBOX_BUF)) else --***************
      MEM_SHARED        when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_SHARED)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED) and (instr_src1_shared_i = '0')) else
      MEM_SHARED        when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED) and (instr_src1_shared_i = '1')) else
      MEM_CONST         when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_CONST)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_GLOBAL)) else
      MEM_GLOBAL        when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_GLOBAL)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_LOCAL)) else
      MEM_LOCAL         when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_LOCAL)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM) and (instr_src1_shared_i = '0')) else
      MEM_SHARED        when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM) and (instr_src1_shared_i = '1')) else
      ADDRESS_ADDRESS   when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_ADDRESS)) else
      ADDRESS           when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = ADDRESS)) else
      FLAGS             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = FLAGS)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS) and (instr_src1_shared_i = '0')) else
      MEM_SHARED        when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS) and (instr_src1_shared_i = '1')) else
      UNKNOWN;
   
    src2_mem_type_i <=
      REG               when ((instr_opcode_type_i = ALU) and (instr_src2_const_i = '0')) else
      MEM_CONST         when ((instr_opcode_type_i = ALU) and (instr_src2_const_i = '1')) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG)) else
      MEM_SHARED        when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_SHARED)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED) and (instr_src2_const_i = '0')) else
      MEM_CONST         when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED) and (instr_src2_const_i = '1')) else
      MEM_CONST         when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_CONST)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_GLOBAL)) else
      MEM_GLOBAL        when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_GLOBAL)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_LOCAL)) else
      MEM_LOCAL         when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_LOCAL)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM) and (instr_src2_const_i = '0')) else
      MEM_CONST         when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM) and (instr_src2_const_i = '1')) else
      ADDRESS_ADDRESS   when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_ADDRESS)) else
      ADDRESS           when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = ADDRESS)) else
      FLAGS             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = FLAGS)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS) and (instr_src2_const_i = '0')) else
      MEM_CONST         when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS) and (instr_src2_const_i = '1')) else
      UNKNOWN;
   
    src3_mem_type_i <=
      REG               when ((instr_opcode_type_i = ALU) and (instr_src3_const_i = '0')) else
      MEM_CONST         when ((instr_opcode_type_i = ALU) and (instr_src3_const_i = '1')) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG)) else
      MEM_SHARED        when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_SHARED)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED) and (instr_src3_const_i = '0')) else
      MEM_CONST         when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED) and (instr_src3_const_i = '1')) else
      MEM_CONST         when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_CONST)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_GLOBAL)) else
      MEM_GLOBAL        when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_GLOBAL)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_LOCAL)) else
      MEM_LOCAL         when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_LOCAL)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM) and (instr_src3_const_i = '0')) else
      MEM_CONST         when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM) and (instr_src3_const_i = '1')) else
      ADDRESS_ADDRESS   when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_ADDRESS)) else
      ADDRESS           when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = ADDRESS)) else
      FLAGS             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = FLAGS)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS) and (instr_src3_const_i = '0')) else
      MEM_CONST         when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS) and (instr_src3_const_i = '1')) else
      UNKNOWN;
   
    dest_mem_type_i <=
      REG               when (instr_opcode_type_i = ALU) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_SHARED)) else
      MEM_SHARED        when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_CONST)) else
      MEM_GLOBAL        when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_GLOBAL)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_GLOBAL)) else
      MEM_LOCAL         when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_LOCAL)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_LOCAL)) else
      ADDRESS           when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM)) else
      ADDRESS           when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_ADDRESS)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = ADDRESS)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = FLAGS)) else
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS)) else
      MAILBOX_BUF       when ((instr_opcode_type_i = MAILBOX) and (mov_opcode_i = SEND) and (mov_mem_type_i = MAILBOX_BUF)) else --***************
		REG		         when ((instr_opcode_type_i = MAILBOX) and (mov_opcode_i = RECV) and (mov_mem_type_i = MAILBOX_BUF)) else --***************
      REG               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS) and (instr_src3_const_i = '1')) else
      UNKNOWN;
      
	 src1_mem_type_out <= src1_mem_type_i;	
	 src2_mem_type_out <= src2_mem_type_i;	
	 src3_mem_type_out <= src3_mem_type_i;	
	 dest_mem_type_out <= dest_mem_type_i;	
		
    src1_mem_opcode_type_out <=
      READ              when ((instr_opcode_type_i = ALU) and (instr_src1_shared_i = '0')) else
      READ              when ((instr_opcode_type_i = ALU) and (instr_src1_shared_i = '1') and (addr_reg_i = "000")) else 
      READ_GATHER       when ((instr_opcode_type_i = ALU) and (instr_src1_shared_i = '1') and (addr_reg_i /= "000")) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG) and (addr_reg_i = "000")) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG) and (addr_reg_i /= "000")) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_SHARED)) else
      READ       when ((instr_opcode_type_i = MAILBOX) and (mov_opcode_i = SEND) and (mov_mem_type_i = MAILBOX_BUF)) else --***********
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED) and (instr_src1_shared_i = '0')) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED) and (instr_src1_shared_i = '1')) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_CONST)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_GLOBAL)) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_GLOBAL)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_LOCAL)) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_LOCAL)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM) and (instr_src1_shared_i = '0')) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM) and (instr_src1_shared_i = '1')) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_ADDRESS)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = ADDRESS)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = FLAGS)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS) and (instr_src1_shared_i = '0')) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS) and (instr_src1_shared_i = '1')) else
      READ;
    
    src2_mem_opcode_type_out <=
      READ              when ((instr_opcode_type_i = ALU) and (instr_src2_const_i = '0')) else
      READ              when ((instr_opcode_type_i = ALU) and (instr_src2_const_i = '1') and (src2_use_gather_i = '0')) else
--      READ_GATHER       when ((instr_opcode_type_i = ALU) and (instr_src2_const_i = '1') and (src2_use_gather_i = '1')) else
      READ		         when ((instr_opcode_type_i = ALU) and (instr_src2_const_i = '1') and (src2_use_gather_i = '1')) else     -- Removed READ_GATHER condition altogether for constant memory
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG)) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_SHARED)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED) and (instr_src2_const_i = '0')) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED) and (instr_src2_const_i = '1') and (src2_use_gather_i = '0')) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED) and (instr_src2_const_i = '1') and (src2_use_gather_i = '1')) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_CONST)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_GLOBAL)) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_GLOBAL)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_LOCAL)) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_LOCAL)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM) and (instr_src2_const_i = '0')) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM) and (instr_src2_const_i = '1') and (src2_use_gather_i = '0')) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM) and (instr_src2_const_i = '1') and (src2_use_gather_i = '1')) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_ADDRESS)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = ADDRESS)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = FLAGS)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS) and (instr_src2_const_i = '0')) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS) and (instr_src2_const_i = '1')) else
      READ;
    
    src3_mem_opcode_type_out <=
      READ              when ((instr_opcode_type_i = ALU) and (instr_src3_const_i = '0')) else
      READ              when ((instr_opcode_type_i = ALU) and (instr_src3_const_i = '1') and (addr_reg_i = "000")) else
      READ_GATHER       when ((instr_opcode_type_i = ALU) and (instr_src3_const_i = '1') and (addr_reg_i /= "000")) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG)) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_SHARED)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED) and (instr_src3_const_i = '0')) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED) and (instr_src3_const_i = '1') and (addr_reg_i = "000")) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED) and (instr_src3_const_i = '1') and (addr_reg_i /= "000")) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_CONST)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_GLOBAL)) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_GLOBAL)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_LOCAL)) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_LOCAL)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM) and (instr_src3_const_i = '0')) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM) and (instr_src3_const_i = '1') and (addr_reg_i = "000")) else
      READ_GATHER       when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM) and (instr_src3_const_i = '1') and (addr_reg_i /= "000")) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_ADDRESS)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = ADDRESS)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = FLAGS)) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS) and (instr_src3_const_i = '0')) else
      READ              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS) and (instr_src3_const_i = '1')) else
      READ;
   
    dest_mem_opcode_type_out <=
      WRITE             when (instr_opcode_type_i = ALU) else
      WRITE             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG)) else
      WRITE             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_SHARED)) else
      WRITE_SCATTER     when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED)) else
      WRITE             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_CONST)) else
      WRITE_SCATTER     when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_GLOBAL)) else
      WRITE             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_GLOBAL)) else
      WRITE_SCATTER     when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_LOCAL)) else
      WRITE             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_LOCAL)) else
      WRITE             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM)) else
      WRITE             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_ADDRESS)) else
      WRITE             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = ADDRESS)) else
      WRITE             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = FLAGS)) else
      WRITE             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS)) else
      WRITE             when ((instr_opcode_type_i = MAILBOX) and ((mov_opcode_i = SEND) or (mov_opcode_i = RECV)) and (mov_mem_type_i = MAILBOX_BUF)) else --*************
      WRITE             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS) and (instr_src3_const_i = '1')) else
      WRITE;
      
    reg_to_data_type    <=
        DT_U16      when (w32_i = '0') else
        DT_U32;
    
    mov_size_to_data_type   <=
        DT_U16      when (mov_size_i = "000") else
        DT_U32      when (mov_size_i = "001") else
        DT_U8       when (mov_size_i = "010") else
        DT_U32;
    
    with mov_size_i select
        data_type_mov_size_i <=                               
            DT_U8   when "000",
            DT_S8   when "001",
            DT_U16  when "010",
            DT_S16  when "011",
            DT_U64  when "100",
            DT_U128 when "101",
            DT_U32  when "110",
            DT_S32  when others;
    
    with mem_type_i select
        sm_type_to_data_type <=                               
            DT_U8  when "000",
            DT_U16  when "001",
            DT_S16   when "010",
            DT_U32  when "011",
            DT_U32  when others;
            
    with cvt_type_i select
        cvt_type_to_data_type <=                               
            DT_U16  when "000",
            DT_U32  when "001",
            DT_U8   when "010",
            DT_U32  when "011",
            DT_S16  when "100",
            DT_S32  when "101",
            DT_S8   when "110",
            DT_U32  when others;
            
    with instr_subop_i select
        subop_to_data_type  <=
            DT_U16  when "000",
            DT_S16  when "001",
            DT_S16  when "010",
            DT_U32  when "011",
            DT_S32  when "100",
            DT_S32  when "101",
            DT_U32  when "110",
            DT_S32  when others;
            
    src1_data_type_out  <=
        DT_NONE                             when ((instr_opcode_type_i = FLOW) or (instr_opcode_type_i = NOP)) else
        subop_to_data_type                  when ((instr_opcode_type_i = ALU) and ((alu_opcode_i = IMAD24) or (alu_opcode_i = IMAD24C)) and (instr_marker_type_i /= IMM)) else
        subop_to_data_type                  when ((instr_opcode_type_i = ALU) and ((alu_opcode_i = IMAD24) or (alu_opcode_i = IMAD24C)) and (instr_marker_type_i = IMM)) else
        reg_to_data_type                    when ((instr_opcode_type_i = ALU) and (alu_opcode_i = IMUL24)) else
        subop_to_data_type                  when ((instr_opcode_type_i = ALU) and (src2_mem_type_i = MEM_CONST) and ((alu_opcode_i = AND_OP) or (alu_opcode_i = OR_OP) or (alu_opcode_i = XOR_OP) or (alu_opcode_i = NEG_OP)) ) else
		  cvt_type_to_data_type               when ((instr_opcode_type_i = ALU) and (alu_opcode_i = CVT)) else
        subop_to_data_type                  when ((instr_opcode_type_i = ALU) and (alu_opcode_i = SET)) else
        reg_to_data_type                    when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG) and (is_full_marker_i = '1')) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG) and (instr_marker_type_i = IMM)) else
        reg_to_data_type                    when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG) and (instr_marker_type_i = HALF)) else

    reg_to_data_type                    when ((instr_opcode_type_i = MAILBOX) and (mov_opcode_i = SEND) and (mov_mem_type_i = MAILBOX_BUF)) else -- and (instr_marker_type_i = HALF)) else --*******************
        sm_type_to_data_type                when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_SHARED)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_CONST)) else
        data_type_mov_size_i                when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_GLOBAL)) else
        data_type_mov_size_i                when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_GLOBAL)) else
        data_type_mov_size_i                when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_LOCAL)) else
        data_type_mov_size_i                when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_LOCAL)) else
        DT_U32                              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM)) else
        DT_U32                              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_ADDRESS)) else
        DT_U32                              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = ADDRESS)) else
        DT_U32                              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = FLAGS)) else
        DT_U32                              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS)) else
        DT_U32;
    
    src2_data_type_out  <=
        DT_NONE                             when ((instr_opcode_type_i = FLOW) or (instr_opcode_type_i = NOP)) else
        subop_to_data_type                  when ((instr_opcode_type_i = ALU) and ((alu_opcode_i = IMAD24) or (alu_opcode_i = IMAD24C)) and (instr_marker_type_i /= IMM)) else
        subop_to_data_type                  when ((instr_opcode_type_i = ALU) and ((alu_opcode_i = IMAD24) or (alu_opcode_i = IMAD24C)) and (instr_marker_type_i = IMM)) else
        reg_to_data_type                    when ((instr_opcode_type_i = ALU) and (alu_opcode_i = IMUL24)) else
        reg_to_data_type                    when ((instr_opcode_type_i = ALU) and (alu_opcode_i = IADD)) else
        subop_to_data_type                  when ((instr_opcode_type_i = ALU) and (src2_mem_type_i = MEM_CONST) and ((alu_opcode_i = AND_OP) or (alu_opcode_i = OR_OP) or (alu_opcode_i = XOR_OP) or (alu_opcode_i = NEG_OP)) ) else
        DT_NONE                             when ((instr_opcode_type_i = ALU) and (alu_opcode_i = CVT)) else
        subop_to_data_type                  when ((instr_opcode_type_i = ALU) and (alu_opcode_i = SET)) else
        DT_U32                  				  when ((instr_opcode_type_i = ALU) and ((alu_opcode_i = AND_OP) or (alu_opcode_i = OR_OP) or (alu_opcode_i = XOR_OP))) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG) and (is_full_marker_i = '1')) else
        reg_to_data_type                    when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG) and (instr_marker_type_i = IMM)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG) and (instr_marker_type_i = HALF)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_SHARED)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED)) else
        sm_type_to_data_type                when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_CONST)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_GLOBAL)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_GLOBAL)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_LOCAL)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_LOCAL)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_ADDRESS)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = ADDRESS)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = FLAGS)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS)) else
        DT_NONE;
    
    src3_data_type_out  <=
        DT_NONE                             when ((instr_opcode_type_i = FLOW) or (instr_opcode_type_i = NOP)) else
        DT_U32                              when ((instr_opcode_type_i = ALU) and ((alu_opcode_i = IMAD24) or (alu_opcode_i = IMAD24C)) and (instr_marker_type_i /= IMM)) else
        DT_U32                              when ((instr_opcode_type_i = ALU) and ((alu_opcode_i = IMAD24) or (alu_opcode_i = IMAD24C)) and (instr_marker_type_i = IMM)) else
        DT_NONE                             when ((instr_opcode_type_i = ALU) and (alu_opcode_i = IMUL24)) else
        DT_NONE                             when ((instr_opcode_type_i = ALU) and (alu_opcode_i = CVT)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG) and (is_full_marker_i = '1')) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG) and (instr_marker_type_i = IMM)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG) and (instr_marker_type_i = HALF)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_SHARED)) else
        reg_to_data_type                    when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_CONST)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_GLOBAL)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_GLOBAL)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_LOCAL)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_LOCAL)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_ADDRESS)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = ADDRESS)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = FLAGS)) else
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS)) else
        DT_NONE;
        
    dest_data_type_out  <=
        DT_NONE                             when ((instr_opcode_type_i = FLOW) or (instr_opcode_type_i = NOP)) else
        DT_U32                              when ((instr_opcode_type_i = ALU) and ((alu_opcode_i = IMAD24) or (alu_opcode_i = IMAD24C)) and (instr_marker_type_i /= IMM)) else
        DT_U32                              when ((instr_opcode_type_i = ALU) and ((alu_opcode_i = IMAD24) or (alu_opcode_i = IMAD24C)) and (instr_marker_type_i = IMM)) else
        DT_U32                              when ((instr_opcode_type_i = ALU) and (alu_opcode_i = IMUL24)) else
        reg_to_data_type                    when ((instr_opcode_type_i = ALU) and (alu_opcode_i = CVT)) else
        subop_to_data_type                  when ((instr_opcode_type_i = ALU) and (src2_mem_type_i = MEM_CONST) and ((alu_opcode_i = AND_OP) or (alu_opcode_i = OR_OP) or (alu_opcode_i = XOR_OP) or (alu_opcode_i = NEG_OP)) ) else
        reg_to_data_type                    when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG) and (is_full_marker_i = '1')) else
        reg_to_data_type                    when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG) and (instr_marker_type_i = IMM)) else
        reg_to_data_type                    when ((instr_opcode_type_i = MOV) and (mov_opcode_i = MOV) and (mov_mem_type_i = REG) and (instr_marker_type_i = HALF)) else
        reg_to_data_type                    when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_SHARED)) else
        mov_size_to_data_type               when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_SHARED)) else
        reg_to_data_type                    when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_CONST)) else
        data_type_mov_size_i                when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_GLOBAL)) else
        data_type_mov_size_i                when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_GLOBAL)) else
        data_type_mov_size_i                when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = MEM_LOCAL)) else
        data_type_mov_size_i                when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = MEM_LOCAL)) else
        DT_U32                              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_MEM)) else
        DT_U32                              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = ADDRESS_ADDRESS)) else
        DT_U32                              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = ADDRESS)) else
        DT_U32                              when ((instr_opcode_type_i = MOV) and (mov_opcode_i = LOAD) and (mov_mem_type_i = FLAGS)) else
        DT_U32                              when ((instr_opcode_type_i = MAILBOX) and ((mov_opcode_i = SEND) or (mov_opcode_i = RECV)) and (mov_mem_type_i = MAILBOX_BUF)) else --********
        DT_NONE                             when ((instr_opcode_type_i = MOV) and (mov_opcode_i = STORE) and (mov_mem_type_i = FLAGS)) else
        DT_U32;
        
    instr_opcode_type_out               <= instr_opcode_type_i;
    instr_subop_type_out                <= instr_subop_i;
    alu_opcode_out                      <= alu_opcode_i;
    mov_opcode_out                      <= mov_opcode_i;
    flow_opcode_out                     <= flow_opcode_i;
   
    instr_marker_type_out               <= instr_marker_type_i;
   
    instr_src1_shared_out               <= instr_src1_shared_i;
    instr_src2_const_out                <= instr_src2_const_i;
    instr_src3_const_out                <= instr_src3_const_i;
    
    addr_hi_out                         <= addr_hi_i;
    addr_lo_out                         <= addr_lo_i;
    addr_reg_out                        <= addr_reg_i;
    w32_out                             <= w32_i;
    cvt_type_out                        <= cvt_type_i;
    mov_size_out                        <= mov_size_i;
    mem_type_out                        <= mem_type_i;
    set_pred_out                        <= set_pred_i;
    
    --
    -- Stats
    --
    stats_out.total_idle            <= std_logic_vector(to_unsigned(stat_idle_total_cnt, stats_out.total_idle'length));
    stats_out.total_processing      <= std_logic_vector(to_unsigned(stat_proc_total_cnt, stats_out.total_processing'length));
    stats_out.total_stall           <= std_logic_vector(to_unsigned(stat_stall_total_cnt, stats_out.total_stall'length));
    
    pPipelineDecodeStats : process(clk_in)
    begin
        if(rising_edge(clk_in)) then
            if (reset = '1' or stats_reset = '1') then
                stat_idle_cnt                           <= 0;
                stat_idle_total_cnt                     <= 0;
                stat_proc_cnt                           <= 0;
                stat_proc_total_cnt                     <= 0;
                stat_stall_cnt                          <= 0;
                stat_stall_total_cnt                    <= 0;
            else
                case decode_state_machine is
                    when IDLE =>
                        if (en_reg = '0' and en = '1') then
                            stat_idle_cnt               <= 0;
                            stat_proc_cnt               <= stat_proc_cnt + 1;
                            stat_proc_total_cnt         <= stat_proc_total_cnt + 1;
                        else
                            stat_idle_cnt               <= stat_idle_cnt + 1;
                            stat_idle_total_cnt         <= stat_idle_total_cnt + 1;
                            stat_proc_cnt               <= 0;
                        end if;
                    when DECODE_INSTRUCTION =>
                        if (pipeline_stall_in = '0') then
                            stat_stall_cnt              <= 0;
                        else
                            stat_stall_cnt              <= stat_stall_cnt + 1;
                            stat_stall_total_cnt        <= stat_stall_total_cnt + 1;
                        end if;
                    when others =>
                end case;
            end if;
        end if;
    end process;
	 
	 decode_flag_check_out	<=	decode_flag_check_out_i;
    --decode_flag_check_out	<=	en;
	 
end arch;

