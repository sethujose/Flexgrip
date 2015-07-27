library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "compute_set_pred_i/Subsystem"

entity subsystem_entity_c5104c640d is
  port (
    a: in std_logic_vector(31 downto 0); 
    b: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    is_signed: in std_logic; 
    set_cond: in std_logic_vector(2 downto 0); 
    w32: in std_logic; 
    result: out std_logic_vector(31 downto 0); 
    sign: out std_logic; 
    zero: out std_logic
  );
end subsystem_entity_c5104c640d;

architecture structural of subsystem_entity_c5104c640d is
  signal addsub_s_net: std_logic_vector(1 downto 0);
  signal ce_1_sg_x0: std_logic;
  signal clk_1_sg_x0: std_logic;
  signal constant10_op_net: std_logic;
  signal constant1_op_net: std_logic_vector(7 downto 0);
  signal constant2_op_net: std_logic_vector(7 downto 0);
  signal constant3_op_net: std_logic_vector(7 downto 0);
  signal constant4_op_net: std_logic_vector(7 downto 0);
  signal constant5_op_net: std_logic_vector(31 downto 0);
  signal constant6_op_net: std_logic;
  signal constant7_op_net: std_logic;
  signal constant8_op_net: std_logic_vector(31 downto 0);
  signal constant9_op_net: std_logic;
  signal convert1_dout_net: std_logic_vector(31 downto 0);
  signal convert2_dout_net: std_logic_vector(15 downto 0);
  signal convert3_dout_net: std_logic_vector(31 downto 0);
  signal convert4_dout_net: std_logic_vector(15 downto 0);
  signal convert5_dout_net: std_logic;
  signal convert6_dout_net: std_logic;
  signal convert7_dout_net: std_logic;
  signal convert8_dout_net: std_logic;
  signal convert9_dout_net: std_logic_vector(30 downto 0);
  signal convert_dout_net: std_logic;
  signal inverter_op_net: std_logic;
  signal is_signed_in_net_x0: std_logic;
  signal logical1_y_net: std_logic;
  signal logical2_y_net: std_logic;
  signal logical3_y_net: std_logic_vector(7 downto 0);
  signal logical_y_net: std_logic;
  signal mux2_y_net: std_logic_vector(7 downto 0);
  signal mux3_y_net: std_logic_vector(31 downto 0);
  signal mux4_y_net: std_logic_vector(31 downto 0);
  signal mux5_y_net: std_logic_vector(7 downto 0);
  signal mux6_y_net_x0: std_logic;
  signal mux7_y_net_x0: std_logic;
  signal mux8_y_net: std_logic;
  signal negate_op_net_x0: std_logic_vector(31 downto 0);
  signal relational1_op_net: std_logic;
  signal relational2_op_net: std_logic;
  signal relational3_op_net: std_logic;
  signal relational4_op_net: std_logic;
  signal relational5_op_net: std_logic;
  signal set_cond_in_net_x0: std_logic_vector(2 downto 0);
  signal slice1_y_net: std_logic;
  signal slice2_y_net: std_logic;
  signal slice_y_net: std_logic;
  signal src_1_in_net_x0: std_logic_vector(31 downto 0);
  signal src_2_in_net_x0: std_logic_vector(31 downto 0);
  signal w32_in_net_x0: std_logic;

begin
  src_1_in_net_x0 <= a;
  src_2_in_net_x0 <= b;
  ce_1_sg_x0 <= ce_1;
  clk_1_sg_x0 <= clk_1;
  is_signed_in_net_x0 <= is_signed;
  set_cond_in_net_x0 <= set_cond;
  w32_in_net_x0 <= w32;
  result <= negate_op_net_x0;
  sign <= mux7_y_net_x0;
  zero <= mux6_y_net_x0;

  addsub: entity work.xladdsub_compute_set_pred_i
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 8,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 8,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 9,
      core_name0 => "addsb_11_0_466a9d5db3d8f7f1",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 9,
      latency => 0,
      overflow => 2,
      quantization => 1,
      s_arith => xlUnsigned,
      s_bin_pt => 0,
      s_width => 2
    )
    port map (
      a => constant4_op_net,
      b => mux5_y_net,
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      en => "1",
      s => addsub_s_net
    );

  constant1: entity work.constant_b437b02512
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net
    );

  constant10: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant10_op_net
    );

  constant2: entity work.constant_91ef1678ca
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net
    );

  constant3: entity work.constant_bc54100077
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant3_op_net
    );

  constant4: entity work.constant_bc54100077
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant4_op_net
    );

  constant5: entity work.constant_37567836aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant5_op_net
    );

  constant6: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant6_op_net
    );

  constant7: entity work.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant7_op_net
    );

  constant8: entity work.constant_37567836aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant8_op_net
    );

  constant9: entity work.constant_6293007044
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant9_op_net
    );

  convert: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      din(0) => relational1_op_net,
      en => "1",
      dout(0) => convert_dout_net
    );

  convert1: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 32,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 32,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      din => src_1_in_net_x0,
      en => "1",
      dout => convert1_dout_net
    );

  convert2: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 32,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 16,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      din => src_1_in_net_x0,
      en => "1",
      dout => convert2_dout_net
    );

  convert3: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 32,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 32,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      din => src_2_in_net_x0,
      en => "1",
      dout => convert3_dout_net
    );

  convert4: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 32,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 16,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      din => src_2_in_net_x0,
      en => "1",
      dout => convert4_dout_net
    );

  convert5: entity work.xlconvert
    generic map (
      bool_conversion => 1,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      din(0) => is_signed_in_net_x0,
      en => "1",
      dout(0) => convert5_dout_net
    );

  convert6: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      din(0) => logical2_y_net,
      en => "1",
      dout(0) => convert6_dout_net
    );

  convert7: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      din(0) => relational4_op_net,
      en => "1",
      dout(0) => convert7_dout_net
    );

  convert8: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      din(0) => relational5_op_net,
      en => "1",
      dout(0) => convert8_dout_net
    );

  convert9: entity work.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 31,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      din(0) => mux8_y_net,
      en => "1",
      dout => convert9_dout_net
    );

  inverter: entity work.inverter_e5b38cca3b
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip(0) => convert5_dout_net,
      op(0) => inverter_op_net
    );

  logical: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => convert5_dout_net,
      d1(0) => relational2_op_net,
      y(0) => logical_y_net
    );

  logical1: entity work.logical_80f90b97d0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => inverter_op_net,
      d1(0) => relational3_op_net,
      y(0) => logical1_y_net
    );

  logical2: entity work.logical_aacf6e1b0e
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical_y_net,
      d1(0) => logical1_y_net,
      y(0) => logical2_y_net
    );

  logical3: entity work.logical_a8f7ff4c23
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => mux2_y_net,
      d1 => constant3_op_net,
      y => logical3_y_net
    );

  mux2: entity work.mux_2af8d8c05a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => constant2_op_net,
      d1 => constant1_op_net,
      sel(0) => convert_dout_net,
      y => mux2_y_net
    );

  mux3: entity work.mux_6ef2c99a1b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => convert2_dout_net,
      d1 => convert1_dout_net,
      sel(0) => w32_in_net_x0,
      y => mux3_y_net
    );

  mux4: entity work.mux_6ef2c99a1b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => convert4_dout_net,
      d1 => convert3_dout_net,
      sel(0) => w32_in_net_x0,
      y => mux4_y_net
    );

  mux5: entity work.mux_2af8d8c05a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => mux2_y_net,
      d1 => logical3_y_net,
      sel(0) => convert6_dout_net,
      y => mux5_y_net
    );

  mux6: entity work.mux_67acc0d350
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => constant7_op_net,
      d1(0) => constant6_op_net,
      sel(0) => convert7_dout_net,
      y(0) => mux6_y_net_x0
    );

  mux7: entity work.mux_67acc0d350
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => constant10_op_net,
      d1(0) => constant9_op_net,
      sel(0) => convert8_dout_net,
      y(0) => mux7_y_net_x0
    );

  mux8: entity work.mux_a3706fc7d1
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => slice_y_net,
      d1(0) => slice1_y_net,
      d2(0) => slice2_y_net,
      sel => addsub_s_net,
      y(0) => mux8_y_net
    );

  negate: entity work.negate_9ede1a16c5
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => convert9_dout_net,
      op => negate_op_net_x0
    );

  relational1: entity work.relational_3ffd1d0a40
    port map (
      a => src_1_in_net_x0,
      b => src_2_in_net_x0,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational1_op_net
    );

  relational2: entity work.relational_3ff7ebf1f0
    port map (
      a => mux3_y_net,
      b => mux4_y_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational2_op_net
    );

  relational3: entity work.relational_59ca12fcca
    port map (
      a => src_1_in_net_x0,
      b => src_2_in_net_x0,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational3_op_net
    );

  relational4: entity work.relational_73637bf7b8
    port map (
      a => negate_op_net_x0,
      b => constant5_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational4_op_net
    );

  relational5: entity work.relational_3ff7ebf1f0
    port map (
      a => negate_op_net_x0,
      b => constant8_op_net,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational5_op_net
    );

  slice: entity work.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 0,
      x_width => 3,
      y_width => 1
    )
    port map (
      x => set_cond_in_net_x0,
      y(0) => slice_y_net
    );

  slice1: entity work.xlslice
    generic map (
      new_lsb => 1,
      new_msb => 1,
      x_width => 3,
      y_width => 1
    )
    port map (
      x => set_cond_in_net_x0,
      y(0) => slice1_y_net
    );

  slice2: entity work.xlslice
    generic map (
      new_lsb => 2,
      new_msb => 2,
      x_width => 3,
      y_width => 1
    )
    port map (
      x => set_cond_in_net_x0,
      y(0) => slice2_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
use work.conv_pkg.all;

-- Generated from Simulink block "compute_set_pred_i"

entity compute_set_pred_i is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    is_signed_in: in std_logic; 
    set_cond_in: in std_logic_vector(2 downto 0); 
    src_1_in: in std_logic_vector(31 downto 0); 
    src_2_in: in std_logic_vector(31 downto 0); 
    w32_in: in std_logic; 
    result_out: out std_logic_vector(31 downto 0); 
    sign_out: out std_logic; 
    zero_out: out std_logic
  );
end compute_set_pred_i;

architecture structural of compute_set_pred_i is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "compute_set_pred_i,sysgen_core,{clock_period=10.00000000,clocking=Clock_Enables,compilation=NGC_Netlist,sample_periods=1.00000000000,testbench=0,total_blocks=70,xilinx_adder_subtracter_block=1,xilinx_arithmetic_relational_operator_block=5,xilinx_bit_slice_extractor_block=3,xilinx_bus_multiplexer_block=7,xilinx_constant_block_block=10,xilinx_gateway_in_block=5,xilinx_gateway_out_block=3,xilinx_inverter_block=1,xilinx_logical_block_block=4,xilinx_negate_block_block=1,xilinx_resource_estimator_block=1,xilinx_system_generator_block=1,xilinx_type_converter_block=10,}";

  signal ce_1_sg_x1: std_logic;
  signal clk_1_sg_x1: std_logic;
  signal is_signed_in_net: std_logic;
  signal result_out_net: std_logic_vector(31 downto 0);
  signal set_cond_in_net: std_logic_vector(2 downto 0);
  signal sign_out_net: std_logic;
  signal src_1_in_net: std_logic_vector(31 downto 0);
  signal src_2_in_net: std_logic_vector(31 downto 0);
  signal w32_in_net: std_logic;
  signal zero_out_net: std_logic;

begin
  ce_1_sg_x1 <= ce_1;
  clk_1_sg_x1 <= clk_1;
  is_signed_in_net <= is_signed_in;
  set_cond_in_net <= set_cond_in;
  src_1_in_net <= src_1_in;
  src_2_in_net <= src_2_in;
  w32_in_net <= w32_in;
  result_out <= result_out_net;
  sign_out <= sign_out_net;
  zero_out <= zero_out_net;

  subsystem_c5104c640d: entity work.subsystem_entity_c5104c640d
    port map (
      a => src_1_in_net,
      b => src_2_in_net,
      ce_1 => ce_1_sg_x1,
      clk_1 => clk_1_sg_x1,
      is_signed => is_signed_in_net,
      set_cond => set_cond_in_net,
      w32 => w32_in_net,
      result => result_out_net,
      sign => sign_out_net,
      zero => zero_out_net
    );

end structural;
