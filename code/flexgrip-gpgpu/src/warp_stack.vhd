----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      stack - arch 
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

    entity warp_stack is
        generic (
            STACK_DEPTH     : integer := 256;
            DATA_WIDTH      : integer := 64
        );
        port (
            clk_in          : in std_logic;  --Clock for the stack.
            reset           : in std_logic;
            warp_lane       : in std_logic_vector(1 downto 0);
            stack_en        : in std_logic;  --Enable the stack. Otherwise neither push nor pop will happen.
            data_in         : in std_logic_vector(DATA_WIDTH-1 downto 0);  --Data to be pushed to stack
            data_out        : out std_logic_vector(DATA_WIDTH-1 downto 0);  --Data popped from the stack.
            push_en         : in std_logic;  --active low for POP and active high for PUSH.
            stack_full      : out std_logic;  --Goes high when the stack is full.
            stack_empty     : out std_logic  --Goes high when the stack is empty.
        );
    end warp_stack;

architecture arch of warp_stack is

    component stack
        generic (
            STACK_DEPTH     : integer := 256;
            DATA_WIDTH      : integer := 64
        );
        port (
            clk_in          : in std_logic;  --Clock for the stack.
            reset           : in std_logic;
            stack_en        : in std_logic;  --Enable the stack. Otherwise neither push nor pop will happen.
            data_in         : in std_logic_vector(DATA_WIDTH-1 downto 0);  --Data to be pushed to stack
            data_out        : out std_logic_vector(DATA_WIDTH-1 downto 0);  --Data popped from the stack.
            push_en         : in std_logic;  --active low for POP and active high for PUSH.
            stack_full      : out std_logic;  --Goes high when the stack is full.
            stack_empty     : out std_logic  --Goes high when the stack is empty.
        );
    end component;
    
begin

    warp_stack_0_en         <= stack_en when (warp_lane = "00") else '0';
    warp_stack_1_en         <= stack_en when (warp_lane = "01") else '0';
    warp_stack_2_en         <= stack_en when (warp_lane = "10") else '0';
    warp_stack_3_en         <= stack_en when (warp_lane = "11") else '0';
    
    warp_stack_0_data_i     <= data_in when (warp_lane = "00") else (others => '0');
    warp_stack_1_data_i     <= data_in when (warp_lane = "01") else (others => '0');
    warp_stack_2_data_i     <= data_in when (warp_lane = "10") else (others => '0');
    warp_stack_3_data_i     <= data_in when (warp_lane = "11") else (others => '0');
    
    warp_stack_0_push_en    <= push_en when (warp_lane = "00") else '0';
    warp_stack_1_push_en    <= push_en when (warp_lane = "01") else '0';
    warp_stack_2_push_en    <= push_en when (warp_lane = "10") else '0';
    warp_stack_3_push_en    <= push_en when (warp_lane = "11") else '0';
    
    uWarpStackLane0 : stack
        generic map (
            STACK_DEPTH     => 256,
            DATA_WIDTH      => 64
        )
        port map (
            clk_in          => clk_in,
            reset           => reset,
            stack_en        => warp_stack_0_en,
            data_in         => warp_stack_0_data_i,
            data_out        => warp_stack_0_data_o,
            push_en         => warp_stack_0_push_en,
            stack_full      => warp_stack_0_full,
            stack_empty     => warp_stack_0_empty
        );

    uWarpStackLane1 : stack
        generic map (
            STACK_DEPTH     => 256,
            DATA_WIDTH      => 64
        )
        port map (
            clk_in          => clk_in,
            reset           => reset,
            stack_en        => warp_stack_1_en,
            data_in         => warp_stack_1_data_i,
            data_out        => warp_stack_1_data_o,
            push_en         => warp_stack_1_push_en,
            stack_full      => warp_stack_1_full,
            stack_empty     => warp_stack_1_empty
        );

    uWarpStackLane2 : stack
        generic map (
            STACK_DEPTH     => 256,
            DATA_WIDTH      => 64
        )
        port map (
            clk_in          => clk_in,
            reset           => reset,
            stack_en        => warp_stack_2_en,
            data_in         => warp_stack_2_data_i,
            data_out        => warp_stack_2_data_o,
            push_en         => warp_stack_2_push_en,
            stack_full      => warp_stack_2_full,
            stack_empty     => warp_stack_2_empty
        );

    uWarpStackLane3 : stack
        generic map (
            STACK_DEPTH     => 256,
            DATA_WIDTH      => 64
        )
        port map (
            clk_in          => clk_in,
            reset           => reset,
            stack_en        => warp_stack_3_en,
            data_in         => warp_stack_3_data_i,
            data_out        => warp_stack_3_data_o,
            push_en         => warp_stack_3_push_en,
            stack_full      => warp_stack_3_full,
            stack_empty     => warp_stack_3_empty
        );
        
    data_out <=
        warp_stack_0_data_o     when (warp_lane = "00") else
        warp_stack_1_data_o     when (warp_lane = "01") else
        warp_stack_2_data_o     when (warp_lane = "10") else
        warp_stack_3_data_o;
   
    stack_full <=
        warp_stack_0_full       when (warp_lane = "00") else
        warp_stack_1_full       when (warp_lane = "01") else
        warp_stack_2_full       when (warp_lane = "10") else
        warp_stack_3_full;
    
    stack_empty <=
        warp_stack_0_empty      when (warp_lane = "00") else
        warp_stack_1_empty      when (warp_lane = "01") else
        warp_stack_2_empty      when (warp_lane = "10") else
        warp_stack_3_empty;
        
end arch;

