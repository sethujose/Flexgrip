----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      scalar_processor - arch 
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

library int_add_sub_lib;
library int_mult_24_lib;
library shift_logical_lib;
library boolean_functions_lib;
library min_max_lib;
library convert_int_int_lib;
library compute_set_pred_lib;

use work.gpgpu_package.all;

    entity scalar_processor is
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
    end scalar_processor;

architecture arch of scalar_processor is

    component integer_add_subtract  
        port (
            ce_1                    : in std_logic; 
            clk_1                   : in std_logic; 
            a_in                    : in std_logic_vector(31 downto 0); 
            a_neg_in                : in std_logic; 
            b_in                    : in std_logic_vector(31 downto 0); 
            b_neg_in                : in std_logic; 
            carry_in                : in std_logic; 
            saturate_in             : in std_logic; 
            sub_en                  : in std_logic; 
            w32_in                  : in std_logic; 
            carry_out               : out std_logic; 
            overflow_out            : out std_logic; 
            result_out              : out std_logic_vector(31 downto 0)
        );
    end component;

    component integer_mult_24  
        port (
            ce_1                    : in std_logic; 
            clk_1                   : in std_logic; 
            a_in                    : in std_logic_vector(31 downto 0); 
            a_neg_in                : in std_logic; 
            b_in                    : in std_logic_vector(31 downto 0); 
            b_neg_in                : in std_logic; 
            is_signed_in            : in std_logic; 
            w32_in                  : in std_logic; 
            result_out              : out std_logic_vector(31 downto 0)
        );
    end component;
    
    component shift_logical  
        port (
            ce_1                    : in std_logic; 
            clk_1                   : in std_logic; 
            a_in                    : in std_logic_vector(31 downto 0); 
            b_in                    : in std_logic_vector(31 downto 0);
            is_signed_in            : in std_logic; 
            w32_in                  : in std_logic; 
            sll_out                 : out std_logic_vector(31 downto 0); 
            srl_out                 : out std_logic_vector(31 downto 0)
        );
    end component;
    
    component boolean_functions  
        port (
            ce_1                    : in std_logic; 
            clk_1                   : in std_logic; 
            a_in                    : in std_logic_vector(31 downto 0); 
            b_in                    : in std_logic_vector(31 downto 0); 
            and_out                 : out std_logic_vector(31 downto 0); 
            neg_out                 : out std_logic_vector(31 downto 0); 
            or_out                  : out std_logic_vector(31 downto 0); 
            xor_out                 : out std_logic_vector(31 downto 0)
        );
    end component;
    
    component min_max  
        port (
            a_in                    : in std_logic_vector(31 downto 0); 
            b_in                    : in std_logic_vector(31 downto 0); 
            ce_1                    : in std_logic; 
            clk_1                   : in std_logic; 
            is_signed_in            : in std_logic; 
            w32_in                  : in std_logic; 
            max_out                 : out std_logic_vector(31 downto 0); 
            min_out                 : out std_logic_vector(31 downto 0)
        );
    end component;

    component convert_int_int  
        port (
            ce_1                    : in std_logic; 
            clk_1                   : in std_logic; 
            a_in                    : in std_logic_vector(31 downto 0); 
            abs_saturate_in         : in std_logic_vector(1 downto 0); 
            cvt_neg_in              : in std_logic; 
            cvt_type_in             : in std_logic_vector(2 downto 0); 
            w32_in                  : in std_logic; 
            result_out              : out std_logic_vector(31 downto 0)
        );
    end component;

    component compute_set_pred_i  
        port (
            ce_1                    : in std_logic; 
            clk_1                   : in std_logic; 
            is_signed_in            : in std_logic; 
            set_cond_in             : in std_logic_vector(2 downto 0); 
            src_1_in                : in std_logic_vector(31 downto 0); 
            src_2_in                : in std_logic_vector(31 downto 0); 
            w32_in                  : in std_logic; 
            result_out              : out std_logic_vector(31 downto 0); 
            sign_out                : out std_logic; 
            zero_out                : out std_logic
        );
    end component;
    
    signal srca_i                   : std_logic_vector(31 downto 0);
    signal srcb_i                   : std_logic_vector(31 downto 0);
    
    signal srca_iaddsub_i           : std_logic_vector(31 downto 0);
    signal srcb_iaddsub_i           : std_logic_vector(31 downto 0);
    
    signal src_a_neg_i              : std_logic;
    signal src_b_neg_i              : std_logic;
    signal src_c_neg_i              : std_logic;
    
    signal sub_en_i                 : std_logic;
    signal carry_i                  : std_logic;
    signal w32_i                    : std_logic;
    signal is_signed_i              : std_logic;
    signal saturate_i               : std_logic;
    
    signal sum_o                    : std_logic_vector(31 downto 0);
    signal carry_o                  : std_logic;
    signal overflow_o               : std_logic;
    signal product_o                : std_logic_vector(31 downto 0);
    signal sll_o                    : std_logic_vector(31 downto 0);
    signal srl_o                    : std_logic_vector(31 downto 0);
    signal neg_o                    : std_logic_vector(31 downto 0);
    signal and_o                    : std_logic_vector(31 downto 0);
    signal or_o                     : std_logic_vector(31 downto 0);
    signal xor_o                    : std_logic_vector(31 downto 0);
    signal max_o                    : std_logic_vector(31 downto 0);
    signal min_o                    : std_logic_vector(31 downto 0);
    signal convert_o                : std_logic_vector(31 downto 0);
    signal compute_pred_o           : std_logic_vector(31 downto 0);
    signal sign_o                   : std_logic;
    signal zero_o                   : std_logic;
    
begin

    srca_i          <=  src1_in;
    
    srcb_i          <=  src2_in;
    
    srca_iaddsub_i  <=  
        product_o   when (alu_opcode_type_in = IMAD24) else  
        src1_in;

    srcb_iaddsub_i  <=
        src3_in     when ((alu_opcode_type_in = IMAD24) or (alu_opcode_type_in = IMAD24C) ) else  --MM: removed "or (is_full_normal_in = '1')"
        src2_in;																											  -- from the condition statement
    
    src_a_neg_i     <=
        '1'         when (alu_opcode_type_in = ISUB) else
        '1'         when ((alu_opcode_type_in = IADDC) and (is_full_normal_in = '0')) else
        src1_neg_in when ((alu_opcode_type_in = IMUL24) and (is_full_normal_in = '1')) else
        '0';
        
    src_b_neg_i     <=
        src3_neg_in   when (alu_opcode_type_in = IADD) else
        src2_neg_in   when ((alu_opcode_type_in = IMUL24) and (is_full_normal_in = '0')) else
        src3_neg_in   when ((alu_opcode_type_in = IMAD24) and (is_full_normal_in = '0')) else
        '0';
        
    src_c_neg_i     <= src3_neg_in;
    
    sub_en_i        <=
        '1'         when (alu_opcode_type_in = ISUB) else
        '0';
        
    w32_i           <=
        '1'         when ((alu_opcode_type_in = IMAD24) or (alu_opcode_type_in = IMAD24C)) else
        w32_in;
    
    carry_i         <=
        carry_in    when ((alu_opcode_type_in = IADDC) or (alu_opcode_type_in = IMAD24C)) else
        '0';
    
    is_signed_i     <=
        '1'         when (((alu_opcode_type_in = IMAD24) or (alu_opcode_type_in = IMAD24C)) and ((instr_subop_type_in = "001") or (instr_subop_type_in = "100") or (instr_subop_type_in = "111"))) else
        '0'         when (((alu_opcode_type_in = IMAD24) or (alu_opcode_type_in = IMAD24C)) and ((instr_subop_type_in = "000") or (instr_subop_type_in = "010") or (instr_subop_type_in = "011") or (instr_subop_type_in = "101") or (instr_subop_type_in = "110"))) else
        is_signed_in;
    
    saturate_i      <=
        '1'         when (((alu_opcode_type_in = IMAD24) or (alu_opcode_type_in = IMAD24C)) and (instr_subop_type_in = "101")) else
        '0'         when (((alu_opcode_type_in = IMAD24) or (alu_opcode_type_in = IMAD24C)) and ((instr_subop_type_in = "000") or (instr_subop_type_in = "001") or (instr_subop_type_in = "010") or (instr_subop_type_in = "011") or (instr_subop_type_in = "100") or (instr_subop_type_in = "110") or (instr_subop_type_in = "111"))) else
        saturate_in;
        
    uIAddSubrtract : integer_add_subtract
        port map (
            ce_1            => '1',
            clk_1           => clk_in,
            a_in            => srca_iaddsub_i,
            a_neg_in        => src_a_neg_i,
            b_in            => srcb_iaddsub_i,
            b_neg_in        => src_b_neg_i,
            carry_in        => carry_i,
            saturate_in     => saturate_i,
            sub_en          => sub_en_i,
            w32_in          => w32_in,
            carry_out       => carry_o,
            overflow_out    => overflow_o,
            result_out      => sum_o
        );
    
    uIMult24 : integer_mult_24
        port map (
            ce_1            => '1',
            clk_1           => clk_in,
            a_in            => srca_i,
            a_neg_in        => src_a_neg_i,
            b_in            => srcb_i,
            b_neg_in        => src_b_neg_i,
            is_signed_in    => is_signed_i,
            w32_in          => w32_in,
            result_out      => product_o
        );

    uShiftLogical : shift_logical
        port map (
            ce_1            => '1',
            clk_1           => clk_in,
            a_in            => srca_i,
            b_in            => srcb_i,
            is_signed_in    => is_signed_i,
            w32_in          => w32_in,
            sll_out         => sll_o,
            srl_out         => srl_o
        );
    
    uBoolean : boolean_functions
        port map (
            ce_1            => '1',
            clk_1           => clk_in,
            a_in            => srca_i,
            b_in            => srcb_i,
            and_out         => and_o,
            neg_out         => neg_o,
            or_out          => or_o,
            xor_out         => xor_o
        );

    uMinMax : min_max
        port map (
            ce_1            => '1',
            clk_1           => clk_in,
            a_in            => srca_i,
            b_in            => srcb_i,
            is_signed_in    => is_signed_i,
            w32_in          => w32_in,
            max_out         => max_o,
            min_out         => min_o
        );
    
    uConvertIntInt : convert_int_int
        port map (
            ce_1            => '1',
            clk_1           => clk_in,
            a_in            => srca_i,
            abs_saturate_in => abs_saturate_in,
            cvt_neg_in      => cvt_neg_in,
            cvt_type_in     => cvt_type_in,
            w32_in          => w32_in,
            result_out      => convert_o
        );

    uComputeSetPredI : compute_set_pred_i
        port map (
            ce_1            => '1',
            clk_1           => clk_in,
            is_signed_in    => is_signed_i,
            set_cond_in     => set_cond_in,
            src_1_in        => srca_i,
            src_2_in        => srcb_i,
            w32_in          => w32_in,
            result_out      => compute_pred_o,
            sign_out        => sign_o,
            zero_out        => zero_o
        );
    
    
    result_out  <=
        sum_o               when ((alu_opcode_type_in = IADD) or (alu_opcode_type_in = IADDC) or (alu_opcode_type_in = ISUB) or (alu_opcode_type_in = IMAD24) or (alu_opcode_type_in = IMAD24C)) else
        min_o               when (alu_opcode_type_in = work.gpgpu_package.MIN) else
        max_o               when (alu_opcode_type_in = MAX) else
        sll_o               when (alu_opcode_type_in = SHL) else
        srl_o               when (alu_opcode_type_in = SHR) else
        and_o               when (alu_opcode_type_in = AND_OP) else
        or_o                when (alu_opcode_type_in = OR_OP) else
        xor_o               when (alu_opcode_type_in = XOR_OP) else
        neg_o               when (alu_opcode_type_in = NEG_OP) else
        product_o           when (alu_opcode_type_in = IMUL24) else
        convert_o           when (alu_opcode_type_in = CVT) else
        compute_pred_o      when (alu_opcode_type_in = SET) else
        x"00000000";

    carry_out               <= carry_o;
    overflow_out            <= overflow_o;
    sign_out                <= sign_o;
    zero_out                <= zero_o;
    
end arch;

