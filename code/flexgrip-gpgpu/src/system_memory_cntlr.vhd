----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      system_memory_cntlr - arch 
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

use work.gpgpu_package.all;

    entity system_memory_cntlr is
        port (
            clk_in_a                : in  std_logic;
			mem_data_in_a	        : in std_logic_vector(7 downto 0);
			mem_addr_in_a			: in std_logic_vector(8 downto 0);
			mem_wr_en_a				: in std_logic_vector(0 downto 0);
			mem_data_out_a			: out std_logic_vector(7 downto 0);
            
            clk_in_b                : in  std_logic;
			mem_data_in_b			: in std_logic_vector(7 downto 0);
			mem_addr_in_b			: in std_logic_vector(8 downto 0);
			mem_wr_en_b				: in std_logic_vector(0 downto 0);
			mem_data_out_b			: out std_logic_vector(7 downto 0)
		);
	end system_memory_cntlr;

architecture arch of system_memory_cntlr is

--    component dp_ram_8x32768
--        port (
--            clka            : in std_logic;
--            dina            : in std_logic_vector(7 downto 0);
--            addra           : in std_logic_vector(14 downto 0);
--            wea             : in std_logic_vector(0 downto 0);
--            douta           : out std_logic_vector(7 downto 0);
--            clkb            : in std_logic;
--            dinb            : in std_logic_vector(7 downto 0);
--            addrb           : in std_logic_vector(14 downto 0);
--            web             : in std_logic_vector(0 downto 0);
--            doutb           : out std_logic_vector(7 downto 0)
--        );
--    end component;

    component dp_ram_8x512
        port (
            clka            : in std_logic;
            dina            : in std_logic_vector(7 downto 0);
            addra           : in std_logic_vector(8 downto 0);
            wea             : in std_logic_vector(0 downto 0);
            douta           : out std_logic_vector(7 downto 0);
            clkb            : in std_logic;
            dinb            : in std_logic_vector(7 downto 0);
            addrb           : in std_logic_vector(8 downto 0);
            web             : in std_logic_vector(0 downto 0);
            doutb           : out std_logic_vector(7 downto 0)
        );
    end component;

begin

--	uSystemMemory : dp_ram_8x32768
--		port map (
--			clka 			=> clk_in,
--			dina 			=> mem_data_in_a,
--			addra 		=> mem_addr_in_a,
--			wea 			=> mem_wr_en_a,
--			douta 		=> mem_data_out_a,
--			clkb 			=> clk_in,
--			dinb 			=> mem_data_in_b,
--			addrb 		=> mem_addr_in_b,
--			web 			=> mem_wr_en_b,
--			doutb 		=> mem_data_out_b
--		);

	uSystemMemory : dp_ram_8x512
		port map (
			clka 			=> clk_in_a,
			dina 			=> mem_data_in_a,
			addra 		    => mem_addr_in_a,
			wea 			=> mem_wr_en_a,
			douta 		    => mem_data_out_a,
			clkb 			=> clk_in_b,
			dinb 			=> mem_data_in_b,
			addrb 		    => mem_addr_in_b,
			web 			=> mem_wr_en_b,
			doutb 		    => mem_data_out_b
		);

end arch;

