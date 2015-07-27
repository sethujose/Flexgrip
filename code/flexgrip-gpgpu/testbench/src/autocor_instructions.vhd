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

    entity autocor_instructions is
        port (
            instruction_pointer_in  : in integer;
            
            num_instructions_out    : out integer;
            instruction_out         : out std_logic_vector(31 downto 0)
        );
    end autocor_instructions;

architecture arch of autocor_instructions is

    constant AUTOCOR_INSTRUCTIONS : integer := 66;
    
begin

    num_instructions_out    <= AUTOCOR_INSTRUCTIONS;
    
    process(instruction_pointer_in)
    begin
        case instruction_pointer_in is
				when  0 => instruction_out <= x"10004205";
				when  1 => instruction_out <= x"0023c780";
				when  2 => instruction_out <= x"a0000005";
				when  3 => instruction_out <= x"04000780";
				when  4 => instruction_out <= x"60014c01";
				when  5 => instruction_out <= x"00204780";
				when  6 => instruction_out <= x"3000cdfd";
				when  7 => instruction_out <= x"6c20c7c8";
				when  8 => instruction_out <= x"30000003";
				when  9 => instruction_out <= x"00000280";
				when  10 => instruction_out <= x"2040cc05";
				when  11 => instruction_out <= x"04200780";
				when  12 => instruction_out <= x"307c03fd";
				when  13 => instruction_out <= x"6c00c7c8";
				when  14 => instruction_out <= x"a001b003";
				when  15 => instruction_out <= x"00000000";
				when  16 => instruction_out <= x"1001a003";
				when  17 => instruction_out <= x"00000280";
				when  18 => instruction_out <= x"3002000d";
				when  19 => instruction_out <= x"c4100780";
				when  20 => instruction_out <= x"10008004";
				when  21 => instruction_out <= x"1100e808";
				when  22 => instruction_out <= x"1000f815";
				when  23 => instruction_out <= x"0403c780";
				when  24 => instruction_out <= x"2000c819";
				when  25 => instruction_out <= x"0420c780";
				when  26 => instruction_out <= x"d00e040d";
				when  27 => instruction_out <= x"80c00780";
				when  28 => instruction_out <= x"d00e0c11";
				when  29 => instruction_out <= x"80c00780";
				when  30 => instruction_out <= x"40090c1d";
				when  31 => instruction_out <= x"00000780";
				when  32 => instruction_out <= x"60080e1d";
				when  33 => instruction_out <= x"0001c780";
				when  34 => instruction_out <= x"30100e1d";
				when  35 => instruction_out <= x"c4100780";
				when  36 => instruction_out <= x"20018205";
				when  37 => instruction_out <= x"00000003";
				when  38 => instruction_out <= x"60080c0d";
				when  39 => instruction_out <= x"0001c780";
				when  40 => instruction_out <= x"3001cdfd";
				when  41 => instruction_out <= x"6c2147c8";
				when  42 => instruction_out <= x"20000615";
				when  43 => instruction_out <= x"04014780";
				when  44 => instruction_out <= x"20048c19";
				when  45 => instruction_out <= x"00000003";
				when  46 => instruction_out <= x"20048409";
				when  47 => instruction_out <= x"00000003";
				when  48 => instruction_out <= x"1000d003";
				when  49 => instruction_out <= x"00000280";
				when  50 => instruction_out <= x"1001b003";
				when  51 => instruction_out <= x"00000780";
				when  52 => instruction_out <= x"1000f815";
				when  53 => instruction_out <= x"0403c780";
				when  54 => instruction_out <= x"f0000001";
				when  55 => instruction_out <= x"e0000002";
				when  56 => instruction_out <= x"861ffe03";
				when  57 => instruction_out <= x"00000000";
				when  58 => instruction_out <= x"30020001";
				when  59 => instruction_out <= x"c4100780";
				when  60 => instruction_out <= x"2000ca01";
				when  61 => instruction_out <= x"04200780";
				when  62 => instruction_out <= x"d00e0015";
				when  63 => instruction_out <= x"a0c00781";
                when  64 => instruction_out <= x"30000003"; 
                when  65 => instruction_out <= x"00000780";
            when others => null;
        end case;
    end process;
    
end arch;

