
-------------------------------------------------------------------
-- System Generator version 13.2 VHDL source file.
--
-- Copyright(C) 2011 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2011 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
package conv_pkg is
    constant simulating : boolean := false
      -- synopsys translate_off
        or true
      -- synopsys translate_on
    ;
    constant xlUnsigned : integer := 1;
    constant xlSigned : integer := 2;
    constant xlWrap : integer := 1;
    constant xlSaturate : integer := 2;
    constant xlTruncate : integer := 1;
    constant xlRound : integer := 2;
    constant xlRoundBanker : integer := 3;
    constant xlAddMode : integer := 1;
    constant xlSubMode : integer := 2;
    attribute black_box : boolean;
    attribute syn_black_box : boolean;
    attribute fpga_dont_touch: string;
    attribute box_type :  string;
    attribute keep : string;
    attribute syn_keep : boolean;
    function std_logic_vector_to_unsigned(inp : std_logic_vector) return unsigned;
    function unsigned_to_std_logic_vector(inp : unsigned) return std_logic_vector;
    function std_logic_vector_to_signed(inp : std_logic_vector) return signed;
    function signed_to_std_logic_vector(inp : signed) return std_logic_vector;
    function unsigned_to_signed(inp : unsigned) return signed;
    function signed_to_unsigned(inp : signed) return unsigned;
    function pos(inp : std_logic_vector; arith : INTEGER) return boolean;
    function all_same(inp: std_logic_vector) return boolean;
    function all_zeros(inp: std_logic_vector) return boolean;
    function is_point_five(inp: std_logic_vector) return boolean;
    function all_ones(inp: std_logic_vector) return boolean;
    function convert_type (inp : std_logic_vector; old_width, old_bin_pt,
                           old_arith, new_width, new_bin_pt, new_arith,
                           quantization, overflow : INTEGER)
        return std_logic_vector;
    function cast (inp : std_logic_vector; old_bin_pt,
                   new_width, new_bin_pt, new_arith : INTEGER)
        return std_logic_vector;
    function vec_slice (inp : std_logic_vector; upper, lower : INTEGER)
        return std_logic_vector;
    function s2u_slice (inp : signed; upper, lower : INTEGER)
        return unsigned;
    function u2u_slice (inp : unsigned; upper, lower : INTEGER)
        return unsigned;
    function s2s_cast (inp : signed; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return signed;
    function u2s_cast (inp : unsigned; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return signed;
    function s2u_cast (inp : signed; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return unsigned;
    function u2u_cast (inp : unsigned; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return unsigned;
    function u2v_cast (inp : unsigned; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return std_logic_vector;
    function s2v_cast (inp : signed; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return std_logic_vector;
    function trunc (inp : std_logic_vector; old_width, old_bin_pt, old_arith,
                    new_width, new_bin_pt, new_arith : INTEGER)
        return std_logic_vector;
    function round_towards_inf (inp : std_logic_vector; old_width, old_bin_pt,
                                old_arith, new_width, new_bin_pt,
                                new_arith : INTEGER) return std_logic_vector;
    function round_towards_even (inp : std_logic_vector; old_width, old_bin_pt,
                                old_arith, new_width, new_bin_pt,
                                new_arith : INTEGER) return std_logic_vector;
    function max_signed(width : INTEGER) return std_logic_vector;
    function min_signed(width : INTEGER) return std_logic_vector;
    function saturation_arith(inp:  std_logic_vector;  old_width, old_bin_pt,
                              old_arith, new_width, new_bin_pt, new_arith
                              : INTEGER) return std_logic_vector;
    function wrap_arith(inp:  std_logic_vector;  old_width, old_bin_pt,
                        old_arith, new_width, new_bin_pt, new_arith : INTEGER)
                        return std_logic_vector;
    function fractional_bits(a_bin_pt, b_bin_pt: INTEGER) return INTEGER;
    function integer_bits(a_width, a_bin_pt, b_width, b_bin_pt: INTEGER)
        return INTEGER;
    function sign_ext(inp : std_logic_vector; new_width : INTEGER)
        return std_logic_vector;
    function zero_ext(inp : std_logic_vector; new_width : INTEGER)
        return std_logic_vector;
    function zero_ext(inp : std_logic; new_width : INTEGER)
        return std_logic_vector;
    function extend_MSB(inp : std_logic_vector; new_width, arith : INTEGER)
        return std_logic_vector;
    function align_input(inp : std_logic_vector; old_width, delta, new_arith,
                          new_width: INTEGER)
        return std_logic_vector;
    function pad_LSB(inp : std_logic_vector; new_width: integer)
        return std_logic_vector;
    function pad_LSB(inp : std_logic_vector; new_width, arith : integer)
        return std_logic_vector;
    function max(L, R: INTEGER) return INTEGER;
    function min(L, R: INTEGER) return INTEGER;
    function "="(left,right: STRING) return boolean;
    function boolean_to_signed (inp : boolean; width: integer)
        return signed;
    function boolean_to_unsigned (inp : boolean; width: integer)
        return unsigned;
    function boolean_to_vector (inp : boolean)
        return std_logic_vector;
    function std_logic_to_vector (inp : std_logic)
        return std_logic_vector;
    function integer_to_std_logic_vector (inp : integer;  width, arith : integer)
        return std_logic_vector;
    function std_logic_vector_to_integer (inp : std_logic_vector;  arith : integer)
        return integer;
    function std_logic_to_integer(constant inp : std_logic := '0')
        return integer;
    function bin_string_element_to_std_logic_vector (inp : string;  width, index : integer)
        return std_logic_vector;
    function bin_string_to_std_logic_vector (inp : string)
        return std_logic_vector;
    function hex_string_to_std_logic_vector (inp : string; width : integer)
        return std_logic_vector;
    function makeZeroBinStr (width : integer) return STRING;
    function and_reduce(inp: std_logic_vector) return std_logic;
    -- synopsys translate_off
    function is_binary_string_invalid (inp : string)
        return boolean;
    function is_binary_string_undefined (inp : string)
        return boolean;
    function is_XorU(inp : std_logic_vector)
        return boolean;
    function to_real(inp : std_logic_vector; bin_pt : integer; arith : integer)
        return real;
    function std_logic_to_real(inp : std_logic; bin_pt : integer; arith : integer)
        return real;
    function real_to_std_logic_vector (inp : real;  width, bin_pt, arith : integer)
        return std_logic_vector;
    function real_string_to_std_logic_vector (inp : string;  width, bin_pt, arith : integer)
        return std_logic_vector;
    constant display_precision : integer := 20;
    function real_to_string (inp : real) return string;
    function valid_bin_string(inp : string) return boolean;
    function std_logic_vector_to_bin_string(inp : std_logic_vector) return string;
    function std_logic_to_bin_string(inp : std_logic) return string;
    function std_logic_vector_to_bin_string_w_point(inp : std_logic_vector; bin_pt : integer)
        return string;
    function real_to_bin_string(inp : real;  width, bin_pt, arith : integer)
        return string;
    type stdlogic_to_char_t is array(std_logic) of character;
    constant to_char : stdlogic_to_char_t := (
        'U' => 'U',
        'X' => 'X',
        '0' => '0',
        '1' => '1',
        'Z' => 'Z',
        'W' => 'W',
        'L' => 'L',
        'H' => 'H',
        '-' => '-');
    -- synopsys translate_on
end conv_pkg;
package body conv_pkg is
    function std_logic_vector_to_unsigned(inp : std_logic_vector)
        return unsigned
    is
    begin
        return unsigned (inp);
    end;
    function unsigned_to_std_logic_vector(inp : unsigned)
        return std_logic_vector
    is
    begin
        return std_logic_vector(inp);
    end;
    function std_logic_vector_to_signed(inp : std_logic_vector)
        return signed
    is
    begin
        return  signed (inp);
    end;
    function signed_to_std_logic_vector(inp : signed)
        return std_logic_vector
    is
    begin
        return std_logic_vector(inp);
    end;
    function unsigned_to_signed (inp : unsigned)
        return signed
    is
    begin
        return signed(std_logic_vector(inp));
    end;
    function signed_to_unsigned (inp : signed)
        return unsigned
    is
    begin
        return unsigned(std_logic_vector(inp));
    end;
    function pos(inp : std_logic_vector; arith : INTEGER)
        return boolean
    is
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
    begin
        vec := inp;
        if arith = xlUnsigned then
            return true;
        else
            if vec(width-1) = '0' then
                return true;
            else
                return false;
            end if;
        end if;
        return true;
    end;
    function max_signed(width : INTEGER)
        return std_logic_vector
    is
        variable ones : std_logic_vector(width-2 downto 0);
        variable result : std_logic_vector(width-1 downto 0);
    begin
        ones := (others => '1');
        result(width-1) := '0';
        result(width-2 downto 0) := ones;
        return result;
    end;
    function min_signed(width : INTEGER)
        return std_logic_vector
    is
        variable zeros : std_logic_vector(width-2 downto 0);
        variable result : std_logic_vector(width-1 downto 0);
    begin
        zeros := (others => '0');
        result(width-1) := '1';
        result(width-2 downto 0) := zeros;
        return result;
    end;
    function and_reduce(inp: std_logic_vector) return std_logic
    is
        variable result: std_logic;
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
    begin
        vec := inp;
        result := vec(0);
        if width > 1 then
            for i in 1 to width-1 loop
                result := result and vec(i);
            end loop;
        end if;
        return result;
    end;
    function all_same(inp: std_logic_vector) return boolean
    is
        variable result: boolean;
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
    begin
        vec := inp;
        result := true;
        if width > 0 then
            for i in 1 to width-1 loop
                if vec(i) /= vec(0) then
                    result := false;
                end if;
            end loop;
        end if;
        return result;
    end;
    function all_zeros(inp: std_logic_vector)
        return boolean
    is
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
        variable zero : std_logic_vector(width-1 downto 0);
        variable result : boolean;
    begin
        zero := (others => '0');
        vec := inp;
        -- synopsys translate_off
        if (is_XorU(vec)) then
            return false;
        end if;
         -- synopsys translate_on
        if (std_logic_vector_to_unsigned(vec) = std_logic_vector_to_unsigned(zero)) then
            result := true;
        else
            result := false;
        end if;
        return result;
    end;
    function is_point_five(inp: std_logic_vector)
        return boolean
    is
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
        variable result : boolean;
    begin
        vec := inp;
        -- synopsys translate_off
        if (is_XorU(vec)) then
            return false;
        end if;
         -- synopsys translate_on
        if (width > 1) then
           if ((vec(width-1) = '1') and (all_zeros(vec(width-2 downto 0)) = true)) then
               result := true;
           else
               result := false;
           end if;
        else
           if (vec(width-1) = '1') then
               result := true;
           else
               result := false;
           end if;
        end if;
        return result;
    end;
    function all_ones(inp: std_logic_vector)
        return boolean
    is
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
        variable one : std_logic_vector(width-1 downto 0);
        variable result : boolean;
    begin
        one := (others => '1');
        vec := inp;
        -- synopsys translate_off
        if (is_XorU(vec)) then
            return false;
        end if;
         -- synopsys translate_on
        if (std_logic_vector_to_unsigned(vec) = std_logic_vector_to_unsigned(one)) then
            result := true;
        else
            result := false;
        end if;
        return result;
    end;
    function full_precision_num_width(quantization, overflow, old_width,
                                      old_bin_pt, old_arith,
                                      new_width, new_bin_pt, new_arith : INTEGER)
        return integer
    is
        variable result : integer;
    begin
        result := old_width + 2;
        return result;
    end;
    function quantized_num_width(quantization, overflow, old_width, old_bin_pt,
                                 old_arith, new_width, new_bin_pt, new_arith
                                 : INTEGER)
        return integer
    is
        variable right_of_dp, left_of_dp, result : integer;
    begin
        right_of_dp := max(new_bin_pt, old_bin_pt);
        left_of_dp := max((new_width - new_bin_pt), (old_width - old_bin_pt));
        result := (old_width + 2) + (new_bin_pt - old_bin_pt);
        return result;
    end;
    function convert_type (inp : std_logic_vector; old_width, old_bin_pt,
                           old_arith, new_width, new_bin_pt, new_arith,
                           quantization, overflow : INTEGER)
        return std_logic_vector
    is
        constant fp_width : integer :=
            full_precision_num_width(quantization, overflow, old_width,
                                     old_bin_pt, old_arith, new_width,
                                     new_bin_pt, new_arith);
        constant fp_bin_pt : integer := old_bin_pt;
        constant fp_arith : integer := old_arith;
        variable full_precision_result : std_logic_vector(fp_width-1 downto 0);
        constant q_width : integer :=
            quantized_num_width(quantization, overflow, old_width, old_bin_pt,
                                old_arith, new_width, new_bin_pt, new_arith);
        constant q_bin_pt : integer := new_bin_pt;
        constant q_arith : integer := old_arith;
        variable quantized_result : std_logic_vector(q_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        result := (others => '0');
        full_precision_result := cast(inp, old_bin_pt, fp_width, fp_bin_pt,
                                      fp_arith);
        if (quantization = xlRound) then
            quantized_result := round_towards_inf(full_precision_result,
                                                  fp_width, fp_bin_pt,
                                                  fp_arith, q_width, q_bin_pt,
                                                  q_arith);
        elsif (quantization = xlRoundBanker) then
            quantized_result := round_towards_even(full_precision_result,
                                                  fp_width, fp_bin_pt,
                                                  fp_arith, q_width, q_bin_pt,
                                                  q_arith);
        else
            quantized_result := trunc(full_precision_result, fp_width, fp_bin_pt,
                                      fp_arith, q_width, q_bin_pt, q_arith);
        end if;
        if (overflow = xlSaturate) then
            result := saturation_arith(quantized_result, q_width, q_bin_pt,
                                       q_arith, new_width, new_bin_pt, new_arith);
        else
             result := wrap_arith(quantized_result, q_width, q_bin_pt, q_arith,
                                  new_width, new_bin_pt, new_arith);
        end if;
        return result;
    end;
    function cast (inp : std_logic_vector; old_bin_pt, new_width,
                   new_bin_pt, new_arith : INTEGER)
        return std_logic_vector
    is
        constant old_width : integer := inp'length;
        constant left_of_dp : integer := (new_width - new_bin_pt)
                                         - (old_width - old_bin_pt);
        constant right_of_dp : integer := (new_bin_pt - old_bin_pt);
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
        variable j   : integer;
    begin
        vec := inp;
        for i in new_width-1 downto 0 loop
            j := i - right_of_dp;
            if ( j > old_width-1) then
                if (new_arith = xlUnsigned) then
                    result(i) := '0';
                else
                    result(i) := vec(old_width-1);
                end if;
            elsif ( j >= 0) then
                result(i) := vec(j);
            else
                result(i) := '0';
            end if;
        end loop;
        return result;
    end;
    function vec_slice (inp : std_logic_vector; upper, lower : INTEGER)
      return std_logic_vector
    is
    begin
        return inp(upper downto lower);
    end;
    function s2u_slice (inp : signed; upper, lower : INTEGER)
      return unsigned
    is
    begin
        return unsigned(vec_slice(std_logic_vector(inp), upper, lower));
    end;
    function u2u_slice (inp : unsigned; upper, lower : INTEGER)
      return unsigned
    is
    begin
        return unsigned(vec_slice(std_logic_vector(inp), upper, lower));
    end;
    function s2s_cast (inp : signed; old_bin_pt, new_width, new_bin_pt : INTEGER)
        return signed
    is
    begin
        return signed(cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlSigned));
    end;
    function s2u_cast (inp : signed; old_bin_pt, new_width,
                   new_bin_pt : INTEGER)
        return unsigned
    is
    begin
        return unsigned(cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlSigned));
    end;
    function u2s_cast (inp : unsigned; old_bin_pt, new_width,
                   new_bin_pt : INTEGER)
        return signed
    is
    begin
        return signed(cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlUnsigned));
    end;
    function u2u_cast (inp : unsigned; old_bin_pt, new_width,
                   new_bin_pt : INTEGER)
        return unsigned
    is
    begin
        return unsigned(cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlUnsigned));
    end;
    function u2v_cast (inp : unsigned; old_bin_pt, new_width,
                   new_bin_pt : INTEGER)
        return std_logic_vector
    is
    begin
        return cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlUnsigned);
    end;
    function s2v_cast (inp : signed; old_bin_pt, new_width,
                   new_bin_pt : INTEGER)
        return std_logic_vector
    is
    begin
        return cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlSigned);
    end;
    function boolean_to_signed (inp : boolean; width : integer)
        return signed
    is
        variable result : signed(width - 1 downto 0);
    begin
        result := (others => '0');
        if inp then
          result(0) := '1';
        else
          result(0) := '0';
        end if;
        return result;
    end;
    function boolean_to_unsigned (inp : boolean; width : integer)
        return unsigned
    is
        variable result : unsigned(width - 1 downto 0);
    begin
        result := (others => '0');
        if inp then
          result(0) := '1';
        else
          result(0) := '0';
        end if;
        return result;
    end;
    function boolean_to_vector (inp : boolean)
        return std_logic_vector
    is
        variable result : std_logic_vector(1 - 1 downto 0);
    begin
        result := (others => '0');
        if inp then
          result(0) := '1';
        else
          result(0) := '0';
        end if;
        return result;
    end;
    function std_logic_to_vector (inp : std_logic)
        return std_logic_vector
    is
        variable result : std_logic_vector(1 - 1 downto 0);
    begin
        result(0) := inp;
        return result;
    end;
    function trunc (inp : std_logic_vector; old_width, old_bin_pt, old_arith,
                                new_width, new_bin_pt, new_arith : INTEGER)
        return std_logic_vector
    is
        constant right_of_dp : integer := (old_bin_pt - new_bin_pt);
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if right_of_dp >= 0 then
            if new_arith = xlUnsigned then
                result := zero_ext(vec(old_width-1 downto right_of_dp), new_width);
            else
                result := sign_ext(vec(old_width-1 downto right_of_dp), new_width);
            end if;
        else
            if new_arith = xlUnsigned then
                result := zero_ext(pad_LSB(vec, old_width +
                                           abs(right_of_dp)), new_width);
            else
                result := sign_ext(pad_LSB(vec, old_width +
                                           abs(right_of_dp)), new_width);
            end if;
        end if;
        return result;
    end;
    function round_towards_inf (inp : std_logic_vector; old_width, old_bin_pt,
                                old_arith, new_width, new_bin_pt, new_arith
                                : INTEGER)
        return std_logic_vector
    is
        constant right_of_dp : integer := (old_bin_pt - new_bin_pt);
        constant expected_new_width : integer :=  old_width - right_of_dp  + 1;
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable one_or_zero : std_logic_vector(new_width-1 downto 0);
        variable truncated_val : std_logic_vector(new_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if right_of_dp >= 0 then
            if new_arith = xlUnsigned then
                truncated_val := zero_ext(vec(old_width-1 downto right_of_dp),
                                          new_width);
            else
                truncated_val := sign_ext(vec(old_width-1 downto right_of_dp),
                                          new_width);
            end if;
        else
            if new_arith = xlUnsigned then
                truncated_val := zero_ext(pad_LSB(vec, old_width +
                                                  abs(right_of_dp)), new_width);
            else
                truncated_val := sign_ext(pad_LSB(vec, old_width +
                                                  abs(right_of_dp)), new_width);
            end if;
        end if;
        one_or_zero := (others => '0');
        if (new_arith = xlSigned) then
            if (vec(old_width-1) = '0') then
                one_or_zero(0) := '1';
            end if;
            if (right_of_dp >= 2) and (right_of_dp <= old_width) then
                if (all_zeros(vec(right_of_dp-2 downto 0)) = false) then
                    one_or_zero(0) := '1';
                end if;
            end if;
            if (right_of_dp >= 1) and (right_of_dp <= old_width) then
                if vec(right_of_dp-1) = '0' then
                    one_or_zero(0) := '0';
                end if;
            else
                one_or_zero(0) := '0';
            end if;
        else
            if (right_of_dp >= 1) and (right_of_dp <= old_width) then
                one_or_zero(0) :=  vec(right_of_dp-1);
            end if;
        end if;
        if new_arith = xlSigned then
            result := signed_to_std_logic_vector(std_logic_vector_to_signed(truncated_val) +
                                                 std_logic_vector_to_signed(one_or_zero));
        else
            result := unsigned_to_std_logic_vector(std_logic_vector_to_unsigned(truncated_val) +
                                                  std_logic_vector_to_unsigned(one_or_zero));
        end if;
        return result;
    end;
    function round_towards_even (inp : std_logic_vector; old_width, old_bin_pt,
                                old_arith, new_width, new_bin_pt, new_arith
                                : INTEGER)
        return std_logic_vector
    is
        constant right_of_dp : integer := (old_bin_pt - new_bin_pt);
        constant expected_new_width : integer :=  old_width - right_of_dp  + 1;
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable one_or_zero : std_logic_vector(new_width-1 downto 0);
        variable truncated_val : std_logic_vector(new_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if right_of_dp >= 0 then
            if new_arith = xlUnsigned then
                truncated_val := zero_ext(vec(old_width-1 downto right_of_dp),
                                          new_width);
            else
                truncated_val := sign_ext(vec(old_width-1 downto right_of_dp),
                                          new_width);
            end if;
        else
            if new_arith = xlUnsigned then
                truncated_val := zero_ext(pad_LSB(vec, old_width +
                                                  abs(right_of_dp)), new_width);
            else
                truncated_val := sign_ext(pad_LSB(vec, old_width +
                                                  abs(right_of_dp)), new_width);
            end if;
        end if;
        one_or_zero := (others => '0');
        if (right_of_dp >= 1) and (right_of_dp <= old_width) then
            if (is_point_five(vec(right_of_dp-1 downto 0)) = false) then
                one_or_zero(0) :=  vec(right_of_dp-1);
            else
                one_or_zero(0) :=  vec(right_of_dp);
            end if;
        end if;
        if new_arith = xlSigned then
            result := signed_to_std_logic_vector(std_logic_vector_to_signed(truncated_val) +
                                                 std_logic_vector_to_signed(one_or_zero));
        else
            result := unsigned_to_std_logic_vector(std_logic_vector_to_unsigned(truncated_val) +
                                                  std_logic_vector_to_unsigned(one_or_zero));
        end if;
        return result;
    end;
    function saturation_arith(inp:  std_logic_vector;  old_width, old_bin_pt,
                              old_arith, new_width, new_bin_pt, new_arith
                              : INTEGER)
        return std_logic_vector
    is
        constant left_of_dp : integer := (old_width - old_bin_pt) -
                                         (new_width - new_bin_pt);
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
        variable overflow : boolean;
    begin
        vec := inp;
        overflow := true;
        result := (others => '0');
        if (new_width >= old_width) then
            overflow := false;
        end if;
        if ((old_arith = xlSigned and new_arith = xlSigned) and (old_width > new_width)) then
            if all_same(vec(old_width-1 downto new_width-1)) then
                overflow := false;
            end if;
        end if;
        if (old_arith = xlSigned and new_arith = xlUnsigned) then
            if (old_width > new_width) then
                if all_zeros(vec(old_width-1 downto new_width)) then
                    overflow := false;
                end if;
            else
                if (old_width = new_width) then
                    if (vec(new_width-1) = '0') then
                        overflow := false;
                    end if;
                end if;
            end if;
        end if;
        if (old_arith = xlUnsigned and new_arith = xlUnsigned) then
            if (old_width > new_width) then
                if all_zeros(vec(old_width-1 downto new_width)) then
                    overflow := false;
                end if;
            else
                if (old_width = new_width) then
                    overflow := false;
                end if;
            end if;
        end if;
        if ((old_arith = xlUnsigned and new_arith = xlSigned) and (old_width > new_width)) then
            if all_same(vec(old_width-1 downto new_width-1)) then
                overflow := false;
            end if;
        end if;
        if overflow then
            if new_arith = xlSigned then
                if vec(old_width-1) = '0' then
                    result := max_signed(new_width);
                else
                    result := min_signed(new_width);
                end if;
            else
                if ((old_arith = xlSigned) and vec(old_width-1) = '1') then
                    result := (others => '0');
                else
                    result := (others => '1');
                end if;
            end if;
        else
            if (old_arith = xlSigned) and (new_arith = xlUnsigned) then
                if (vec(old_width-1) = '1') then
                    vec := (others => '0');
                end if;
            end if;
            if new_width <= old_width then
                result := vec(new_width-1 downto 0);
            else
                if new_arith = xlUnsigned then
                    result := zero_ext(vec, new_width);
                else
                    result := sign_ext(vec, new_width);
                end if;
            end if;
        end if;
        return result;
    end;
   function wrap_arith(inp:  std_logic_vector;  old_width, old_bin_pt,
                       old_arith, new_width, new_bin_pt, new_arith : INTEGER)
        return std_logic_vector
    is
        variable result : std_logic_vector(new_width-1 downto 0);
        variable result_arith : integer;
    begin
        if (old_arith = xlSigned) and (new_arith = xlUnsigned) then
            result_arith := xlSigned;
        end if;
        result := cast(inp, old_bin_pt, new_width, new_bin_pt, result_arith);
        return result;
    end;
    function fractional_bits(a_bin_pt, b_bin_pt: INTEGER) return INTEGER is
    begin
        return max(a_bin_pt, b_bin_pt);
    end;
    function integer_bits(a_width, a_bin_pt, b_width, b_bin_pt: INTEGER)
        return INTEGER is
    begin
        return  max(a_width - a_bin_pt, b_width - b_bin_pt);
    end;
    function pad_LSB(inp : std_logic_vector; new_width: integer)
        return STD_LOGIC_VECTOR
    is
        constant orig_width : integer := inp'length;
        variable vec : std_logic_vector(orig_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
        variable pos : integer;
        constant pad_pos : integer := new_width - orig_width - 1;
    begin
        vec := inp;
        pos := new_width-1;
        if (new_width >= orig_width) then
            for i in orig_width-1 downto 0 loop
                result(pos) := vec(i);
                pos := pos - 1;
            end loop;
            if pad_pos >= 0 then
                for i in pad_pos downto 0 loop
                    result(i) := '0';
                end loop;
            end if;
        end if;
        return result;
    end;
    function sign_ext(inp : std_logic_vector; new_width : INTEGER)
        return std_logic_vector
    is
        constant old_width : integer := inp'length;
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if new_width >= old_width then
            result(old_width-1 downto 0) := vec;
            if new_width-1 >= old_width then
                for i in new_width-1 downto old_width loop
                    result(i) := vec(old_width-1);
                end loop;
            end if;
        else
            result(new_width-1 downto 0) := vec(new_width-1 downto 0);
        end if;
        return result;
    end;
    function zero_ext(inp : std_logic_vector; new_width : INTEGER)
        return std_logic_vector
    is
        constant old_width : integer := inp'length;
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if new_width >= old_width then
            result(old_width-1 downto 0) := vec;
            if new_width-1 >= old_width then
                for i in new_width-1 downto old_width loop
                    result(i) := '0';
                end loop;
            end if;
        else
            result(new_width-1 downto 0) := vec(new_width-1 downto 0);
        end if;
        return result;
    end;
    function zero_ext(inp : std_logic; new_width : INTEGER)
        return std_logic_vector
    is
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        result(0) := inp;
        for i in new_width-1 downto 1 loop
            result(i) := '0';
        end loop;
        return result;
    end;
    function extend_MSB(inp : std_logic_vector; new_width, arith : INTEGER)
        return std_logic_vector
    is
        constant orig_width : integer := inp'length;
        variable vec : std_logic_vector(orig_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if arith = xlUnsigned then
            result := zero_ext(vec, new_width);
        else
            result := sign_ext(vec, new_width);
        end if;
        return result;
    end;
    function pad_LSB(inp : std_logic_vector; new_width, arith: integer)
        return STD_LOGIC_VECTOR
    is
        constant orig_width : integer := inp'length;
        variable vec : std_logic_vector(orig_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
        variable pos : integer;
    begin
        vec := inp;
        pos := new_width-1;
        if (arith = xlUnsigned) then
            result(pos) := '0';
            pos := pos - 1;
        else
            result(pos) := vec(orig_width-1);
            pos := pos - 1;
        end if;
        if (new_width >= orig_width) then
            for i in orig_width-1 downto 0 loop
                result(pos) := vec(i);
                pos := pos - 1;
            end loop;
            if pos >= 0 then
                for i in pos downto 0 loop
                    result(i) := '0';
                end loop;
            end if;
        end if;
        return result;
    end;
    function align_input(inp : std_logic_vector; old_width, delta, new_arith,
                         new_width: INTEGER)
        return std_logic_vector
    is
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable padded_inp : std_logic_vector((old_width + delta)-1  downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if delta > 0 then
            padded_inp := pad_LSB(vec, old_width+delta);
            result := extend_MSB(padded_inp, new_width, new_arith);
        else
            result := extend_MSB(vec, new_width, new_arith);
        end if;
        return result;
    end;
    function max(L, R: INTEGER) return INTEGER is
    begin
        if L > R then
            return L;
        else
            return R;
        end if;
    end;
    function min(L, R: INTEGER) return INTEGER is
    begin
        if L < R then
            return L;
        else
            return R;
        end if;
    end;
    function "="(left,right: STRING) return boolean is
    begin
        if (left'length /= right'length) then
            return false;
        else
            test : for i in 1 to left'length loop
                if left(i) /= right(i) then
                    return false;
                end if;
            end loop test;
            return true;
        end if;
    end;
    -- synopsys translate_off
    function is_binary_string_invalid (inp : string)
        return boolean
    is
        variable vec : string(1 to inp'length);
        variable result : boolean;
    begin
        vec := inp;
        result := false;
        for i in 1 to vec'length loop
            if ( vec(i) = 'X' ) then
                result := true;
            end if;
        end loop;
        return result;
    end;
    function is_binary_string_undefined (inp : string)
        return boolean
    is
        variable vec : string(1 to inp'length);
        variable result : boolean;
    begin
        vec := inp;
        result := false;
        for i in 1 to vec'length loop
            if ( vec(i) = 'U' ) then
                result := true;
            end if;
        end loop;
        return result;
    end;
    function is_XorU(inp : std_logic_vector)
        return boolean
    is
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
        variable result : boolean;
    begin
        vec := inp;
        result := false;
        for i in 0 to width-1 loop
            if (vec(i) = 'U') or (vec(i) = 'X') then
                result := true;
            end if;
        end loop;
        return result;
    end;
    function to_real(inp : std_logic_vector; bin_pt : integer; arith : integer)
        return real
    is
        variable  vec : std_logic_vector(inp'length-1 downto 0);
        variable result, shift_val, undefined_real : real;
        variable neg_num : boolean;
    begin
        vec := inp;
        result := 0.0;
        neg_num := false;
        if vec(inp'length-1) = '1' then
            neg_num := true;
        end if;
        for i in 0 to inp'length-1 loop
            if  vec(i) = 'U' or vec(i) = 'X' then
                return undefined_real;
            end if;
            if arith = xlSigned then
                if neg_num then
                    if vec(i) = '0' then
                        result := result + 2.0**i;
                    end if;
                else
                    if vec(i) = '1' then
                        result := result + 2.0**i;
                    end if;
                end if;
            else
                if vec(i) = '1' then
                    result := result + 2.0**i;
                end if;
            end if;
        end loop;
        if arith = xlSigned then
            if neg_num then
                result := result + 1.0;
                result := result * (-1.0);
            end if;
        end if;
        shift_val := 2.0**(-1*bin_pt);
        result := result * shift_val;
        return result;
    end;
    function std_logic_to_real(inp : std_logic; bin_pt : integer; arith : integer)
        return real
    is
        variable result : real := 0.0;
    begin
        if inp = '1' then
            result := 1.0;
        end if;
        if arith = xlSigned then
            assert false
                report "It doesn't make sense to convert a 1 bit number to a signed real.";
        end if;
        return result;
    end;
    -- synopsys translate_on
    function integer_to_std_logic_vector (inp : integer;  width, arith : integer)
        return std_logic_vector
    is
        variable result : std_logic_vector(width-1 downto 0);
        variable unsigned_val : unsigned(width-1 downto 0);
        variable signed_val : signed(width-1 downto 0);
    begin
        if (arith = xlSigned) then
            signed_val := to_signed(inp, width);
            result := signed_to_std_logic_vector(signed_val);
        else
            unsigned_val := to_unsigned(inp, width);
            result := unsigned_to_std_logic_vector(unsigned_val);
        end if;
        return result;
    end;
    function std_logic_vector_to_integer (inp : std_logic_vector;  arith : integer)
        return integer
    is
        constant width : integer := inp'length;
        variable unsigned_val : unsigned(width-1 downto 0);
        variable signed_val : signed(width-1 downto 0);
        variable result : integer;
    begin
        if (arith = xlSigned) then
            signed_val := std_logic_vector_to_signed(inp);
            result := to_integer(signed_val);
        else
            unsigned_val := std_logic_vector_to_unsigned(inp);
            result := to_integer(unsigned_val);
        end if;
        return result;
    end;
    function std_logic_to_integer(constant inp : std_logic := '0')
        return integer
    is
    begin
        if inp = '1' then
            return 1;
        else
            return 0;
        end if;
    end;
    function makeZeroBinStr (width : integer) return STRING is
        variable result : string(1 to width+3);
    begin
        result(1) := '0';
        result(2) := 'b';
        for i in 3 to width+2 loop
            result(i) := '0';
        end loop;
        result(width+3) := '.';
        return result;
    end;
    -- synopsys translate_off
    function real_string_to_std_logic_vector (inp : string;  width, bin_pt, arith : integer)
        return std_logic_vector
    is
        variable result : std_logic_vector(width-1 downto 0);
    begin
        result := (others => '0');
        return result;
    end;
    function real_to_std_logic_vector (inp : real;  width, bin_pt, arith : integer)
        return std_logic_vector
    is
        variable real_val : real;
        variable int_val : integer;
        variable result : std_logic_vector(width-1 downto 0) := (others => '0');
        variable unsigned_val : unsigned(width-1 downto 0) := (others => '0');
        variable signed_val : signed(width-1 downto 0) := (others => '0');
    begin
        real_val := inp;
        int_val := integer(real_val * 2.0**(bin_pt));
        if (arith = xlSigned) then
            signed_val := to_signed(int_val, width);
            result := signed_to_std_logic_vector(signed_val);
        else
            unsigned_val := to_unsigned(int_val, width);
            result := unsigned_to_std_logic_vector(unsigned_val);
        end if;
        return result;
    end;
    -- synopsys translate_on
    function valid_bin_string (inp : string)
        return boolean
    is
        variable vec : string(1 to inp'length);
    begin
        vec := inp;
        if (vec(1) = '0' and vec(2) = 'b') then
            return true;
        else
            return false;
        end if;
    end;
    function hex_string_to_std_logic_vector(inp: string; width : integer)
        return std_logic_vector is
        constant strlen       : integer := inp'LENGTH;
        variable result       : std_logic_vector(width-1 downto 0);
        variable bitval       : std_logic_vector((strlen*4)-1 downto 0);
        variable posn         : integer;
        variable ch           : character;
        variable vec          : string(1 to strlen);
    begin
        vec := inp;
        result := (others => '0');
        posn := (strlen*4)-1;
        for i in 1 to strlen loop
            ch := vec(i);
            case ch is
                when '0' => bitval(posn downto posn-3) := "0000";
                when '1' => bitval(posn downto posn-3) := "0001";
                when '2' => bitval(posn downto posn-3) := "0010";
                when '3' => bitval(posn downto posn-3) := "0011";
                when '4' => bitval(posn downto posn-3) := "0100";
                when '5' => bitval(posn downto posn-3) := "0101";
                when '6' => bitval(posn downto posn-3) := "0110";
                when '7' => bitval(posn downto posn-3) := "0111";
                when '8' => bitval(posn downto posn-3) := "1000";
                when '9' => bitval(posn downto posn-3) := "1001";
                when 'A' | 'a' => bitval(posn downto posn-3) := "1010";
                when 'B' | 'b' => bitval(posn downto posn-3) := "1011";
                when 'C' | 'c' => bitval(posn downto posn-3) := "1100";
                when 'D' | 'd' => bitval(posn downto posn-3) := "1101";
                when 'E' | 'e' => bitval(posn downto posn-3) := "1110";
                when 'F' | 'f' => bitval(posn downto posn-3) := "1111";
                when others => bitval(posn downto posn-3) := "XXXX";
                               -- synopsys translate_off
                               ASSERT false
                                   REPORT "Invalid hex value" SEVERITY ERROR;
                               -- synopsys translate_on
            end case;
            posn := posn - 4;
        end loop;
        if (width <= strlen*4) then
            result :=  bitval(width-1 downto 0);
        else
            result((strlen*4)-1 downto 0) := bitval;
        end if;
        return result;
    end;
    function bin_string_to_std_logic_vector (inp : string)
        return std_logic_vector
    is
        variable pos : integer;
        variable vec : string(1 to inp'length);
        variable result : std_logic_vector(inp'length-1 downto 0);
    begin
        vec := inp;
        pos := inp'length-1;
        result := (others => '0');
        for i in 1 to vec'length loop
            -- synopsys translate_off
            if (pos < 0) and (vec(i) = '0' or vec(i) = '1' or vec(i) = 'X' or vec(i) = 'U')  then
                assert false
                    report "Input string is larger than output std_logic_vector. Truncating output.";
                return result;
            end if;
            -- synopsys translate_on
            if vec(i) = '0' then
                result(pos) := '0';
                pos := pos - 1;
            end if;
            if vec(i) = '1' then
                result(pos) := '1';
                pos := pos - 1;
            end if;
            -- synopsys translate_off
            if (vec(i) = 'X' or vec(i) = 'U') then
                result(pos) := 'U';
                pos := pos - 1;
            end if;
            -- synopsys translate_on
        end loop;
        return result;
    end;
    function bin_string_element_to_std_logic_vector (inp : string;  width, index : integer)
        return std_logic_vector
    is
        constant str_width : integer := width + 4;
        constant inp_len : integer := inp'length;
        constant num_elements : integer := (inp_len + 1)/str_width;
        constant reverse_index : integer := (num_elements-1) - index;
        variable left_pos : integer;
        variable right_pos : integer;
        variable vec : string(1 to inp'length);
        variable result : std_logic_vector(width-1 downto 0);
    begin
        vec := inp;
        result := (others => '0');
        if (reverse_index = 0) and (reverse_index < num_elements) and (inp_len-3 >= width) then
            left_pos := 1;
            right_pos := width + 3;
            result := bin_string_to_std_logic_vector(vec(left_pos to right_pos));
        end if;
        if (reverse_index > 0) and (reverse_index < num_elements) and (inp_len-3 >= width) then
            left_pos := (reverse_index * str_width) + 1;
            right_pos := left_pos + width + 2;
            result := bin_string_to_std_logic_vector(vec(left_pos to right_pos));
        end if;
        return result;
    end;
   -- synopsys translate_off
    function std_logic_vector_to_bin_string(inp : std_logic_vector)
        return string
    is
        variable vec : std_logic_vector(1 to inp'length);
        variable result : string(vec'range);
    begin
        vec := inp;
        for i in vec'range loop
            result(i) := to_char(vec(i));
        end loop;
        return result;
    end;
    function std_logic_to_bin_string(inp : std_logic)
        return string
    is
        variable result : string(1 to 3);
    begin
        result(1) := '0';
        result(2) := 'b';
        result(3) := to_char(inp);
        return result;
    end;
    function std_logic_vector_to_bin_string_w_point(inp : std_logic_vector; bin_pt : integer)
        return string
    is
        variable width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
        variable str_pos : integer;
        variable result : string(1 to width+3);
    begin
        vec := inp;
        str_pos := 1;
        result(str_pos) := '0';
        str_pos := 2;
        result(str_pos) := 'b';
        str_pos := 3;
        for i in width-1 downto 0  loop
            if (((width+3) - bin_pt) = str_pos) then
                result(str_pos) := '.';
                str_pos := str_pos + 1;
            end if;
            result(str_pos) := to_char(vec(i));
            str_pos := str_pos + 1;
        end loop;
        if (bin_pt = 0) then
            result(str_pos) := '.';
        end if;
        return result;
    end;
    function real_to_bin_string(inp : real;  width, bin_pt, arith : integer)
        return string
    is
        variable result : string(1 to width);
        variable vec : std_logic_vector(width-1 downto 0);
    begin
        vec := real_to_std_logic_vector(inp, width, bin_pt, arith);
        result := std_logic_vector_to_bin_string(vec);
        return result;
    end;
    function real_to_string (inp : real) return string
    is
        variable result : string(1 to display_precision) := (others => ' ');
    begin
        result(real'image(inp)'range) := real'image(inp);
        return result;
    end;
    -- synopsys translate_on
end conv_pkg;

-------------------------------------------------------------------
-- System Generator version 13.2 VHDL source file.
--
-- Copyright(C) 2011 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2011 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
-- synopsys translate_off
library unisim;
use unisim.vcomponents.all;
-- synopsys translate_on
library IEEE;
use IEEE.std_logic_1164.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;
entity srl17e is
    generic (width : integer:=16;
             latency : integer :=8);
    port (clk   : in std_logic;
          ce    : in std_logic;
          d     : in std_logic_vector(width-1 downto 0);
          q     : out std_logic_vector(width-1 downto 0));
end srl17e;
architecture structural of srl17e is
    component SRL16E
        port (D   : in STD_ULOGIC;
              CE  : in STD_ULOGIC;
              CLK : in STD_ULOGIC;
              A0  : in STD_ULOGIC;
              A1  : in STD_ULOGIC;
              A2  : in STD_ULOGIC;
              A3  : in STD_ULOGIC;
              Q   : out STD_ULOGIC);
    end component;
    attribute syn_black_box of SRL16E : component is true;
    attribute fpga_dont_touch of SRL16E : component is "true";
    component FDE
        port(
            Q  :        out   STD_ULOGIC;
            D  :        in    STD_ULOGIC;
            C  :        in    STD_ULOGIC;
            CE :        in    STD_ULOGIC);
    end component;
    attribute syn_black_box of FDE : component is true;
    attribute fpga_dont_touch of FDE : component is "true";
    constant a : std_logic_vector(4 downto 0) :=
        integer_to_std_logic_vector(latency-2,5,xlSigned);
    signal d_delayed : std_logic_vector(width-1 downto 0);
    signal srl16_out : std_logic_vector(width-1 downto 0);
begin
    d_delayed <= d after 200 ps;
    reg_array : for i in 0 to width-1 generate
        srl16_used: if latency > 1 generate
            u1 : srl16e port map(clk => clk,
                                 d => d_delayed(i),
                                 q => srl16_out(i),
                                 ce => ce,
                                 a0 => a(0),
                                 a1 => a(1),
                                 a2 => a(2),
                                 a3 => a(3));
        end generate;
        srl16_not_used: if latency <= 1 generate
            srl16_out(i) <= d_delayed(i);
        end generate;
        fde_used: if latency /= 0  generate
            u2 : fde port map(c => clk,
                              d => srl16_out(i),
                              q => q(i),
                              ce => ce);
        end generate;
        fde_not_used: if latency = 0  generate
            q(i) <= srl16_out(i);
        end generate;
    end generate;
 end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;
entity synth_reg is
    generic (width           : integer := 8;
             latency         : integer := 1);
    port (i       : in std_logic_vector(width-1 downto 0);
          ce      : in std_logic;
          clr     : in std_logic;
          clk     : in std_logic;
          o       : out std_logic_vector(width-1 downto 0));
end synth_reg;
architecture structural of synth_reg is
    component srl17e
        generic (width : integer:=16;
                 latency : integer :=8);
        port (clk : in std_logic;
              ce  : in std_logic;
              d   : in std_logic_vector(width-1 downto 0);
              q   : out std_logic_vector(width-1 downto 0));
    end component;
    function calc_num_srl17es (latency : integer)
        return integer
    is
        variable remaining_latency : integer;
        variable result : integer;
    begin
        result := latency / 17;
        remaining_latency := latency - (result * 17);
        if (remaining_latency /= 0) then
            result := result + 1;
        end if;
        return result;
    end;
    constant complete_num_srl17es : integer := latency / 17;
    constant num_srl17es : integer := calc_num_srl17es(latency);
    constant remaining_latency : integer := latency - (complete_num_srl17es * 17);
    type register_array is array (num_srl17es downto 0) of
        std_logic_vector(width-1 downto 0);
    signal z : register_array;
begin
    z(0) <= i;
    complete_ones : if complete_num_srl17es > 0 generate
        srl17e_array: for i in 0 to complete_num_srl17es-1 generate
            delay_comp : srl17e
                generic map (width => width,
                             latency => 17)
                port map (clk => clk,
                          ce  => ce,
                          d       => z(i),
                          q       => z(i+1));
        end generate;
    end generate;
    partial_one : if remaining_latency > 0 generate
        last_srl17e : srl17e
            generic map (width => width,
                         latency => remaining_latency)
            port map (clk => clk,
                      ce  => ce,
                      d   => z(num_srl17es-1),
                      q   => z(num_srl17es));
    end generate;
    o <= z(num_srl17es);
end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;
entity synth_reg_reg is
    generic (width           : integer := 8;
             latency         : integer := 1);
    port (i       : in std_logic_vector(width-1 downto 0);
          ce      : in std_logic;
          clr     : in std_logic;
          clk     : in std_logic;
          o       : out std_logic_vector(width-1 downto 0));
end synth_reg_reg;
architecture behav of synth_reg_reg is
  type reg_array_type is array (latency-1 downto 0) of std_logic_vector(width -1 downto 0);
  signal reg_bank : reg_array_type := (others => (others => '0'));
  signal reg_bank_in : reg_array_type := (others => (others => '0'));
  attribute syn_allow_retiming : boolean;
  attribute syn_srlstyle : string;
  attribute syn_allow_retiming of reg_bank : signal is true;
  attribute syn_allow_retiming of reg_bank_in : signal is true;
  attribute syn_srlstyle of reg_bank : signal is "registers";
  attribute syn_srlstyle of reg_bank_in : signal is "registers";
begin
  latency_eq_0: if latency = 0 generate
    o <= i;
  end generate latency_eq_0;
  latency_gt_0: if latency >= 1 generate
    o <= reg_bank(latency-1);
    reg_bank_in(0) <= i;
    loop_gen: for idx in latency-2 downto 0 generate
      reg_bank_in(idx+1) <= reg_bank(idx);
    end generate loop_gen;
    sync_loop: for sync_idx in latency-1 downto 0 generate
      sync_proc: process (clk)
      begin
        if clk'event and clk = '1' then
          if ce = '1'  then
            reg_bank(sync_idx) <= reg_bank_in(sync_idx);
          end if;
        end if;
      end process sync_proc;
    end generate sync_loop;
  end generate latency_gt_0;
end behav;

-------------------------------------------------------------------
-- System Generator version 13.2 VHDL source file.
--
-- Copyright(C) 2011 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2011 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
-- synopsys translate_off
library unisim;
use unisim.vcomponents.all;
-- synopsys translate_on
library IEEE;
use IEEE.std_logic_1164.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;
entity single_reg_w_init is
  generic (
    width: integer := 8;
    init_index: integer := 0;
    init_value: bit_vector := b"0000"
  );
  port (
    i: in std_logic_vector(width - 1 downto 0);
    ce: in std_logic;
    clr: in std_logic;
    clk: in std_logic;
    o: out std_logic_vector(width - 1 downto 0)
  );
end single_reg_w_init;
architecture structural of single_reg_w_init is
  function build_init_const(width: integer;
                            init_index: integer;
                            init_value: bit_vector)
    return std_logic_vector
  is
    variable result: std_logic_vector(width - 1 downto 0);
  begin
    if init_index = 0 then
      result := (others => '0');
    elsif init_index = 1 then
      result := (others => '0');
      result(0) := '1';
    else
      result := to_stdlogicvector(init_value);
    end if;
    return result;
  end;
  component fdre
    port (
      q: out std_ulogic;
      d: in  std_ulogic;
      c: in  std_ulogic;
      ce: in  std_ulogic;
      r: in  std_ulogic
    );
  end component;
  attribute syn_black_box of fdre: component is true;
  attribute fpga_dont_touch of fdre: component is "true";
  component fdse
    port (
      q: out std_ulogic;
      d: in  std_ulogic;
      c: in  std_ulogic;
      ce: in  std_ulogic;
      s: in  std_ulogic
    );
  end component;
  attribute syn_black_box of fdse: component is true;
  attribute fpga_dont_touch of fdse: component is "true";
  constant init_const: std_logic_vector(width - 1 downto 0)
    := build_init_const(width, init_index, init_value);
begin
  fd_prim_array: for index in 0 to width - 1 generate
    bit_is_0: if (init_const(index) = '0') generate
      fdre_comp: fdre
        port map (
          c => clk,
          d => i(index),
          q => o(index),
          ce => ce,
          r => clr
        );
    end generate;
    bit_is_1: if (init_const(index) = '1') generate
      fdse_comp: fdse
        port map (
          c => clk,
          d => i(index),
          q => o(index),
          ce => ce,
          s => clr
        );
    end generate;
  end generate;
end architecture structural;
-- synopsys translate_off
library unisim;
use unisim.vcomponents.all;
-- synopsys translate_on
library IEEE;
use IEEE.std_logic_1164.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;
entity synth_reg_w_init is
  generic (
    width: integer := 8;
    init_index: integer := 0;
    init_value: bit_vector := b"0000";
    latency: integer := 1
  );
  port (
    i: in std_logic_vector(width - 1 downto 0);
    ce: in std_logic;
    clr: in std_logic;
    clk: in std_logic;
    o: out std_logic_vector(width - 1 downto 0)
  );
end synth_reg_w_init;
architecture structural of synth_reg_w_init is
  component single_reg_w_init
    generic (
      width: integer := 8;
      init_index: integer := 0;
      init_value: bit_vector := b"0000"
    );
    port (
      i: in std_logic_vector(width - 1 downto 0);
      ce: in std_logic;
      clr: in std_logic;
      clk: in std_logic;
      o: out std_logic_vector(width - 1 downto 0)
    );
  end component;
  signal dly_i: std_logic_vector((latency + 1) * width - 1 downto 0);
  signal dly_clr: std_logic;
begin
  latency_eq_0: if (latency = 0) generate
    o <= i;
  end generate;
  latency_gt_0: if (latency >= 1) generate
    dly_i((latency + 1) * width - 1 downto latency * width) <= i
      after 200 ps;
    dly_clr <= clr after 200 ps;
    fd_array: for index in latency downto 1 generate
       reg_comp: single_reg_w_init
          generic map (
            width => width,
            init_index => init_index,
            init_value => init_value
          )
          port map (
            clk => clk,
            i => dly_i((index + 1) * width - 1 downto index * width),
            o => dly_i(index * width - 1 downto (index - 1) * width),
            ce => ce,
            clr => dly_clr
          );
    end generate;
    o <= dly_i(width - 1 downto 0);
  end generate;
end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity mux_bc26d025ba is
  port (
    sel : in std_logic_vector((5 - 1) downto 0);
    d0 : in std_logic_vector((32 - 1) downto 0);
    d1 : in std_logic_vector((32 - 1) downto 0);
    d2 : in std_logic_vector((32 - 1) downto 0);
    d3 : in std_logic_vector((32 - 1) downto 0);
    d4 : in std_logic_vector((32 - 1) downto 0);
    d5 : in std_logic_vector((32 - 1) downto 0);
    d6 : in std_logic_vector((32 - 1) downto 0);
    d7 : in std_logic_vector((32 - 1) downto 0);
    d8 : in std_logic_vector((32 - 1) downto 0);
    d9 : in std_logic_vector((32 - 1) downto 0);
    d10 : in std_logic_vector((32 - 1) downto 0);
    d11 : in std_logic_vector((32 - 1) downto 0);
    d12 : in std_logic_vector((32 - 1) downto 0);
    d13 : in std_logic_vector((32 - 1) downto 0);
    d14 : in std_logic_vector((32 - 1) downto 0);
    d15 : in std_logic_vector((32 - 1) downto 0);
    d16 : in std_logic_vector((32 - 1) downto 0);
    d17 : in std_logic_vector((32 - 1) downto 0);
    d18 : in std_logic_vector((32 - 1) downto 0);
    d19 : in std_logic_vector((32 - 1) downto 0);
    d20 : in std_logic_vector((32 - 1) downto 0);
    d21 : in std_logic_vector((32 - 1) downto 0);
    d22 : in std_logic_vector((32 - 1) downto 0);
    d23 : in std_logic_vector((32 - 1) downto 0);
    d24 : in std_logic_vector((32 - 1) downto 0);
    d25 : in std_logic_vector((32 - 1) downto 0);
    d26 : in std_logic_vector((32 - 1) downto 0);
    d27 : in std_logic_vector((32 - 1) downto 0);
    d28 : in std_logic_vector((32 - 1) downto 0);
    d29 : in std_logic_vector((32 - 1) downto 0);
    d30 : in std_logic_vector((32 - 1) downto 0);
    d31 : in std_logic_vector((32 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end mux_bc26d025ba;


architecture behavior of mux_bc26d025ba is
  signal sel_1_20: std_logic_vector((5 - 1) downto 0);
  signal d0_1_24: std_logic_vector((32 - 1) downto 0);
  signal d1_1_27: std_logic_vector((32 - 1) downto 0);
  signal d2_1_30: std_logic_vector((32 - 1) downto 0);
  signal d3_1_33: std_logic_vector((32 - 1) downto 0);
  signal d4_1_36: std_logic_vector((32 - 1) downto 0);
  signal d5_1_39: std_logic_vector((32 - 1) downto 0);
  signal d6_1_42: std_logic_vector((32 - 1) downto 0);
  signal d7_1_45: std_logic_vector((32 - 1) downto 0);
  signal d8_1_48: std_logic_vector((32 - 1) downto 0);
  signal d9_1_51: std_logic_vector((32 - 1) downto 0);
  signal d10_1_54: std_logic_vector((32 - 1) downto 0);
  signal d11_1_58: std_logic_vector((32 - 1) downto 0);
  signal d12_1_62: std_logic_vector((32 - 1) downto 0);
  signal d13_1_66: std_logic_vector((32 - 1) downto 0);
  signal d14_1_70: std_logic_vector((32 - 1) downto 0);
  signal d15_1_74: std_logic_vector((32 - 1) downto 0);
  signal d16_1_78: std_logic_vector((32 - 1) downto 0);
  signal d17_1_82: std_logic_vector((32 - 1) downto 0);
  signal d18_1_86: std_logic_vector((32 - 1) downto 0);
  signal d19_1_90: std_logic_vector((32 - 1) downto 0);
  signal d20_1_94: std_logic_vector((32 - 1) downto 0);
  signal d21_1_98: std_logic_vector((32 - 1) downto 0);
  signal d22_1_102: std_logic_vector((32 - 1) downto 0);
  signal d23_1_106: std_logic_vector((32 - 1) downto 0);
  signal d24_1_110: std_logic_vector((32 - 1) downto 0);
  signal d25_1_114: std_logic_vector((32 - 1) downto 0);
  signal d26_1_118: std_logic_vector((32 - 1) downto 0);
  signal d27_1_122: std_logic_vector((32 - 1) downto 0);
  signal d28_1_126: std_logic_vector((32 - 1) downto 0);
  signal d29_1_130: std_logic_vector((32 - 1) downto 0);
  signal d30_1_134: std_logic_vector((32 - 1) downto 0);
  signal d31_1_138: std_logic_vector((32 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((32 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  d4_1_36 <= d4;
  d5_1_39 <= d5;
  d6_1_42 <= d6;
  d7_1_45 <= d7;
  d8_1_48 <= d8;
  d9_1_51 <= d9;
  d10_1_54 <= d10;
  d11_1_58 <= d11;
  d12_1_62 <= d12;
  d13_1_66 <= d13;
  d14_1_70 <= d14;
  d15_1_74 <= d15;
  d16_1_78 <= d16;
  d17_1_82 <= d17;
  d18_1_86 <= d18;
  d19_1_90 <= d19;
  d20_1_94 <= d20;
  d21_1_98 <= d21;
  d22_1_102 <= d22;
  d23_1_106 <= d23;
  d24_1_110 <= d24;
  d25_1_114 <= d25;
  d26_1_118 <= d26;
  d27_1_122 <= d27;
  d28_1_126 <= d28;
  d29_1_130 <= d29;
  d30_1_134 <= d30;
  d31_1_138 <= d31;
  proc_switch_6_1: process (d0_1_24, d10_1_54, d11_1_58, d12_1_62, d13_1_66, d14_1_70, d15_1_74, d16_1_78, d17_1_82, d18_1_86, d19_1_90, d1_1_27, d20_1_94, d21_1_98, d22_1_102, d23_1_106, d24_1_110, d25_1_114, d26_1_118, d27_1_122, d28_1_126, d29_1_130, d2_1_30, d30_1_134, d31_1_138, d3_1_33, d4_1_36, d5_1_39, d6_1_42, d7_1_45, d8_1_48, d9_1_51, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00000" =>
        unregy_join_6_1 <= d0_1_24;
      when "00001" =>
        unregy_join_6_1 <= d1_1_27;
      when "00010" =>
        unregy_join_6_1 <= d2_1_30;
      when "00011" =>
        unregy_join_6_1 <= d3_1_33;
      when "00100" =>
        unregy_join_6_1 <= d4_1_36;
      when "00101" =>
        unregy_join_6_1 <= d5_1_39;
      when "00110" =>
        unregy_join_6_1 <= d6_1_42;
      when "00111" =>
        unregy_join_6_1 <= d7_1_45;
      when "01000" =>
        unregy_join_6_1 <= d8_1_48;
      when "01001" =>
        unregy_join_6_1 <= d9_1_51;
      when "01010" =>
        unregy_join_6_1 <= d10_1_54;
      when "01011" =>
        unregy_join_6_1 <= d11_1_58;
      when "01100" =>
        unregy_join_6_1 <= d12_1_62;
      when "01101" =>
        unregy_join_6_1 <= d13_1_66;
      when "01110" =>
        unregy_join_6_1 <= d14_1_70;
      when "01111" =>
        unregy_join_6_1 <= d15_1_74;
      when "10000" =>
        unregy_join_6_1 <= d16_1_78;
      when "10001" =>
        unregy_join_6_1 <= d17_1_82;
      when "10010" =>
        unregy_join_6_1 <= d18_1_86;
      when "10011" =>
        unregy_join_6_1 <= d19_1_90;
      when "10100" =>
        unregy_join_6_1 <= d20_1_94;
      when "10101" =>
        unregy_join_6_1 <= d21_1_98;
      when "10110" =>
        unregy_join_6_1 <= d22_1_102;
      when "10111" =>
        unregy_join_6_1 <= d23_1_106;
      when "11000" =>
        unregy_join_6_1 <= d24_1_110;
      when "11001" =>
        unregy_join_6_1 <= d25_1_114;
      when "11010" =>
        unregy_join_6_1 <= d26_1_118;
      when "11011" =>
        unregy_join_6_1 <= d27_1_122;
      when "11100" =>
        unregy_join_6_1 <= d28_1_126;
      when "11101" =>
        unregy_join_6_1 <= d29_1_130;
      when "11110" =>
        unregy_join_6_1 <= d30_1_134;
      when others =>
        unregy_join_6_1 <= d31_1_138;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_953fd27e4e is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_953fd27e4e;


architecture behavior of shift_953fd27e4e is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(ip_1_23);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_53a9eabf4d is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_53a9eabf4d;


architecture behavior of shift_53a9eabf4d is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((33 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 33, 1);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_9fab70e0b5 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_9fab70e0b5;


architecture behavior of shift_9fab70e0b5 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((42 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 42, 10);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_657b5342cc is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_657b5342cc;


architecture behavior of shift_657b5342cc is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((43 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 43, 11);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_d1e30ba6e3 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_d1e30ba6e3;


architecture behavior of shift_d1e30ba6e3 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((44 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 44, 12);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_63e62df7ee is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_63e62df7ee;


architecture behavior of shift_63e62df7ee is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((45 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 45, 13);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_e0c4ea8daf is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_e0c4ea8daf;


architecture behavior of shift_e0c4ea8daf is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((46 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 46, 14);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_908b7ad8c9 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_908b7ad8c9;


architecture behavior of shift_908b7ad8c9 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((47 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 47, 15);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_a1f80e8302 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_a1f80e8302;


architecture behavior of shift_a1f80e8302 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((48 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 48, 16);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_2a68b3555e is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_2a68b3555e;


architecture behavior of shift_2a68b3555e is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((49 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 49, 17);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_fccd89c7dc is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_fccd89c7dc;


architecture behavior of shift_fccd89c7dc is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((58 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 58, 26);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_0777b5473a is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_0777b5473a;


architecture behavior of shift_0777b5473a is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((59 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 59, 27);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_1ee0126720 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_1ee0126720;


architecture behavior of shift_1ee0126720 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((34 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 34, 2);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_bbceaaf4ad is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_bbceaaf4ad;


architecture behavior of shift_bbceaaf4ad is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((60 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 60, 28);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_0d92409f07 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_0d92409f07;


architecture behavior of shift_0d92409f07 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((61 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 61, 29);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_f3c2831506 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_f3c2831506;


architecture behavior of shift_f3c2831506 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((62 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 62, 30);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_b122968286 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_b122968286;


architecture behavior of shift_b122968286 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((63 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 63, 31);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_1769ff8354 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_1769ff8354;


architecture behavior of shift_1769ff8354 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((50 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 50, 18);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_21ac99447c is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_21ac99447c;


architecture behavior of shift_21ac99447c is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((51 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 51, 19);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_077b4cb8bc is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_077b4cb8bc;


architecture behavior of shift_077b4cb8bc is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((52 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 52, 20);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_1c5f6b428e is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_1c5f6b428e;


architecture behavior of shift_1c5f6b428e is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((53 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 53, 21);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_a870cde4d0 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_a870cde4d0;


architecture behavior of shift_a870cde4d0 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((54 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 54, 22);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_402829e770 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_402829e770;


architecture behavior of shift_402829e770 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((55 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 55, 23);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_b5c7a2a7a3 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_b5c7a2a7a3;


architecture behavior of shift_b5c7a2a7a3 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((35 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 35, 3);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_0d965b2981 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_0d965b2981;


architecture behavior of shift_0d965b2981 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((56 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 56, 24);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_e6acae782b is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_e6acae782b;


architecture behavior of shift_e6acae782b is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((57 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 57, 25);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_520bf99957 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_520bf99957;


architecture behavior of shift_520bf99957 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((36 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 36, 4);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_cc92633aff is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_cc92633aff;


architecture behavior of shift_cc92633aff is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((37 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 37, 5);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_ef307fdf17 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_ef307fdf17;


architecture behavior of shift_ef307fdf17 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((38 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 38, 6);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_d5d98a98f9 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_d5d98a98f9;


architecture behavior of shift_d5d98a98f9 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((39 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 39, 7);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_1b584f2b88 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_1b584f2b88;


architecture behavior of shift_1b584f2b88 is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((40 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 40, 8);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_7cc6eff90a is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_7cc6eff90a;


architecture behavior of shift_7cc6eff90a is
  signal ip_1_23: unsigned((32 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_46_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_25_3_lsh: unsigned((41 - 1) downto 0);
  signal cast_internal_ip_36_3_convert: unsigned((32 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_unsigned(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_25_3_lsh <= u2u_cast(ip_1_23, 0, 41, 9);
  cast_internal_ip_36_3_convert <= u2u_cast(cast_internal_ip_25_3_lsh, 0, 32, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity constant_b8cd06851c is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_b8cd06851c;


architecture behavior of constant_b8cd06851c is
begin
  op <= "00000000000000000000000000100000";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity constant_37567836aa is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_37567836aa;


architecture behavior of constant_37567836aa is
begin
  op <= "00000000000000000000000000000000";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity constant_6293007044 is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_6293007044;


architecture behavior of constant_6293007044 is
begin
  op <= "1";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity constant_b213411135 is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_b213411135;


architecture behavior of constant_b213411135 is
begin
  op <= "00000000000000000000000000010000";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity constant_4792b807f2 is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_4792b807f2;


architecture behavior of constant_4792b807f2 is
begin
  op <= "00000000000000001111111111111111";
end behavior;


-------------------------------------------------------------------
-- System Generator version 13.2 VHDL source file.
--
-- Copyright(C) 2011 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2011 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;
entity convert_func_call is
    generic (
        din_width    : integer := 16;
        din_bin_pt   : integer := 4;
        din_arith    : integer := xlUnsigned;
        dout_width   : integer := 8;
        dout_bin_pt  : integer := 2;
        dout_arith   : integer := xlUnsigned;
        quantization : integer := xlTruncate;
        overflow     : integer := xlWrap);
    port (
        din : in std_logic_vector (din_width-1 downto 0);
        result : out std_logic_vector (dout_width-1 downto 0));
end convert_func_call;
architecture behavior of convert_func_call is
begin
    result <= convert_type(din, din_width, din_bin_pt, din_arith,
                           dout_width, dout_bin_pt, dout_arith,
                           quantization, overflow);
end behavior;
library IEEE;
use IEEE.std_logic_1164.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;
entity xlconvert is
    generic (
        din_width    : integer := 16;
        din_bin_pt   : integer := 4;
        din_arith    : integer := xlUnsigned;
        dout_width   : integer := 8;
        dout_bin_pt  : integer := 2;
        dout_arith   : integer := xlUnsigned;
        en_width     : integer := 1;
        en_bin_pt    : integer := 0;
        en_arith     : integer := xlUnsigned;
        bool_conversion : integer :=0;
        latency      : integer := 0;
        quantization : integer := xlTruncate;
        overflow     : integer := xlWrap);
    port (
        din : in std_logic_vector (din_width-1 downto 0);
        en  : in std_logic_vector (en_width-1 downto 0);
        ce  : in std_logic;
        clr : in std_logic;
        clk : in std_logic;
        dout : out std_logic_vector (dout_width-1 downto 0));
end xlconvert;
architecture behavior of xlconvert is
    component synth_reg
        generic (width       : integer;
                 latency     : integer);
        port (i       : in std_logic_vector(width-1 downto 0);
              ce      : in std_logic;
              clr     : in std_logic;
              clk     : in std_logic;
              o       : out std_logic_vector(width-1 downto 0));
    end component;
    component convert_func_call
        generic (
            din_width    : integer := 16;
            din_bin_pt   : integer := 4;
            din_arith    : integer := xlUnsigned;
            dout_width   : integer := 8;
            dout_bin_pt  : integer := 2;
            dout_arith   : integer := xlUnsigned;
            quantization : integer := xlTruncate;
            overflow     : integer := xlWrap);
        port (
            din : in std_logic_vector (din_width-1 downto 0);
            result : out std_logic_vector (dout_width-1 downto 0));
    end component;
    -- synopsys translate_off
    -- synopsys translate_on
    signal result : std_logic_vector(dout_width-1 downto 0);
    signal internal_ce : std_logic;
begin
    -- synopsys translate_off
    -- synopsys translate_on
    internal_ce <= ce and en(0);

    bool_conversion_generate : if (bool_conversion = 1)
    generate
      result <= din;
    end generate;
    std_conversion_generate : if (bool_conversion = 0)
    generate
      convert : convert_func_call
        generic map (
          din_width   => din_width,
          din_bin_pt  => din_bin_pt,
          din_arith   => din_arith,
          dout_width  => dout_width,
          dout_bin_pt => dout_bin_pt,
          dout_arith  => dout_arith,
          quantization => quantization,
          overflow     => overflow)
        port map (
          din => din,
          result => result);
    end generate;
    latency_test : if (latency > 0) generate
        reg : synth_reg
            generic map (
              width => dout_width,
              latency => latency
            )
            port map (
              i => result,
              ce => internal_ce,
              clr => clr,
              clk => clk,
              o => dout
            );
    end generate;
    latency0 : if (latency = 0)
    generate
        dout <= result;
    end generate latency0;
end  behavior;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity inverter_e5b38cca3b is
  port (
    ip : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end inverter_e5b38cca3b;


architecture behavior of inverter_e5b38cca3b is
  signal ip_1_26: boolean;
  type array_type_op_mem_22_20 is array (0 to (1 - 1)) of boolean;
  signal op_mem_22_20: array_type_op_mem_22_20 := (
    0 => false);
  signal op_mem_22_20_front_din: boolean;
  signal op_mem_22_20_back: boolean;
  signal op_mem_22_20_push_front_pop_back_en: std_logic;
  signal internal_ip_12_1_bitnot: boolean;
begin
  ip_1_26 <= ((ip) = "1");
  op_mem_22_20_back <= op_mem_22_20(0);
  proc_op_mem_22_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_22_20_push_front_pop_back_en = '1')) then
        op_mem_22_20(0) <= op_mem_22_20_front_din;
      end if;
    end if;
  end process proc_op_mem_22_20;
  internal_ip_12_1_bitnot <= ((not boolean_to_vector(ip_1_26)) = "1");
  op_mem_22_20_push_front_pop_back_en <= '0';
  op <= boolean_to_vector(internal_ip_12_1_bitnot);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity logical_80f90b97d0 is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end logical_80f90b97d0;


architecture behavior of logical_80f90b97d0 is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  fully_2_1_bit <= d0_1_24 and d1_1_27;
  y <= std_logic_to_vector(fully_2_1_bit);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity logical_aacf6e1b0e is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end logical_aacf6e1b0e;


architecture behavior of logical_aacf6e1b0e is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  fully_2_1_bit <= d0_1_24 or d1_1_27;
  y <= std_logic_to_vector(fully_2_1_bit);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity logical_93dcb93ace is
  port (
    d0 : in std_logic_vector((32 - 1) downto 0);
    d1 : in std_logic_vector((32 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end logical_93dcb93ace;


architecture behavior of logical_93dcb93ace is
  signal d0_1_24: std_logic_vector((32 - 1) downto 0);
  signal d1_1_27: std_logic_vector((32 - 1) downto 0);
  signal fully_2_1_bit: std_logic_vector((32 - 1) downto 0);
begin
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  fully_2_1_bit <= d0_1_24 and d1_1_27;
  y <= fully_2_1_bit;
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity mux_286b77e019 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((32 - 1) downto 0);
    d1 : in std_logic_vector((32 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end mux_286b77e019;


architecture behavior of mux_286b77e019 is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((32 - 1) downto 0);
  signal d1_1_27: std_logic_vector((32 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((32 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity relational_8782e16b67 is
  port (
    a : in std_logic_vector((32 - 1) downto 0);
    b : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end relational_8782e16b67;


architecture behavior of relational_8782e16b67 is
  signal a_1_31: unsigned((32 - 1) downto 0);
  signal b_1_34: unsigned((32 - 1) downto 0);
  signal result_22_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_22_3_rel <= a_1_31 >= b_1_34;
  op <= boolean_to_vector(result_22_3_rel);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity relational_ee3d1b14c5 is
  port (
    a : in std_logic_vector((1 - 1) downto 0);
    b : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end relational_ee3d1b14c5;


architecture behavior of relational_ee3d1b14c5 is
  signal a_1_31: unsigned((1 - 1) downto 0);
  signal b_1_34: unsigned((1 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity relational_338aab6013 is
  port (
    a : in std_logic_vector((1 - 1) downto 0);
    b : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end relational_338aab6013;


architecture behavior of relational_338aab6013 is
  signal a_1_31: unsigned((1 - 1) downto 0);
  signal b_1_34: unsigned((32 - 1) downto 0);
  signal cast_12_12: unsigned((32 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  cast_12_12 <= u2u_cast(a_1_31, 0, 32, 0);
  result_12_3_rel <= cast_12_12 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity mux_ff2c00cfbe is
  port (
    sel : in std_logic_vector((5 - 1) downto 0);
    d0 : in std_logic_vector((33 - 1) downto 0);
    d1 : in std_logic_vector((33 - 1) downto 0);
    d2 : in std_logic_vector((33 - 1) downto 0);
    d3 : in std_logic_vector((33 - 1) downto 0);
    d4 : in std_logic_vector((33 - 1) downto 0);
    d5 : in std_logic_vector((33 - 1) downto 0);
    d6 : in std_logic_vector((33 - 1) downto 0);
    d7 : in std_logic_vector((33 - 1) downto 0);
    d8 : in std_logic_vector((33 - 1) downto 0);
    d9 : in std_logic_vector((33 - 1) downto 0);
    d10 : in std_logic_vector((33 - 1) downto 0);
    d11 : in std_logic_vector((33 - 1) downto 0);
    d12 : in std_logic_vector((33 - 1) downto 0);
    d13 : in std_logic_vector((33 - 1) downto 0);
    d14 : in std_logic_vector((33 - 1) downto 0);
    d15 : in std_logic_vector((33 - 1) downto 0);
    d16 : in std_logic_vector((33 - 1) downto 0);
    d17 : in std_logic_vector((33 - 1) downto 0);
    d18 : in std_logic_vector((33 - 1) downto 0);
    d19 : in std_logic_vector((33 - 1) downto 0);
    d20 : in std_logic_vector((33 - 1) downto 0);
    d21 : in std_logic_vector((33 - 1) downto 0);
    d22 : in std_logic_vector((33 - 1) downto 0);
    d23 : in std_logic_vector((33 - 1) downto 0);
    d24 : in std_logic_vector((33 - 1) downto 0);
    d25 : in std_logic_vector((33 - 1) downto 0);
    d26 : in std_logic_vector((33 - 1) downto 0);
    d27 : in std_logic_vector((33 - 1) downto 0);
    d28 : in std_logic_vector((33 - 1) downto 0);
    d29 : in std_logic_vector((33 - 1) downto 0);
    d30 : in std_logic_vector((33 - 1) downto 0);
    d31 : in std_logic_vector((33 - 1) downto 0);
    y : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end mux_ff2c00cfbe;


architecture behavior of mux_ff2c00cfbe is
  signal sel_1_20: std_logic_vector((5 - 1) downto 0);
  signal d0_1_24: std_logic_vector((33 - 1) downto 0);
  signal d1_1_27: std_logic_vector((33 - 1) downto 0);
  signal d2_1_30: std_logic_vector((33 - 1) downto 0);
  signal d3_1_33: std_logic_vector((33 - 1) downto 0);
  signal d4_1_36: std_logic_vector((33 - 1) downto 0);
  signal d5_1_39: std_logic_vector((33 - 1) downto 0);
  signal d6_1_42: std_logic_vector((33 - 1) downto 0);
  signal d7_1_45: std_logic_vector((33 - 1) downto 0);
  signal d8_1_48: std_logic_vector((33 - 1) downto 0);
  signal d9_1_51: std_logic_vector((33 - 1) downto 0);
  signal d10_1_54: std_logic_vector((33 - 1) downto 0);
  signal d11_1_58: std_logic_vector((33 - 1) downto 0);
  signal d12_1_62: std_logic_vector((33 - 1) downto 0);
  signal d13_1_66: std_logic_vector((33 - 1) downto 0);
  signal d14_1_70: std_logic_vector((33 - 1) downto 0);
  signal d15_1_74: std_logic_vector((33 - 1) downto 0);
  signal d16_1_78: std_logic_vector((33 - 1) downto 0);
  signal d17_1_82: std_logic_vector((33 - 1) downto 0);
  signal d18_1_86: std_logic_vector((33 - 1) downto 0);
  signal d19_1_90: std_logic_vector((33 - 1) downto 0);
  signal d20_1_94: std_logic_vector((33 - 1) downto 0);
  signal d21_1_98: std_logic_vector((33 - 1) downto 0);
  signal d22_1_102: std_logic_vector((33 - 1) downto 0);
  signal d23_1_106: std_logic_vector((33 - 1) downto 0);
  signal d24_1_110: std_logic_vector((33 - 1) downto 0);
  signal d25_1_114: std_logic_vector((33 - 1) downto 0);
  signal d26_1_118: std_logic_vector((33 - 1) downto 0);
  signal d27_1_122: std_logic_vector((33 - 1) downto 0);
  signal d28_1_126: std_logic_vector((33 - 1) downto 0);
  signal d29_1_130: std_logic_vector((33 - 1) downto 0);
  signal d30_1_134: std_logic_vector((33 - 1) downto 0);
  signal d31_1_138: std_logic_vector((33 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((33 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  d4_1_36 <= d4;
  d5_1_39 <= d5;
  d6_1_42 <= d6;
  d7_1_45 <= d7;
  d8_1_48 <= d8;
  d9_1_51 <= d9;
  d10_1_54 <= d10;
  d11_1_58 <= d11;
  d12_1_62 <= d12;
  d13_1_66 <= d13;
  d14_1_70 <= d14;
  d15_1_74 <= d15;
  d16_1_78 <= d16;
  d17_1_82 <= d17;
  d18_1_86 <= d18;
  d19_1_90 <= d19;
  d20_1_94 <= d20;
  d21_1_98 <= d21;
  d22_1_102 <= d22;
  d23_1_106 <= d23;
  d24_1_110 <= d24;
  d25_1_114 <= d25;
  d26_1_118 <= d26;
  d27_1_122 <= d27;
  d28_1_126 <= d28;
  d29_1_130 <= d29;
  d30_1_134 <= d30;
  d31_1_138 <= d31;
  proc_switch_6_1: process (d0_1_24, d10_1_54, d11_1_58, d12_1_62, d13_1_66, d14_1_70, d15_1_74, d16_1_78, d17_1_82, d18_1_86, d19_1_90, d1_1_27, d20_1_94, d21_1_98, d22_1_102, d23_1_106, d24_1_110, d25_1_114, d26_1_118, d27_1_122, d28_1_126, d29_1_130, d2_1_30, d30_1_134, d31_1_138, d3_1_33, d4_1_36, d5_1_39, d6_1_42, d7_1_45, d8_1_48, d9_1_51, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00000" =>
        unregy_join_6_1 <= d0_1_24;
      when "00001" =>
        unregy_join_6_1 <= d1_1_27;
      when "00010" =>
        unregy_join_6_1 <= d2_1_30;
      when "00011" =>
        unregy_join_6_1 <= d3_1_33;
      when "00100" =>
        unregy_join_6_1 <= d4_1_36;
      when "00101" =>
        unregy_join_6_1 <= d5_1_39;
      when "00110" =>
        unregy_join_6_1 <= d6_1_42;
      when "00111" =>
        unregy_join_6_1 <= d7_1_45;
      when "01000" =>
        unregy_join_6_1 <= d8_1_48;
      when "01001" =>
        unregy_join_6_1 <= d9_1_51;
      when "01010" =>
        unregy_join_6_1 <= d10_1_54;
      when "01011" =>
        unregy_join_6_1 <= d11_1_58;
      when "01100" =>
        unregy_join_6_1 <= d12_1_62;
      when "01101" =>
        unregy_join_6_1 <= d13_1_66;
      when "01110" =>
        unregy_join_6_1 <= d14_1_70;
      when "01111" =>
        unregy_join_6_1 <= d15_1_74;
      when "10000" =>
        unregy_join_6_1 <= d16_1_78;
      when "10001" =>
        unregy_join_6_1 <= d17_1_82;
      when "10010" =>
        unregy_join_6_1 <= d18_1_86;
      when "10011" =>
        unregy_join_6_1 <= d19_1_90;
      when "10100" =>
        unregy_join_6_1 <= d20_1_94;
      when "10101" =>
        unregy_join_6_1 <= d21_1_98;
      when "10110" =>
        unregy_join_6_1 <= d22_1_102;
      when "10111" =>
        unregy_join_6_1 <= d23_1_106;
      when "11000" =>
        unregy_join_6_1 <= d24_1_110;
      when "11001" =>
        unregy_join_6_1 <= d25_1_114;
      when "11010" =>
        unregy_join_6_1 <= d26_1_118;
      when "11011" =>
        unregy_join_6_1 <= d27_1_122;
      when "11100" =>
        unregy_join_6_1 <= d28_1_126;
      when "11101" =>
        unregy_join_6_1 <= d29_1_130;
      when "11110" =>
        unregy_join_6_1 <= d30_1_134;
      when others =>
        unregy_join_6_1 <= d31_1_138;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity mux_a9c79d495b is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((16 - 1) downto 0);
    d1 : in std_logic_vector((32 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end mux_a9c79d495b;


architecture behavior of mux_a9c79d495b is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((16 - 1) downto 0);
  signal d1_1_27: std_logic_vector((32 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((32 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= cast(d0_1_24, 0, 32, 0, xlSigned);
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity mux_6ed18994ca is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((32 - 1) downto 0);
    d1 : in std_logic_vector((32 - 1) downto 0);
    y : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end mux_6ed18994ca;


architecture behavior of mux_6ed18994ca is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((32 - 1) downto 0);
  signal d1_1_27: std_logic_vector((32 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((33 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= cast(d0_1_24, 0, 33, 0, xlUnsigned);
      when others =>
        unregy_join_6_1 <= cast(d1_1_27, 0, 33, 0, xlSigned);
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_f38ca8a59c is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_f38ca8a59c;


architecture behavior of shift_f38ca8a59c is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(ip_1_23);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_f0cb3da196 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_f0cb3da196;


architecture behavior of shift_f0cb3da196 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 1, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_18f3036668 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_18f3036668;


architecture behavior of shift_18f3036668 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 10, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_8e72e7c0e4 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_8e72e7c0e4;


architecture behavior of shift_8e72e7c0e4 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 11, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_98864fa7d1 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_98864fa7d1;


architecture behavior of shift_98864fa7d1 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 12, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_81adbe8e7d is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_81adbe8e7d;


architecture behavior of shift_81adbe8e7d is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 13, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_f0c2d31333 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_f0c2d31333;


architecture behavior of shift_f0c2d31333 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 14, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_4461a8c54c is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_4461a8c54c;


architecture behavior of shift_4461a8c54c is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 15, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_5222e634ed is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_5222e634ed;


architecture behavior of shift_5222e634ed is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 16, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_e24b69181f is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_e24b69181f;


architecture behavior of shift_e24b69181f is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 17, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_dd6d99dd5f is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_dd6d99dd5f;


architecture behavior of shift_dd6d99dd5f is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 26, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_668d5c78fa is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_668d5c78fa;


architecture behavior of shift_668d5c78fa is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 27, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_d7796bdbf7 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_d7796bdbf7;


architecture behavior of shift_d7796bdbf7 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 2, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_ef68ec89bc is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_ef68ec89bc;


architecture behavior of shift_ef68ec89bc is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 28, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_4d9687c27f is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_4d9687c27f;


architecture behavior of shift_4d9687c27f is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 29, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_66a5085a76 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_66a5085a76;


architecture behavior of shift_66a5085a76 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 30, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_49e56224ae is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_49e56224ae;


architecture behavior of shift_49e56224ae is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 31, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_7b8aa374f7 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_7b8aa374f7;


architecture behavior of shift_7b8aa374f7 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 18, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_54693bdfc7 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_54693bdfc7;


architecture behavior of shift_54693bdfc7 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 19, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_6b27d83f47 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_6b27d83f47;


architecture behavior of shift_6b27d83f47 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 20, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_cb981aa8c4 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_cb981aa8c4;


architecture behavior of shift_cb981aa8c4 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 21, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_40fa484ec5 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_40fa484ec5;


architecture behavior of shift_40fa484ec5 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 22, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_58d1f48765 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_58d1f48765;


architecture behavior of shift_58d1f48765 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 23, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_1e5eafd814 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_1e5eafd814;


architecture behavior of shift_1e5eafd814 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 3, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_462bbb5711 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_462bbb5711;


architecture behavior of shift_462bbb5711 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 24, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_04b6078e49 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_04b6078e49;


architecture behavior of shift_04b6078e49 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 25, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_9998b67051 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_9998b67051;


architecture behavior of shift_9998b67051 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 4, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_260b3da14d is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_260b3da14d;


architecture behavior of shift_260b3da14d is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 5, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_fb39f5df3f is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_fb39f5df3f;


architecture behavior of shift_fb39f5df3f is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 6, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_4ff2f36ac1 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_4ff2f36ac1;


architecture behavior of shift_4ff2f36ac1 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 7, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_0ee5f4864b is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_0ee5f4864b;


architecture behavior of shift_0ee5f4864b is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 8, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity shift_c32bb227e7 is
  port (
    ip : in std_logic_vector((33 - 1) downto 0);
    op : out std_logic_vector((33 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end shift_c32bb227e7;


architecture behavior of shift_c32bb227e7 is
  signal ip_1_23: signed((33 - 1) downto 0);
  type array_type_op_mem_46_20 is array (0 to (1 - 1)) of signed((33 - 1) downto 0);
  signal op_mem_46_20: array_type_op_mem_46_20 := (
    0 => "000000000000000000000000000000000");
  signal op_mem_46_20_front_din: signed((33 - 1) downto 0);
  signal op_mem_46_20_back: signed((33 - 1) downto 0);
  signal op_mem_46_20_push_front_pop_back_en: std_logic;
  signal cast_internal_ip_36_3_convert: signed((33 - 1) downto 0);
begin
  ip_1_23 <= std_logic_vector_to_signed(ip);
  op_mem_46_20_back <= op_mem_46_20(0);
  proc_op_mem_46_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_46_20_push_front_pop_back_en = '1')) then
        op_mem_46_20(0) <= op_mem_46_20_front_din;
      end if;
    end if;
  end process proc_op_mem_46_20;
  cast_internal_ip_36_3_convert <= s2s_cast(ip_1_23, 9, 33, 0);
  op_mem_46_20_push_front_pop_back_en <= '0';
  op <= signed_to_std_logic_vector(cast_internal_ip_36_3_convert);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity logical_b2600bd110 is
  port (
    d0 : in std_logic_vector((32 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end logical_b2600bd110;


architecture behavior of logical_b2600bd110 is
  signal d0_1_24: std_logic_vector((32 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  signal cast_convert_2_49: std_logic_vector((32 - 1) downto 0);
  signal cast_2_49: std_logic_vector((32 - 1) downto 0);
  signal fully_2_1_bit: std_logic_vector((32 - 1) downto 0);
begin
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  cast_convert_2_49 <= cast(d1_1_27, 0, 32, 0, xlUnsigned);
  cast_2_49 <= cast(cast_convert_2_49, 0, 32, 0, xlUnsigned);
  fully_2_1_bit <= d0_1_24 and cast_2_49;
  y <= fully_2_1_bit;
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity relational_f842e8b315 is
  port (
    a : in std_logic_vector((32 - 1) downto 0);
    b : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end relational_f842e8b315;


architecture behavior of relational_f842e8b315 is
  signal a_1_31: signed((32 - 1) downto 0);
  signal b_1_34: unsigned((32 - 1) downto 0);
  signal cast_16_12: signed((33 - 1) downto 0);
  signal cast_16_16: signed((33 - 1) downto 0);
  signal result_16_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_signed(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  cast_16_12 <= s2s_cast(a_1_31, 0, 33, 0);
  cast_16_16 <= u2s_cast(b_1_34, 0, 33, 0);
  result_16_3_rel <= cast_16_12 < cast_16_16;
  op <= boolean_to_vector(result_16_3_rel);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity concat_37d8262b20 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end concat_37d8262b20;


architecture behavior of concat_37d8262b20 is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: boolean;
  signal y_2_1_concat: unsigned((2 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= ((in1) = "1");
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & boolean_to_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity concat_3e67e1f589 is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end concat_3e67e1f589;


architecture behavior of concat_3e67e1f589 is
  signal in0_1_23: boolean;
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((2 - 1) downto 0);
begin
  in0_1_23 <= ((in0) = "1");
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(boolean_to_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity concat_e6f5ee726b is
  port (
    in0 : in std_logic_vector((1 - 1) downto 0);
    in1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end concat_e6f5ee726b;


architecture behavior of concat_e6f5ee726b is
  signal in0_1_23: unsigned((1 - 1) downto 0);
  signal in1_1_27: unsigned((1 - 1) downto 0);
  signal y_2_1_concat: unsigned((2 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity constant_963ed6358a is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_963ed6358a;


architecture behavior of constant_963ed6358a is
begin
  op <= "0";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity constant_754435d9c5 is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_754435d9c5;


architecture behavior of constant_754435d9c5 is
begin
  op <= "11111111111111111111111111111111";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity logical_aac1cbcdb3 is
  port (
    d0 : in std_logic_vector((2 - 1) downto 0);
    d1 : in std_logic_vector((2 - 1) downto 0);
    d2 : in std_logic_vector((2 - 1) downto 0);
    y : out std_logic_vector((2 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end logical_aac1cbcdb3;


architecture behavior of logical_aac1cbcdb3 is
  signal d0_1_24: std_logic_vector((2 - 1) downto 0);
  signal d1_1_27: std_logic_vector((2 - 1) downto 0);
  signal d2_1_30: std_logic_vector((2 - 1) downto 0);
  signal fully_2_1_bit: std_logic_vector((2 - 1) downto 0);
begin
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  fully_2_1_bit <= d0_1_24 or d1_1_27 or d2_1_30;
  y <= fully_2_1_bit;
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

entity mux_b70bd0a225 is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((32 - 1) downto 0);
    d1 : in std_logic_vector((32 - 1) downto 0);
    d2 : in std_logic_vector((32 - 1) downto 0);
    d3 : in std_logic_vector((32 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end mux_b70bd0a225;


architecture behavior of mux_b70bd0a225 is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((32 - 1) downto 0);
  signal d1_1_27: std_logic_vector((32 - 1) downto 0);
  signal d2_1_30: std_logic_vector((32 - 1) downto 0);
  signal d3_1_33: std_logic_vector((32 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((32 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  d3_1_33 <= d3;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, d3_1_33, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when "10" =>
        unregy_join_6_1 <= d2_1_30;
      when others =>
        unregy_join_6_1 <= d3_1_33;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;


-------------------------------------------------------------------
-- System Generator version 13.2 VHDL source file.
--
-- Copyright(C) 2011 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2011 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;
entity xlslice is
    generic (
        new_msb      : integer := 9;
        new_lsb      : integer := 1;
        x_width      : integer := 16;
        y_width      : integer := 8);
    port (
        x : in std_logic_vector (x_width-1 downto 0);
        y : out std_logic_vector (y_width-1 downto 0));
end xlslice;
architecture behavior of xlslice is
begin
    y <= x(new_msb downto new_lsb);
end  behavior;
library IEEE;
use IEEE.std_logic_1164.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

-- Generated from Simulink block "shift_logical/Shift Logical/sll"

entity sll_entity_e089338fd3 is
  port (
    a: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sll_amt: in std_logic_vector(4 downto 0); 
    sll_out: out std_logic_vector(31 downto 0)
  );
end sll_entity_e089338fd3;

architecture structural of sll_entity_e089338fd3 is
  signal a_in_net_x0: std_logic_vector(31 downto 0);
  signal ce_1_sg_x0: std_logic;
  signal clk_1_sg_x0: std_logic;
  signal mux_y_net_x0: std_logic_vector(31 downto 0);
  signal shift10_op_net: std_logic_vector(31 downto 0);
  signal shift11_op_net: std_logic_vector(31 downto 0);
  signal shift12_op_net: std_logic_vector(31 downto 0);
  signal shift13_op_net: std_logic_vector(31 downto 0);
  signal shift14_op_net: std_logic_vector(31 downto 0);
  signal shift15_op_net: std_logic_vector(31 downto 0);
  signal shift16_op_net: std_logic_vector(31 downto 0);
  signal shift17_op_net: std_logic_vector(31 downto 0);
  signal shift18_op_net: std_logic_vector(31 downto 0);
  signal shift19_op_net: std_logic_vector(31 downto 0);
  signal shift1_op_net: std_logic_vector(31 downto 0);
  signal shift20_op_net: std_logic_vector(31 downto 0);
  signal shift21_op_net: std_logic_vector(31 downto 0);
  signal shift22_op_net: std_logic_vector(31 downto 0);
  signal shift23_op_net: std_logic_vector(31 downto 0);
  signal shift24_op_net: std_logic_vector(31 downto 0);
  signal shift25_op_net: std_logic_vector(31 downto 0);
  signal shift26_op_net: std_logic_vector(31 downto 0);
  signal shift27_op_net: std_logic_vector(31 downto 0);
  signal shift28_op_net: std_logic_vector(31 downto 0);
  signal shift29_op_net: std_logic_vector(31 downto 0);
  signal shift2_op_net: std_logic_vector(31 downto 0);
  signal shift30_op_net: std_logic_vector(31 downto 0);
  signal shift31_op_net: std_logic_vector(31 downto 0);
  signal shift3_op_net: std_logic_vector(31 downto 0);
  signal shift4_op_net: std_logic_vector(31 downto 0);
  signal shift5_op_net: std_logic_vector(31 downto 0);
  signal shift6_op_net: std_logic_vector(31 downto 0);
  signal shift7_op_net: std_logic_vector(31 downto 0);
  signal shift8_op_net: std_logic_vector(31 downto 0);
  signal shift9_op_net: std_logic_vector(31 downto 0);
  signal shift_op_net: std_logic_vector(31 downto 0);
  signal slice_y_net_x0: std_logic_vector(4 downto 0);

begin
  a_in_net_x0 <= a;
  ce_1_sg_x0 <= ce_1;
  clk_1_sg_x0 <= clk_1;
  slice_y_net_x0 <= sll_amt;
  sll_out <= mux_y_net_x0;

  mux: entity shift_logical_lib.mux_bc26d025ba
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => shift_op_net,
      d1 => shift1_op_net,
      d10 => shift10_op_net,
      d11 => shift11_op_net,
      d12 => shift12_op_net,
      d13 => shift13_op_net,
      d14 => shift14_op_net,
      d15 => shift15_op_net,
      d16 => shift16_op_net,
      d17 => shift17_op_net,
      d18 => shift24_op_net,
      d19 => shift25_op_net,
      d2 => shift2_op_net,
      d20 => shift26_op_net,
      d21 => shift27_op_net,
      d22 => shift28_op_net,
      d23 => shift29_op_net,
      d24 => shift30_op_net,
      d25 => shift31_op_net,
      d26 => shift18_op_net,
      d27 => shift19_op_net,
      d28 => shift20_op_net,
      d29 => shift21_op_net,
      d3 => shift3_op_net,
      d30 => shift22_op_net,
      d31 => shift23_op_net,
      d4 => shift4_op_net,
      d5 => shift5_op_net,
      d6 => shift6_op_net,
      d7 => shift7_op_net,
      d8 => shift8_op_net,
      d9 => shift9_op_net,
      sel => slice_y_net_x0,
      y => mux_y_net_x0
    );

  shift: entity shift_logical_lib.shift_953fd27e4e
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift_op_net
    );

  shift1: entity shift_logical_lib.shift_53a9eabf4d
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift1_op_net
    );

  shift10: entity shift_logical_lib.shift_9fab70e0b5
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift10_op_net
    );

  shift11: entity shift_logical_lib.shift_657b5342cc
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift11_op_net
    );

  shift12: entity shift_logical_lib.shift_d1e30ba6e3
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift12_op_net
    );

  shift13: entity shift_logical_lib.shift_63e62df7ee
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift13_op_net
    );

  shift14: entity shift_logical_lib.shift_e0c4ea8daf
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift14_op_net
    );

  shift15: entity shift_logical_lib.shift_908b7ad8c9
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift15_op_net
    );

  shift16: entity shift_logical_lib.shift_a1f80e8302
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift16_op_net
    );

  shift17: entity shift_logical_lib.shift_2a68b3555e
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift17_op_net
    );

  shift18: entity shift_logical_lib.shift_fccd89c7dc
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift18_op_net
    );

  shift19: entity shift_logical_lib.shift_0777b5473a
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift19_op_net
    );

  shift2: entity shift_logical_lib.shift_1ee0126720
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift2_op_net
    );

  shift20: entity shift_logical_lib.shift_bbceaaf4ad
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift20_op_net
    );

  shift21: entity shift_logical_lib.shift_0d92409f07
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift21_op_net
    );

  shift22: entity shift_logical_lib.shift_f3c2831506
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift22_op_net
    );

  shift23: entity shift_logical_lib.shift_b122968286
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift23_op_net
    );

  shift24: entity shift_logical_lib.shift_1769ff8354
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift24_op_net
    );

  shift25: entity shift_logical_lib.shift_21ac99447c
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift25_op_net
    );

  shift26: entity shift_logical_lib.shift_077b4cb8bc
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift26_op_net
    );

  shift27: entity shift_logical_lib.shift_1c5f6b428e
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift27_op_net
    );

  shift28: entity shift_logical_lib.shift_a870cde4d0
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift28_op_net
    );

  shift29: entity shift_logical_lib.shift_402829e770
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift29_op_net
    );

  shift3: entity shift_logical_lib.shift_b5c7a2a7a3
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift3_op_net
    );

  shift30: entity shift_logical_lib.shift_0d965b2981
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift30_op_net
    );

  shift31: entity shift_logical_lib.shift_e6acae782b
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift31_op_net
    );

  shift4: entity shift_logical_lib.shift_520bf99957
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift4_op_net
    );

  shift5: entity shift_logical_lib.shift_cc92633aff
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift5_op_net
    );

  shift6: entity shift_logical_lib.shift_ef307fdf17
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift6_op_net
    );

  shift7: entity shift_logical_lib.shift_d5d98a98f9
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift7_op_net
    );

  shift8: entity shift_logical_lib.shift_1b584f2b88
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift8_op_net
    );

  shift9: entity shift_logical_lib.shift_7cc6eff90a
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => a_in_net_x0,
      op => shift9_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

-- Generated from Simulink block "shift_logical/Shift Logical/sll_select"

entity sll_select_entity_6dbfcdd973 is
  port (
    b: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    sll_in: in std_logic_vector(31 downto 0); 
    w32: in std_logic; 
    sll_out: out std_logic_vector(31 downto 0)
  );
end sll_select_entity_6dbfcdd973;

architecture structural of sll_select_entity_6dbfcdd973 is
  signal b_in_net_x0: std_logic_vector(31 downto 0);
  signal ce_1_sg_x1: std_logic;
  signal clk_1_sg_x1: std_logic;
  signal constant1_op_net: std_logic_vector(31 downto 0);
  signal constant2_op_net: std_logic;
  signal constant3_op_net: std_logic_vector(31 downto 0);
  signal constant4_op_net: std_logic;
  signal constant5_op_net: std_logic_vector(31 downto 0);
  signal constant6_op_net: std_logic_vector(31 downto 0);
  signal constant_op_net: std_logic_vector(31 downto 0);
  signal convert1_dout_net: std_logic;
  signal convert2_dout_net: std_logic;
  signal convert3_dout_net: std_logic;
  signal convert_dout_net: std_logic;
  signal inverter1_op_net: std_logic;
  signal logical1_y_net: std_logic;
  signal logical2_y_net: std_logic;
  signal logical5_y_net: std_logic_vector(31 downto 0);
  signal logical_y_net: std_logic;
  signal mux1_y_net_x0: std_logic_vector(31 downto 0);
  signal mux_y_net: std_logic_vector(31 downto 0);
  signal mux_y_net_x1: std_logic_vector(31 downto 0);
  signal relational1_op_net: std_logic;
  signal relational2_op_net: std_logic;
  signal relational3_op_net: std_logic;
  signal relational4_op_net: std_logic;
  signal relational_op_net: std_logic;
  signal w32_in_net_x0: std_logic;

begin
  b_in_net_x0 <= b;
  ce_1_sg_x1 <= ce_1;
  clk_1_sg_x1 <= clk_1;
  mux_y_net_x1 <= sll_in;
  w32_in_net_x0 <= w32;
  sll_out <= mux1_y_net_x0;

  constant1: entity shift_logical_lib.constant_37567836aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant2: entity shift_logical_lib.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  constant3: entity shift_logical_lib.constant_b213411135
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant3_op_net
    );

  constant4: entity shift_logical_lib.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant4_op_net
    );

  constant5: entity shift_logical_lib.constant_37567836aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant5_op_net
    );

  constant6: entity shift_logical_lib.constant_4792b807f2
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant6_op_net
    );

  constant_x0: entity shift_logical_lib.constant_b8cd06851c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  convert: entity shift_logical_lib.xlconvert
    generic map (
      bool_conversion => 1,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      din(0) => w32_in_net_x0,
      en => "1",
      dout(0) => convert_dout_net
    );

  convert1: entity shift_logical_lib.xlconvert
    generic map (
      bool_conversion => 1,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      din(0) => w32_in_net_x0,
      en => "1",
      dout(0) => convert1_dout_net
    );

  convert2: entity shift_logical_lib.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      din(0) => logical_y_net,
      en => "1",
      dout(0) => convert2_dout_net
    );

  convert3: entity shift_logical_lib.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      din(0) => logical1_y_net,
      en => "1",
      dout(0) => convert3_dout_net
    );

  inverter1: entity shift_logical_lib.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x1,
      clk => clk_1_sg_x1,
      clr => '0',
      ip(0) => convert1_dout_net,
      op(0) => inverter1_op_net
    );

  logical: entity shift_logical_lib.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => relational_op_net,
      d1(0) => convert_dout_net,
      y(0) => logical_y_net
    );

  logical1: entity shift_logical_lib.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => relational2_op_net,
      d1(0) => inverter1_op_net,
      y(0) => logical1_y_net
    );

  logical2: entity shift_logical_lib.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => relational1_op_net,
      d1(0) => relational3_op_net,
      y(0) => logical2_y_net
    );

  logical5: entity shift_logical_lib.logical_93dcb93ace
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => mux_y_net,
      d1 => constant6_op_net,
      y => logical5_y_net
    );

  mux: entity shift_logical_lib.mux_286b77e019
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => mux_y_net_x1,
      d1 => constant1_op_net,
      sel(0) => logical2_y_net,
      y => mux_y_net
    );

  mux1: entity shift_logical_lib.mux_286b77e019
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => logical5_y_net,
      d1 => mux_y_net,
      sel(0) => relational4_op_net,
      y => mux1_y_net_x0
    );

  relational: entity shift_logical_lib.relational_8782e16b67
    port map (
      a => b_in_net_x0,
      b => constant_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity shift_logical_lib.relational_ee3d1b14c5
    port map (
      a(0) => convert2_dout_net,
      b(0) => constant2_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

  relational2: entity shift_logical_lib.relational_8782e16b67
    port map (
      a => b_in_net_x0,
      b => constant3_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational2_op_net
    );

  relational3: entity shift_logical_lib.relational_ee3d1b14c5
    port map (
      a(0) => convert3_dout_net,
      b(0) => constant4_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational3_op_net
    );

  relational4: entity shift_logical_lib.relational_338aab6013
    port map (
      a(0) => w32_in_net_x0,
      b => constant5_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational4_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

-- Generated from Simulink block "shift_logical/Shift Logical/srl"

entity srl_entity_d2c6b67a6e is
  port (
    a: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    is_signed: in std_logic; 
    srl_amt: in std_logic_vector(4 downto 0); 
    w32: in std_logic; 
    srl_out: out std_logic_vector(31 downto 0)
  );
end srl_entity_d2c6b67a6e;

architecture structural of srl_entity_d2c6b67a6e is
  signal a_in_net_x1: std_logic_vector(31 downto 0);
  signal ce_1_sg_x2: std_logic;
  signal clk_1_sg_x2: std_logic;
  signal constant1_op_net: std_logic;
  signal constant_op_net: std_logic;
  signal convert1_dout_net: std_logic_vector(31 downto 0);
  signal convert2_dout_net_x0: std_logic_vector(31 downto 0);
  signal convert_dout_net: std_logic_vector(15 downto 0);
  signal is_signed_in_net_x0: std_logic;
  signal mux1_y_net: std_logic_vector(31 downto 0);
  signal mux3_y_net: std_logic_vector(32 downto 0);
  signal mux_y_net: std_logic_vector(32 downto 0);
  signal relational1_op_net: std_logic;
  signal relational_op_net: std_logic;
  signal shift10_op_net: std_logic_vector(32 downto 0);
  signal shift11_op_net: std_logic_vector(32 downto 0);
  signal shift12_op_net: std_logic_vector(32 downto 0);
  signal shift13_op_net: std_logic_vector(32 downto 0);
  signal shift14_op_net: std_logic_vector(32 downto 0);
  signal shift15_op_net: std_logic_vector(32 downto 0);
  signal shift16_op_net: std_logic_vector(32 downto 0);
  signal shift17_op_net: std_logic_vector(32 downto 0);
  signal shift18_op_net: std_logic_vector(32 downto 0);
  signal shift19_op_net: std_logic_vector(32 downto 0);
  signal shift1_op_net: std_logic_vector(32 downto 0);
  signal shift20_op_net: std_logic_vector(32 downto 0);
  signal shift21_op_net: std_logic_vector(32 downto 0);
  signal shift22_op_net: std_logic_vector(32 downto 0);
  signal shift23_op_net: std_logic_vector(32 downto 0);
  signal shift24_op_net: std_logic_vector(32 downto 0);
  signal shift25_op_net: std_logic_vector(32 downto 0);
  signal shift26_op_net: std_logic_vector(32 downto 0);
  signal shift27_op_net: std_logic_vector(32 downto 0);
  signal shift28_op_net: std_logic_vector(32 downto 0);
  signal shift29_op_net: std_logic_vector(32 downto 0);
  signal shift2_op_net: std_logic_vector(32 downto 0);
  signal shift30_op_net: std_logic_vector(32 downto 0);
  signal shift31_op_net: std_logic_vector(32 downto 0);
  signal shift3_op_net: std_logic_vector(32 downto 0);
  signal shift4_op_net: std_logic_vector(32 downto 0);
  signal shift5_op_net: std_logic_vector(32 downto 0);
  signal shift6_op_net: std_logic_vector(32 downto 0);
  signal shift7_op_net: std_logic_vector(32 downto 0);
  signal shift8_op_net: std_logic_vector(32 downto 0);
  signal shift9_op_net: std_logic_vector(32 downto 0);
  signal shift_op_net: std_logic_vector(32 downto 0);
  signal slice_y_net_x1: std_logic_vector(4 downto 0);
  signal w32_in_net_x1: std_logic;

begin
  a_in_net_x1 <= a;
  ce_1_sg_x2 <= ce_1;
  clk_1_sg_x2 <= clk_1;
  is_signed_in_net_x0 <= is_signed;
  slice_y_net_x1 <= srl_amt;
  w32_in_net_x1 <= w32;
  srl_out <= convert2_dout_net_x0;

  constant1: entity shift_logical_lib.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant1_op_net
    );

  constant_x0: entity shift_logical_lib.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant_op_net
    );

  convert: entity shift_logical_lib.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 32,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 16,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      din => a_in_net_x1,
      en => "1",
      dout => convert_dout_net
    );

  convert1: entity shift_logical_lib.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 32,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 32,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      din => a_in_net_x1,
      en => "1",
      dout => convert1_dout_net
    );

  convert2: entity shift_logical_lib.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 2,
      din_bin_pt => 0,
      din_width => 33,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 32,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      din => mux_y_net,
      en => "1",
      dout => convert2_dout_net_x0
    );

  mux: entity shift_logical_lib.mux_ff2c00cfbe
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => shift_op_net,
      d1 => shift1_op_net,
      d10 => shift10_op_net,
      d11 => shift11_op_net,
      d12 => shift12_op_net,
      d13 => shift13_op_net,
      d14 => shift14_op_net,
      d15 => shift15_op_net,
      d16 => shift16_op_net,
      d17 => shift17_op_net,
      d18 => shift24_op_net,
      d19 => shift25_op_net,
      d2 => shift2_op_net,
      d20 => shift26_op_net,
      d21 => shift27_op_net,
      d22 => shift28_op_net,
      d23 => shift29_op_net,
      d24 => shift30_op_net,
      d25 => shift31_op_net,
      d26 => shift18_op_net,
      d27 => shift19_op_net,
      d28 => shift20_op_net,
      d29 => shift21_op_net,
      d3 => shift3_op_net,
      d30 => shift22_op_net,
      d31 => shift23_op_net,
      d4 => shift4_op_net,
      d5 => shift5_op_net,
      d6 => shift6_op_net,
      d7 => shift7_op_net,
      d8 => shift8_op_net,
      d9 => shift9_op_net,
      sel => slice_y_net_x1,
      y => mux_y_net
    );

  mux1: entity shift_logical_lib.mux_a9c79d495b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => convert_dout_net,
      d1 => convert1_dout_net,
      sel(0) => relational1_op_net,
      y => mux1_y_net
    );

  mux3: entity shift_logical_lib.mux_6ed18994ca
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => a_in_net_x1,
      d1 => mux1_y_net,
      sel(0) => relational_op_net,
      y => mux3_y_net
    );

  relational: entity shift_logical_lib.relational_ee3d1b14c5
    port map (
      a(0) => is_signed_in_net_x0,
      b(0) => constant_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity shift_logical_lib.relational_ee3d1b14c5
    port map (
      a(0) => w32_in_net_x1,
      b(0) => constant1_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

  shift: entity shift_logical_lib.shift_f38ca8a59c
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift_op_net
    );

  shift1: entity shift_logical_lib.shift_f0cb3da196
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift1_op_net
    );

  shift10: entity shift_logical_lib.shift_18f3036668
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift10_op_net
    );

  shift11: entity shift_logical_lib.shift_8e72e7c0e4
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift11_op_net
    );

  shift12: entity shift_logical_lib.shift_98864fa7d1
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift12_op_net
    );

  shift13: entity shift_logical_lib.shift_81adbe8e7d
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift13_op_net
    );

  shift14: entity shift_logical_lib.shift_f0c2d31333
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift14_op_net
    );

  shift15: entity shift_logical_lib.shift_4461a8c54c
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift15_op_net
    );

  shift16: entity shift_logical_lib.shift_5222e634ed
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift16_op_net
    );

  shift17: entity shift_logical_lib.shift_e24b69181f
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift17_op_net
    );

  shift18: entity shift_logical_lib.shift_dd6d99dd5f
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift18_op_net
    );

  shift19: entity shift_logical_lib.shift_668d5c78fa
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift19_op_net
    );

  shift2: entity shift_logical_lib.shift_d7796bdbf7
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift2_op_net
    );

  shift20: entity shift_logical_lib.shift_ef68ec89bc
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift20_op_net
    );

  shift21: entity shift_logical_lib.shift_4d9687c27f
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift21_op_net
    );

  shift22: entity shift_logical_lib.shift_66a5085a76
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift22_op_net
    );

  shift23: entity shift_logical_lib.shift_49e56224ae
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift23_op_net
    );

  shift24: entity shift_logical_lib.shift_7b8aa374f7
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift24_op_net
    );

  shift25: entity shift_logical_lib.shift_54693bdfc7
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift25_op_net
    );

  shift26: entity shift_logical_lib.shift_6b27d83f47
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift26_op_net
    );

  shift27: entity shift_logical_lib.shift_cb981aa8c4
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift27_op_net
    );

  shift28: entity shift_logical_lib.shift_40fa484ec5
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift28_op_net
    );

  shift29: entity shift_logical_lib.shift_58d1f48765
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift29_op_net
    );

  shift3: entity shift_logical_lib.shift_1e5eafd814
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift3_op_net
    );

  shift30: entity shift_logical_lib.shift_462bbb5711
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift30_op_net
    );

  shift31: entity shift_logical_lib.shift_04b6078e49
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift31_op_net
    );

  shift4: entity shift_logical_lib.shift_9998b67051
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift4_op_net
    );

  shift5: entity shift_logical_lib.shift_260b3da14d
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift5_op_net
    );

  shift6: entity shift_logical_lib.shift_fb39f5df3f
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift6_op_net
    );

  shift7: entity shift_logical_lib.shift_4ff2f36ac1
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift7_op_net
    );

  shift8: entity shift_logical_lib.shift_0ee5f4864b
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift8_op_net
    );

  shift9: entity shift_logical_lib.shift_c32bb227e7
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => mux3_y_net,
      op => shift9_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

-- Generated from Simulink block "shift_logical/Shift Logical/srl_select/Subsystem"

entity subsystem_entity_ed1fcae508 is
  port (
    in1: in std_logic_vector(31 downto 0); 
    in2: in std_logic; 
    out1: out std_logic
  );
end subsystem_entity_ed1fcae508;

architecture structural of subsystem_entity_ed1fcae508 is
  signal constant9_op_net: std_logic_vector(31 downto 0);
  signal convert_dout_net_x0: std_logic_vector(31 downto 0);
  signal is_signed_in_net_x1: std_logic;
  signal logical2_y_net: std_logic_vector(31 downto 0);
  signal relational6_op_net_x0: std_logic;

begin
  convert_dout_net_x0 <= in1;
  is_signed_in_net_x1 <= in2;
  out1 <= relational6_op_net_x0;

  constant9: entity shift_logical_lib.constant_37567836aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant9_op_net
    );

  logical2: entity shift_logical_lib.logical_b2600bd110
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => convert_dout_net_x0,
      d1(0) => is_signed_in_net_x1,
      y => logical2_y_net
    );

  relational6: entity shift_logical_lib.relational_f842e8b315
    port map (
      a => logical2_y_net,
      b => constant9_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational6_op_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

-- Generated from Simulink block "shift_logical/Shift Logical/srl_select"

entity srl_select_entity_914f22079b is
  port (
    a: in std_logic_vector(31 downto 0); 
    b: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    is_signed: in std_logic; 
    srl_in: in std_logic_vector(31 downto 0); 
    w32: in std_logic; 
    srl_out: out std_logic_vector(31 downto 0)
  );
end srl_select_entity_914f22079b;

architecture structural of srl_select_entity_914f22079b is
  signal a_in_net_x2: std_logic_vector(31 downto 0);
  signal b_in_net_x1: std_logic_vector(31 downto 0);
  signal ce_1_sg_x3: std_logic;
  signal clk_1_sg_x3: std_logic;
  signal concat1_y_net: std_logic_vector(1 downto 0);
  signal concat2_y_net: std_logic_vector(1 downto 0);
  signal concat_y_net: std_logic_vector(1 downto 0);
  signal constant10_op_net: std_logic_vector(31 downto 0);
  signal constant11_op_net: std_logic_vector(31 downto 0);
  signal constant12_op_net: std_logic_vector(31 downto 0);
  signal constant13_op_net: std_logic;
  signal constant14_op_net: std_logic;
  signal constant2_op_net: std_logic;
  signal constant3_op_net: std_logic_vector(31 downto 0);
  signal constant4_op_net: std_logic;
  signal constant9_op_net: std_logic_vector(31 downto 0);
  signal constant_op_net: std_logic_vector(31 downto 0);
  signal convert1_dout_net: std_logic;
  signal convert2_dout_net: std_logic;
  signal convert2_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert3_dout_net: std_logic;
  signal convert4_dout_net: std_logic;
  signal convert_dout_net_x1: std_logic_vector(31 downto 0);
  signal inverter1_op_net: std_logic;
  signal is_signed_in_net_x3: std_logic;
  signal logical1_y_net: std_logic;
  signal logical2_y_net: std_logic_vector(1 downto 0);
  signal logical_y_net: std_logic;
  signal mux2_y_net: std_logic_vector(31 downto 0);
  signal mux3_y_net: std_logic_vector(31 downto 0);
  signal mux4_y_net_x0: std_logic_vector(31 downto 0);
  signal relational1_op_net: std_logic;
  signal relational2_op_net: std_logic;
  signal relational3_op_net: std_logic;
  signal relational6_op_net_x0: std_logic;
  signal relational6_op_net_x1: std_logic;
  signal relational_op_net: std_logic;
  signal w32_in_net_x2: std_logic;

begin
  a_in_net_x2 <= a;
  b_in_net_x1 <= b;
  ce_1_sg_x3 <= ce_1;
  clk_1_sg_x3 <= clk_1;
  is_signed_in_net_x3 <= is_signed;
  convert2_dout_net_x1 <= srl_in;
  w32_in_net_x2 <= w32;
  srl_out <= mux4_y_net_x0;

  concat: entity shift_logical_lib.concat_37d8262b20
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => constant13_op_net,
      in1(0) => relational1_op_net,
      y => concat_y_net
    );

  concat1: entity shift_logical_lib.concat_3e67e1f589
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => relational3_op_net,
      in1(0) => constant14_op_net,
      y => concat1_y_net
    );

  concat2: entity shift_logical_lib.concat_e6f5ee726b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0(0) => is_signed_in_net_x3,
      in1(0) => is_signed_in_net_x3,
      y => concat2_y_net
    );

  constant10: entity shift_logical_lib.constant_37567836aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant10_op_net
    );

  constant11: entity shift_logical_lib.constant_37567836aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant11_op_net
    );

  constant12: entity shift_logical_lib.constant_4792b807f2
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant12_op_net
    );

  constant13: entity shift_logical_lib.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant13_op_net
    );

  constant14: entity shift_logical_lib.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant14_op_net
    );

  constant2: entity shift_logical_lib.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant2_op_net
    );

  constant3: entity shift_logical_lib.constant_b213411135
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant3_op_net
    );

  constant4: entity shift_logical_lib.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant4_op_net
    );

  constant9: entity shift_logical_lib.constant_754435d9c5
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant9_op_net
    );

  constant_x0: entity shift_logical_lib.constant_b8cd06851c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  convert: entity shift_logical_lib.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 32,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 32,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x3,
      clk => clk_1_sg_x3,
      clr => '0',
      din => a_in_net_x2,
      en => "1",
      dout => convert_dout_net_x1
    );

  convert1: entity shift_logical_lib.xlconvert
    generic map (
      bool_conversion => 1,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x3,
      clk => clk_1_sg_x3,
      clr => '0',
      din(0) => w32_in_net_x2,
      en => "1",
      dout(0) => convert1_dout_net
    );

  convert2: entity shift_logical_lib.xlconvert
    generic map (
      bool_conversion => 1,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x3,
      clk => clk_1_sg_x3,
      clr => '0',
      din(0) => w32_in_net_x2,
      en => "1",
      dout(0) => convert2_dout_net
    );

  convert3: entity shift_logical_lib.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x3,
      clk => clk_1_sg_x3,
      clr => '0',
      din(0) => logical_y_net,
      en => "1",
      dout(0) => convert3_dout_net
    );

  convert4: entity shift_logical_lib.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x3,
      clk => clk_1_sg_x3,
      clr => '0',
      din(0) => logical1_y_net,
      en => "1",
      dout(0) => convert4_dout_net
    );

  inverter1: entity shift_logical_lib.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x3,
      clk => clk_1_sg_x3,
      clr => '0',
      ip(0) => convert1_dout_net,
      op(0) => inverter1_op_net
    );

  logical: entity shift_logical_lib.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => relational_op_net,
      d1(0) => convert2_dout_net,
      y(0) => logical_y_net
    );

  logical1: entity shift_logical_lib.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => relational2_op_net,
      d1(0) => inverter1_op_net,
      y(0) => logical1_y_net
    );

  logical2: entity shift_logical_lib.logical_aac1cbcdb3
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => concat_y_net,
      d1 => concat1_y_net,
      d2 => concat2_y_net,
      y => logical2_y_net
    );

  mux2: entity shift_logical_lib.mux_286b77e019
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => constant9_op_net,
      d1 => constant10_op_net,
      sel(0) => relational6_op_net_x0,
      y => mux2_y_net
    );

  mux3: entity shift_logical_lib.mux_286b77e019
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => constant12_op_net,
      d1 => constant11_op_net,
      sel(0) => relational6_op_net_x1,
      y => mux3_y_net
    );

  mux4: entity shift_logical_lib.mux_b70bd0a225
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => convert2_dout_net_x1,
      d1 => mux2_y_net,
      d2 => mux3_y_net,
      d3 => convert2_dout_net_x1,
      sel => logical2_y_net,
      y => mux4_y_net_x0
    );

  relational: entity shift_logical_lib.relational_8782e16b67
    port map (
      a => b_in_net_x1,
      b => constant_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

  relational1: entity shift_logical_lib.relational_ee3d1b14c5
    port map (
      a(0) => convert3_dout_net,
      b(0) => constant2_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

  relational2: entity shift_logical_lib.relational_8782e16b67
    port map (
      a => b_in_net_x1,
      b => constant3_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational2_op_net
    );

  relational3: entity shift_logical_lib.relational_ee3d1b14c5
    port map (
      a(0) => convert4_dout_net,
      b(0) => constant4_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational3_op_net
    );

  subsystem1_c5c3c0a483: entity shift_logical_lib.subsystem_entity_ed1fcae508
    port map (
      in1 => convert_dout_net_x1,
      in2 => is_signed_in_net_x3,
      out1 => relational6_op_net_x1
    );

  subsystem_ed1fcae508: entity shift_logical_lib.subsystem_entity_ed1fcae508
    port map (
      in1 => convert_dout_net_x1,
      in2 => is_signed_in_net_x3,
      out1 => relational6_op_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

-- Generated from Simulink block "shift_logical/Shift Logical"

entity shift_logical_entity_4c3eb91cc2 is
  port (
    a: in std_logic_vector(31 downto 0); 
    b: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    is_signed: in std_logic; 
    w32: in std_logic; 
    shift_left: out std_logic_vector(31 downto 0); 
    shift_right: out std_logic_vector(31 downto 0)
  );
end shift_logical_entity_4c3eb91cc2;

architecture structural of shift_logical_entity_4c3eb91cc2 is
  signal a_in_net_x3: std_logic_vector(31 downto 0);
  signal b_in_net_x2: std_logic_vector(31 downto 0);
  signal ce_1_sg_x4: std_logic;
  signal clk_1_sg_x4: std_logic;
  signal convert2_dout_net_x1: std_logic_vector(31 downto 0);
  signal is_signed_in_net_x4: std_logic;
  signal mux1_y_net_x1: std_logic_vector(31 downto 0);
  signal mux4_y_net_x1: std_logic_vector(31 downto 0);
  signal mux_y_net_x1: std_logic_vector(31 downto 0);
  signal slice_y_net_x1: std_logic_vector(4 downto 0);
  signal w32_in_net_x3: std_logic;

begin
  a_in_net_x3 <= a;
  b_in_net_x2 <= b;
  ce_1_sg_x4 <= ce_1;
  clk_1_sg_x4 <= clk_1;
  is_signed_in_net_x4 <= is_signed;
  w32_in_net_x3 <= w32;
  shift_left <= mux1_y_net_x1;
  shift_right <= mux4_y_net_x1;

  slice: entity shift_logical_lib.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 4,
      x_width => 32,
      y_width => 5
    )
    port map (
      x => b_in_net_x2,
      y => slice_y_net_x1
    );

  sll_e089338fd3: entity shift_logical_lib.sll_entity_e089338fd3
    port map (
      a => a_in_net_x3,
      ce_1 => ce_1_sg_x4,
      clk_1 => clk_1_sg_x4,
      sll_amt => slice_y_net_x1,
      sll_out => mux_y_net_x1
    );

  sll_select_6dbfcdd973: entity shift_logical_lib.sll_select_entity_6dbfcdd973
    port map (
      b => b_in_net_x2,
      ce_1 => ce_1_sg_x4,
      clk_1 => clk_1_sg_x4,
      sll_in => mux_y_net_x1,
      w32 => w32_in_net_x3,
      sll_out => mux1_y_net_x1
    );

  srl_d2c6b67a6e: entity shift_logical_lib.srl_entity_d2c6b67a6e
    port map (
      a => a_in_net_x3,
      ce_1 => ce_1_sg_x4,
      clk_1 => clk_1_sg_x4,
      is_signed => is_signed_in_net_x4,
      srl_amt => slice_y_net_x1,
      w32 => w32_in_net_x3,
      srl_out => convert2_dout_net_x1
    );

  srl_select_914f22079b: entity shift_logical_lib.srl_select_entity_914f22079b
    port map (
      a => a_in_net_x3,
      b => b_in_net_x2,
      ce_1 => ce_1_sg_x4,
      clk_1 => clk_1_sg_x4,
      is_signed => is_signed_in_net_x4,
      srl_in => convert2_dout_net_x1,
      w32 => w32_in_net_x3,
      srl_out => mux4_y_net_x1
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library shift_logical_lib;
use shift_logical_lib.conv_pkg.all;

-- Generated from Simulink block "shift_logical"

entity shift_logical is
  port (
    a_in: in std_logic_vector(31 downto 0); 
    b_in: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    is_signed_in: in std_logic; 
    w32_in: in std_logic; 
    sll_out: out std_logic_vector(31 downto 0); 
    srl_out: out std_logic_vector(31 downto 0)
  );
end shift_logical;

architecture structural of shift_logical is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "shift_logical,sysgen_core,{clock_period=3.33333333,clocking=Clock_Enables,compilation=NGC_Netlist,sample_periods=1.00000000000,testbench=0,total_blocks=183,xilinx_arithmetic_relational_operator_block=13,xilinx_binary_shift_operator_block=64,xilinx_bit_slice_extractor_block=1,xilinx_bus_concatenator_block=3,xilinx_bus_multiplexer_block=9,xilinx_constant_block_block=21,xilinx_gateway_in_block=4,xilinx_gateway_out_block=2,xilinx_inverter_block=2,xilinx_logical_block_block=9,xilinx_resource_estimator_block=1,xilinx_system_generator_block=1,xilinx_type_converter_block=12,}";

  signal a_in_net: std_logic_vector(31 downto 0);
  signal b_in_net: std_logic_vector(31 downto 0);
  signal ce_1_sg_x5: std_logic;
  signal clk_1_sg_x5: std_logic;
  signal is_signed_in_net: std_logic;
  signal sll_out_net: std_logic_vector(31 downto 0);
  signal srl_out_net: std_logic_vector(31 downto 0);
  signal w32_in_net: std_logic;

begin
  a_in_net <= a_in;
  b_in_net <= b_in;
  ce_1_sg_x5 <= ce_1;
  clk_1_sg_x5 <= clk_1;
  is_signed_in_net <= is_signed_in;
  w32_in_net <= w32_in;
  sll_out <= sll_out_net;
  srl_out <= srl_out_net;

  shift_logical_4c3eb91cc2: entity shift_logical_lib.shift_logical_entity_4c3eb91cc2
    port map (
      a => a_in_net,
      b => b_in_net,
      ce_1 => ce_1_sg_x5,
      clk_1 => clk_1_sg_x5,
      is_signed => is_signed_in_net,
      w32 => w32_in_net,
      shift_left => sll_out_net,
      shift_right => srl_out_net
    );

end structural;
