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

entity compute_set_pred_i_stub is
    port (
      ce_1: in std_logic; 
      clk_1: in std_logic; 
      is_signed_in: in std_logic; 
      set_cond_in: in std_logic_vector(2 downto 0); 
      src_1_in: in std_logic_vector(31 downto 0); 
      src_2_in: in std_logic_vector(31 downto 0); 
      w32_in: in std_logic; 
      result_out: out std_logic_vector(31 downto 0); 
      sign_out: out std_logic; 
      zero_out: out std_logic
    );
end compute_set_pred_i_stub;

architecture Behavioral of compute_set_pred_i_stub is

  component compute_set_pred_i
    port (
      ce_1: in std_logic; 
      clk_1: in std_logic; 
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

compute_set_pred_i_i : compute_set_pred_i
  port map (
    ce_1 => ce_1,
    clk_1 => clk_1,
    is_signed_in => is_signed_in,
    set_cond_in => set_cond_in,
    src_1_in => src_1_in,
    src_2_in => src_2_in,
    w32_in => w32_in,
    result_out => result_out,
    sign_out => sign_out,
    zero_out => zero_out);
end Behavioral;

