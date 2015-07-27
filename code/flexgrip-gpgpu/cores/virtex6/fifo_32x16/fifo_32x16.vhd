--------------------------------------------------------------------------------
-- Copyright (c) 1995-2012 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.28xd
--  \   \         Application: netgen
--  /   /         Filename: fifo_32x16.vhd
-- /___/   /\     Timestamp: Wed Oct 24 20:00:55 2012
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -w -sim -ofmt vhdl I:/GPGPU/gpgpu-1.0.1/src/RAMs-Virtex6/fifo_32x16/tmp/_cg/fifo_32x16.ngc I:/GPGPU/gpgpu-1.0.1/src/RAMs-Virtex6/fifo_32x16/tmp/_cg/fifo_32x16.vhd 
-- Device	: 6vlx240tff1156-1
-- Input file	: I:/GPGPU/gpgpu-1.0.1/src/RAMs-Virtex6/fifo_32x16/tmp/_cg/fifo_32x16.ngc
-- Output file	: I:/GPGPU/gpgpu-1.0.1/src/RAMs-Virtex6/fifo_32x16/tmp/_cg/fifo_32x16.vhd
-- # of Entities	: 1
-- Design Name	: fifo_32x16
-- Xilinx	: C:\Xilinx\14.2\ISE_DS\ISE\
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

entity fifo_32x16 is
  port (
    clk : in STD_LOGIC := 'X'; 
    rst : in STD_LOGIC := 'X'; 
    wr_en : in STD_LOGIC := 'X'; 
    rd_en : in STD_LOGIC := 'X'; 
    full : out STD_LOGIC; 
    empty : out STD_LOGIC; 
    din : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 ) 
  );
end fifo_32x16;

architecture STRUCTURE of fifo_32x16 is
  signal N1 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_i_4 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_i_5 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_grstd1_grst_full_rst_d2_40 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_RST_FULL_GEN_41 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_GND_12_o_MUX_2_o : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_comb : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_wr_rst_asreg_GND_12_o_MUX_1_o : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_d2_82 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_d1_83 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_84 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_wr_rst_asreg_d2_85 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_wr_rst_asreg_d1_86 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_wr_rst_asreg_87 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_grstd1_grst_full_rst_d3_88 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_grstd1_grst_full_rst_d1_89 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_comb_122 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_comb : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_GND_26_o_count_3_mux_3_OUT_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_GND_26_o_count_3_mux_3_OUT_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_GND_23_o_count_3_mux_3_OUT_3_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_GND_23_o_count_3_mux_3_OUT_2_Q : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_cntr_en : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_fb_i_132 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_fb_i_133 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count_0_rstpot_144 : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count_1_rstpot_145 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal N7 : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_31_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_30_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_29_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_28_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_27_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_26_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_25_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_24_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_23_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_22_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_21_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_20_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_19_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_18_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_17_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_16_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_15_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_14_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_13_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_12_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_11_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_10_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_9_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_8_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_7_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_6_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_5_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_4_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_3_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_2_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_1_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_0_gv5_srl32_Q31_UNCONNECTED : STD_LOGIC; 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count : STD_LOGIC_VECTOR ( 3 downto 2 ); 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg : STD_LOGIC_VECTOR ( 1 downto 0 ); 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_Result : STD_LOGIC_VECTOR ( 3 downto 1 ); 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count : STD_LOGIC_VECTOR ( 3 downto 1 ); 
  signal U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count : STD_LOGIC_VECTOR ( 3 downto 0 ); 
begin
  dout(31) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(31);
  dout(30) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(30);
  dout(29) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(29);
  dout(28) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(28);
  dout(27) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(27);
  dout(26) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(26);
  dout(25) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(25);
  dout(24) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(24);
  dout(23) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(23);
  dout(22) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(22);
  dout(21) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(21);
  dout(20) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(20);
  dout(19) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(19);
  dout(18) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(18);
  dout(17) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(17);
  dout(16) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(16);
  dout(15) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(15);
  dout(14) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(14);
  dout(13) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(13);
  dout(12) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(12);
  dout(11) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(11);
  dout(10) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(10);
  dout(9) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(9);
  dout(8) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(8);
  dout(7) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(7);
  dout(6) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(6);
  dout(5) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(5);
  dout(4) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(4);
  dout(3) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(3);
  dout(2) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(2);
  dout(1) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(1);
  dout(0) <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(0);
  full <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_i_5;
  empty <= U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_i_4;
  XST_GND : GND
    port map (
      G => N1
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_RST_FULL_GEN : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => rst,
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_grstd1_grst_full_rst_d3_88,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_RST_FULL_GEN_41
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg : FDP
    port map (
      C => clk,
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_GND_12_o_MUX_2_o,
      PRE => rst,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_84
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_wr_rst_asreg : FDP
    port map (
      C => clk,
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_wr_rst_asreg_GND_12_o_MUX_1_o,
      PRE => rst,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_wr_rst_asreg_87
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_grstd1_grst_full_rst_d3 : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_grstd1_grst_full_rst_d2_40,
      PRE => rst,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_grstd1_grst_full_rst_d3_88
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_d2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_d1_83,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_d2_82
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_wr_rst_asreg_d2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_wr_rst_asreg_d1_86,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_wr_rst_asreg_d2_85
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_grstd1_grst_full_rst_d2 : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_grstd1_grst_full_rst_d1_89,
      PRE => rst,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_grstd1_grst_full_rst_d2_40
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg_1 : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => N1,
      PRE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_comb,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(1)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg_0 : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => N1,
      PRE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_comb,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_d1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_84,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_d1_83
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_wr_rst_asreg_d1 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_wr_rst_asreg_87,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_wr_rst_asreg_d1_86
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_grstd1_grst_full_rst_d1 : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => N1,
      PRE => rst,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_grstd1_grst_full_rst_d1_89
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_31 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(31),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(31)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_30 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(30),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(30)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_29 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(29),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(29)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_28 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(28),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(28)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_27 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(27),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(27)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_26 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(26),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(26)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_25 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(25),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(25)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_24 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(24),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(24)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_23 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(23),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(23)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_22 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(22),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(22)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_21 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(21),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(21)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_20 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(20),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(20)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_19 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(19),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(19)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_18 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(18),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(18)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_17 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(17),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(17)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_16 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(16),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(16)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_15 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(15),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(15)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_14 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(14),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(14)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_13 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(13),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(13)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_12 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(12),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(12)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_11 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(11),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(11)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_10 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(10),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(10)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_9 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(9),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(9)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_8 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(8),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(8)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_7 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(7),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(7)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_6 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(6),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(6)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_5 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(5),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(5)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_4 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(4),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(4)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(3),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(3)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(2),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(2)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(1),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(1)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i_0 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(0),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(0),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_i(0)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_31_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(31),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(31),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_31_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_30_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(30),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(30),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_30_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_29_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(29),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(29),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_29_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_28_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(28),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(28),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_28_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_27_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(27),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(27),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_27_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_26_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(26),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(26),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_26_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_25_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(25),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(25),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_25_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_24_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(24),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(24),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_24_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_23_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(23),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(23),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_23_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_22_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(22),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(22),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_22_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_21_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(21),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(21),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_21_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_20_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(20),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(20),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_20_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_19_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(19),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(19),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_19_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_18_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(18),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(18),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_18_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_17_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(17),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(17),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_17_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_16_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(16),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(16),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_16_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_15_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(15),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(15),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_15_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_14_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(14),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(14),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_14_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_13_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(13),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(13),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_13_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_12_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(12),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(12),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_12_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_11_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(11),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(11),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_11_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_10_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(10),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(10),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_10_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_9_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(9),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(9),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_9_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_8_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(8),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(8),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_8_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_7_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(7),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(7),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_7_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_6_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(6),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(6),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_6_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_5_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(5),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(5),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_5_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_4_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(4),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(4),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_4_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_3_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(3),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(3),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_3_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_2_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(2),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(2),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_2_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_1_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(1),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(1),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_1_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_0_gv5_srl32 : SRLC32E
    generic map(
      INIT => X"00000000"
    )
    port map (
      CLK => clk,
      D => din(0),
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_dout_mem(0),
      Q31 => NLW_U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_mem_gsm_sm_gsm1_sm1_gram_gsms_0_gv5_srl32_Q31_UNCONNECTED,
      A(4) => N1,
      A(3) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      A(2) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      A(1) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv,
      A(0) => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_fb_i : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_comb_122,
      PRE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(1),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_fb_i_132
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_i : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_comb_122,
      PRE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(1),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_i_4
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_fb_i : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_comb,
      PRE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_grstd1_grst_full_rst_d2_40,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_fb_i_133
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_i : FDP
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_comb,
      PRE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_grstd1_grst_full_rst_d2_40,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_i_5
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_cntr_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(1),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_Result(3),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(3)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_cntr_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(1),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_Result(2),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(2)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count_1 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_cntr_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(1),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_Result(1),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(1)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count_2 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_cntr_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(1),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_GND_26_o_count_3_mux_3_OUT_2_Q,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count(2)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count_3 : FDCE
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_cntr_en,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(1),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_GND_26_o_count_3_mux_3_OUT_3_Q,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count(3)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count_2 : FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_cntr_en,
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_GND_23_o_count_3_mux_3_OUT_2_Q,
      PRE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(1),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count_3 : FDPE
    generic map(
      INIT => '1'
    )
    port map (
      C => clk,
      CE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_cntr_en,
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_GND_23_o_count_3_mux_3_OUT_3_Q,
      PRE => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(1),
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_Mmux_rd_rst_asreg_GND_12_o_MUX_2_o11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_d1_83,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_84,
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_GND_12_o_MUX_2_o
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_Mmux_wr_rst_asreg_GND_12_o_MUX_1_o11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_wr_rst_asreg_d1_86,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_wr_rst_asreg_87,
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_wr_rst_asreg_GND_12_o_MUX_1_o
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_comb1 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_d2_82,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_asreg_84,
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_rd_rst_comb
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_ram_rd_en_i1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => rd_en,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_fb_i_132,
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_ram_wr_en_i1 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => wr_en,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_fb_i_133,
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_comb_SW0 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(3),
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(2),
      O => N2
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_comb : LUT6
    generic map(
      INIT => X"F0F0F0C0F0F0F2F0"
    )
    port map (
      I0 => rd_en,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(1),
      I2 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_fb_i_132,
      I3 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(0),
      I4 => N2,
      I5 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_wr_en,
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_comb_122
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_Mxor_cntr_en_xo_0_1 : LUT4
    generic map(
      INIT => X"0CA6"
    )
    port map (
      I0 => rd_en,
      I1 => wr_en,
      I2 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_fb_i_133,
      I3 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_fb_i_132,
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_cntr_en
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count_0 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(1),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count_0_rstpot_144,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(0)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count_1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk,
      CLR => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_ngwrdrst_grst_rd_rst_reg(1),
      D => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count_1_rstpot_145,
      Q => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count(1)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_Maddsub_GND_26_o_count_3_mux_3_OUT_xor_3_11 : LUT6
    generic map(
      INIT => X"9AAAAAA69A9AAAAA"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count(3),
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(0),
      I2 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count(2),
      I3 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_fb_i_132,
      I4 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count(1),
      I5 => rd_en,
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_GND_26_o_count_3_mux_3_OUT_3_Q
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_Maddsub_GND_23_o_count_3_mux_3_OUT_xor_3_11 : LUT6
    generic map(
      INIT => X"A9AAA9AAAA6AA9AA"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(3),
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(0),
      I2 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count(1),
      I3 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      I4 => rd_en,
      I5 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_fb_i_132,
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_GND_23_o_count_3_mux_3_OUT_3_Q
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count_1_rstpot : LUT6
    generic map(
      INIT => X"D2B4F0A5C3F0F0F0"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_fb_i_133,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_fb_i_132,
      I2 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count(1),
      I3 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(0),
      I4 => rd_en,
      I5 => wr_en,
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count_1_rstpot_145
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_Mcount_count_xor_3_11 : LUT6
    generic map(
      INIT => X"6CCCCCC93CCCCCCC"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_fb_i_132,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(3),
      I2 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(2),
      I3 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(1),
      I4 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(0),
      I5 => rd_en,
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_Result(3)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count_0_rstpot : LUT5
    generic map(
      INIT => X"96A5C3F0"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_fb_i_133,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_fb_i_132,
      I2 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(0),
      I3 => rd_en,
      I4 => wr_en,
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count_0_rstpot_144
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_Maddsub_GND_23_o_count_3_mux_3_OUT_xor_2_11 : LUT5
    generic map(
      INIT => X"AA6A99A9"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_count(2),
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count(1),
      I2 => rd_en,
      I3 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_fb_i_132,
      I4 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(0),
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_crd_GND_23_o_count_3_mux_3_OUT_2_Q
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_Maddsub_GND_26_o_count_3_mux_3_OUT_xor_2_11 : LUT5
    generic map(
      INIT => X"A9AA6A66"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count(2),
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count(1),
      I2 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_fb_i_132,
      I3 => rd_en,
      I4 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(0),
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_GND_26_o_count_3_mux_3_OUT_2_Q
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_Mcount_count_xor_2_11 : LUT5
    generic map(
      INIT => X"6A66A9AA"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(2),
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(1),
      I2 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_fb_i_132,
      I3 => rd_en,
      I4 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(0),
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_Result(2)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_Mcount_count_xor_1_11 : LUT4
    generic map(
      INIT => X"659A"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(1),
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_rsts_ram_empty_fb_i_132,
      I2 => rd_en,
      I3 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(0),
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_Result(1)
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_comb3 : MUXF7
    port map (
      I0 => N6,
      I1 => N7,
      S => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_fb_i_133,
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_comb
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_comb3_F : LUT6
    generic map(
      INIT => X"0000000000040000"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count(3),
      I1 => wr_en,
      I2 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count(2),
      I3 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count(1),
      I4 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(0),
      I5 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      O => N6
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_wsts_ram_full_comb3_G : LUT6
    generic map(
      INIT => X"5555555455555555"
    )
    port map (
      I0 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_rstblk_RST_FULL_GEN_41,
      I1 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(1),
      I2 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(2),
      I3 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(3),
      I4 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(0),
      I5 => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_ram_rd_en,
      O => N7
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv1_INV_0 : INV
    port map (
      I => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c1_count(1),
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_plus1_1_inv
    );
  U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv1_INV_0 : INV
    port map (
      I => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_c0_count(0),
      O => U0_xst_fifo_generator_gconvfifo_rf_grf_rf_gntv_or_sync_fifo_gl1_lsshft_pntr_0_inv
    );

end STRUCTURE;

-- synthesis translate_on
