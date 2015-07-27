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

    entity bitonic_sort_instructions is
        port (
            instruction_pointer_in  : in integer;
            
            num_instructions_out    : out integer;
            instruction_out         : out std_logic_vector(31 downto 0)
        );
    end bitonic_sort_instructions;

architecture arch of bitonic_sort_instructions is

    constant NUM_BITONIC_SORT_INSTRUCTIONS : integer := 90;
    
begin

    num_instructions_out    <= NUM_BITONIC_SORT_INSTRUCTIONS;
    
    process(instruction_pointer_in)
    begin
        case instruction_pointer_in is

            when  0 => instruction_out <= x"a000000d";
            when  1 => instruction_out <= x"04000780";
            when  2 => instruction_out <= x"30020601";
            when  3 => instruction_out <= x"c4100780";
            when  4 => instruction_out <= x"2000c809";
            when  5 => instruction_out <= x"04200780";
            when  6 => instruction_out <= x"00020605";
            when  7 => instruction_out <= x"c0000780";
				when  8 => instruction_out <= x"d00e0401";
            when  9 => instruction_out <= x"80c00780";
            when 10 => instruction_out <= x"04001001";
            when 11 => instruction_out <= x"e4200780";
            when 12 => instruction_out <= x"861ffe03";
            when 13 => instruction_out <= x"00000000";
            when 14 => instruction_out <= x"10028011";
            when 15 => instruction_out <= x"00000003";
            when 16 => instruction_out <= x"30010815";
            when 17 => instruction_out <= x"e41007c0";
            when 18 => instruction_out <= x"10026003";
            when 19 => instruction_out <= x"00000100";   
            when 20 => instruction_out <= x"d0030a01";
            when 21 => instruction_out <= x"04008780";
            when 22 => instruction_out <= x"300301fd";
            when 23 => instruction_out <= x"6400c7c8";             
            when 24 => instruction_out <= x"00020005";
            when 25 => instruction_out <= x"c0000780";
            when 26 => instruction_out <= x"a0022003";
            when 27 => instruction_out <= x"00000000";
            when 28 => instruction_out <= x"10022003";
            when 29 => instruction_out <= x"00000280";
            when 30 => instruction_out <= x"d00309fd"; 
            when 31 => instruction_out <= x"040007c8"; 
            when 32 => instruction_out <= x"1001a003"; 
            when 33 => instruction_out <= x"00000280"; 
            when 34 => instruction_out <= x"00020609"; 
            when 35 => instruction_out <= x"c0000780"; 
            when 36 => instruction_out <= x"1400d001"; 
            when 37 => instruction_out <= x"0423c780";
            when 38 => instruction_out <= x"3800d1fd"; 
            when 39 => instruction_out <= x"6c20c7c8"; 
            when 40 => instruction_out <= x"10022003"; 
            when 41 => instruction_out <= x"00000280";  
            when 42 => instruction_out <= x"00020609";  
            when 43 => instruction_out <= x"c0000780"; 
            when 44 => instruction_out <= x"1500f004"; 
            when 45 => instruction_out <= x"1900f000"; 
            when 46 => instruction_out <= x"08001001"; 
            when 47 => instruction_out <= x"e4204780"; 
            when 48 => instruction_out <= x"04001001"; 
            when 49 => instruction_out <= x"e4200780"; 
            when 50 => instruction_out <= x"10022003"; 
            when 51 => instruction_out <= x"00000780"; 
            when 52 => instruction_out <= x"00020609"; 
            when 53 => instruction_out <= x"c0000780"; 
            when 54 => instruction_out <= x"1400d001"; 
            when 55 => instruction_out <= x"0423c780"; 
            when 56 => instruction_out <= x"3800d1fd"; 
            when 57 => instruction_out <= x"6c2187c8"; 
            when 58 => instruction_out <= x"00020609"; 
            when 59 => instruction_out <= x"c0000500"; 
            when 60 => instruction_out <= x"1400d005"; 
            when 61 => instruction_out <= x"0423c500"; 
            when 62 => instruction_out <= x"1800d001"; 
            when 63 => instruction_out <= x"0423c500"; 
            when 64 => instruction_out <= x"08001001"; 
            when 65 => instruction_out <= x"e4204500"; 
            when 66 => instruction_out <= x"04001001"; 
            when 67 => instruction_out <= x"e4200500"; 
            when 68 => instruction_out <= x"f0000001";  
            when 69 => instruction_out <= x"e0000002"; 
            when 70 => instruction_out <= x"861ffe03"; 
            when 71 => instruction_out <= x"00000000"; 
            when 72 => instruction_out <= x"30010a15"; 
            when 73 => instruction_out <= x"e41007c0"; 
            when 74 => instruction_out <= x"1000a003"; 
            when 75 => instruction_out <= x"00000280"; 
            when 76 => instruction_out <= x"30010811"; 
            when 77 => instruction_out <= x"c4100780"; 
            when 78 => instruction_out <= x"308109fd"; 
            when 79 => instruction_out <= x"6440c7c8"; 
            when 80 => instruction_out <= x"10008003"; 
            when 81 => instruction_out <= x"00000280"; 
            when 82 => instruction_out <= x"00020605"; 
            when 83 => instruction_out <= x"c0000780"; 
            when 84 => instruction_out <= x"1400d001"; 
            when 85 => instruction_out <= x"0423c780"; 
            when 86 => instruction_out <= x"d00e0401"; 
            when 87 => instruction_out <= x"a0c00781"; 
            when 88 => instruction_out <= x"30000003"; 
            when 89 => instruction_out <= x"00000780";
            when others => null;
        end case;
    end process;
    
end arch;

