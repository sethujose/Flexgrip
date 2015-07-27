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

    entity streaming_multiprocessor_configuration is
        port (
            clk_in                      : in  std_logic;
            host_reset                  : in  std_logic;
         
            reg_threads_per_block_in    : in  std_logic_vector(11 downto 0);
            reg_num_blocks_in           : in  std_logic_vector(3 downto 0);
            reg_warps_per_block_in      : in  std_logic_vector(5 downto 0);
            reg_shmem_base_addr_in      : in  std_logic_vector(31 downto 0);
            reg_shmem_size_in           : in  std_logic_vector(31 downto 0);
            reg_parameter_size_in       : in  std_logic_vector(15 downto 0);
            reg_gprs_size_in            : in  std_logic_vector(8 downto 0);
            reg_block_x_in              : in  std_logic_vector(15 downto 0);
            reg_block_y_in              : in  std_logic_vector(15 downto 0);
            reg_block_z_in              : in  std_logic_vector(15 downto 0);
            reg_grid_x_in               : in  std_logic_vector(15 downto 0);
            reg_grid_y_in               : in  std_logic_vector(15 downto 0);
            reg_block_idx_in            : in  std_logic_vector(15 downto 0);
            
            reg_threads_per_block_ld    : in  std_logic;
            reg_num_blocks_ld           : in  std_logic;
            reg_warps_per_block_ld      : in  std_logic;
            reg_shmem_base_addr_ld      : in  std_logic;
            reg_shmem_size_ld           : in  std_logic;
            reg_parameter_size_ld       : in  std_logic;
            reg_gprs_size_ld            : in  std_logic;
            reg_block_x_ld              : in  std_logic;
            reg_block_y_ld              : in  std_logic;
            reg_block_z_ld              : in  std_logic;
            reg_grid_x_ld               : in  std_logic;
            reg_grid_y_ld               : in  std_logic;
            reg_block_idx_ld            : in  std_logic;
            
            reg_threads_per_block_out   : out std_logic_vector(11 downto 0);
            reg_num_blocks_out          : out std_logic_vector(3 downto 0);
            reg_warps_per_block_out     : out std_logic_vector(5 downto 0);
            reg_shmem_base_addr_out     : out std_logic_vector(31 downto 0);
            reg_shmem_size_out          : out std_logic_vector(31 downto 0);
            reg_parameter_size_out      : out std_logic_vector(15 downto 0);
            reg_gprs_size_out           : out std_logic_vector(8 downto 0);
            reg_block_x_out             : out std_logic_vector(15 downto 0);
            reg_block_y_out             : out std_logic_vector(15 downto 0);
            reg_block_z_out             : out std_logic_vector(15 downto 0);
            reg_grid_x_out              : out std_logic_vector(15 downto 0);
            reg_grid_y_out              : out std_logic_vector(15 downto 0);
            reg_block_idx_out           : out std_logic_vector(15 downto 0)
        );
    end streaming_multiprocessor_configuration;

architecture arch of streaming_multiprocessor_configuration is
    
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
        
    uThreadsPerBlockReg : register_ld
        generic map(
            width   => 12
        )	
        port map(
            clk     => clk_in,
            reset   => host_reset,
            Ld      => reg_threads_per_block_ld,
            D       => reg_threads_per_block_in,
            Q       => reg_threads_per_block_out
        );
        
    uNumBlocksReg : register_ld
        generic map(
            width   => 4
        )	
        port map(
            clk     => clk_in,
            reset   => host_reset,
            Ld      => reg_num_blocks_ld,
            D       => reg_num_blocks_in,
            Q       => reg_num_blocks_out
        );
    
    
    uWarpsPerBlockReg : register_ld
        generic map(
            width   => 6
        )	
        port map(
            clk     => clk_in,
            reset   => host_reset,
            Ld      => reg_warps_per_block_ld,
            D       => reg_warps_per_block_in,
            Q       => reg_warps_per_block_out
        );
        
    uSHMEMBaseAddrReg : register_ld
        generic map(
            width   => 32
        )	
        port map(
            clk     => clk_in,
            reset   => host_reset,
            Ld      => reg_shmem_base_addr_ld,
            D       => reg_shmem_base_addr_in,
            Q       => reg_shmem_base_addr_out
        );
        
    uSHMEMSizeReg : register_ld
        generic map(
            width   => 32
        )	
        port map(
            clk     => clk_in,
            reset   => host_reset,
            Ld      => reg_shmem_size_ld,
            D       => reg_shmem_size_in,
            Q       => reg_shmem_size_out
        );
    
    uParamSizeReg : register_ld
        generic map(
            width   => 16
        )	
        port map(
            clk     => clk_in,
            reset   => host_reset,
            Ld      => reg_parameter_size_ld,
            D       => reg_parameter_size_in,
            Q       => reg_parameter_size_out
        );
        
    uGPRSSizeReg : register_ld
        generic map(
            width   => 9
        )	
        port map(
            clk     => clk_in,
            reset   => host_reset,
            Ld      => reg_gprs_size_ld,
            D       => reg_gprs_size_in,
            Q       => reg_gprs_size_out
        );

    uBlockXReg : register_ld
        generic map(
            width   => 16
        )	
        port map(
            clk     => clk_in,
            reset   => host_reset,
            Ld      => reg_block_x_ld,
            D       => reg_block_x_in,
            Q       => reg_block_x_out
        );
    
    uBlockYReg : register_ld
        generic map(
            width   => 16
        )	
        port map(
            clk     => clk_in,
            reset   => host_reset,
            Ld      => reg_block_y_ld,
            D       => reg_block_y_in,
            Q       => reg_block_y_out
        );
    
    uBlockZReg : register_ld
        generic map(
            width   => 16
        )	
        port map(
            clk     => clk_in,
            reset   => host_reset,
            Ld      => reg_block_z_ld,
            D       => reg_block_z_in,
            Q       => reg_block_z_out
        );
    
    uGridXReg : register_ld
        generic map(
            width   => 16
        )	
        port map(
            clk     => clk_in,
            reset   => host_reset,
            Ld      => reg_grid_x_ld,
            D       => reg_grid_x_in,
            Q       => reg_grid_x_out
        );
    
    uGridYReg : register_ld
        generic map(
            width   => 16
        )	
        port map(
            clk     => clk_in,
            reset   => host_reset,
            Ld      => reg_grid_y_ld,
            D       => reg_grid_y_in,
            Q       => reg_grid_y_out
        );
    
    uBlockIdxReg : register_ld
        generic map(
            width   => 16
        )	
        port map(
            clk     => clk_in,
            reset   => host_reset,
            Ld      => reg_block_idx_ld,
            D       => reg_block_idx_in,
            Q       => reg_block_idx_out
        );

end arch;

