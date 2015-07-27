----------------------------------------------------------------------------------
-- Company:          Univerity of Massachusetts 
-- Engineer:         Kevin Andryc
-- 
-- Create Date:      17:50:27 09/19/2010  
-- Module Name:      memory_controller - arch 
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
use IEEE.std_logic_unsigned.all ;  
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.gpgpu_package.all;

    entity memory_controller is
        generic (
            ADDRESS_SIZE            : integer := 32
        );
        port (
            reset                   : in  std_logic;
            clk_in                  : in  std_logic;
            en                      : in  std_logic;
            
            mem_addr_in             : in  std_logic_vector(ADDRESS_SIZE-1 downto 0);
            mem_size_in             : in  std_logic_vector(2 downto 0);
            mem_wr_data_in          : in  std_logic_vector(31 downto 0);
            mem_wr_en_in            : in  std_logic;
            
            mem_addr_out            : out std_logic_vector(ADDRESS_SIZE-1 downto 0);
            mem_wr_en_out           : out std_logic_vector(0 downto 0);
            mem_wr_data_out         : out std_logic_vector(7 downto 0);
            mem_rd_data_in          : in  std_logic_vector(7 downto 0);
            
            mem_rd_data_out         : out std_logic_vector(31 downto 0);
            mem_rd_wr_done          : out std_logic
        );
    end memory_controller;

architecture arch of memory_controller is

    type memory_controller_state_type is (IDLE, WRITE_MEM, READ_MEM, READ_WAIT, READ_DONE);
    signal memory_controller_state_machine              : memory_controller_state_type;
    
    signal en_reg                                       : std_logic;
    signal write_data                                   : std_logic_vector(31 downto 0);
    signal read_data                                    : std_logic_vector(31 downto 0);
    signal mem_rd_wr_cnt                                : std_logic_vector(2 downto 0);
    signal prev_mem_rd_wr_cnt                           : std_logic_vector(2 downto 0);
	 
begin

    pMemoryController :  process(clk_in)
    begin
        if (rising_edge(clk_in)) then
            if (reset = '1') then
                mem_addr_out                                    <= (others => '0');
                mem_wr_en_out                                   <= (others => '0');
                mem_rd_data_out                                 <= (others => '0');
                mem_rd_wr_cnt                                   <= (others => '0');
                mem_rd_wr_done                                  <= '0';
                memory_controller_state_machine                 <= IDLE;
            else
                case memory_controller_state_machine is
                    when IDLE =>
                        mem_rd_wr_cnt                           <= (others => '0');
                        mem_rd_wr_done                          <= '0';
                        en_reg                                  <= en;
                        if (en_reg = '0' and en = '1') then
                            if (mem_wr_en_in = '1') then
                                write_data                      <= mem_wr_data_in;
                                memory_controller_state_machine <= WRITE_MEM;
                            else
                                memory_controller_state_machine <= READ_MEM;
                            end if;
                        end if;
                    when WRITE_MEM =>
                        if (mem_rd_wr_cnt < mem_size_in) then
                            mem_addr_out                        <= mem_addr_in + mem_rd_wr_cnt;
                            mem_wr_en_out                       <= (others => '1');
                            mem_rd_wr_cnt                       <= mem_rd_wr_cnt + "01";
                        else
                            mem_addr_out                        <= (others => '0');
                            mem_wr_en_out                       <= (others => '0');
                            mem_rd_wr_cnt                       <= (others => '0');
                            mem_rd_wr_done                      <= '1';
                            memory_controller_state_machine     <= IDLE;
                        end if;
                    when READ_MEM =>
                        if (mem_rd_wr_cnt < mem_size_in+1) then
                            --mem_rd_wr_cnt                       <= mem_rd_wr_cnt + "01";
                            mem_addr_out                        <= mem_addr_in + mem_rd_wr_cnt;
                            mem_wr_en_out                       <= (others => '0');
                            memory_controller_state_machine     <= READ_WAIT;
                        else
                            mem_addr_out                        <= (others => '0');
                            mem_wr_en_out                       <= (others => '0');
                            mem_rd_wr_cnt                       <= (others => '0');
                            mem_rd_data_out                     <= read_data;
                            mem_rd_wr_done                      <= '1';
                            memory_controller_state_machine     <= IDLE;
                        end if;
                    when READ_WAIT =>
                        memory_controller_state_machine         <= READ_DONE;
                    when READ_DONE =>
                        mem_rd_wr_cnt                           <= mem_rd_wr_cnt + "01";
                        case mem_rd_wr_cnt is
                            when "000" =>
                                read_data                       <= x"000000" & mem_rd_data_in;
                            when "001" =>
                                read_data(15 downto 8)          <= mem_rd_data_in;
                            when "010" =>
                                read_data(23 downto 16)         <= mem_rd_data_in;
                            when "011" =>
                                read_data(31 downto 24)         <= mem_rd_data_in;
                            when others =>
                                null;
                        end case;
                        memory_controller_state_machine         <= READ_MEM;
                    when others =>
                        memory_controller_state_machine         <= IDLE;
                end case;
            end if;
        end if;
    end process;
    
	prev_mem_rd_wr_cnt <= mem_rd_wr_cnt - "01";
    
    pWriteMemory : process(prev_mem_rd_wr_cnt)
    begin
        case prev_mem_rd_wr_cnt is
            when "000" =>
                mem_wr_data_out         <= write_data(7 downto 0);
            when "001" =>
                mem_wr_data_out         <= write_data(15 downto 8);
            when "010" =>
                mem_wr_data_out         <= write_data(23 downto 16);
            when "011" =>
                mem_wr_data_out         <= write_data(31 downto 24);
            when others =>
                null;
        end case;
    end process;
    
end arch;

