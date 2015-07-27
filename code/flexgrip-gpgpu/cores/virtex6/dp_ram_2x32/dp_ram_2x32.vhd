--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.40xd
--  \   \         Application: netgen
--  /   /         Filename: dp_ram_2x32.vhd
-- /___/   /\     Timestamp: Thu Nov 29 18:52:30 2012
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -w -sim -ofmt vhdl I:/GPGPU/gpgpu-1.0.1/src/RAMs-Virtex6/dp_ram_2x32/tmp/_cg/dp_ram_2x32.ngc I:/GPGPU/gpgpu-1.0.1/src/RAMs-Virtex6/dp_ram_2x32/tmp/_cg/dp_ram_2x32.vhd 
-- Device	: 6vlx240tff1156-1
-- Input file	: I:/GPGPU/gpgpu-1.0.1/src/RAMs-Virtex6/dp_ram_2x32/tmp/_cg/dp_ram_2x32.ngc
-- Output file	: I:/GPGPU/gpgpu-1.0.1/src/RAMs-Virtex6/dp_ram_2x32/tmp/_cg/dp_ram_2x32.vhd
-- # of Entities	: 1
-- Design Name	: dp_ram_2x32
-- Xilinx	: C:\Xilinx\14.3\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------


-- synthesis translate_off
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity dp_ram_2x32 is
  port (
    clka : in STD_LOGIC := 'X'; 
    clkb : in STD_LOGIC := 'X'; 
    wea : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    addra : in STD_LOGIC_VECTOR ( 4 downto 0 ); 
    dina : in STD_LOGIC_VECTOR ( 1 downto 0 ); 
    web : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    addrb : in STD_LOGIC_VECTOR ( 4 downto 0 ); 
    dinb : in STD_LOGIC_VECTOR ( 1 downto 0 ); 
    douta : out STD_LOGIC_VECTOR ( 1 downto 0 ); 
    doutb : out STD_LOGIC_VECTOR ( 1 downto 0 ) 
  );
end dp_ram_2x32;

architecture STRUCTURE of dp_ram_2x32 is
  signal N0 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_12_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_11_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_10_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_9_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOPADOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOPADOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOPBDOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOPBDOP_0_UNCONNECTED : STD_LOGIC;
 
begin
  XST_VCC : VCC
    port map (
      P => N0
    );
  XST_GND : GND
    port map (
      G => N1
    );
  U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram : RAMB18E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_10 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_11 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_12 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_13 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_14 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_15 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_16 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_17 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_18 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_19 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_1F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_20 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_21 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_22 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_23 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_24 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_25 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_26 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_27 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_28 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_29 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_2F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_30 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_31 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_32 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_33 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_34 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_35 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_36 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_37 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_38 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_39 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_3F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"00000",
      INIT_B => X"00000",
      INIT_FILE => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 18,
      READ_WIDTH_B => 18,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "VIRTEX6",
      SRVAL_A => X"00000",
      SRVAL_B => X"00000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 18,
      WRITE_WIDTH_B => 18
    )
    port map (
      CLKARDCLK => clka,
      CLKBWRCLK => clkb,
      ENARDEN => N0,
      ENBWREN => N0,
      REGCEAREGCE => N1,
      REGCEB => N1,
      RSTRAMARSTRAM => N1,
      RSTRAMB => N1,
      RSTREGARSTREG => N1,
      RSTREGB => N1,
      ADDRARDADDR(13) => N1,
      ADDRARDADDR(12) => N1,
      ADDRARDADDR(11) => N1,
      ADDRARDADDR(10) => N1,
      ADDRARDADDR(9) => N1,
      ADDRARDADDR(8) => addra(4),
      ADDRARDADDR(7) => addra(3),
      ADDRARDADDR(6) => addra(2),
      ADDRARDADDR(5) => addra(1),
      ADDRARDADDR(4) => addra(0),
      ADDRARDADDR(3) => N1,
      ADDRARDADDR(2) => N1,
      ADDRARDADDR(1) => N1,
      ADDRARDADDR(0) => N1,
      ADDRBWRADDR(13) => N1,
      ADDRBWRADDR(12) => N1,
      ADDRBWRADDR(11) => N1,
      ADDRBWRADDR(10) => N1,
      ADDRBWRADDR(9) => N1,
      ADDRBWRADDR(8) => addrb(4),
      ADDRBWRADDR(7) => addrb(3),
      ADDRBWRADDR(6) => addrb(2),
      ADDRBWRADDR(5) => addrb(1),
      ADDRBWRADDR(4) => addrb(0),
      ADDRBWRADDR(3) => N1,
      ADDRBWRADDR(2) => N1,
      ADDRBWRADDR(1) => N1,
      ADDRBWRADDR(0) => N1,
      DIADI(15) => N1,
      DIADI(14) => N1,
      DIADI(13) => N1,
      DIADI(12) => N1,
      DIADI(11) => N1,
      DIADI(10) => N1,
      DIADI(9) => N1,
      DIADI(8) => dina(1),
      DIADI(7) => N1,
      DIADI(6) => N1,
      DIADI(5) => N1,
      DIADI(4) => N1,
      DIADI(3) => N1,
      DIADI(2) => N1,
      DIADI(1) => N1,
      DIADI(0) => dina(0),
      DIBDI(15) => N1,
      DIBDI(14) => N1,
      DIBDI(13) => N1,
      DIBDI(12) => N1,
      DIBDI(11) => N1,
      DIBDI(10) => N1,
      DIBDI(9) => N1,
      DIBDI(8) => dinb(1),
      DIBDI(7) => N1,
      DIBDI(6) => N1,
      DIBDI(5) => N1,
      DIBDI(4) => N1,
      DIBDI(3) => N1,
      DIBDI(2) => N1,
      DIBDI(1) => N1,
      DIBDI(0) => dinb(0),
      DIPADIP(1) => N1,
      DIPADIP(0) => N1,
      DIPBDIP(1) => N1,
      DIPBDIP(0) => N1,
      DOADO(15) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_15_UNCONNECTED
,
      DOADO(14) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_14_UNCONNECTED
,
      DOADO(13) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_13_UNCONNECTED
,
      DOADO(12) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_12_UNCONNECTED
,
      DOADO(11) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_11_UNCONNECTED
,
      DOADO(10) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_10_UNCONNECTED
,
      DOADO(9) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_9_UNCONNECTED
,
      DOADO(8) => douta(1),
      DOADO(7) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_7_UNCONNECTED
,
      DOADO(6) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_6_UNCONNECTED
,
      DOADO(5) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_5_UNCONNECTED
,
      DOADO(4) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_4_UNCONNECTED
,
      DOADO(3) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_3_UNCONNECTED
,
      DOADO(2) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_2_UNCONNECTED
,
      DOADO(1) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOADO_1_UNCONNECTED
,
      DOADO(0) => douta(0),
      DOBDO(15) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_15_UNCONNECTED
,
      DOBDO(14) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_14_UNCONNECTED
,
      DOBDO(13) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_13_UNCONNECTED
,
      DOBDO(12) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_12_UNCONNECTED
,
      DOBDO(11) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_11_UNCONNECTED
,
      DOBDO(10) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_10_UNCONNECTED
,
      DOBDO(9) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_9_UNCONNECTED
,
      DOBDO(8) => doutb(1),
      DOBDO(7) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_7_UNCONNECTED
,
      DOBDO(6) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_6_UNCONNECTED
,
      DOBDO(5) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_5_UNCONNECTED
,
      DOBDO(4) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_4_UNCONNECTED
,
      DOBDO(3) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_3_UNCONNECTED
,
      DOBDO(2) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_2_UNCONNECTED
,
      DOBDO(1) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOBDO_1_UNCONNECTED
,
      DOBDO(0) => doutb(0),
      DOPADOP(1) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOPADOP_1_UNCONNECTED
,
      DOPADOP(0) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOPADOP_0_UNCONNECTED
,
      DOPBDOP(1) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOPBDOP_1_UNCONNECTED
,
      DOPBDOP(0) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM18_ram_DOPBDOP_0_UNCONNECTED
,
      WEA(1) => wea(0),
      WEA(0) => wea(0),
      WEBWE(3) => N1,
      WEBWE(2) => N1,
      WEBWE(1) => web(0),
      WEBWE(0) => web(0)
    );

end STRUCTURE;

-- synthesis translate_on
