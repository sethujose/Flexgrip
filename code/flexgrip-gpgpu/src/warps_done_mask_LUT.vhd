----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Murtaza Merchant
-- 
-- Create Date:      08/28/2012  
-- Module Name:      warps_donw_mask_LUT - arch 
-- Project Name:     GPGPU
-- Target Devices: 
-- Tool versions:    ISE 14.1
-- Description: 
--
----------------------------------------------------------------------------
-- Revisions:       
--  REV:        Date:           Description:
--  0.1.a       08/28/2012       Created Top level file 
----------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;  
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.gpgpu_package.all;

    entity warps_done_lut is
        port (
            clk_in              : in  std_logic;
            host_reset          : in  std_logic;
            
            num_warps_in        : in  std_logic_vector(4 downto 0);
            warps_done_mask     : out std_logic_vector (MAX_WARPS-1 downto 0)
        );
    end warps_done_lut;

architecture arch of warps_done_lut is

    type registers_type is array (MAX_WARPS downto 0) of std_logic_vector(MAX_WARPS-1 downto 0);
    constant warps_done_lut_default   : registers_type := 
            (
				x"FFFFFF",  									   -- 24
            x"7FFFFF",x"3FFFFF",x"1FFFFF",x"0FFFFF",  -- 20
            x"07FFFF",x"03FFFF",x"01FFFF",x"00FFFF",  -- 16
            x"007FFF",x"003FFF",x"001FFF",x"000FFF",  -- 12
            x"0007FF",x"0003FF",x"0001FF",x"0000FF",  -- 8
            x"00007F",x"00003F",x"00001F",x"00000F",  -- 4   
            x"000007",x"000003",x"000001",x"000000"); -- 0
   
begin

    pRegisterRead: process (clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (host_reset = '1') then
                warps_done_mask             <=  (others => '0');
            else
                for i in 0 to 24 loop
                    if (num_warps_in = std_logic_vector(to_unsigned(i,5))) then
                        warps_done_mask     <= warps_done_lut_default(i);
                    end if;
                end loop;
            end if;
        end if; 
    end process;
    
end arch;

