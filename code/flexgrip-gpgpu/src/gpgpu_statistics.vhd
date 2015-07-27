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

    entity gpgpu_statistics is
        port (
            clk_in                      : in  std_logic;
            host_reset                  : in  std_logic;
            reset_registers             : in  std_logic;
            
            en                          : in  std_logic;
            
            smp_stats_in                : in vector_stat_registers;
            
            stats_reg_cs                : in  std_logic;
            stats_reg_rw                : in  std_logic;
            stats_reg_adr               : in  std_logic_vector(31 downto 0);
            stats_reg_data_in           : in  std_logic_vector(31 downto 0);
            stats_reg_data_out          : out std_logic_vector(31 downto 0)
        );
    end gpgpu_statistics;

architecture arch of gpgpu_statistics is

    type gpgpu_stats_state_type is (IDLE, WRITE_STATS); 
    signal gpgpu_stats_state_machine : gpgpu_stats_state_type := IDLE; 
    
    type registers_type is array (63 downto 0) of std_logic_vector(31 downto 0);
   
    signal stats_regs                     : registers_type; 
    constant stats_regs_default           : registers_type := 
           (--  63(3F)
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 60
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 56
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 52
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 48
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 44
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 40
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 36
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 32 
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 28
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 24
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 20
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 16
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 12
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 8
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 4
            x"00000000",x"00000000",x"00000000",x"00000000"); -- 0

    signal en_reg                           : std_logic;
    
    signal smp_stats_i                      : vector_stat_registers;
    
begin
    
    pGPGPUStatsStateMachine: process(clk_in)
	begin
		if (rising_edge(clk_in)) then 
            if (host_reset = '1') then
                en_reg                                          <= '0';
                gpgpu_stats_state_machine                       <= IDLE;
            else  
                case gpgpu_stats_state_machine is 
                    when IDLE =>
                        en_reg                                  <= en;
                        if (en_reg = '0' and en = '1') then
                            smp_stats_i                         <= smp_stats_in;
                            gpgpu_stats_state_machine           <= WRITE_STATS;
                        end if;
                    when WRITE_STATS =>
                        for i in 0 to stat_stages'length-1 loop
                            stats_regs(i*4)(31 downto 0)        <=  smp_stats_i(i).total;
                            stats_regs((i*4)+1)(31 downto 0)    <=  smp_stats_i(i).total_idle;
                            stats_regs((i*4)+2)(31 downto 0)    <=  smp_stats_i(i).total_processing;
                            stats_regs((i*4)+3)(31 downto 0)    <=  smp_stats_i(i).total_stall;
                        end loop;
                        gpgpu_stats_state_machine               <= IDLE;
                    when others =>
                        gpgpu_stats_state_machine               <= IDLE;
                end case;
            end if;
        end if;
    end process;
    
    -- This generate Loop creates the 16 debug registers, and controls the write accesses to them. 
    gLoopRegistersWrite: for i in 56 to 63 generate
        pRegistersWrite: process (clk_in)
        begin
            if (rising_edge(clk_in)) then   
                if (host_reset = '1' or reset_registers = '1') then
                    stats_regs(i)                           <= stats_regs_default(i);
                else
                    if (stats_reg_cs = '1' and stats_reg_rw = '0') then 
                        if (stats_reg_adr = std_logic_vector(to_unsigned(i,64))) then 
                            stats_regs(i)(31 downto 0)      <=  stats_reg_data_in;
                        end if;
                    end if;                    
                end if; 
             end if;
        end process;
    end generate;

    gLoopRegistersRead: for i in 0 to 63 generate
        pRegistersRead: process (clk_in)
        begin
            if (rising_edge(clk_in)) then 
                if (host_reset = '1' or reset_registers = '1') then
                    stats_reg_data_out                  <=  (others => '0');
                else
                    if (stats_reg_cs = '1' and stats_reg_rw = '1') then 
                        for i in 0 to 63 loop
                            if (stats_reg_adr = std_logic_vector(to_unsigned(i,64))) then 
                                stats_reg_data_out      <= stats_regs(i);                  
                            end if;
                        end loop ;
                    end if;
                end if;
            end if;                
        end process;
    end generate;
    
end arch;

