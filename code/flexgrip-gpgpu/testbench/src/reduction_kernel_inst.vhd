-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      matrix_mult_instructions - arch 
-- Project Name:     GPGPU
-- Target Devices: 
-- Tool versions:    ISE 13.3
-- Description: 

----------------------------------------------------------------------------
-- Revisions:       
--  REV:        Date:           Description:
--  0.1.a       9/13/2010       Created Top level file 
----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;  
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

    entity reduction_instructions is
        port (
            instruction_pointer_in  : in integer;
            
            num_instructions_out    : out integer;
            instruction_out         : out std_logic_vector(31 downto 0)
        );
    end reduction_instructions;

architecture arch of reduction_instructions is

    constant NUM_REDUCTION_INSTRUCTIONS : integer := 66;
    
begin

    num_instructions_out    <= NUM_REDUCTION_INSTRUCTIONS;
    
    process(instruction_pointer_in)
    begin
        case instruction_pointer_in is
            when  0 => instruction_out <= x"a0004209";
            when  1 => instruction_out <= x"04200780";
            when  2 => instruction_out <= x"a0004c05";
            when  3 => instruction_out <= x"04200780";
            when  4 => instruction_out <= x"40040411";
            when  5 => instruction_out <= x"00000780";
            when  6 => instruction_out <= x"a000000d";
            when  7 => instruction_out <= x"04000780";
				when  8 => instruction_out <= x"30010801";
            when  9 => instruction_out <= x"c4100780";
            when 10 => instruction_out <= x"20008600";
            when 11 => instruction_out <= x"20008410";
            when 12 => instruction_out <= x"30020001";
            when 13 => instruction_out <= x"c4100780";
            when 14 => instruction_out <= x"30020811";
            when 15 => instruction_out <= x"c4100780";
            when 16 => instruction_out <= x"2100e800";
            when 17 => instruction_out <= x"2104e814";
            when 18 => instruction_out <= x"d00e0011";
            when 19 => instruction_out <= x"80c00780";  
            when 20 => instruction_out <= x"d00e0a01";
            when 21 => instruction_out <= x"80c00780";
            when 22 => instruction_out <= x"20000801";
            when 23 => instruction_out <= x"04000780";             
            when 24 => instruction_out <= x"00020605";
            when 25 => instruction_out <= x"c0000780";
            when 26 => instruction_out <= x"04001001";
            when 27 => instruction_out <= x"e4200780";
            when 28 => instruction_out <= x"861ffe03";
            when 29 => instruction_out <= x"00000000";
            when 30 => instruction_out <= x"30010409"; 
            when 31 => instruction_out <= x"e41007c0"; 
            when 32 => instruction_out <= x"1001b003"; 
            when 33 => instruction_out <= x"00000100"; 
            when 34 => instruction_out <= x"300305fd"; 
            when 35 => instruction_out <= x"6400c7c8"; 
            when 36 => instruction_out <= x"20000601"; 
            when 37 => instruction_out <= x"04008500"; 
            when 38 => instruction_out <= x"00020009"; 
            when 39 => instruction_out <= x"c0000500"; 
            when 40 => instruction_out <= x"00020605"; 
            when 41 => instruction_out <= x"c0000500"; 
            when 42 => instruction_out <= x"1800d001"; 
            when 43 => instruction_out <= x"0423c500"; 
            when 44 => instruction_out <= x"2400d001"; 
            when 45 => instruction_out <= x"04200500"; 
            when 46 => instruction_out <= x"04001001"; 
            when 47 => instruction_out <= x"e4200500"; 
            when 48 => instruction_out <= x"861ffe03"; 
            when 49 => instruction_out <= x"00000000"; 
            when 50 => instruction_out <= x"30010409"; 
            when 51 => instruction_out <= x"e41007c0"; 
            when 52 => instruction_out <= x"10011003"; 
            when 53 => instruction_out <= x"00000280"; 
            when 54 => instruction_out <= x"307c07fd"; 
            when 55 => instruction_out <= x"640147c8"; 
            when 56 => instruction_out <= x"30000003"; 
            when 57 => instruction_out <= x"00000280"; 
            when 58 => instruction_out <= x"30020205"; 
            when 59 => instruction_out <= x"c4100780"; 
            when 60 => instruction_out <= x"1100f000"; 
            when 61 => instruction_out <= x"2101ea04"; 
            when 62 => instruction_out <= x"d00e0201"; 
            when 63 => instruction_out <= x"a0c00781";
            when 64 => instruction_out <= x"30000003"; 
            when 65 => instruction_out <= x"00000780";
            when others => null;
        end case;
    end process;
    
end arch;

