----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      warp_configuration - arch 
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

    entity warp_configuration is
        port (
            clk_in                      : in  std_logic;
            host_reset                  : in  std_logic;
         
            reg_num_warps_in            : in  std_logic_vector(4 downto 0);
            
            reg_num_warps_ld            : in  std_logic;
            
            reg_num_warps_out           : out std_logic_vector(4 downto 0)
        );
    end warp_configuration;

architecture arch of warp_configuration is
    
    component register_ld
        generic ( 
            width                       : integer := 4
        );
        port (
            clk                         : in std_logic;
            reset                       : in std_logic;
            D                           : in std_logic_vector(Width - 1 downto 0);
            Ld                          : in std_logic;
            Q                           : out std_logic_vector(Width - 1 downto 0)
        );
    end component;
    
begin

    uNumWarpsReg : register_ld
        generic map(
            width   => 5
        )	
        port map(
            clk     => clk_in,
            reset   => host_reset,
            Ld      => reg_num_warps_ld,
            D       => reg_num_warps_in,
            Q       => reg_num_warps_out
        );
        
end arch;

