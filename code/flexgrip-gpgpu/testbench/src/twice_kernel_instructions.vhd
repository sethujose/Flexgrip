-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      twice_kernel_instructions - arch 
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

    entity twice_kernel_instructions is
        port (
            instruction_pointer_in  : in integer;
            
            num_instructions_out    : out integer;
            instruction_out         : out std_logic_vector(31 downto 0)
        );
    end twice_kernel_instructions;

architecture arch of twice_kernel_instructions is

    constant NUM_TWICE_KERNEL_INSTRUCTIONS : integer := 20;
    
begin

    num_instructions_out    <= NUM_TWICE_KERNEL_INSTRUCTIONS;
    
    process(instruction_pointer_in)
    begin
        case instruction_pointer_in is
--            when  0 => instruction_out <= x"10004205"; --incorrectly decoded MOV instruction
--            when  1 => instruction_out <= x"0023c780";
--				when  2 => instruction_out <= x"a0000005";
--				when  3 => instruction_out <= x"04000780";
--            when  4 => instruction_out <= x"60014c01";
--            when  5 => instruction_out <= x"00204780";
--            when  6 => instruction_out <= x"3000cdfd";
--            when  7 => instruction_out <= x"6c20c7c8";
--            when  8 => instruction_out <= x"30000003";
--            when  9 => instruction_out <= x"00000280";
--				when 10 => instruction_out <= x"30020001";
--            when 11 => instruction_out <= x"c4100780";
--            when 12 => instruction_out <= x"2000c805";
--            when 13 => instruction_out <= x"04200780";
--            when 14 => instruction_out <= x"d00e0201";
--            when 15 => instruction_out <= x"80c00780";
--            when 16 => instruction_out <= x"30010001";
--            when 17 => instruction_out <= x"c4100780";
--            when 18 => instruction_out <= x"d00e0001";
--            when 19 => instruction_out <= x"a0c00781";
--            when others => null;
				when  0 => instruction_out <= x"a0000005";
				when  1 => instruction_out <= x"04000780";
            when  2 => instruction_out <= x"60014c01";
            when  3 => instruction_out <= x"00204780";
            when  4 => instruction_out <= x"3000cdfd";
            when  5 => instruction_out <= x"6c20c7c8";
            when  6 => instruction_out <= x"30000003";
            when  7 => instruction_out <= x"00000280";
				when  8 => instruction_out <= x"30020001";
            when  9 => instruction_out <= x"c4100780";
            when 10 => instruction_out <= x"2000c805";
            when 11 => instruction_out <= x"04200780";
            when 12 => instruction_out <= x"d00e0201";
            when 13 => instruction_out <= x"80c00780";
            when 14 => instruction_out <= x"30010001";
            when 15 => instruction_out <= x"c4100780";
            when 16 => instruction_out <= x"d00e0001";
            when 17 => instruction_out <= x"a0c00781";
            when others => null;
        end case;
    end process;
    
end arch;

