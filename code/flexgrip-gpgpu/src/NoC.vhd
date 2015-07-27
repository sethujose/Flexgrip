----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:26:28 04/07/2015 
-- Design Name: 
-- Module Name:    NoC - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
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

entity NoC is
port (
req : in std_logic;
ack : out std_logic;
clk : in  std_logic;
read_en : out std_logic;
write_en_noc : out std_logic_vector (0 downto 0);
write_add: out std_logic_vector(2 downto 0);
valid : in std_logic;
fifo_data_in: in std_logic_vector(31 downto 0);
fifo_data_out: out std_logic_vector(31 downto 0)
);
end NoC;

architecture Behavioral of NoC is

type read_state_type is (IDLE, READ_WAIT, READ_ENB, WRITE_EN, WRITE_WAIT);
signal read_state_machine   : read_state_type := IDLE;
signal ack_i : std_logic := '0';
signal req_i : std_logic;
signal read_en_i : std_logic:='0';
signal valid_i : std_logic;
signal fifo_data_out_i: std_logic_vector(31 downto 0);
signal write_en_noc_i : std_logic_vector (0 downto 0);
signal write_add_i: std_logic_vector(2 downto 0);
begin

ack <= ack_i;
req_i <= req;
read_en <= read_en_i;
valid_i <= valid;

write_en_noc <= write_en_noc_i;
write_add <= write_add_i;

readFifo: process(clk)
variable a: integer := 0;
begin
if(rising_edge(clk)) then
case read_state_machine is
when IDLE =>
write_en_noc_i <= "0";
read_en_i <= '0';
if(req_i = '1') then
read_state_machine <= READ_ENB;
end if;

when READ_ENB =>
read_en_i <= '1';
read_state_machine <= READ_WAIT;

when READ_WAIT =>
if( valid_i = '1') then
fifo_data_out_i <= fifo_data_in;
read_state_machine <= WRITE_EN;
end if;

when WRITE_EN =>
read_en_i <= '0';

fifo_data_out <= x"0" & fifo_data_out_i(31 downto 4);
write_add_i <=  fifo_data_out_i(2 downto 0);
write_en_noc_i <= "1";
read_state_machine <= IDLE;

when others =>
read_state_machine <= IDLE;

end case;
end if;
end process;
end Behavioral;

