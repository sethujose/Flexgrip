----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:02:25 03/22/2013 
-- Design Name: 
-- Module Name:    tb_configuration - Behavioral 
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
use IEEE.std_logic_unsigned.all;  
use IEEE.std_logic_arith.all;
use IEEE.numeric_std.all;

library unisim;
use unisim.vcomponents.all;

use work.gpgpu_package.all;

    entity bitonic_sort_configuration is
        port (
            clk                     : in  std_logic;
            reset                   : in  std_logic;
            reset_registers         : in  std_logic;
            
            cmem_reg_cs             : in  std_logic;
            cmem_reg_rw             : in  std_logic;
            cmem_reg_adr            : in  std_logic_vector(5 downto 0);
            cmem_reg_data_in        : in  std_logic_vector(7 downto 0);
            cmem_reg_data_out       : out std_logic_vector(7 downto 0);
            
            kernel_reg_cs           : in  std_logic;
            kernel_reg_rw           : in  std_logic;
            kernel_reg_adr          : in  std_logic_vector(3 downto 0);
            kernel_reg_data_in      : in  std_logic_vector(31 downto 0);
            kernel_reg_data_out     : out std_logic_vector(31 downto 0);
            
            cmem_param_size_out     : out std_logic_vector(5 downto 0);
            kernel_param_size_out   : out std_logic_vector(3 downto 0);
            kernel_block_x_out      : out std_logic_vector(15 downto 0);
            kernel_block_y_out      : out std_logic_vector(15 downto 0);
            kernel_block_z_out      : out std_logic_vector(15 downto 0);
            kernel_grid_x_out       : out std_logic_vector(15 downto 0);
            kernel_grid_y_out       : out std_logic_vector(15 downto 0);
            kernel_gprs_out         : out std_logic_vector(8 downto 0);
            kernel_shmem_size_out   : out std_logic_vector(31 downto 0);
            threads_per_block_out   : out std_logic_vector(11 downto 0);
            warps_per_block_out     : out std_logic_vector(5 downto 0);
            blocks_registers_out    : out std_logic_vector(7 downto 0);
            blocks_shared_mem_out   : out std_logic_vector(7 downto 0);
            blocks_warps_out        : out std_logic_vector(7 downto 0);
            blocks_per_core_out     : out std_logic_vector(3 downto 0)
        );
    end bitonic_sort_configuration;

architecture Behavioral of bitonic_sort_configuration is

    type cmem_regs_type is array (63 downto 0) of std_logic_vector(7 downto 0);
    type kernel_regs_type is array (15 downto 0) of std_logic_vector(31 downto 0);
   
    signal cmem_regs                 : cmem_regs_type; 
    constant cmem_regs_default       : cmem_regs_type := 
           (--  63(3F)
            x"00",x"00",x"00",x"00",  -- 60
            x"00",x"00",x"00",x"00",  -- 56
            x"00",x"00",x"00",x"00",  -- 52
            x"00",x"00",x"00",x"00",  -- 48
            x"00",x"00",x"00",x"00",  -- 44
            x"00",x"00",x"00",x"00",  -- 40
            x"00",x"00",x"00",x"00",  -- 36
            x"00",x"00",x"00",x"00",  -- 32 
            x"00",x"00",x"00",x"00",  -- 28
            x"00",x"00",x"00",x"00",  -- 24
            x"00",x"00",x"00",x"00",  -- 20
            x"00",x"00",x"00",x"00",  -- 16
            x"00",x"00",x"00",x"00",  -- 12
            x"00",x"00",x"00",x"00",  -- 8
            x"00",x"00",x"00",x"00",  -- 4
            x"00",x"00",x"01",x"00"); -- 0

    signal kernel_regs              : kernel_regs_type; 
    constant kernel_regs_default    : kernel_regs_type := 
           (--  15(0F)
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 12
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 8
            x"00000000",x"00000000",x"00000000",x"00000000",  -- 4
            x"00000000",x"00000000",x"00000000",x"00000000"); -- 0
            
            -- addr 0: start address of data
    
    constant cmem_param_size    : std_logic_vector(5 downto 0)  := "00" & x"4";     -- 4 bytes
    constant kernel_param_size  : std_logic_vector(3 downto 0)  := x"1";            -- 1
    constant kernel_block_x     : std_logic_vector(15 downto 0) := x"0010";         -- 16
    constant kernel_block_y     : std_logic_vector(15 downto 0) := x"0001";         -- 1
    constant kernel_block_z     : std_logic_vector(15 downto 0) := x"0001";         -- 1
    constant kernel_grid_x      : std_logic_vector(15 downto 0) := x"0010";         -- 16
    constant kernel_grid_y      : std_logic_vector(15 downto 0) := x"0001";         -- 1
    constant kernel_gprs        : std_logic_vector(8 downto 0)  := "0" & x"06";     -- 6
    constant kernel_shmem_size  : std_logic_vector(31 downto 0) := x"00000020";     -- 32
    constant threads_per_block  : std_logic_vector(11 downto 0) := x"100";          -- 256
    constant warps_per_block    : std_logic_vector(5 downto 0)  := "001000";        -- 8
    constant blocks_registers   : std_logic_vector(7 downto 0)  := x"05";           -- 5
    constant blocks_shared_mem  : std_logic_vector(7 downto 0)  := x"08";           -- 8
    constant blocks_warps       : std_logic_vector(7 downto 0)  := x"03";           -- 3
    constant blocks_per_core    : std_logic_vector(3 downto 0)  := x"3";            -- 3
    
begin

    cmem_param_size_out     <= cmem_param_size;
    kernel_param_size_out   <= kernel_param_size;
    kernel_block_x_out      <= kernel_block_x;
    kernel_block_y_out      <= kernel_block_y;
    kernel_block_z_out      <= kernel_block_z;
    kernel_grid_x_out       <= kernel_grid_x;
    kernel_grid_y_out       <= kernel_grid_y;
    kernel_gprs_out         <= kernel_gprs;
    kernel_shmem_size_out   <= kernel_shmem_size;
    threads_per_block_out   <= threads_per_block;
    warps_per_block_out     <= warps_per_block;
    blocks_registers_out    <= blocks_registers;
    blocks_shared_mem_out   <= blocks_shared_mem;
    blocks_warps_out        <= blocks_warps;
    blocks_per_core_out     <= blocks_per_core;
    
    -- This generate Loop creates the 64 const mem registers, and controls the write accesses to them. 
    gLoopConstMemRegistersWrite: for i in 0 to 63 generate
        pConstMemRegistersWrite: process (clk)
        begin
            if (rising_edge(clk)) then   
                if (reset = '1' or reset_registers = '1') then
                    cmem_regs(i)                        <= cmem_regs_default(i);
                else
                    if (cmem_reg_cs = '1' and cmem_reg_rw = '0') then 
                        if (cmem_reg_adr = std_logic_vector(to_unsigned(i, 6))) then 
                            cmem_regs(i)(7 downto 0)    <=  cmem_reg_data_in;
                        end if;
                    end if;                    
                end if; 
             end if;
        end process;
    end generate;

    gLoopConstMemRegistersRead: for i in 0 to 63 generate
        pConstMemRegistersRead: process (clk)
        begin
            if (rising_edge(clk)) then 
                if (reset = '1' or reset_registers = '1') then
                    cmem_reg_data_out                 <=  (others => '0');
                else
                    if (cmem_reg_cs = '1' and cmem_reg_rw = '1') then 
                        for i in 0 to 63 loop
                            if (cmem_reg_adr = std_logic_vector(to_unsigned(i, 6))) then 
                                cmem_reg_data_out       <= cmem_regs(i);                  
                            end if;
                        end loop ;
                    end if;
                end if;
            end if;                
        end process;
    end generate;

    -- This generate Loop creates the 16 shared mem registers, and controls the write accesses to them. 
    gLoopKernelRegistersWrite: for i in 0 to 15 generate
        pKernelRegistersWrite: process (reset, reset_registers, clk)
        begin
            if (rising_edge(clk)) then   
                if (reset = '1' or reset_registers = '1') then
                    kernel_regs(i)                        <= kernel_regs_default(i);
                else
                    if (kernel_reg_cs = '1' and kernel_reg_rw = '0') then 
                        if (kernel_reg_adr = std_logic_vector(to_unsigned(i, 4))) then 
                            kernel_regs(i)(31 downto 0)    <=  kernel_reg_data_in;
                        end if;
                    end if;                    
                end if; 
             end if;
        end process;
    end generate;

    gLoopKernelRegistersRead: for i in 0 to 15 generate
        pKernelRegistersRead: process (reset, reset_registers, clk)
        begin
            if (rising_edge(clk)) then 
                if (reset = '1' or reset_registers = '1') then
                    kernel_reg_data_out                 <=  (others => '0');
                else
                    if (kernel_reg_cs = '1' and kernel_reg_rw = '1') then 
                        for i in 0 to 15 loop
                            if (kernel_reg_adr = std_logic_vector(to_unsigned(i, 4))) then 
                                kernel_reg_data_out       <= kernel_regs(i);                  
                            end if;
                        end loop ;
                    end if;
                end if;
            end if;                
        end process;
    end generate;
    
end Behavioral;

