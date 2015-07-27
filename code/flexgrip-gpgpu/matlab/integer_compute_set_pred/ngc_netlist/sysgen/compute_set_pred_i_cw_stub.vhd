----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name: 
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity compute_set_pred_i_cw_stub is
    port (
      ce: in std_logic := '1'; 
      clk: in std_logic; -- clock period = 10.0 ns (100.0 Mhz)
      is_signed_in: in std_logic; 
      set_cond_in: in std_logic_vector(2 downto 0); 
      src_1_in: in std_logic_vector(31 downto 0); 
      src_2_in: in std_logic_vector(31 downto 0); 
      w32_in: in std_logic; 
      result_out: out std_logic_vector(31 downto 0); 
      sign_out: out std_logic; 
      zero_out: out std_logic
    );
end compute_set_pred_i_cw_stub;

architecture Behavioral of compute_set_pred_i_cw_stub is

  component compute_set_pred_i_cw
    port (
      ce: in std_logic := '1'; 
      clk: in std_logic; -- clock period = 10.0 ns (100.0 Mhz)
      is_signed_in: in std_logic; 
      set_cond_in: in std_logic_vector(2 downto 0); 
      src_1_in: in std_logic_vector(31 downto 0); 
      src_2_in: in std_logic_vector(31 downto 0); 
      w32_in: in std_logic; 
      result_out: out std_logic_vector(31 downto 0); 
      sign_out: out std_logic; 
      zero_out: out std_logic
    );
  end component;
begin

compute_set_pred_i_cw_i : compute_set_pred_i_cw
  port map (
    ce => ce,
    clk => clk,
    is_signed_in => is_signed_in,
    set_cond_in => set_cond_in,
    src_1_in => src_1_in,
    src_2_in => src_2_in,
    w32_in => w32_in,
    result_out => result_out,
    sign_out => sign_out,
    zero_out => zero_out);
end Behavioral;

