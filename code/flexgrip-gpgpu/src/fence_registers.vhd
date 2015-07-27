----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      fence_registers - arch 
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

    entity fence_registers is
        port (
            clk_in                  : in  std_logic;
            host_reset              : in  std_logic;
            
            cta_id_in               : in  std_logic_vector(3 downto 0);
            cta_id_ld               : in  std_logic;
            
            fence_en_in             : in  std_logic;
            fence_en_ld             : in  std_logic;
            
            cta_id_out              : out std_logic_vector(3 downto 0);
            fence_en_out            : out std_logic
        );
    end fence_registers;

architecture arch of fence_registers is

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
    
    signal fence_en_i                   : std_logic_vector(0 downto 0);
    signal fence_en_o                   : std_logic_vector(0 downto 0);
    
begin

    uRegisterCTA: register_ld
        generic map(
            width   => 4
        )	
        port map(
            clk     => clk_in,
            reset   => host_reset,
            Ld      => cta_id_ld,
            D       => cta_id_in,
            Q       => cta_id_out
        );
    
    fence_en_i(0)  <= fence_en_in;
    
    uRegisterFence: register_ld
        generic map(
            width   => 1
        )	
        port map(
            clk     => clk_in,
            reset   => host_reset,
            Ld      => fence_en_ld,
            D       => fence_en_i,
            Q       => fence_en_o
        );
    
    fence_en_out    <= fence_en_o(0);
    
end arch;

