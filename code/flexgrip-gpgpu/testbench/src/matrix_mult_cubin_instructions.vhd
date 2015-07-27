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

    entity matrix_mult_cubin_instructions is
        port (
            instruction_pointer_in  : in integer;
            
            num_instructions_out    : out integer;
            instruction_out         : out std_logic_vector(31 downto 0)
        );
    end matrix_mult_cubin_instructions;

architecture arch of matrix_mult_cubin_instructions is

    constant NUM_MATRX_MUL_INSTRUCTIONS : integer := 100;
    
begin

    num_instructions_out    <= NUM_MATRX_MUL_INSTRUCTIONS;
    
    process(instruction_pointer_in)
    begin
        case instruction_pointer_in is
				when  0 => instruction_out <= x"d0810205";
				when  1 => instruction_out <= x"00400780";
				when  2 => instruction_out <= x"307cd5fd";
				when  3 => instruction_out <= x"6c20c7c8";
                when  4 => instruction_out <= x"1000f809";
                when  5 => instruction_out <= x"0403c780";
				when  6 => instruction_out <= x"a000000d";
				when  7 => instruction_out <= x"04000780";
				when  8 => instruction_out <= x"a0000205";
				when  9 => instruction_out <= x"04000780";
				when  10 => instruction_out <= x"10023003";
				when  11 => instruction_out <= x"00000280";
				when  12 => instruction_out <= x"10004e01";
				when  13 => instruction_out <= x"0023c780";
				when  14 => instruction_out <= x"60004405";
				when  15 => instruction_out <= x"00204780";
				when  16 => instruction_out <= x"1000d401";
				when  17 => instruction_out <= x"0423c780";
				when  18 => instruction_out <= x"40030011";
				when  19 => instruction_out <= x"00000780";
				when  20 => instruction_out <= x"60020211";
				when  21 => instruction_out <= x"00010780";
				when  22 => instruction_out <= x"10004c05";
				when  23 => instruction_out <= x"0023c780";
				when  24 => instruction_out <= x"30100811";
				when  25 => instruction_out <= x"c4100780";
				when  26 => instruction_out <= x"60014215";
				when  27 => instruction_out <= x"0020c780";
				when  28 => instruction_out <= x"60020005";
				when  29 => instruction_out <= x"00010780";
                when  30 => instruction_out <= x"30020a01";
                when  31 => instruction_out <= x"c4100780";
				when  32 => instruction_out <= x"a0021003";
				when  33 => instruction_out <= x"00000000";
				when  34 => instruction_out <= x"3002d419";
				when  35 => instruction_out <= x"c4300780";
				when  36 => instruction_out <= x"3002020d";
				when  37 => instruction_out <= x"c4100780";
				when  38 => instruction_out <= x"2100ec1c";
				when  39 => instruction_out <= x"10008200";
				when  40 => instruction_out <= x"2101f420";
				when  41 => instruction_out <= x"2103e824";
				when  42 => instruction_out <= x"d00e120d";
				when  43 => instruction_out <= x"80c00780";
				when  44 => instruction_out <= x"d00e0e11";
				when  45 => instruction_out <= x"80c00780";
				when  46 => instruction_out <= x"40090c29";
				when  47 => instruction_out <= x"00000780";
				when  48 => instruction_out <= x"60080e29";
				when  49 => instruction_out <= x"00028780";
				when  50 => instruction_out <= x"30101429";
				when  51 => instruction_out <= x"c4100780";
				when  52 => instruction_out <= x"20018205";
				when  53 => instruction_out <= x"00000003";
				when  54 => instruction_out <= x"60080c0d";
				when  55 => instruction_out <= x"00028780";
				when  56 => instruction_out <= x"300803fd";
				when  57 => instruction_out <= x"6c0147c8";
				when  58 => instruction_out <= x"20000609";
				when  59 => instruction_out <= x"04008780";
				when  60 => instruction_out <= x"20049225";
				when  61 => instruction_out <= x"00000003";
				when  62 => instruction_out <= x"20000c1d";
				when  63 => instruction_out <= x"0401c780";
				when  64 => instruction_out <= x"10015003";
				when  65 => instruction_out <= x"00000280";
				when  66 => instruction_out <= x"f0000001";
				when  67 => instruction_out <= x"e0000002";
				when  68 => instruction_out <= x"1002c003";
				when  69 => instruction_out <= x"00000780";
				when  70 => instruction_out <= x"10004e01";
				when  71 => instruction_out <= x"0023c780";
				when  72 => instruction_out <= x"60004411";
				when  73 => instruction_out <= x"00204780";
				when  74 => instruction_out <= x"1000d401";
				when  75 => instruction_out <= x"0423c780";
				when  76 => instruction_out <= x"40090005";
				when  77 => instruction_out <= x"00000780";
				when  78 => instruction_out <= x"60080205";
				when  79 => instruction_out <= x"00004780";
				when  80 => instruction_out <= x"30100215";
				when  81 => instruction_out <= x"c4100780";
				when  82 => instruction_out <= x"10004c09";
				when  83 => instruction_out <= x"0023c780";
				when  84 => instruction_out <= x"60080001";
				when  85 => instruction_out <= x"00014780";
				when  86 => instruction_out <= x"60024215";
				when  87 => instruction_out <= x"0020c780";
				when  88 => instruction_out <= x"20000001";
				when  89 => instruction_out <= x"04014780";
				when  90 => instruction_out <= x"30020001";
				when  91 => instruction_out <= x"c4100780";
				when  92 => instruction_out <= x"2000d001";
				when  93 => instruction_out <= x"04200780";
				when  94 => instruction_out <= x"d00e0009";
				when  95 => instruction_out <= x"a0c00781";
                when  98 => instruction_out <= x"30000003"; 
                when  99 => instruction_out <= x"00000780";
            when others => null;
        end case;
    end process;
    
end arch;

