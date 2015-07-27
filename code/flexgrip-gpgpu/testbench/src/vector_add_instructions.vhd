----------------------------------------------------------------------------------
-- Company: UNIVERSITY OF MASSACHUSETTS, AMHERST
-- Engineer: TEDY MAMMEN THOMAS
-- 
-- Create Date:    14:22:11 03/03/2014 
-- Design Name: 
-- Module Name:    new_application_instructions - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;  
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

    entity vector_add_instructions is
        port (
            instruction_pointer_in  : in integer;
            
            num_instructions_out    : out integer;
            instruction_out         : out std_logic_vector(31 downto 0)
        );
    end vector_add_instructions;

architecture arch of vector_add_instructions is

    constant NUM_NEW_APPLICATION_INSTRUCTIONS : integer := 100;
    
begin

    num_instructions_out    <= NUM_NEW_APPLICATION_INSTRUCTIONS;
    
    process(instruction_pointer_in)
    begin
        case instruction_pointer_in is
				when  0 => instruction_out <= x"10004205";
				when  1 => instruction_out <= x"0023c780";
				when  2 => instruction_out <= x"a0000005";
				when  3 => instruction_out <= x"04000780";
				when  4 => instruction_out <= x"60014c01";
				when  5 => instruction_out <= x"00204780";
				when  6 => instruction_out <= x"3000cffd";
				when  7 => instruction_out <= x"6c20c7c8";
				when  8 => instruction_out <= x"30000003";
				when  9 => instruction_out <= x"00000280";
				when  10 => instruction_out <= x"30020009";
				when  11 => instruction_out <= x"c4100780";
				when  12 => instruction_out <= x"2102e800";
				when  13 => instruction_out <= x"2102ea0c";
				when  14 => instruction_out <= x"d00e0005";
				when  15 => instruction_out <= x"80c00780";
				when  16 => instruction_out <= x"d00e0601";
				when  17 => instruction_out <= x"80c00780";
				when  18 => instruction_out <= x"b0000204";
				when  19 => instruction_out <= x"2102ec00";
				when  20 => instruction_out <= x"d00e0005";
				when  21 => instruction_out <= x"a0c00781";
			   when  22 => instruction_out <= x"10228001";
				when  23 => instruction_out <= x"00000003";
				when  24 => instruction_out <= x"c0008000";	
				when  25 => instruction_out <= x"e0008400";
				--when  25 => instruction_out <= x"00000000";
				--when  23 => instruction_out <= x"c0008000";	--///////////////****************
				--when  23 => instruction_out <= x"c000c180";	--///////////////****************
	         when  26 => instruction_out <= x"00000000";	--///////////////****************
				--when  25 => instruction_out <= x"00000000";	--///////////////****************
				--when  26 => instruction_out <= x"60000000";	--///////////////****************
				--when  27 => instruction_out <= x"60000000";	--///////////////****************
            when others => null;
        end case;
    end process;
    
end arch;