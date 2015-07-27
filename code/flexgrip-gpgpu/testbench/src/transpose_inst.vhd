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

    entity transpose_instructions is
        port (
            instruction_pointer_in  : in integer;
            
            num_instructions_out    : out integer;
            instruction_out         : out std_logic_vector(31 downto 0)
        );
    end transpose_instructions;

architecture arch of transpose_instructions is

    constant NUM_TRANSPOSE_INSTRUCTIONS : integer := 96;
    
begin

    num_instructions_out    <= NUM_TRANSPOSE_INSTRUCTIONS;
    
    process(instruction_pointer_in)
    begin
        case instruction_pointer_in is
				when  0 => instruction_out <= x"10000005";
				when  1 => instruction_out <= x"0403c780";
				when  2 => instruction_out <= x"d0820601";
				when  3 => instruction_out <= x"00400780";
				when  4 => instruction_out <= x"a000000d";
				when  5 => instruction_out <= x"04000780";
				when  6 => instruction_out <= x"1000cc01";
				when  7 => instruction_out <= x"0423c780";
				when  8 => instruction_out <= x"a0000409";
				when  9 => instruction_out <= x"04000780";
				when  10 => instruction_out <= x"60814e05";
				when  11 => instruction_out <= x"0060c780";
				when  12 => instruction_out <= x"61202c09";
				when  13 => instruction_out <= x"00000003";
				when  14 => instruction_out <= x"40030010";
				when  15 => instruction_out <= x"4005000c";
				when  16 => instruction_out <= x"60020211";
				when  17 => instruction_out <= x"00010780";
				when  18 => instruction_out <= x"6004020d";
				when  19 => instruction_out <= x"0000c780";
				when  20 => instruction_out <= x"30100811";
				when  21 => instruction_out <= x"c4100780";
				when  22 => instruction_out <= x"3010060d";
				when  23 => instruction_out <= x"c4100780";
				when  24 => instruction_out <= x"60020011";
				when  25 => instruction_out <= x"00010780";
				when  26 => instruction_out <= x"6004000d";
				when  27 => instruction_out <= x"0000c780";
				when  28 => instruction_out <= x"20048400";
				when  29 => instruction_out <= x"20018604";
				when  30 => instruction_out <= x"3002000d";
				when  31 => instruction_out <= x"c4100780";
				when  32 => instruction_out <= x"30020209";
				when  33 => instruction_out <= x"c4100780";
				when  34 => instruction_out <= x"2000c80d";
				when  35 => instruction_out <= x"0420c780";
				when  36 => instruction_out <= x"d00e060d";
				when  37 => instruction_out <= x"80c00780";
				when  38 => instruction_out <= x"2000ca11";
				when  39 => instruction_out <= x"04208780";
				when  40 => instruction_out <= x"3003cc09";
				when  41 => instruction_out <= x"c4300780";
				when  42 => instruction_out <= x"20000019";
				when  43 => instruction_out <= x"04008780";
				when  44 => instruction_out <= x"20088215";
				when  45 => instruction_out <= x"00000003";
				when  46 => instruction_out <= x"30020c19";
				when  47 => instruction_out <= x"c4100780";
				when  48 => instruction_out <= x"d00e080d";
				when  49 => instruction_out <= x"a0c00780";
				when  50 => instruction_out <= x"30020a11";
				when  51 => instruction_out <= x"c4100780";
				when  52 => instruction_out <= x"2000c80d";
				when  53 => instruction_out <= x"04218780";
				when  54 => instruction_out <= x"d00e060d";
				when  55 => instruction_out <= x"80c00780";
				when  56 => instruction_out <= x"2000ca11";
				when  57 => instruction_out <= x"04210780";
				when  58 => instruction_out <= x"3004cc19";
				when  59 => instruction_out <= x"c4300780";
				when  60 => instruction_out <= x"2000001d";
				when  61 => instruction_out <= x"04018780";
				when  62 => instruction_out <= x"20108215";
				when  63 => instruction_out <= x"00000003";
				when  64 => instruction_out <= x"30020e1d";
				when  65 => instruction_out <= x"c4100780";
				when  66 => instruction_out <= x"d00e080d";
				when  67 => instruction_out <= x"a0c00780";
				when  68 => instruction_out <= x"20000411";
				when  69 => instruction_out <= x"04018780";
				when  70 => instruction_out <= x"30020a0d";
				when  71 => instruction_out <= x"c4100780";
				when  72 => instruction_out <= x"2000c809";
				when  73 => instruction_out <= x"0421c780";
				when  74 => instruction_out <= x"d00e0409";
				when  75 => instruction_out <= x"80c00780";
				when  76 => instruction_out <= x"20048010";
				when  77 => instruction_out <= x"2103ea00";
				when  78 => instruction_out <= x"20188205";
				when  79 => instruction_out <= x"00000003";
				when  80 => instruction_out <= x"3002080d";
				when  81 => instruction_out <= x"c4100780";
				when  82 => instruction_out <= x"d00e0009";
				when  83 => instruction_out <= x"a0c00780";
				when  84 => instruction_out <= x"30020205";
				when  85 => instruction_out <= x"c4100780";
				when  86 => instruction_out <= x"2000c801";
				when  87 => instruction_out <= x"0420c780";
				when  88 => instruction_out <= x"d00e0001";
				when  89 => instruction_out <= x"80c00780";
				when  90 => instruction_out <= x"2000ca05";
				when  91 => instruction_out <= x"04204780";
				when  92 => instruction_out <= x"d00e0201";
				when  93 => instruction_out <= x"a0c00781";
            when  94 => instruction_out <= x"30000003"; 
            when  95 => instruction_out <= x"00000780";
            when others => null;
        end case;
    end process;
    
end arch;


