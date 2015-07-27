--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.40xd
--  \   \         Application: netgen
--  /   /         Filename: dp_ram_128x32.vhd
-- /___/   /\     Timestamp: Thu Nov 29 18:48:16 2012
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -w -sim -ofmt vhdl I:/GPGPU/gpgpu-1.0.1/src/RAMs-Virtex6/dp_ram_128x32/tmp/_cg/dp_ram_128x32.ngc I:/GPGPU/gpgpu-1.0.1/src/RAMs-Virtex6/dp_ram_128x32/tmp/_cg/dp_ram_128x32.vhd 
-- Device	: 6vlx240tff1156-1
-- Input file	: I:/GPGPU/gpgpu-1.0.1/src/RAMs-Virtex6/dp_ram_128x32/tmp/_cg/dp_ram_128x32.ngc
-- Output file	: I:/GPGPU/gpgpu-1.0.1/src/RAMs-Virtex6/dp_ram_128x32/tmp/_cg/dp_ram_128x32.vhd
-- # of Entities	: 1
-- Design Name	: dp_ram_128x32
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

entity dp_ram_128x32 is
  port (
    clka : in STD_LOGIC := 'X'; 
    clkb : in STD_LOGIC := 'X'; 
    wea : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    addra : in STD_LOGIC_VECTOR ( 4 downto 0 ); 
    dina : in STD_LOGIC_VECTOR ( 127 downto 0 ); 
    web : in STD_LOGIC_VECTOR ( 0 downto 0 ); 
    addrb : in STD_LOGIC_VECTOR ( 4 downto 0 ); 
    dinb : in STD_LOGIC_VECTOR ( 127 downto 0 ); 
    douta : out STD_LOGIC_VECTOR ( 127 downto 0 ); 
    doutb : out STD_LOGIC_VECTOR ( 127 downto 0 ) 
  );
end dp_ram_128x32;

architecture STRUCTURE of dp_ram_128x32 is
  signal N0 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DBITERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_SBITERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DBITERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_SBITERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DBITERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_SBITERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_CASCADEOUTA_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_CASCADEOUTB_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DBITERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_SBITERR_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_31_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_30_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_29_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_23_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_22_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_21_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_15_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_14_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_13_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOPADOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOPADOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOPADOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOPADOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOPBDOP_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOPBDOP_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOPBDOP_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOPBDOP_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_0_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_8_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_7_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_6_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_5_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_4_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_3_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_2_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_1_UNCONNECTED : STD_LOGIC;
 
  signal NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_0_UNCONNECTED : STD_LOGIC;
 
begin
  XST_VCC : VCC
    port map (
      P => N0
    );
  XST_GND : GND
    port map (
      G => N1
    );
  U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram : RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => FALSE,
      EN_ECC_WRITE => FALSE,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
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
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "VIRTEX6",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
    port map (
      CASCADEINA => N1,
      CASCADEINB => N1,
      CASCADEOUTA => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_CASCADEOUTA_UNCONNECTED
,
      CASCADEOUTB => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_CASCADEOUTB_UNCONNECTED
,
      CLKARDCLK => clka,
      CLKBWRCLK => clkb,
      DBITERR => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DBITERR_UNCONNECTED
,
      ENARDEN => N0,
      ENBWREN => N0,
      INJECTDBITERR => N1,
      INJECTSBITERR => N1,
      REGCEAREGCE => N1,
      REGCEB => N1,
      RSTRAMARSTRAM => N1,
      RSTRAMB => N1,
      RSTREGARSTREG => N1,
      RSTREGB => N1,
      SBITERR => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_SBITERR_UNCONNECTED
,
      ADDRARDADDR(15) => N0,
      ADDRARDADDR(14) => N1,
      ADDRARDADDR(13) => N1,
      ADDRARDADDR(12) => N1,
      ADDRARDADDR(11) => N1,
      ADDRARDADDR(10) => N1,
      ADDRARDADDR(9) => addra(4),
      ADDRARDADDR(8) => addra(3),
      ADDRARDADDR(7) => addra(2),
      ADDRARDADDR(6) => addra(1),
      ADDRARDADDR(5) => addra(0),
      ADDRARDADDR(4) => N1,
      ADDRARDADDR(3) => N1,
      ADDRARDADDR(2) => N1,
      ADDRARDADDR(1) => N1,
      ADDRARDADDR(0) => N1,
      ADDRBWRADDR(15) => N0,
      ADDRBWRADDR(14) => N1,
      ADDRBWRADDR(13) => N1,
      ADDRBWRADDR(12) => N1,
      ADDRBWRADDR(11) => N1,
      ADDRBWRADDR(10) => N1,
      ADDRBWRADDR(9) => addrb(4),
      ADDRBWRADDR(8) => addrb(3),
      ADDRBWRADDR(7) => addrb(2),
      ADDRBWRADDR(6) => addrb(1),
      ADDRBWRADDR(5) => addrb(0),
      ADDRBWRADDR(4) => N1,
      ADDRBWRADDR(3) => N1,
      ADDRBWRADDR(2) => N1,
      ADDRBWRADDR(1) => N1,
      ADDRBWRADDR(0) => N1,
      DIADI(31) => dina(34),
      DIADI(30) => dina(33),
      DIADI(29) => dina(32),
      DIADI(28) => dina(31),
      DIADI(27) => dina(30),
      DIADI(26) => dina(29),
      DIADI(25) => dina(28),
      DIADI(24) => dina(27),
      DIADI(23) => dina(25),
      DIADI(22) => dina(24),
      DIADI(21) => dina(23),
      DIADI(20) => dina(22),
      DIADI(19) => dina(21),
      DIADI(18) => dina(20),
      DIADI(17) => dina(19),
      DIADI(16) => dina(18),
      DIADI(15) => dina(16),
      DIADI(14) => dina(15),
      DIADI(13) => dina(14),
      DIADI(12) => dina(13),
      DIADI(11) => dina(12),
      DIADI(10) => dina(11),
      DIADI(9) => dina(10),
      DIADI(8) => dina(9),
      DIADI(7) => dina(7),
      DIADI(6) => dina(6),
      DIADI(5) => dina(5),
      DIADI(4) => dina(4),
      DIADI(3) => dina(3),
      DIADI(2) => dina(2),
      DIADI(1) => dina(1),
      DIADI(0) => dina(0),
      DIBDI(31) => dinb(34),
      DIBDI(30) => dinb(33),
      DIBDI(29) => dinb(32),
      DIBDI(28) => dinb(31),
      DIBDI(27) => dinb(30),
      DIBDI(26) => dinb(29),
      DIBDI(25) => dinb(28),
      DIBDI(24) => dinb(27),
      DIBDI(23) => dinb(25),
      DIBDI(22) => dinb(24),
      DIBDI(21) => dinb(23),
      DIBDI(20) => dinb(22),
      DIBDI(19) => dinb(21),
      DIBDI(18) => dinb(20),
      DIBDI(17) => dinb(19),
      DIBDI(16) => dinb(18),
      DIBDI(15) => dinb(16),
      DIBDI(14) => dinb(15),
      DIBDI(13) => dinb(14),
      DIBDI(12) => dinb(13),
      DIBDI(11) => dinb(12),
      DIBDI(10) => dinb(11),
      DIBDI(9) => dinb(10),
      DIBDI(8) => dinb(9),
      DIBDI(7) => dinb(7),
      DIBDI(6) => dinb(6),
      DIBDI(5) => dinb(5),
      DIBDI(4) => dinb(4),
      DIBDI(3) => dinb(3),
      DIBDI(2) => dinb(2),
      DIBDI(1) => dinb(1),
      DIBDI(0) => dinb(0),
      DIPADIP(3) => dina(35),
      DIPADIP(2) => dina(26),
      DIPADIP(1) => dina(17),
      DIPADIP(0) => dina(8),
      DIPBDIP(3) => dinb(35),
      DIPBDIP(2) => dinb(26),
      DIPBDIP(1) => dinb(17),
      DIPBDIP(0) => dinb(8),
      DOADO(31) => douta(34),
      DOADO(30) => douta(33),
      DOADO(29) => douta(32),
      DOADO(28) => douta(31),
      DOADO(27) => douta(30),
      DOADO(26) => douta(29),
      DOADO(25) => douta(28),
      DOADO(24) => douta(27),
      DOADO(23) => douta(25),
      DOADO(22) => douta(24),
      DOADO(21) => douta(23),
      DOADO(20) => douta(22),
      DOADO(19) => douta(21),
      DOADO(18) => douta(20),
      DOADO(17) => douta(19),
      DOADO(16) => douta(18),
      DOADO(15) => douta(16),
      DOADO(14) => douta(15),
      DOADO(13) => douta(14),
      DOADO(12) => douta(13),
      DOADO(11) => douta(12),
      DOADO(10) => douta(11),
      DOADO(9) => douta(10),
      DOADO(8) => douta(9),
      DOADO(7) => douta(7),
      DOADO(6) => douta(6),
      DOADO(5) => douta(5),
      DOADO(4) => douta(4),
      DOADO(3) => douta(3),
      DOADO(2) => douta(2),
      DOADO(1) => douta(1),
      DOADO(0) => douta(0),
      DOBDO(31) => doutb(34),
      DOBDO(30) => doutb(33),
      DOBDO(29) => doutb(32),
      DOBDO(28) => doutb(31),
      DOBDO(27) => doutb(30),
      DOBDO(26) => doutb(29),
      DOBDO(25) => doutb(28),
      DOBDO(24) => doutb(27),
      DOBDO(23) => doutb(25),
      DOBDO(22) => doutb(24),
      DOBDO(21) => doutb(23),
      DOBDO(20) => doutb(22),
      DOBDO(19) => doutb(21),
      DOBDO(18) => doutb(20),
      DOBDO(17) => doutb(19),
      DOBDO(16) => doutb(18),
      DOBDO(15) => doutb(16),
      DOBDO(14) => doutb(15),
      DOBDO(13) => doutb(14),
      DOBDO(12) => doutb(13),
      DOBDO(11) => doutb(12),
      DOBDO(10) => doutb(11),
      DOBDO(9) => doutb(10),
      DOBDO(8) => doutb(9),
      DOBDO(7) => doutb(7),
      DOBDO(6) => doutb(6),
      DOBDO(5) => doutb(5),
      DOBDO(4) => doutb(4),
      DOBDO(3) => doutb(3),
      DOBDO(2) => doutb(2),
      DOBDO(1) => doutb(1),
      DOBDO(0) => doutb(0),
      DOPADOP(3) => douta(35),
      DOPADOP(2) => douta(26),
      DOPADOP(1) => douta(17),
      DOPADOP(0) => douta(8),
      DOPBDOP(3) => doutb(35),
      DOPBDOP(2) => doutb(26),
      DOPBDOP(1) => doutb(17),
      DOPBDOP(0) => doutb(8),
      ECCPARITY(7) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_7_UNCONNECTED
,
      ECCPARITY(6) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_6_UNCONNECTED
,
      ECCPARITY(5) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_5_UNCONNECTED
,
      ECCPARITY(4) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_4_UNCONNECTED
,
      ECCPARITY(3) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_3_UNCONNECTED
,
      ECCPARITY(2) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_2_UNCONNECTED
,
      ECCPARITY(1) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_1_UNCONNECTED
,
      ECCPARITY(0) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_0_UNCONNECTED
,
      RDADDRECC(8) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_8_UNCONNECTED
,
      RDADDRECC(7) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_7_UNCONNECTED
,
      RDADDRECC(6) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_6_UNCONNECTED
,
      RDADDRECC(5) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_5_UNCONNECTED
,
      RDADDRECC(4) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_4_UNCONNECTED
,
      RDADDRECC(3) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_3_UNCONNECTED
,
      RDADDRECC(2) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_2_UNCONNECTED
,
      RDADDRECC(1) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_1_UNCONNECTED
,
      RDADDRECC(0) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_0_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_0_UNCONNECTED
,
      WEA(3) => wea(0),
      WEA(2) => wea(0),
      WEA(1) => wea(0),
      WEA(0) => wea(0),
      WEBWE(7) => N1,
      WEBWE(6) => N1,
      WEBWE(5) => N1,
      WEBWE(4) => N1,
      WEBWE(3) => web(0),
      WEBWE(2) => web(0),
      WEBWE(1) => web(0),
      WEBWE(0) => web(0)
    );
  U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram : RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => FALSE,
      EN_ECC_WRITE => FALSE,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
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
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "VIRTEX6",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
    port map (
      CASCADEINA => N1,
      CASCADEINB => N1,
      CASCADEOUTA => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_CASCADEOUTA_UNCONNECTED
,
      CASCADEOUTB => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_CASCADEOUTB_UNCONNECTED
,
      CLKARDCLK => clka,
      CLKBWRCLK => clkb,
      DBITERR => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DBITERR_UNCONNECTED
,
      ENARDEN => N0,
      ENBWREN => N0,
      INJECTDBITERR => N1,
      INJECTSBITERR => N1,
      REGCEAREGCE => N1,
      REGCEB => N1,
      RSTRAMARSTRAM => N1,
      RSTRAMB => N1,
      RSTREGARSTREG => N1,
      RSTREGB => N1,
      SBITERR => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_SBITERR_UNCONNECTED
,
      ADDRARDADDR(15) => N0,
      ADDRARDADDR(14) => N1,
      ADDRARDADDR(13) => N1,
      ADDRARDADDR(12) => N1,
      ADDRARDADDR(11) => N1,
      ADDRARDADDR(10) => N1,
      ADDRARDADDR(9) => addra(4),
      ADDRARDADDR(8) => addra(3),
      ADDRARDADDR(7) => addra(2),
      ADDRARDADDR(6) => addra(1),
      ADDRARDADDR(5) => addra(0),
      ADDRARDADDR(4) => N1,
      ADDRARDADDR(3) => N1,
      ADDRARDADDR(2) => N1,
      ADDRARDADDR(1) => N1,
      ADDRARDADDR(0) => N1,
      ADDRBWRADDR(15) => N0,
      ADDRBWRADDR(14) => N1,
      ADDRBWRADDR(13) => N1,
      ADDRBWRADDR(12) => N1,
      ADDRBWRADDR(11) => N1,
      ADDRBWRADDR(10) => N1,
      ADDRBWRADDR(9) => addrb(4),
      ADDRBWRADDR(8) => addrb(3),
      ADDRBWRADDR(7) => addrb(2),
      ADDRBWRADDR(6) => addrb(1),
      ADDRBWRADDR(5) => addrb(0),
      ADDRBWRADDR(4) => N1,
      ADDRBWRADDR(3) => N1,
      ADDRBWRADDR(2) => N1,
      ADDRBWRADDR(1) => N1,
      ADDRBWRADDR(0) => N1,
      DIADI(31) => dina(70),
      DIADI(30) => dina(69),
      DIADI(29) => dina(68),
      DIADI(28) => dina(67),
      DIADI(27) => dina(66),
      DIADI(26) => dina(65),
      DIADI(25) => dina(64),
      DIADI(24) => dina(63),
      DIADI(23) => dina(61),
      DIADI(22) => dina(60),
      DIADI(21) => dina(59),
      DIADI(20) => dina(58),
      DIADI(19) => dina(57),
      DIADI(18) => dina(56),
      DIADI(17) => dina(55),
      DIADI(16) => dina(54),
      DIADI(15) => dina(52),
      DIADI(14) => dina(51),
      DIADI(13) => dina(50),
      DIADI(12) => dina(49),
      DIADI(11) => dina(48),
      DIADI(10) => dina(47),
      DIADI(9) => dina(46),
      DIADI(8) => dina(45),
      DIADI(7) => dina(43),
      DIADI(6) => dina(42),
      DIADI(5) => dina(41),
      DIADI(4) => dina(40),
      DIADI(3) => dina(39),
      DIADI(2) => dina(38),
      DIADI(1) => dina(37),
      DIADI(0) => dina(36),
      DIBDI(31) => dinb(70),
      DIBDI(30) => dinb(69),
      DIBDI(29) => dinb(68),
      DIBDI(28) => dinb(67),
      DIBDI(27) => dinb(66),
      DIBDI(26) => dinb(65),
      DIBDI(25) => dinb(64),
      DIBDI(24) => dinb(63),
      DIBDI(23) => dinb(61),
      DIBDI(22) => dinb(60),
      DIBDI(21) => dinb(59),
      DIBDI(20) => dinb(58),
      DIBDI(19) => dinb(57),
      DIBDI(18) => dinb(56),
      DIBDI(17) => dinb(55),
      DIBDI(16) => dinb(54),
      DIBDI(15) => dinb(52),
      DIBDI(14) => dinb(51),
      DIBDI(13) => dinb(50),
      DIBDI(12) => dinb(49),
      DIBDI(11) => dinb(48),
      DIBDI(10) => dinb(47),
      DIBDI(9) => dinb(46),
      DIBDI(8) => dinb(45),
      DIBDI(7) => dinb(43),
      DIBDI(6) => dinb(42),
      DIBDI(5) => dinb(41),
      DIBDI(4) => dinb(40),
      DIBDI(3) => dinb(39),
      DIBDI(2) => dinb(38),
      DIBDI(1) => dinb(37),
      DIBDI(0) => dinb(36),
      DIPADIP(3) => dina(71),
      DIPADIP(2) => dina(62),
      DIPADIP(1) => dina(53),
      DIPADIP(0) => dina(44),
      DIPBDIP(3) => dinb(71),
      DIPBDIP(2) => dinb(62),
      DIPBDIP(1) => dinb(53),
      DIPBDIP(0) => dinb(44),
      DOADO(31) => douta(70),
      DOADO(30) => douta(69),
      DOADO(29) => douta(68),
      DOADO(28) => douta(67),
      DOADO(27) => douta(66),
      DOADO(26) => douta(65),
      DOADO(25) => douta(64),
      DOADO(24) => douta(63),
      DOADO(23) => douta(61),
      DOADO(22) => douta(60),
      DOADO(21) => douta(59),
      DOADO(20) => douta(58),
      DOADO(19) => douta(57),
      DOADO(18) => douta(56),
      DOADO(17) => douta(55),
      DOADO(16) => douta(54),
      DOADO(15) => douta(52),
      DOADO(14) => douta(51),
      DOADO(13) => douta(50),
      DOADO(12) => douta(49),
      DOADO(11) => douta(48),
      DOADO(10) => douta(47),
      DOADO(9) => douta(46),
      DOADO(8) => douta(45),
      DOADO(7) => douta(43),
      DOADO(6) => douta(42),
      DOADO(5) => douta(41),
      DOADO(4) => douta(40),
      DOADO(3) => douta(39),
      DOADO(2) => douta(38),
      DOADO(1) => douta(37),
      DOADO(0) => douta(36),
      DOBDO(31) => doutb(70),
      DOBDO(30) => doutb(69),
      DOBDO(29) => doutb(68),
      DOBDO(28) => doutb(67),
      DOBDO(27) => doutb(66),
      DOBDO(26) => doutb(65),
      DOBDO(25) => doutb(64),
      DOBDO(24) => doutb(63),
      DOBDO(23) => doutb(61),
      DOBDO(22) => doutb(60),
      DOBDO(21) => doutb(59),
      DOBDO(20) => doutb(58),
      DOBDO(19) => doutb(57),
      DOBDO(18) => doutb(56),
      DOBDO(17) => doutb(55),
      DOBDO(16) => doutb(54),
      DOBDO(15) => doutb(52),
      DOBDO(14) => doutb(51),
      DOBDO(13) => doutb(50),
      DOBDO(12) => doutb(49),
      DOBDO(11) => doutb(48),
      DOBDO(10) => doutb(47),
      DOBDO(9) => doutb(46),
      DOBDO(8) => doutb(45),
      DOBDO(7) => doutb(43),
      DOBDO(6) => doutb(42),
      DOBDO(5) => doutb(41),
      DOBDO(4) => doutb(40),
      DOBDO(3) => doutb(39),
      DOBDO(2) => doutb(38),
      DOBDO(1) => doutb(37),
      DOBDO(0) => doutb(36),
      DOPADOP(3) => douta(71),
      DOPADOP(2) => douta(62),
      DOPADOP(1) => douta(53),
      DOPADOP(0) => douta(44),
      DOPBDOP(3) => doutb(71),
      DOPBDOP(2) => doutb(62),
      DOPBDOP(1) => doutb(53),
      DOPBDOP(0) => doutb(44),
      ECCPARITY(7) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_7_UNCONNECTED
,
      ECCPARITY(6) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_6_UNCONNECTED
,
      ECCPARITY(5) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_5_UNCONNECTED
,
      ECCPARITY(4) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_4_UNCONNECTED
,
      ECCPARITY(3) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_3_UNCONNECTED
,
      ECCPARITY(2) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_2_UNCONNECTED
,
      ECCPARITY(1) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_1_UNCONNECTED
,
      ECCPARITY(0) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_0_UNCONNECTED
,
      RDADDRECC(8) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_8_UNCONNECTED
,
      RDADDRECC(7) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_7_UNCONNECTED
,
      RDADDRECC(6) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_6_UNCONNECTED
,
      RDADDRECC(5) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_5_UNCONNECTED
,
      RDADDRECC(4) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_4_UNCONNECTED
,
      RDADDRECC(3) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_3_UNCONNECTED
,
      RDADDRECC(2) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_2_UNCONNECTED
,
      RDADDRECC(1) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_1_UNCONNECTED
,
      RDADDRECC(0) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_1_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_0_UNCONNECTED
,
      WEA(3) => wea(0),
      WEA(2) => wea(0),
      WEA(1) => wea(0),
      WEA(0) => wea(0),
      WEBWE(7) => N1,
      WEBWE(6) => N1,
      WEBWE(5) => N1,
      WEBWE(4) => N1,
      WEBWE(3) => web(0),
      WEBWE(2) => web(0),
      WEBWE(1) => web(0),
      WEBWE(0) => web(0)
    );
  U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram : RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => FALSE,
      EN_ECC_WRITE => FALSE,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
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
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "VIRTEX6",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
    port map (
      CASCADEINA => N1,
      CASCADEINB => N1,
      CASCADEOUTA => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_CASCADEOUTA_UNCONNECTED
,
      CASCADEOUTB => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_CASCADEOUTB_UNCONNECTED
,
      CLKARDCLK => clka,
      CLKBWRCLK => clkb,
      DBITERR => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DBITERR_UNCONNECTED
,
      ENARDEN => N0,
      ENBWREN => N0,
      INJECTDBITERR => N1,
      INJECTSBITERR => N1,
      REGCEAREGCE => N1,
      REGCEB => N1,
      RSTRAMARSTRAM => N1,
      RSTRAMB => N1,
      RSTREGARSTREG => N1,
      RSTREGB => N1,
      SBITERR => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_SBITERR_UNCONNECTED
,
      ADDRARDADDR(15) => N0,
      ADDRARDADDR(14) => N1,
      ADDRARDADDR(13) => N1,
      ADDRARDADDR(12) => N1,
      ADDRARDADDR(11) => N1,
      ADDRARDADDR(10) => N1,
      ADDRARDADDR(9) => addra(4),
      ADDRARDADDR(8) => addra(3),
      ADDRARDADDR(7) => addra(2),
      ADDRARDADDR(6) => addra(1),
      ADDRARDADDR(5) => addra(0),
      ADDRARDADDR(4) => N1,
      ADDRARDADDR(3) => N1,
      ADDRARDADDR(2) => N1,
      ADDRARDADDR(1) => N1,
      ADDRARDADDR(0) => N1,
      ADDRBWRADDR(15) => N0,
      ADDRBWRADDR(14) => N1,
      ADDRBWRADDR(13) => N1,
      ADDRBWRADDR(12) => N1,
      ADDRBWRADDR(11) => N1,
      ADDRBWRADDR(10) => N1,
      ADDRBWRADDR(9) => addrb(4),
      ADDRBWRADDR(8) => addrb(3),
      ADDRBWRADDR(7) => addrb(2),
      ADDRBWRADDR(6) => addrb(1),
      ADDRBWRADDR(5) => addrb(0),
      ADDRBWRADDR(4) => N1,
      ADDRBWRADDR(3) => N1,
      ADDRBWRADDR(2) => N1,
      ADDRBWRADDR(1) => N1,
      ADDRBWRADDR(0) => N1,
      DIADI(31) => dina(106),
      DIADI(30) => dina(105),
      DIADI(29) => dina(104),
      DIADI(28) => dina(103),
      DIADI(27) => dina(102),
      DIADI(26) => dina(101),
      DIADI(25) => dina(100),
      DIADI(24) => dina(99),
      DIADI(23) => dina(97),
      DIADI(22) => dina(96),
      DIADI(21) => dina(95),
      DIADI(20) => dina(94),
      DIADI(19) => dina(93),
      DIADI(18) => dina(92),
      DIADI(17) => dina(91),
      DIADI(16) => dina(90),
      DIADI(15) => dina(88),
      DIADI(14) => dina(87),
      DIADI(13) => dina(86),
      DIADI(12) => dina(85),
      DIADI(11) => dina(84),
      DIADI(10) => dina(83),
      DIADI(9) => dina(82),
      DIADI(8) => dina(81),
      DIADI(7) => dina(79),
      DIADI(6) => dina(78),
      DIADI(5) => dina(77),
      DIADI(4) => dina(76),
      DIADI(3) => dina(75),
      DIADI(2) => dina(74),
      DIADI(1) => dina(73),
      DIADI(0) => dina(72),
      DIBDI(31) => dinb(106),
      DIBDI(30) => dinb(105),
      DIBDI(29) => dinb(104),
      DIBDI(28) => dinb(103),
      DIBDI(27) => dinb(102),
      DIBDI(26) => dinb(101),
      DIBDI(25) => dinb(100),
      DIBDI(24) => dinb(99),
      DIBDI(23) => dinb(97),
      DIBDI(22) => dinb(96),
      DIBDI(21) => dinb(95),
      DIBDI(20) => dinb(94),
      DIBDI(19) => dinb(93),
      DIBDI(18) => dinb(92),
      DIBDI(17) => dinb(91),
      DIBDI(16) => dinb(90),
      DIBDI(15) => dinb(88),
      DIBDI(14) => dinb(87),
      DIBDI(13) => dinb(86),
      DIBDI(12) => dinb(85),
      DIBDI(11) => dinb(84),
      DIBDI(10) => dinb(83),
      DIBDI(9) => dinb(82),
      DIBDI(8) => dinb(81),
      DIBDI(7) => dinb(79),
      DIBDI(6) => dinb(78),
      DIBDI(5) => dinb(77),
      DIBDI(4) => dinb(76),
      DIBDI(3) => dinb(75),
      DIBDI(2) => dinb(74),
      DIBDI(1) => dinb(73),
      DIBDI(0) => dinb(72),
      DIPADIP(3) => dina(107),
      DIPADIP(2) => dina(98),
      DIPADIP(1) => dina(89),
      DIPADIP(0) => dina(80),
      DIPBDIP(3) => dinb(107),
      DIPBDIP(2) => dinb(98),
      DIPBDIP(1) => dinb(89),
      DIPBDIP(0) => dinb(80),
      DOADO(31) => douta(106),
      DOADO(30) => douta(105),
      DOADO(29) => douta(104),
      DOADO(28) => douta(103),
      DOADO(27) => douta(102),
      DOADO(26) => douta(101),
      DOADO(25) => douta(100),
      DOADO(24) => douta(99),
      DOADO(23) => douta(97),
      DOADO(22) => douta(96),
      DOADO(21) => douta(95),
      DOADO(20) => douta(94),
      DOADO(19) => douta(93),
      DOADO(18) => douta(92),
      DOADO(17) => douta(91),
      DOADO(16) => douta(90),
      DOADO(15) => douta(88),
      DOADO(14) => douta(87),
      DOADO(13) => douta(86),
      DOADO(12) => douta(85),
      DOADO(11) => douta(84),
      DOADO(10) => douta(83),
      DOADO(9) => douta(82),
      DOADO(8) => douta(81),
      DOADO(7) => douta(79),
      DOADO(6) => douta(78),
      DOADO(5) => douta(77),
      DOADO(4) => douta(76),
      DOADO(3) => douta(75),
      DOADO(2) => douta(74),
      DOADO(1) => douta(73),
      DOADO(0) => douta(72),
      DOBDO(31) => doutb(106),
      DOBDO(30) => doutb(105),
      DOBDO(29) => doutb(104),
      DOBDO(28) => doutb(103),
      DOBDO(27) => doutb(102),
      DOBDO(26) => doutb(101),
      DOBDO(25) => doutb(100),
      DOBDO(24) => doutb(99),
      DOBDO(23) => doutb(97),
      DOBDO(22) => doutb(96),
      DOBDO(21) => doutb(95),
      DOBDO(20) => doutb(94),
      DOBDO(19) => doutb(93),
      DOBDO(18) => doutb(92),
      DOBDO(17) => doutb(91),
      DOBDO(16) => doutb(90),
      DOBDO(15) => doutb(88),
      DOBDO(14) => doutb(87),
      DOBDO(13) => doutb(86),
      DOBDO(12) => doutb(85),
      DOBDO(11) => doutb(84),
      DOBDO(10) => doutb(83),
      DOBDO(9) => doutb(82),
      DOBDO(8) => doutb(81),
      DOBDO(7) => doutb(79),
      DOBDO(6) => doutb(78),
      DOBDO(5) => doutb(77),
      DOBDO(4) => doutb(76),
      DOBDO(3) => doutb(75),
      DOBDO(2) => doutb(74),
      DOBDO(1) => doutb(73),
      DOBDO(0) => doutb(72),
      DOPADOP(3) => douta(107),
      DOPADOP(2) => douta(98),
      DOPADOP(1) => douta(89),
      DOPADOP(0) => douta(80),
      DOPBDOP(3) => doutb(107),
      DOPBDOP(2) => doutb(98),
      DOPBDOP(1) => doutb(89),
      DOPBDOP(0) => doutb(80),
      ECCPARITY(7) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_7_UNCONNECTED
,
      ECCPARITY(6) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_6_UNCONNECTED
,
      ECCPARITY(5) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_5_UNCONNECTED
,
      ECCPARITY(4) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_4_UNCONNECTED
,
      ECCPARITY(3) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_3_UNCONNECTED
,
      ECCPARITY(2) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_2_UNCONNECTED
,
      ECCPARITY(1) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_1_UNCONNECTED
,
      ECCPARITY(0) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_0_UNCONNECTED
,
      RDADDRECC(8) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_8_UNCONNECTED
,
      RDADDRECC(7) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_7_UNCONNECTED
,
      RDADDRECC(6) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_6_UNCONNECTED
,
      RDADDRECC(5) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_5_UNCONNECTED
,
      RDADDRECC(4) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_4_UNCONNECTED
,
      RDADDRECC(3) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_3_UNCONNECTED
,
      RDADDRECC(2) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_2_UNCONNECTED
,
      RDADDRECC(1) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_1_UNCONNECTED
,
      RDADDRECC(0) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_2_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_0_UNCONNECTED
,
      WEA(3) => wea(0),
      WEA(2) => wea(0),
      WEA(1) => wea(0),
      WEA(0) => wea(0),
      WEBWE(7) => N1,
      WEBWE(6) => N1,
      WEBWE(5) => N1,
      WEBWE(4) => N1,
      WEBWE(3) => web(0),
      WEBWE(2) => web(0),
      WEBWE(1) => web(0),
      WEBWE(0) => web(0)
    );
  U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram : RAMB36E1
    generic map(
      DOA_REG => 0,
      DOB_REG => 0,
      EN_ECC_READ => FALSE,
      EN_ECC_WRITE => FALSE,
      INITP_00 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_01 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_02 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_03 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_04 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_05 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_06 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_07 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_08 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_09 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INITP_0F => X"0000000000000000000000000000000000000000000000000000000000000000",
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
      INIT_40 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_41 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_42 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_43 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_44 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_45 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_46 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_47 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_48 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_49 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_4F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_50 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_51 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_52 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_53 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_54 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_55 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_56 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_57 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_58 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_59 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_5F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_60 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_61 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_62 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_63 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_64 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_65 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_66 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_67 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_68 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_69 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_6F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_70 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_71 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_72 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_73 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_74 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_75 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_76 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_77 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_78 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_79 => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7A => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7B => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7C => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7D => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7E => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_7F => X"0000000000000000000000000000000000000000000000000000000000000000",
      INIT_A => X"000000000",
      INIT_B => X"000000000",
      INIT_FILE => "NONE",
      RAM_EXTENSION_A => "NONE",
      RAM_EXTENSION_B => "NONE",
      RAM_MODE => "TDP",
      RDADDR_COLLISION_HWCONFIG => "DELAYED_WRITE",
      READ_WIDTH_A => 36,
      READ_WIDTH_B => 36,
      RSTREG_PRIORITY_A => "REGCE",
      RSTREG_PRIORITY_B => "REGCE",
      SIM_COLLISION_CHECK => "ALL",
      SIM_DEVICE => "VIRTEX6",
      SRVAL_A => X"000000000",
      SRVAL_B => X"000000000",
      WRITE_MODE_A => "WRITE_FIRST",
      WRITE_MODE_B => "WRITE_FIRST",
      WRITE_WIDTH_A => 36,
      WRITE_WIDTH_B => 36
    )
    port map (
      CASCADEINA => N1,
      CASCADEINB => N1,
      CASCADEOUTA => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_CASCADEOUTA_UNCONNECTED
,
      CASCADEOUTB => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_CASCADEOUTB_UNCONNECTED
,
      CLKARDCLK => clka,
      CLKBWRCLK => clkb,
      DBITERR => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DBITERR_UNCONNECTED
,
      ENARDEN => N0,
      ENBWREN => N0,
      INJECTDBITERR => N1,
      INJECTSBITERR => N1,
      REGCEAREGCE => N1,
      REGCEB => N1,
      RSTRAMARSTRAM => N1,
      RSTRAMB => N1,
      RSTREGARSTREG => N1,
      RSTREGB => N1,
      SBITERR => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_SBITERR_UNCONNECTED
,
      ADDRARDADDR(15) => N0,
      ADDRARDADDR(14) => N1,
      ADDRARDADDR(13) => N1,
      ADDRARDADDR(12) => N1,
      ADDRARDADDR(11) => N1,
      ADDRARDADDR(10) => N1,
      ADDRARDADDR(9) => addra(4),
      ADDRARDADDR(8) => addra(3),
      ADDRARDADDR(7) => addra(2),
      ADDRARDADDR(6) => addra(1),
      ADDRARDADDR(5) => addra(0),
      ADDRARDADDR(4) => N1,
      ADDRARDADDR(3) => N1,
      ADDRARDADDR(2) => N1,
      ADDRARDADDR(1) => N1,
      ADDRARDADDR(0) => N1,
      ADDRBWRADDR(15) => N0,
      ADDRBWRADDR(14) => N1,
      ADDRBWRADDR(13) => N1,
      ADDRBWRADDR(12) => N1,
      ADDRBWRADDR(11) => N1,
      ADDRBWRADDR(10) => N1,
      ADDRBWRADDR(9) => addrb(4),
      ADDRBWRADDR(8) => addrb(3),
      ADDRBWRADDR(7) => addrb(2),
      ADDRBWRADDR(6) => addrb(1),
      ADDRBWRADDR(5) => addrb(0),
      ADDRBWRADDR(4) => N1,
      ADDRBWRADDR(3) => N1,
      ADDRBWRADDR(2) => N1,
      ADDRBWRADDR(1) => N1,
      ADDRBWRADDR(0) => N1,
      DIADI(31) => N1,
      DIADI(30) => N1,
      DIADI(29) => N1,
      DIADI(28) => dina(127),
      DIADI(27) => dina(126),
      DIADI(26) => dina(125),
      DIADI(25) => dina(124),
      DIADI(24) => dina(123),
      DIADI(23) => N1,
      DIADI(22) => N1,
      DIADI(21) => N1,
      DIADI(20) => dina(122),
      DIADI(19) => dina(121),
      DIADI(18) => dina(120),
      DIADI(17) => dina(119),
      DIADI(16) => dina(118),
      DIADI(15) => N1,
      DIADI(14) => N1,
      DIADI(13) => N1,
      DIADI(12) => dina(117),
      DIADI(11) => dina(116),
      DIADI(10) => dina(115),
      DIADI(9) => dina(114),
      DIADI(8) => dina(113),
      DIADI(7) => N1,
      DIADI(6) => N1,
      DIADI(5) => N1,
      DIADI(4) => dina(112),
      DIADI(3) => dina(111),
      DIADI(2) => dina(110),
      DIADI(1) => dina(109),
      DIADI(0) => dina(108),
      DIBDI(31) => N1,
      DIBDI(30) => N1,
      DIBDI(29) => N1,
      DIBDI(28) => dinb(127),
      DIBDI(27) => dinb(126),
      DIBDI(26) => dinb(125),
      DIBDI(25) => dinb(124),
      DIBDI(24) => dinb(123),
      DIBDI(23) => N1,
      DIBDI(22) => N1,
      DIBDI(21) => N1,
      DIBDI(20) => dinb(122),
      DIBDI(19) => dinb(121),
      DIBDI(18) => dinb(120),
      DIBDI(17) => dinb(119),
      DIBDI(16) => dinb(118),
      DIBDI(15) => N1,
      DIBDI(14) => N1,
      DIBDI(13) => N1,
      DIBDI(12) => dinb(117),
      DIBDI(11) => dinb(116),
      DIBDI(10) => dinb(115),
      DIBDI(9) => dinb(114),
      DIBDI(8) => dinb(113),
      DIBDI(7) => N1,
      DIBDI(6) => N1,
      DIBDI(5) => N1,
      DIBDI(4) => dinb(112),
      DIBDI(3) => dinb(111),
      DIBDI(2) => dinb(110),
      DIBDI(1) => dinb(109),
      DIBDI(0) => dinb(108),
      DIPADIP(3) => N1,
      DIPADIP(2) => N1,
      DIPADIP(1) => N1,
      DIPADIP(0) => N1,
      DIPBDIP(3) => N1,
      DIPBDIP(2) => N1,
      DIPBDIP(1) => N1,
      DIPBDIP(0) => N1,
      DOADO(31) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_31_UNCONNECTED
,
      DOADO(30) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_30_UNCONNECTED
,
      DOADO(29) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_29_UNCONNECTED
,
      DOADO(28) => douta(127),
      DOADO(27) => douta(126),
      DOADO(26) => douta(125),
      DOADO(25) => douta(124),
      DOADO(24) => douta(123),
      DOADO(23) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_23_UNCONNECTED
,
      DOADO(22) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_22_UNCONNECTED
,
      DOADO(21) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_21_UNCONNECTED
,
      DOADO(20) => douta(122),
      DOADO(19) => douta(121),
      DOADO(18) => douta(120),
      DOADO(17) => douta(119),
      DOADO(16) => douta(118),
      DOADO(15) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_15_UNCONNECTED
,
      DOADO(14) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_14_UNCONNECTED
,
      DOADO(13) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_13_UNCONNECTED
,
      DOADO(12) => douta(117),
      DOADO(11) => douta(116),
      DOADO(10) => douta(115),
      DOADO(9) => douta(114),
      DOADO(8) => douta(113),
      DOADO(7) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_7_UNCONNECTED
,
      DOADO(6) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_6_UNCONNECTED
,
      DOADO(5) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOADO_5_UNCONNECTED
,
      DOADO(4) => douta(112),
      DOADO(3) => douta(111),
      DOADO(2) => douta(110),
      DOADO(1) => douta(109),
      DOADO(0) => douta(108),
      DOBDO(31) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_31_UNCONNECTED
,
      DOBDO(30) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_30_UNCONNECTED
,
      DOBDO(29) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_29_UNCONNECTED
,
      DOBDO(28) => doutb(127),
      DOBDO(27) => doutb(126),
      DOBDO(26) => doutb(125),
      DOBDO(25) => doutb(124),
      DOBDO(24) => doutb(123),
      DOBDO(23) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_23_UNCONNECTED
,
      DOBDO(22) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_22_UNCONNECTED
,
      DOBDO(21) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_21_UNCONNECTED
,
      DOBDO(20) => doutb(122),
      DOBDO(19) => doutb(121),
      DOBDO(18) => doutb(120),
      DOBDO(17) => doutb(119),
      DOBDO(16) => doutb(118),
      DOBDO(15) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_15_UNCONNECTED
,
      DOBDO(14) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_14_UNCONNECTED
,
      DOBDO(13) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_13_UNCONNECTED
,
      DOBDO(12) => doutb(117),
      DOBDO(11) => doutb(116),
      DOBDO(10) => doutb(115),
      DOBDO(9) => doutb(114),
      DOBDO(8) => doutb(113),
      DOBDO(7) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_7_UNCONNECTED
,
      DOBDO(6) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_6_UNCONNECTED
,
      DOBDO(5) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOBDO_5_UNCONNECTED
,
      DOBDO(4) => doutb(112),
      DOBDO(3) => doutb(111),
      DOBDO(2) => doutb(110),
      DOBDO(1) => doutb(109),
      DOBDO(0) => doutb(108),
      DOPADOP(3) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOPADOP_3_UNCONNECTED
,
      DOPADOP(2) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOPADOP_2_UNCONNECTED
,
      DOPADOP(1) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOPADOP_1_UNCONNECTED
,
      DOPADOP(0) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOPADOP_0_UNCONNECTED
,
      DOPBDOP(3) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOPBDOP_3_UNCONNECTED
,
      DOPBDOP(2) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOPBDOP_2_UNCONNECTED
,
      DOPBDOP(1) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOPBDOP_1_UNCONNECTED
,
      DOPBDOP(0) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_DOPBDOP_0_UNCONNECTED
,
      ECCPARITY(7) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_7_UNCONNECTED
,
      ECCPARITY(6) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_6_UNCONNECTED
,
      ECCPARITY(5) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_5_UNCONNECTED
,
      ECCPARITY(4) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_4_UNCONNECTED
,
      ECCPARITY(3) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_3_UNCONNECTED
,
      ECCPARITY(2) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_2_UNCONNECTED
,
      ECCPARITY(1) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_1_UNCONNECTED
,
      ECCPARITY(0) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_ECCPARITY_0_UNCONNECTED
,
      RDADDRECC(8) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_8_UNCONNECTED
,
      RDADDRECC(7) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_7_UNCONNECTED
,
      RDADDRECC(6) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_6_UNCONNECTED
,
      RDADDRECC(5) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_5_UNCONNECTED
,
      RDADDRECC(4) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_4_UNCONNECTED
,
      RDADDRECC(3) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_3_UNCONNECTED
,
      RDADDRECC(2) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_2_UNCONNECTED
,
      RDADDRECC(1) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_1_UNCONNECTED
,
      RDADDRECC(0) => 
NLW_U0_xst_blk_mem_generator_gnativebmg_native_blk_mem_gen_valid_cstr_ramloop_3_ram_r_v6_init_ram_NO_BMM_INFO_TRUE_DP_SIMPLE_PRIM36_ram_RDADDRECC_0_UNCONNECTED
,
      WEA(3) => wea(0),
      WEA(2) => wea(0),
      WEA(1) => wea(0),
      WEA(0) => wea(0),
      WEBWE(7) => N1,
      WEBWE(6) => N1,
      WEBWE(5) => N1,
      WEBWE(4) => N1,
      WEBWE(3) => web(0),
      WEBWE(2) => web(0),
      WEBWE(1) => web(0),
      WEBWE(0) => web(0)
    );

end STRUCTURE;

-- synthesis translate_on
