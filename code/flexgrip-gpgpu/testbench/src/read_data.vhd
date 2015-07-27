----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:52:09 03/20/2013 
-- Design Name: 
-- Module Name:    read_data - Behavioral 
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
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all ;  
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.gpgpu_package.all;

    entity read_data is
        generic (
            MEM_ADDR_SIZE       : integer := 32
        );
        port (                            
            clk                 : in std_logic; 
            reset               : in std_logic;

            en                  : in std_logic;
            
            mem_start_addr_in   : in  std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
            mem_read_size_in    : in  std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
            mem_size_in         : in  std_logic_vector(2 downto 0);
            
            mem_addr_out        : out std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
            mem_wr_en_out       : out std_logic_vector(0 downto 0);
            mem_wr_data_out     : out std_logic_vector(7 downto 0);
            mem_rd_data_in      : in  std_logic_vector(7 downto 0);

            read_data_out       : out std_logic_vector(31 downto 0);
            read_data_rdy_out   : out std_logic;
            
            done                : out std_logic 
        );
    end read_data;

architecture Behavioral of read_data is

    component memory_controller
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
    end component;
    
    type read_data_state_type is (IDLE, READ_MEM, READ_WAIT, READ_DONE);
    signal read_data_state_machine              : read_data_state_type;
    
    signal en_reg                   : std_logic;
    signal mem_en_i                 : std_logic;
    signal mem_start_addr_i         : std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
    signal mem_read_size_i          : std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
            
    signal mem_addr_i               : std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
    signal mem_size_i               : std_logic_vector(2 downto 0);
    signal mem_wr_data_i            : std_logic_vector(31 downto 0);
    signal mem_wr_en_i              : std_logic;
   
    signal mem_rd_cnt               : std_logic_vector(MEM_ADDR_SIZE-1 downto 0);
    signal mem_rd_data_o            : std_logic_vector(31 downto 0);
    signal mem_rd_wr_done_o         : std_logic;
    signal mem_rd_wr_done_o_reg     : std_logic;
    
begin

    pReadData :  process(clk, reset)
    begin
        if (rising_edge(clk)) then
            if (reset = '1') then
                mem_start_addr_i                        <= (others => '0');
                mem_read_size_i                         <= (others => '0');
                mem_en_i                                <= '0';
                mem_addr_i                              <= (others => '0');
                mem_size_i                              <= (others => '0');
                mem_wr_data_i                           <= (others => '0');
                mem_wr_en_i                             <= '0';
                mem_rd_cnt                              <= (others => '0');
                read_data_out                           <= (others => '0');
                read_data_rdy_out                       <= '0';
                en_reg                                  <= '0';
                done                                    <= '0';
                read_data_state_machine                 <= IDLE;
            else
                case read_data_state_machine is
                    when IDLE =>
                        mem_en_i                        <= '0';
                        mem_addr_i                      <=  (others => '0');
                        mem_wr_data_i                   <=  (others => '0');
                        mem_wr_en_i                     <=  '0';
                        mem_rd_cnt                      <= (others => '0');
                        read_data_rdy_out               <= '0';
                        done                            <= '0';
                        en_reg                          <= en;
                        if (en_reg = '0' and en = '1') then
                            mem_start_addr_i            <= mem_start_addr_in;
                            mem_read_size_i             <= mem_read_size_in;
                            mem_size_i                  <= mem_size_in;
                            read_data_state_machine     <= READ_MEM;
                        end if;
                    when READ_MEM =>
                        read_data_rdy_out               <= '0';
                        if (mem_rd_cnt < mem_read_size_i + "01") then
                            mem_en_i                    <= '1';
                            mem_addr_i                  <= mem_start_addr_i;
                            mem_wr_en_out               <= (others => '0');
                            read_data_state_machine     <= READ_WAIT;
                        else
                            done                        <= '1';
                            read_data_state_machine     <= IDLE;
                        end if;
                    when READ_WAIT =>
                        mem_en_i                        <= '0';
                        mem_rd_wr_done_o_reg            <= mem_rd_wr_done_o;
                        if (mem_rd_wr_done_o_reg = '0' and mem_rd_wr_done_o = '1') then
                            mem_start_addr_i            <= mem_start_addr_i + "100";
                            mem_rd_cnt                  <= mem_rd_cnt + "01";
                            read_data_out               <= mem_rd_data_o;
                            read_data_rdy_out           <= '1';
                            read_data_state_machine     <= READ_MEM;
                        end if;
                    when others =>
                        read_data_state_machine         <= IDLE;
                end case;
            end if;
        end if;
    end process;
    
    uMemoryController : memory_controller
        generic map (
            ADDRESS_SIZE            =>  MEM_ADDR_SIZE
        )
        port map (
            reset                   =>  reset,
            clk_in                  =>  clk,
            en                      =>  mem_en_i,
            
            mem_addr_in             =>  mem_addr_i,
            mem_size_in             =>  mem_size_i,
            mem_wr_data_in          =>  mem_wr_data_i,
            mem_wr_en_in            =>  mem_wr_en_i,
            
            mem_addr_out            =>  mem_addr_out,
            mem_wr_en_out           =>  mem_wr_en_out,
            mem_wr_data_out         =>  mem_wr_data_out,
            mem_rd_data_in          =>  mem_rd_data_in,
            
            mem_rd_data_out         =>  mem_rd_data_o,
            mem_rd_wr_done          =>  mem_rd_wr_done_o
        );

end Behavioral;

