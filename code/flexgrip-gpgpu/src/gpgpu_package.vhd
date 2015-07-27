----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010 
-- Design Name: 
-- Module Name:      gpgpu_package - package 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
----------------------------------------------------------------------------
-- Revisions:       
--  REV:        Date:           Description:
--  0.1.a       9/13/2010       Created Top level file 
----------------------------------------------------------------------------

library ieee;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
--use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

package gpgpu_package is

    --
    -- Constants
    --
    constant CORES                      : integer := 16; --8;
    constant WARP_SIZE                  : std_logic_vector(5 downto 0) := "100000";
    constant WARP_LANES                 : integer := 2; --4;
	constant MAX_WARPS_PER_BLOCK        : integer := 16;
	constant MAX_WARPS                  : integer := 24;
	constant MAX_VGPR                   : integer := 512;
	constant MAX_CTAS                   : integer := 8;
	constant MAX_THREADS                : integer := 768; -- MAX_WARPS * WARP_SIZE = 768
	constant MAX_ADDR_REGS              : integer := 4;
	constant MAX_PRED_REGS              : integer := 4;
	constant MAX_SAMPLERS               : integer := 16;
	constant CODE_START                 : std_logic_vector(31 downto 0) := x"00000000";
    constant CORE_COUNT                 : std_logic_vector(7 downto 0) := x"01";
    
	-- 16 * 64 K
	constant CONST_START                : std_logic_vector(31 downto 0) := x"00000000";	-- -> 0x00100000
	constant CONST_SEG_SIZE             : std_logic_vector(31 downto 0) := x"00010000"; -- integer := 64 * 1024;
	constant CONST_SEG_NUM              : integer := 16;

	constant SHARED_START               : std_logic_vector(31 downto 0) := x"00100000";	-- -> 0x00104000
	constant SHARED_SIZE                : integer := 16 * 1024;
	
	constant LOCAL_START                : std_logic_vector(31 downto 0) := x"30000000";
	constant GLOBAL_START               : std_logic_vector(31 downto 0) := x"40000000";
    
    constant CONFIG_PARAMS_START        : std_logic_vector(31 downto 0) := x"00000020";	-- 
    
    constant STACK_DEPTH                : integer := 32;
    constant STACK_DATA_WIDTH           : integer := 66;
    
    constant TEMP_REG_COUNT             : integer := 6;
	constant TEMP_REG_SRC1              : integer := 0;
	constant TEMP_REG_SRC2              : integer := 2;
	constant TEMP_REG_SRC3              : integer := 4;
	constant TEMP_REG_DEST              : integer := 0;
    
    constant GMEM_ADDR_SIZE             : integer := 18;
    constant CMEM_ADDR_SIZE             : integer := 13;
    constant SYSMEM_ADDR_SIZE           : integer := 9;
    constant SHMEM_ADDR_SIZE            : integer := 14;
    constant SHMEM_PARAM_SIZE           : integer := 16;
    
    --
    -- Functions
    --
    function log2(n : integer) return integer;
    
    --
    -- Types
    --
    type instr_opcode_type is (MOV, ALU, FLOW, NOP, MAILBOX, UNKNOWN);
    type instr_opcode_array is array(instr_opcode_type) of std_logic_vector(3 downto 0);
    constant encode_instr_opcode : instr_opcode_array := (MOV => "0000", ALU => "0001", FLOW => "0010", NOP => "0011", UNKNOWN => "0100", MAILBOX => "0101");
   
    type instr_marker_type is (FULL_NORM, FULL_END, FULL_JOIN, IMM, HALF, UNKNOWN);
    type instr_marker_array is array(instr_marker_type) of std_logic_vector(3 downto 0);
    constant encode_instr_marker : instr_marker_array := (FULL_NORM => "0000", FULL_END => "0001", FULL_JOIN => "0010", IMM => "0011", HALF => "0100", UNKNOWN => "0101");
   
    type mov_opcode_type is (LOAD, STORE, MOV, SEND, RECV, UNKNOWN);
    type mov_opcode_array is array(mov_opcode_type) of std_logic_vector(3 downto 0);
    constant encode_mov_opcode : mov_opcode_array := (LOAD => "0000", STORE => "0001", MOV => "0010", UNKNOWN => "0011", SEND => "0100", RECV => "0101");
   
    type mem_type is (REG, MEM_SHARED, MEM_LOCAL, MEM_GLOBAL, MEM_CONST, ADDRESS_MEM, ADDRESS_ADDRESS, ADDRESS, FLAGS, MAILBOX_BUF, UNKNOWN);
    type mem_type_array is array(mem_type) of std_logic_vector(3 downto 0);
    constant encode_mem_type : mem_type_array := (REG => "0000", MEM_SHARED => "0001", MEM_LOCAL => "0010", MEM_GLOBAL => "0011", MEM_CONST => "0100", ADDRESS_MEM => "0101", ADDRESS_ADDRESS => "0110", ADDRESS => "0111", FLAGS => "1000", UNKNOWN => "1001", MAILBOX_BUF => "1010");
   
    type alu_opcode_type is (IADD, IADDC, ISUB, SET, MIN, MAX, SHL, SHR, AND_OP, OR_OP, XOR_OP, NEG_OP, IMUL24, IMAD24, IMAD24C, CVT, UNKNOWN);
    type alu_opcode_array is array(alu_opcode_type) of std_logic_vector(4 downto 0);
    constant encode_alu_opcode : alu_opcode_array := (IADD => "00000", IADDC => "00001", ISUB => "00010", SET => "00011", MIN => "00100", MAX => "00101", SHL => "00110", SHR => "00111", AND_OP => "01000", OR_OP => "01001", XOR_OP => "01010", NEG_OP => "01011", IMUL24 => "01100", IMAD24 => "01101", IMAD24C => "01110", CVT => "01111", UNKNOWN => "10000");
   
    type flow_opcode_type is (BRANCH, CALL, RET, PREBREAK, BREAK, BAR, JOIN, UNKNOWN);
    type flow_opcode_array is array(flow_opcode_type) of std_logic_vector(3 downto 0);
    constant encode_flow_opcode : flow_opcode_array := (BRANCH => "0000", CALL => "0001", RET => "0010", PREBREAK => "0011", BREAK => "0100", BAR => "0101", JOIN => "0110", UNKNOWN => "0111");
   
    type conv_type is (CT_U16, CT_U32, CT_U8, CT_U32U8, CT_S16, CT_S32, CT_S8, CT_NONE);
    type conv_type_array is array(conv_type) of std_logic_vector(2 downto 0);
    constant encode_conv_type : conv_type_array := (CT_U16 => "000", CT_U32 => "001", CT_U8 => "010", CT_U32U8 => "011", CT_S16 => "100", CT_S32 => "101", CT_S8 => "110", CT_NONE => "111");
   
    type abs_sat_type is (AS_NONE, AS_SAT, AS_ABS, AS_SSAT);
    type abs_sat_array is array(abs_sat_type) of std_logic_vector(3 downto 0);
    constant encode_abs_sat : abs_sat_array := (AS_NONE => "0000", AS_SAT => "0001", AS_ABS => "0010", AS_SSAT => "0011");
    
    type sm_type is (SM_U8, SM_U16, SM_S16, SM_U32, SM_NONE);
    type sm_type_array is array(sm_type) of std_logic_vector(2 downto 0);
    constant encode_sm_type : sm_type_array := (SM_U8 => "000", SM_U16 => "001", SM_S16 => "010", SM_U32 => "011", SM_NONE => "111");
    
    type data_type is (DT_U8, DT_S8, DT_U16, DT_S16, DT_U64, DT_U128, DT_U32, DT_S32, DT_F32, DT_F64, DT_NONE, DT_UNKNOWN);
    type data_type_array is array(data_type) of std_logic_vector(3 downto 0);
    constant encode_data_type : data_type_array := (DT_U8 => "0000", DT_S8 => "0001", DT_U16 => "0010", DT_S16 => "0011", DT_U64 => "0100", DT_U128 => "0101", DT_U32 => "0110", DT_S32 => "0111", DT_F32 => "1000", DT_F64 => "1001", DT_NONE => "1010", DT_UNKNOWN => "1011");
    
    type reg_type is (RT_U16, RT_U32, RT_U64, RT_NONE);
    type reg_type_array is array(reg_type) of std_logic_vector(1 downto 0);
    constant encode_reg_type : reg_type_array := (RT_U16 => "00", RT_U32 => "01", RT_U64 => "10", RT_NONE => "11");
    
    type mem_opcode_type is (READ, READ_GATHER, WRITE, WRITE_SCATTER);
    type mem_opcode_type_array is array(mem_opcode_type) of std_logic_vector(1 downto 0);
    constant encode_mem_opcode_type : mem_opcode_type_array := (READ => "00", READ_GATHER => "01", WRITE => "10", WRITE_SCATTER => "11");
    
    type flag_type is (FLAG_ZERO, FLAG_SIGN, FLAG_CARRY, FLAG_OVERFLOW);
    type flag_type_array is array(flag_type) of natural range 0 to 3;
    constant encode_flag_type : flag_type_array := (FLAG_ZERO => 0, FLAG_SIGN => 1, FLAG_CARRY => 2, FLAG_OVERFLOW => 3);
    
    type warp_state_type is (READY, ACTIVE, WAITING_FENCE, FINISHED);
    type warp_state_array is array(warp_state_type) of std_logic_vector(1 downto 0);
    constant encode_warp_state : warp_state_array := (READY => "00", ACTIVE => "01", WAITING_FENCE => "10", FINISHED => "11");
    
    type warp_stack_token_type is (ID_SYNC, ID_DIVERGE, ID_CALL, ID_BREAK);
    type warp_stack_token_array is array(warp_stack_token_type) of std_logic_vector(1 downto 0);
    constant encode_warp_stack_token : warp_stack_token_array := (ID_SYNC => "00", ID_DIVERGE => "01", ID_CALL => "10", ID_BREAK => "11");
    
    type fence_regs_std_array is array (MAX_WARPS-1 downto 0) of std_logic;
    type fence_regs_vector_array is array (MAX_WARPS-1 downto 0) of std_logic_vector(3 downto 0);
    
    type warp_id_array is array (CORES-1 downto 0) of std_logic_vector(4 downto 0);
    type warp_lane_id_array is array (CORES-1 downto 0) of std_logic_vector(1 downto 0);
    type gprs_addr_array is array (CORES-1 downto 0) of std_logic_vector(8 downto 0);
    type gprs_reg_array is array (CORES-1 downto 0) of std_logic_vector(8 downto 0);
    type reg_num_array is array (CORES-1 downto 0) of std_logic_vector(1 downto 0);
    type wr_en_array is array (CORES-1 downto 0) of std_logic;
    
    type warp_div_std_logic_array is array (MAX_WARPS-1 downto 0) of std_logic;
    type warp_div_data_array is array (MAX_WARPS-1 downto 0) of std_logic_vector(STACK_DATA_WIDTH-1 downto 0);
    
    type mask_vector_array is array (3 downto 0) of std_logic_vector(7 downto 0);
    
	type vector_register is array (CORES-1 downto 0) of std_logic_vector(31 downto 0);
    type vector_word_register is array (3 downto 0) of std_logic_vector(31 downto 0);
    type vector_word_register_array is array (CORES-1 downto 0) of vector_word_register;
    type vector_register_array is array (TEMP_REG_COUNT-1 downto 0) of vector_word_register;
    type temp_vector_register is array (CORES-1 downto 0) of vector_register_array;
    
    type vector_flag_register is array (CORES-1 downto 0) of std_logic_vector(3 downto 0);
    type vector_pred_register is array (31 downto 0) of std_logic_vector(3 downto 0);
    
    --
    -- Stats
    --
    type stat_stages_type is (SMP_STATS, WARP_GENERATOR_STATS, WARP_SCHEDULER_STATS, WARP_CHECKER_STATS, PIPELINE_FETCH_STATS, 
                              PIPELINE_DECODE_STATS, PIPELINE_READ_STATS, PIPELINE_EXECUTE_STATS, PIPELINE_WRITE_STATS, INSTRUCTION_STATS);
    type stat_stages_array is array(stat_stages_type) of natural range 0 to 9;
    constant stat_stages : stat_stages_array := (SMP_STATS => 0, WARP_GENERATOR_STATS => 1, WARP_SCHEDULER_STATS => 2, 
                                                 WARP_CHECKER_STATS => 3, PIPELINE_FETCH_STATS => 4, PIPELINE_DECODE_STATS => 5,
                                                 PIPELINE_READ_STATS => 6, PIPELINE_EXECUTE_STATS => 7, PIPELINE_WRITE_STATS => 8,
                                                 INSTRUCTION_STATS => 9);
    
    --type stat_registers_type is (TOTAL_IDLE, TOTAL_PROCESSING, TOTAL_STALL, TOTAL);
    type stat_record is record
        total_idle          : std_logic_vector(31 downto 0);
        total_processing    : std_logic_vector(31 downto 0);
        total_stall         : std_logic_vector(31 downto 0);
        total               : std_logic_vector(31 downto 0);
    end record;
    --type stat_register_array is array (stat_registers_type'length-1 downto 0) of std_logic_vector(31 downto 0);
    type vector_stat_registers is array (stat_stages'length-1 downto 0) of stat_record;
    
end gpgpu_package;
 
package body gpgpu_package is

    function log2(n : integer) return integer is
        variable i : integer := 0;
    begin
        while (2**i <= n) loop
            i := i + 1;
        end loop;
        return i-1;
    end log2;

    function maximum (
        left, right : std_logic_vector
    )
    return std_logic_vector is
    begin  -- function max
        if unsigned(LEFT) > unsigned(RIGHT) 
            then return LEFT;
        else 
            return RIGHT;
        end if;
    end function maximum;
  
    function minimum (
        left, right : std_logic_vector
    )
    return std_logic_vector is
    begin  -- function minimum
        if unsigned(LEFT) < unsigned(RIGHT) 
            then return LEFT;
        else 
            return RIGHT;
        end if;
    end function minimum;
  
end gpgpu_package;