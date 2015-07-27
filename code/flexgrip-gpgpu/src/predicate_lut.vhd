----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      gpgpu_configuration - arch 
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
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.gpgpu_package.all;

    entity predicate_lut is
        port (
            clk_in              : in  std_logic;
            host_reset          : in  std_logic;
            
            pred_reg_lut_addr   : in  std_logic_vector(4 downto 0);
            pred_reg_lut_bit    : in  std_logic_vector(3 downto 0);
            pred_reg_lut_data   : out std_logic
        );
    end predicate_lut;

architecture arch of predicate_lut is

    type registers_type is array (31 downto 0) of std_logic_vector(0 to 15);
   
    signal pred_lut_regs                   : registers_type; 
    constant pred_regs_lut_default         : registers_type := 
            (--  31(1F)
            "1111111100000000","1111000011110000","1111010111110101","1100110011001100",  -- 28
            "0000000000000000","0000000000000000","0000000000000000","0000000000000000",  -- 24
            "0000000000000000","0000000000000000","0000000000000000","0000000000000000",  -- 20
            "0011001100110011","0000101000001010","0000111100001111","0000000011111111",  -- 16
            "1111111111111111","1101110100100010","1011101110111011","1001100100110011",  -- 12
            "0111011111011101","0101010101010101","0011001111001100","0001000100010001",  -- 8
            "1110111011101110","1100110000110011","1010101010101010","1000100000100010",  -- 4   
            "0110011011001100","0100010001000100","0010001011011101","0000000000000000"); -- 0
   
begin

    pRegisterRead: process (clk_in)
    begin
        if(rising_edge(clk_in)) then 
            if (host_reset = '1') then
                pred_reg_lut_data       <=  '0';
            else
                for i in 0 to 31 loop
                    if (pred_reg_lut_addr = std_logic_vector(to_unsigned(i,5))) then
                        for j in 0 to 15 loop
                            if (pred_reg_lut_bit = std_logic_vector(to_unsigned(j,4))) then
                                pred_reg_lut_data  <= pred_regs_lut_default(i)(j);
                            end if;
                        end loop;
                    end if;
                end loop;
            end if;
        end if; 
    end process;
    
end arch;

