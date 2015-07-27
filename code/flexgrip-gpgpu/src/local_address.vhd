--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2012 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- You must compile the wrapper file addsb_11_0_994b511eee23f4bc.vhd when simulating
-- the core, addsb_11_0_994b511eee23f4bc. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
LIBRARY XilinxCoreLib;
-- synthesis translate_on
ENTITY addsb_11_0_994b511eee23f4bc IS
  PORT (
    a : IN STD_LOGIC_VECTOR(64 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(64 DOWNTO 0);
    s : OUT STD_LOGIC_VECTOR(64 DOWNTO 0)
  );
END addsb_11_0_994b511eee23f4bc;

ARCHITECTURE addsb_11_0_994b511eee23f4bc_a OF addsb_11_0_994b511eee23f4bc IS
-- synthesis translate_off
COMPONENT wrapped_addsb_11_0_994b511eee23f4bc
  PORT (
    a : IN STD_LOGIC_VECTOR(64 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(64 DOWNTO 0);
    s : OUT STD_LOGIC_VECTOR(64 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_addsb_11_0_994b511eee23f4bc USE ENTITY XilinxCoreLib.c_addsub_v11_0(behavioral)
    GENERIC MAP (
      c_a_type => 1,
      c_a_width => 65,
      c_add_mode => 0,
      c_ainit_val => "0",
      c_b_constant => 0,
      c_b_type => 1,
      c_b_value => "00000000000000000000000000000000000000000000000000000000000000000",
      c_b_width => 65,
      c_borrow_low => 1,
      c_bypass_low => 0,
      c_ce_overrides_bypass => 1,
      c_ce_overrides_sclr => 0,
      c_has_bypass => 0,
      c_has_c_in => 0,
      c_has_c_out => 0,
      c_has_ce => 0,
      c_has_sclr => 0,
      c_has_sinit => 0,
      c_has_sset => 0,
      c_implementation => 0,
      c_latency => 0,
      c_out_width => 65,
      c_sclr_overrides_sset => 0,
      c_sinit_val => "0",
      c_verbosity => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_addsb_11_0_994b511eee23f4bc
  PORT MAP (
    a => a,
    b => b,
    s => s
  );
-- synthesis translate_on

END addsb_11_0_994b511eee23f4bc_a;
--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2012 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- You must compile the wrapper file addsb_11_0_f45daeb7eb283db0.vhd when simulating
-- the core, addsb_11_0_f45daeb7eb283db0. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
LIBRARY XilinxCoreLib;
-- synthesis translate_on
ENTITY addsb_11_0_f45daeb7eb283db0 IS
  PORT (
    a : IN STD_LOGIC_VECTOR(32 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(32 DOWNTO 0);
    s : OUT STD_LOGIC_VECTOR(32 DOWNTO 0)
  );
END addsb_11_0_f45daeb7eb283db0;

ARCHITECTURE addsb_11_0_f45daeb7eb283db0_a OF addsb_11_0_f45daeb7eb283db0 IS
-- synthesis translate_off
COMPONENT wrapped_addsb_11_0_f45daeb7eb283db0
  PORT (
    a : IN STD_LOGIC_VECTOR(32 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(32 DOWNTO 0);
    s : OUT STD_LOGIC_VECTOR(32 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_addsb_11_0_f45daeb7eb283db0 USE ENTITY XilinxCoreLib.c_addsub_v11_0(behavioral)
    GENERIC MAP (
      c_a_type => 1,
      c_a_width => 33,
      c_add_mode => 0,
      c_ainit_val => "0",
      c_b_constant => 0,
      c_b_type => 1,
      c_b_value => "000000000000000000000000000000000",
      c_b_width => 33,
      c_borrow_low => 1,
      c_bypass_low => 0,
      c_ce_overrides_bypass => 1,
      c_ce_overrides_sclr => 0,
      c_has_bypass => 0,
      c_has_c_in => 0,
      c_has_c_out => 0,
      c_has_ce => 0,
      c_has_sclr => 0,
      c_has_sinit => 0,
      c_has_sset => 0,
      c_implementation => 0,
      c_latency => 0,
      c_out_width => 33,
      c_sclr_overrides_sset => 0,
      c_sinit_val => "0",
      c_verbosity => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_addsb_11_0_f45daeb7eb283db0
  PORT MAP (
    a => a,
    b => b,
    s => s
  );
-- synthesis translate_on

END addsb_11_0_f45daeb7eb283db0_a;
--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2012 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- You must compile the wrapper file cmlt_11_2_a7f98d96f4ab0004.vhd when simulating
-- the core, cmlt_11_2_a7f98d96f4ab0004. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
LIBRARY XilinxCoreLib;
-- synthesis translate_on
ENTITY cmlt_11_2_a7f98d96f4ab0004 IS
  PORT (
    a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    p : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
  );
END cmlt_11_2_a7f98d96f4ab0004;

ARCHITECTURE cmlt_11_2_a7f98d96f4ab0004_a OF cmlt_11_2_a7f98d96f4ab0004 IS
-- synthesis translate_off
COMPONENT wrapped_cmlt_11_2_a7f98d96f4ab0004
  PORT (
    a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    p : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_cmlt_11_2_a7f98d96f4ab0004 USE ENTITY XilinxCoreLib.mult_gen_v11_2(behavioral)
    GENERIC MAP (
      c_a_type => 1,
      c_a_width => 32,
      c_b_type => 1,
      c_b_value => "100",
      c_b_width => 3,
      c_ccm_imp => 0,
      c_ce_overrides_sclr => 0,
      c_has_ce => 0,
      c_has_sclr => 0,
      c_has_zero_detect => 0,
      c_latency => 0,
      c_model_type => 0,
      c_mult_type => 2,
      c_optimize_goal => 1,
      c_out_high => 63,
      c_out_low => 0,
      c_round_output => 0,
      c_round_pt => 0,
      c_verbosity => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_cmlt_11_2_a7f98d96f4ab0004
  PORT MAP (
    a => a,
    p => p
  );
-- synthesis translate_on

END cmlt_11_2_a7f98d96f4ab0004_a;
--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2012 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- You must compile the wrapper file cmlt_11_2_bdd3d0413063c796.vhd when simulating
-- the core, cmlt_11_2_bdd3d0413063c796. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
LIBRARY XilinxCoreLib;
-- synthesis translate_on
ENTITY cmlt_11_2_bdd3d0413063c796 IS
  PORT (
    a : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    p : OUT STD_LOGIC_VECTOR(33 DOWNTO 0)
  );
END cmlt_11_2_bdd3d0413063c796;

ARCHITECTURE cmlt_11_2_bdd3d0413063c796_a OF cmlt_11_2_bdd3d0413063c796 IS
-- synthesis translate_off
COMPONENT wrapped_cmlt_11_2_bdd3d0413063c796
  PORT (
    a : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    p : OUT STD_LOGIC_VECTOR(33 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_cmlt_11_2_bdd3d0413063c796 USE ENTITY XilinxCoreLib.mult_gen_v11_2(behavioral)
    GENERIC MAP (
      c_a_type => 1,
      c_a_width => 2,
      c_b_type => 1,
      c_b_value => "1000",
      c_b_width => 4,
      c_ccm_imp => 0,
      c_ce_overrides_sclr => 0,
      c_has_ce => 0,
      c_has_sclr => 0,
      c_has_zero_detect => 0,
      c_latency => 0,
      c_model_type => 0,
      c_mult_type => 2,
      c_optimize_goal => 1,
      c_out_high => 33,
      c_out_low => 0,
      c_round_output => 0,
      c_round_pt => 0,
      c_verbosity => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_cmlt_11_2_bdd3d0413063c796
  PORT MAP (
    a => a,
    p => p
  );
-- synthesis translate_on

END cmlt_11_2_bdd3d0413063c796_a;
--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2012 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- You must compile the wrapper file cmlt_11_2_c07debef2aeadcba.vhd when simulating
-- the core, cmlt_11_2_c07debef2aeadcba. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
LIBRARY XilinxCoreLib;
-- synthesis translate_on
ENTITY cmlt_11_2_c07debef2aeadcba IS
  PORT (
    a : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    p : OUT STD_LOGIC_VECTOR(37 DOWNTO 0)
  );
END cmlt_11_2_c07debef2aeadcba;

ARCHITECTURE cmlt_11_2_c07debef2aeadcba_a OF cmlt_11_2_c07debef2aeadcba IS
-- synthesis translate_off
COMPONENT wrapped_cmlt_11_2_c07debef2aeadcba
  PORT (
    a : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
    p : OUT STD_LOGIC_VECTOR(37 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_cmlt_11_2_c07debef2aeadcba USE ENTITY XilinxCoreLib.mult_gen_v11_2(behavioral)
    GENERIC MAP (
      c_a_type => 1,
      c_a_width => 6,
      c_b_type => 1,
      c_b_value => "100",
      c_b_width => 3,
      c_ccm_imp => 0,
      c_ce_overrides_sclr => 0,
      c_has_ce => 0,
      c_has_sclr => 0,
      c_has_zero_detect => 0,
      c_latency => 0,
      c_model_type => 0,
      c_mult_type => 2,
      c_optimize_goal => 1,
      c_out_high => 37,
      c_out_low => 0,
      c_round_output => 0,
      c_round_pt => 0,
      c_verbosity => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_cmlt_11_2_c07debef2aeadcba
  PORT MAP (
    a => a,
    p => p
  );
-- synthesis translate_on

END cmlt_11_2_c07debef2aeadcba_a;
--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2012 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- You must compile the wrapper file mult_11_2_5b844aa5e3ab40e9.vhd when simulating
-- the core, mult_11_2_5b844aa5e3ab40e9. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
LIBRARY XilinxCoreLib;
-- synthesis translate_on
ENTITY mult_11_2_5b844aa5e3ab40e9 IS
  PORT (
    clk : IN STD_LOGIC;
    a : IN STD_LOGIC_VECTOR(37 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(32 DOWNTO 0);
    ce : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    p : OUT STD_LOGIC_VECTOR(70 DOWNTO 0)
  );
END mult_11_2_5b844aa5e3ab40e9;

ARCHITECTURE mult_11_2_5b844aa5e3ab40e9_a OF mult_11_2_5b844aa5e3ab40e9 IS
-- synthesis translate_off
COMPONENT wrapped_mult_11_2_5b844aa5e3ab40e9
  PORT (
    clk : IN STD_LOGIC;
    a : IN STD_LOGIC_VECTOR(37 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(32 DOWNTO 0);
    ce : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    p : OUT STD_LOGIC_VECTOR(70 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_mult_11_2_5b844aa5e3ab40e9 USE ENTITY XilinxCoreLib.mult_gen_v11_2(behavioral)
    GENERIC MAP (
      c_a_type => 1,
      c_a_width => 38,
      c_b_type => 1,
      c_b_value => "10000001",
      c_b_width => 33,
      c_ccm_imp => 0,
      c_ce_overrides_sclr => 1,
      c_has_ce => 1,
      c_has_sclr => 1,
      c_has_zero_detect => 0,
      c_latency => 2,
      c_model_type => 0,
      c_mult_type => 1,
      c_optimize_goal => 1,
      c_out_high => 70,
      c_out_low => 0,
      c_round_output => 0,
      c_round_pt => 0,
      c_verbosity => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_mult_11_2_5b844aa5e3ab40e9
  PORT MAP (
    clk => clk,
    a => a,
    b => b,
    ce => ce,
    sclr => sclr,
    p => p
  );
-- synthesis translate_on

END mult_11_2_5b844aa5e3ab40e9_a;
--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2012 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- You must compile the wrapper file mult_11_2_874e4cbe208f3604.vhd when simulating
-- the core, mult_11_2_874e4cbe208f3604. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
LIBRARY XilinxCoreLib;
-- synthesis translate_on
ENTITY mult_11_2_874e4cbe208f3604 IS
  PORT (
    clk : IN STD_LOGIC;
    a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    ce : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    p : OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
  );
END mult_11_2_874e4cbe208f3604;

ARCHITECTURE mult_11_2_874e4cbe208f3604_a OF mult_11_2_874e4cbe208f3604 IS
-- synthesis translate_off
COMPONENT wrapped_mult_11_2_874e4cbe208f3604
  PORT (
    clk : IN STD_LOGIC;
    a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    ce : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    p : OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_mult_11_2_874e4cbe208f3604 USE ENTITY XilinxCoreLib.mult_gen_v11_2(behavioral)
    GENERIC MAP (
      c_a_type => 1,
      c_a_width => 8,
      c_b_type => 1,
      c_b_value => "10000001",
      c_b_width => 5,
      c_ccm_imp => 0,
      c_ce_overrides_sclr => 1,
      c_has_ce => 1,
      c_has_sclr => 1,
      c_has_zero_detect => 0,
      c_latency => 3,
      c_model_type => 0,
      c_mult_type => 1,
      c_optimize_goal => 1,
      c_out_high => 12,
      c_out_low => 0,
      c_round_output => 0,
      c_round_pt => 0,
      c_verbosity => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_mult_11_2_874e4cbe208f3604
  PORT MAP (
    clk => clk,
    a => a,
    b => b,
    ce => ce,
    sclr => sclr,
    p => p
  );
-- synthesis translate_on

END mult_11_2_874e4cbe208f3604_a;
--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2012 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- You must compile the wrapper file mult_11_2_88bc300346481aca.vhd when simulating
-- the core, mult_11_2_88bc300346481aca. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
LIBRARY XilinxCoreLib;
-- synthesis translate_on
ENTITY mult_11_2_88bc300346481aca IS
  PORT (
    clk : IN STD_LOGIC;
    a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    ce : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    p : OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
  );
END mult_11_2_88bc300346481aca;

ARCHITECTURE mult_11_2_88bc300346481aca_a OF mult_11_2_88bc300346481aca IS
-- synthesis translate_off
COMPONENT wrapped_mult_11_2_88bc300346481aca
  PORT (
    clk : IN STD_LOGIC;
    a : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    ce : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    p : OUT STD_LOGIC_VECTOR(12 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_mult_11_2_88bc300346481aca USE ENTITY XilinxCoreLib.mult_gen_v11_2(behavioral)
    GENERIC MAP (
      c_a_type => 1,
      c_a_width => 5,
      c_b_type => 1,
      c_b_value => "10000001",
      c_b_width => 8,
      c_ccm_imp => 0,
      c_ce_overrides_sclr => 1,
      c_has_ce => 1,
      c_has_sclr => 1,
      c_has_zero_detect => 0,
      c_latency => 3,
      c_model_type => 0,
      c_mult_type => 1,
      c_optimize_goal => 1,
      c_out_high => 12,
      c_out_low => 0,
      c_round_output => 0,
      c_round_pt => 0,
      c_verbosity => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_mult_11_2_88bc300346481aca
  PORT MAP (
    clk => clk,
    a => a,
    b => b,
    ce => ce,
    sclr => sclr,
    p => p
  );
-- synthesis translate_on

END mult_11_2_88bc300346481aca_a;
--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2012 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- You must compile the wrapper file mult_11_2_f16a7a44cbd48451.vhd when simulating
-- the core, mult_11_2_f16a7a44cbd48451. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
LIBRARY XilinxCoreLib;
-- synthesis translate_on
ENTITY mult_11_2_f16a7a44cbd48451 IS
  PORT (
    clk : IN STD_LOGIC;
    a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(37 DOWNTO 0);
    ce : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    p : OUT STD_LOGIC_VECTOR(69 DOWNTO 0)
  );
END mult_11_2_f16a7a44cbd48451;

ARCHITECTURE mult_11_2_f16a7a44cbd48451_a OF mult_11_2_f16a7a44cbd48451 IS
-- synthesis translate_off
COMPONENT wrapped_mult_11_2_f16a7a44cbd48451
  PORT (
    clk : IN STD_LOGIC;
    a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(37 DOWNTO 0);
    ce : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    p : OUT STD_LOGIC_VECTOR(69 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_mult_11_2_f16a7a44cbd48451 USE ENTITY XilinxCoreLib.mult_gen_v11_2(behavioral)
    GENERIC MAP (
      c_a_type => 1,
      c_a_width => 32,
      c_b_type => 1,
      c_b_value => "10000001",
      c_b_width => 38,
      c_ccm_imp => 0,
      c_ce_overrides_sclr => 1,
      c_has_ce => 1,
      c_has_sclr => 1,
      c_has_zero_detect => 0,
      c_latency => 2,
      c_model_type => 0,
      c_mult_type => 1,
      c_optimize_goal => 1,
      c_out_high => 69,
      c_out_low => 0,
      c_round_output => 0,
      c_round_pt => 0,
      c_verbosity => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_mult_11_2_f16a7a44cbd48451
  PORT MAP (
    clk => clk,
    a => a,
    b => b,
    ce => ce,
    sclr => sclr,
    p => p
  );
-- synthesis translate_on

END mult_11_2_f16a7a44cbd48451_a;
--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2012 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- You must compile the wrapper file mult_11_2_fbbb37799c4f3417.vhd when simulating
-- the core, mult_11_2_fbbb37799c4f3417. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
LIBRARY XilinxCoreLib;
-- synthesis translate_on
ENTITY mult_11_2_fbbb37799c4f3417 IS
  PORT (
    clk : IN STD_LOGIC;
    a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ce : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    p : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
  );
END mult_11_2_fbbb37799c4f3417;

ARCHITECTURE mult_11_2_fbbb37799c4f3417_a OF mult_11_2_fbbb37799c4f3417 IS
-- synthesis translate_off
COMPONENT wrapped_mult_11_2_fbbb37799c4f3417
  PORT (
    clk : IN STD_LOGIC;
    a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    ce : IN STD_LOGIC;
    sclr : IN STD_LOGIC;
    p : OUT STD_LOGIC_VECTOR(63 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_mult_11_2_fbbb37799c4f3417 USE ENTITY XilinxCoreLib.mult_gen_v11_2(behavioral)
    GENERIC MAP (
      c_a_type => 1,
      c_a_width => 32,
      c_b_type => 1,
      c_b_value => "10000001",
      c_b_width => 32,
      c_ccm_imp => 0,
      c_ce_overrides_sclr => 1,
      c_has_ce => 1,
      c_has_sclr => 1,
      c_has_zero_detect => 0,
      c_latency => 2,
      c_model_type => 0,
      c_mult_type => 1,
      c_optimize_goal => 1,
      c_out_high => 63,
      c_out_low => 0,
      c_round_output => 0,
      c_round_pt => 0,
      c_verbosity => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_mult_11_2_fbbb37799c4f3417
  PORT MAP (
    clk => clk,
    a => a,
    b => b,
    ce => ce,
    sclr => sclr,
    p => p
  );
-- synthesis translate_on

END mult_11_2_fbbb37799c4f3417_a;

-------------------------------------------------------------------
-- System Generator version 13.2 VHDL source file.
--
-- Copyright(C) 2011 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2011 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
package conv_pkg is
    constant simulating : boolean := false
      -- synopsys translate_off
        or true
      -- synopsys translate_on
    ;
    constant xlUnsigned : integer := 1;
    constant xlSigned : integer := 2;
    constant xlWrap : integer := 1;
    constant xlSaturate : integer := 2;
    constant xlTruncate : integer := 1;
    constant xlRound : integer := 2;
    constant xlRoundBanker : integer := 3;
    constant xlAddMode : integer := 1;
    constant xlSubMode : integer := 2;
    attribute black_box : boolean;
    attribute syn_black_box : boolean;
    attribute fpga_dont_touch: string;
    attribute box_type :  string;
    attribute keep : string;
    attribute syn_keep : boolean;
    function std_logic_vector_to_unsigned(inp : std_logic_vector) return unsigned;
    function unsigned_to_std_logic_vector(inp : unsigned) return std_logic_vector;
    function std_logic_vector_to_signed(inp : std_logic_vector) return signed;
    function signed_to_std_logic_vector(inp : signed) return std_logic_vector;
    function unsigned_to_signed(inp : unsigned) return signed;
    function signed_to_unsigned(inp : signed) return unsigned;
    function pos(inp : std_logic_vector; arith : INTEGER) return boolean;
    function all_same(inp: std_logic_vector) return boolean;
    function all_zeros(inp: std_logic_vector) return boolean;
    function is_point_five(inp: std_logic_vector) return boolean;
    function all_ones(inp: std_logic_vector) return boolean;
    function convert_type (inp : std_logic_vector; old_width, old_bin_pt,
                           old_arith, new_width, new_bin_pt, new_arith,
                           quantization, overflow : INTEGER)
        return std_logic_vector;
    function cast (inp : std_logic_vector; old_bin_pt,
                   new_width, new_bin_pt, new_arith : INTEGER)
        return std_logic_vector;
    function vec_slice (inp : std_logic_vector; upper, lower : INTEGER)
        return std_logic_vector;
    function s2u_slice (inp : signed; upper, lower : INTEGER)
        return unsigned;
    function u2u_slice (inp : unsigned; upper, lower : INTEGER)
        return unsigned;
    function s2s_cast (inp : signed; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return signed;
    function u2s_cast (inp : unsigned; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return signed;
    function s2u_cast (inp : signed; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return unsigned;
    function u2u_cast (inp : unsigned; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return unsigned;
    function u2v_cast (inp : unsigned; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return std_logic_vector;
    function s2v_cast (inp : signed; old_bin_pt,
                   new_width, new_bin_pt : INTEGER)
        return std_logic_vector;
    function trunc (inp : std_logic_vector; old_width, old_bin_pt, old_arith,
                    new_width, new_bin_pt, new_arith : INTEGER)
        return std_logic_vector;
    function round_towards_inf (inp : std_logic_vector; old_width, old_bin_pt,
                                old_arith, new_width, new_bin_pt,
                                new_arith : INTEGER) return std_logic_vector;
    function round_towards_even (inp : std_logic_vector; old_width, old_bin_pt,
                                old_arith, new_width, new_bin_pt,
                                new_arith : INTEGER) return std_logic_vector;
    function max_signed(width : INTEGER) return std_logic_vector;
    function min_signed(width : INTEGER) return std_logic_vector;
    function saturation_arith(inp:  std_logic_vector;  old_width, old_bin_pt,
                              old_arith, new_width, new_bin_pt, new_arith
                              : INTEGER) return std_logic_vector;
    function wrap_arith(inp:  std_logic_vector;  old_width, old_bin_pt,
                        old_arith, new_width, new_bin_pt, new_arith : INTEGER)
                        return std_logic_vector;
    function fractional_bits(a_bin_pt, b_bin_pt: INTEGER) return INTEGER;
    function integer_bits(a_width, a_bin_pt, b_width, b_bin_pt: INTEGER)
        return INTEGER;
    function sign_ext(inp : std_logic_vector; new_width : INTEGER)
        return std_logic_vector;
    function zero_ext(inp : std_logic_vector; new_width : INTEGER)
        return std_logic_vector;
    function zero_ext(inp : std_logic; new_width : INTEGER)
        return std_logic_vector;
    function extend_MSB(inp : std_logic_vector; new_width, arith : INTEGER)
        return std_logic_vector;
    function align_input(inp : std_logic_vector; old_width, delta, new_arith,
                          new_width: INTEGER)
        return std_logic_vector;
    function pad_LSB(inp : std_logic_vector; new_width: integer)
        return std_logic_vector;
    function pad_LSB(inp : std_logic_vector; new_width, arith : integer)
        return std_logic_vector;
    function max(L, R: INTEGER) return INTEGER;
    function min(L, R: INTEGER) return INTEGER;
    function "="(left,right: STRING) return boolean;
    function boolean_to_signed (inp : boolean; width: integer)
        return signed;
    function boolean_to_unsigned (inp : boolean; width: integer)
        return unsigned;
    function boolean_to_vector (inp : boolean)
        return std_logic_vector;
    function std_logic_to_vector (inp : std_logic)
        return std_logic_vector;
    function integer_to_std_logic_vector (inp : integer;  width, arith : integer)
        return std_logic_vector;
    function std_logic_vector_to_integer (inp : std_logic_vector;  arith : integer)
        return integer;
    function std_logic_to_integer(constant inp : std_logic := '0')
        return integer;
    function bin_string_element_to_std_logic_vector (inp : string;  width, index : integer)
        return std_logic_vector;
    function bin_string_to_std_logic_vector (inp : string)
        return std_logic_vector;
    function hex_string_to_std_logic_vector (inp : string; width : integer)
        return std_logic_vector;
    function makeZeroBinStr (width : integer) return STRING;
    function and_reduce(inp: std_logic_vector) return std_logic;
    -- synopsys translate_off
    function is_binary_string_invalid (inp : string)
        return boolean;
    function is_binary_string_undefined (inp : string)
        return boolean;
    function is_XorU(inp : std_logic_vector)
        return boolean;
    function to_real(inp : std_logic_vector; bin_pt : integer; arith : integer)
        return real;
    function std_logic_to_real(inp : std_logic; bin_pt : integer; arith : integer)
        return real;
    function real_to_std_logic_vector (inp : real;  width, bin_pt, arith : integer)
        return std_logic_vector;
    function real_string_to_std_logic_vector (inp : string;  width, bin_pt, arith : integer)
        return std_logic_vector;
    constant display_precision : integer := 20;
    function real_to_string (inp : real) return string;
    function valid_bin_string(inp : string) return boolean;
    function std_logic_vector_to_bin_string(inp : std_logic_vector) return string;
    function std_logic_to_bin_string(inp : std_logic) return string;
    function std_logic_vector_to_bin_string_w_point(inp : std_logic_vector; bin_pt : integer)
        return string;
    function real_to_bin_string(inp : real;  width, bin_pt, arith : integer)
        return string;
    type stdlogic_to_char_t is array(std_logic) of character;
    constant to_char : stdlogic_to_char_t := (
        'U' => 'U',
        'X' => 'X',
        '0' => '0',
        '1' => '1',
        'Z' => 'Z',
        'W' => 'W',
        'L' => 'L',
        'H' => 'H',
        '-' => '-');
    -- synopsys translate_on
end conv_pkg;
package body conv_pkg is
    function std_logic_vector_to_unsigned(inp : std_logic_vector)
        return unsigned
    is
    begin
        return unsigned (inp);
    end;
    function unsigned_to_std_logic_vector(inp : unsigned)
        return std_logic_vector
    is
    begin
        return std_logic_vector(inp);
    end;
    function std_logic_vector_to_signed(inp : std_logic_vector)
        return signed
    is
    begin
        return  signed (inp);
    end;
    function signed_to_std_logic_vector(inp : signed)
        return std_logic_vector
    is
    begin
        return std_logic_vector(inp);
    end;
    function unsigned_to_signed (inp : unsigned)
        return signed
    is
    begin
        return signed(std_logic_vector(inp));
    end;
    function signed_to_unsigned (inp : signed)
        return unsigned
    is
    begin
        return unsigned(std_logic_vector(inp));
    end;
    function pos(inp : std_logic_vector; arith : INTEGER)
        return boolean
    is
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
    begin
        vec := inp;
        if arith = xlUnsigned then
            return true;
        else
            if vec(width-1) = '0' then
                return true;
            else
                return false;
            end if;
        end if;
        return true;
    end;
    function max_signed(width : INTEGER)
        return std_logic_vector
    is
        variable ones : std_logic_vector(width-2 downto 0);
        variable result : std_logic_vector(width-1 downto 0);
    begin
        ones := (others => '1');
        result(width-1) := '0';
        result(width-2 downto 0) := ones;
        return result;
    end;
    function min_signed(width : INTEGER)
        return std_logic_vector
    is
        variable zeros : std_logic_vector(width-2 downto 0);
        variable result : std_logic_vector(width-1 downto 0);
    begin
        zeros := (others => '0');
        result(width-1) := '1';
        result(width-2 downto 0) := zeros;
        return result;
    end;
    function and_reduce(inp: std_logic_vector) return std_logic
    is
        variable result: std_logic;
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
    begin
        vec := inp;
        result := vec(0);
        if width > 1 then
            for i in 1 to width-1 loop
                result := result and vec(i);
            end loop;
        end if;
        return result;
    end;
    function all_same(inp: std_logic_vector) return boolean
    is
        variable result: boolean;
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
    begin
        vec := inp;
        result := true;
        if width > 0 then
            for i in 1 to width-1 loop
                if vec(i) /= vec(0) then
                    result := false;
                end if;
            end loop;
        end if;
        return result;
    end;
    function all_zeros(inp: std_logic_vector)
        return boolean
    is
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
        variable zero : std_logic_vector(width-1 downto 0);
        variable result : boolean;
    begin
        zero := (others => '0');
        vec := inp;
        -- synopsys translate_off
        if (is_XorU(vec)) then
            return false;
        end if;
         -- synopsys translate_on
        if (std_logic_vector_to_unsigned(vec) = std_logic_vector_to_unsigned(zero)) then
            result := true;
        else
            result := false;
        end if;
        return result;
    end;
    function is_point_five(inp: std_logic_vector)
        return boolean
    is
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
        variable result : boolean;
    begin
        vec := inp;
        -- synopsys translate_off
        if (is_XorU(vec)) then
            return false;
        end if;
         -- synopsys translate_on
        if (width > 1) then
           if ((vec(width-1) = '1') and (all_zeros(vec(width-2 downto 0)) = true)) then
               result := true;
           else
               result := false;
           end if;
        else
           if (vec(width-1) = '1') then
               result := true;
           else
               result := false;
           end if;
        end if;
        return result;
    end;
    function all_ones(inp: std_logic_vector)
        return boolean
    is
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
        variable one : std_logic_vector(width-1 downto 0);
        variable result : boolean;
    begin
        one := (others => '1');
        vec := inp;
        -- synopsys translate_off
        if (is_XorU(vec)) then
            return false;
        end if;
         -- synopsys translate_on
        if (std_logic_vector_to_unsigned(vec) = std_logic_vector_to_unsigned(one)) then
            result := true;
        else
            result := false;
        end if;
        return result;
    end;
    function full_precision_num_width(quantization, overflow, old_width,
                                      old_bin_pt, old_arith,
                                      new_width, new_bin_pt, new_arith : INTEGER)
        return integer
    is
        variable result : integer;
    begin
        result := old_width + 2;
        return result;
    end;
    function quantized_num_width(quantization, overflow, old_width, old_bin_pt,
                                 old_arith, new_width, new_bin_pt, new_arith
                                 : INTEGER)
        return integer
    is
        variable right_of_dp, left_of_dp, result : integer;
    begin
        right_of_dp := max(new_bin_pt, old_bin_pt);
        left_of_dp := max((new_width - new_bin_pt), (old_width - old_bin_pt));
        result := (old_width + 2) + (new_bin_pt - old_bin_pt);
        return result;
    end;
    function convert_type (inp : std_logic_vector; old_width, old_bin_pt,
                           old_arith, new_width, new_bin_pt, new_arith,
                           quantization, overflow : INTEGER)
        return std_logic_vector
    is
        constant fp_width : integer :=
            full_precision_num_width(quantization, overflow, old_width,
                                     old_bin_pt, old_arith, new_width,
                                     new_bin_pt, new_arith);
        constant fp_bin_pt : integer := old_bin_pt;
        constant fp_arith : integer := old_arith;
        variable full_precision_result : std_logic_vector(fp_width-1 downto 0);
        constant q_width : integer :=
            quantized_num_width(quantization, overflow, old_width, old_bin_pt,
                                old_arith, new_width, new_bin_pt, new_arith);
        constant q_bin_pt : integer := new_bin_pt;
        constant q_arith : integer := old_arith;
        variable quantized_result : std_logic_vector(q_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        result := (others => '0');
        full_precision_result := cast(inp, old_bin_pt, fp_width, fp_bin_pt,
                                      fp_arith);
        if (quantization = xlRound) then
            quantized_result := round_towards_inf(full_precision_result,
                                                  fp_width, fp_bin_pt,
                                                  fp_arith, q_width, q_bin_pt,
                                                  q_arith);
        elsif (quantization = xlRoundBanker) then
            quantized_result := round_towards_even(full_precision_result,
                                                  fp_width, fp_bin_pt,
                                                  fp_arith, q_width, q_bin_pt,
                                                  q_arith);
        else
            quantized_result := trunc(full_precision_result, fp_width, fp_bin_pt,
                                      fp_arith, q_width, q_bin_pt, q_arith);
        end if;
        if (overflow = xlSaturate) then
            result := saturation_arith(quantized_result, q_width, q_bin_pt,
                                       q_arith, new_width, new_bin_pt, new_arith);
        else
             result := wrap_arith(quantized_result, q_width, q_bin_pt, q_arith,
                                  new_width, new_bin_pt, new_arith);
        end if;
        return result;
    end;
    function cast (inp : std_logic_vector; old_bin_pt, new_width,
                   new_bin_pt, new_arith : INTEGER)
        return std_logic_vector
    is
        constant old_width : integer := inp'length;
        constant left_of_dp : integer := (new_width - new_bin_pt)
                                         - (old_width - old_bin_pt);
        constant right_of_dp : integer := (new_bin_pt - old_bin_pt);
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
        variable j   : integer;
    begin
        vec := inp;
        for i in new_width-1 downto 0 loop
            j := i - right_of_dp;
            if ( j > old_width-1) then
                if (new_arith = xlUnsigned) then
                    result(i) := '0';
                else
                    result(i) := vec(old_width-1);
                end if;
            elsif ( j >= 0) then
                result(i) := vec(j);
            else
                result(i) := '0';
            end if;
        end loop;
        return result;
    end;
    function vec_slice (inp : std_logic_vector; upper, lower : INTEGER)
      return std_logic_vector
    is
    begin
        return inp(upper downto lower);
    end;
    function s2u_slice (inp : signed; upper, lower : INTEGER)
      return unsigned
    is
    begin
        return unsigned(vec_slice(std_logic_vector(inp), upper, lower));
    end;
    function u2u_slice (inp : unsigned; upper, lower : INTEGER)
      return unsigned
    is
    begin
        return unsigned(vec_slice(std_logic_vector(inp), upper, lower));
    end;
    function s2s_cast (inp : signed; old_bin_pt, new_width, new_bin_pt : INTEGER)
        return signed
    is
    begin
        return signed(cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlSigned));
    end;
    function s2u_cast (inp : signed; old_bin_pt, new_width,
                   new_bin_pt : INTEGER)
        return unsigned
    is
    begin
        return unsigned(cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlSigned));
    end;
    function u2s_cast (inp : unsigned; old_bin_pt, new_width,
                   new_bin_pt : INTEGER)
        return signed
    is
    begin
        return signed(cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlUnsigned));
    end;
    function u2u_cast (inp : unsigned; old_bin_pt, new_width,
                   new_bin_pt : INTEGER)
        return unsigned
    is
    begin
        return unsigned(cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlUnsigned));
    end;
    function u2v_cast (inp : unsigned; old_bin_pt, new_width,
                   new_bin_pt : INTEGER)
        return std_logic_vector
    is
    begin
        return cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlUnsigned);
    end;
    function s2v_cast (inp : signed; old_bin_pt, new_width,
                   new_bin_pt : INTEGER)
        return std_logic_vector
    is
    begin
        return cast(std_logic_vector(inp), old_bin_pt, new_width, new_bin_pt, xlSigned);
    end;
    function boolean_to_signed (inp : boolean; width : integer)
        return signed
    is
        variable result : signed(width - 1 downto 0);
    begin
        result := (others => '0');
        if inp then
          result(0) := '1';
        else
          result(0) := '0';
        end if;
        return result;
    end;
    function boolean_to_unsigned (inp : boolean; width : integer)
        return unsigned
    is
        variable result : unsigned(width - 1 downto 0);
    begin
        result := (others => '0');
        if inp then
          result(0) := '1';
        else
          result(0) := '0';
        end if;
        return result;
    end;
    function boolean_to_vector (inp : boolean)
        return std_logic_vector
    is
        variable result : std_logic_vector(1 - 1 downto 0);
    begin
        result := (others => '0');
        if inp then
          result(0) := '1';
        else
          result(0) := '0';
        end if;
        return result;
    end;
    function std_logic_to_vector (inp : std_logic)
        return std_logic_vector
    is
        variable result : std_logic_vector(1 - 1 downto 0);
    begin
        result(0) := inp;
        return result;
    end;
    function trunc (inp : std_logic_vector; old_width, old_bin_pt, old_arith,
                                new_width, new_bin_pt, new_arith : INTEGER)
        return std_logic_vector
    is
        constant right_of_dp : integer := (old_bin_pt - new_bin_pt);
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if right_of_dp >= 0 then
            if new_arith = xlUnsigned then
                result := zero_ext(vec(old_width-1 downto right_of_dp), new_width);
            else
                result := sign_ext(vec(old_width-1 downto right_of_dp), new_width);
            end if;
        else
            if new_arith = xlUnsigned then
                result := zero_ext(pad_LSB(vec, old_width +
                                           abs(right_of_dp)), new_width);
            else
                result := sign_ext(pad_LSB(vec, old_width +
                                           abs(right_of_dp)), new_width);
            end if;
        end if;
        return result;
    end;
    function round_towards_inf (inp : std_logic_vector; old_width, old_bin_pt,
                                old_arith, new_width, new_bin_pt, new_arith
                                : INTEGER)
        return std_logic_vector
    is
        constant right_of_dp : integer := (old_bin_pt - new_bin_pt);
        constant expected_new_width : integer :=  old_width - right_of_dp  + 1;
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable one_or_zero : std_logic_vector(new_width-1 downto 0);
        variable truncated_val : std_logic_vector(new_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if right_of_dp >= 0 then
            if new_arith = xlUnsigned then
                truncated_val := zero_ext(vec(old_width-1 downto right_of_dp),
                                          new_width);
            else
                truncated_val := sign_ext(vec(old_width-1 downto right_of_dp),
                                          new_width);
            end if;
        else
            if new_arith = xlUnsigned then
                truncated_val := zero_ext(pad_LSB(vec, old_width +
                                                  abs(right_of_dp)), new_width);
            else
                truncated_val := sign_ext(pad_LSB(vec, old_width +
                                                  abs(right_of_dp)), new_width);
            end if;
        end if;
        one_or_zero := (others => '0');
        if (new_arith = xlSigned) then
            if (vec(old_width-1) = '0') then
                one_or_zero(0) := '1';
            end if;
            if (right_of_dp >= 2) and (right_of_dp <= old_width) then
                if (all_zeros(vec(right_of_dp-2 downto 0)) = false) then
                    one_or_zero(0) := '1';
                end if;
            end if;
            if (right_of_dp >= 1) and (right_of_dp <= old_width) then
                if vec(right_of_dp-1) = '0' then
                    one_or_zero(0) := '0';
                end if;
            else
                one_or_zero(0) := '0';
            end if;
        else
            if (right_of_dp >= 1) and (right_of_dp <= old_width) then
                one_or_zero(0) :=  vec(right_of_dp-1);
            end if;
        end if;
        if new_arith = xlSigned then
            result := signed_to_std_logic_vector(std_logic_vector_to_signed(truncated_val) +
                                                 std_logic_vector_to_signed(one_or_zero));
        else
            result := unsigned_to_std_logic_vector(std_logic_vector_to_unsigned(truncated_val) +
                                                  std_logic_vector_to_unsigned(one_or_zero));
        end if;
        return result;
    end;
    function round_towards_even (inp : std_logic_vector; old_width, old_bin_pt,
                                old_arith, new_width, new_bin_pt, new_arith
                                : INTEGER)
        return std_logic_vector
    is
        constant right_of_dp : integer := (old_bin_pt - new_bin_pt);
        constant expected_new_width : integer :=  old_width - right_of_dp  + 1;
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable one_or_zero : std_logic_vector(new_width-1 downto 0);
        variable truncated_val : std_logic_vector(new_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if right_of_dp >= 0 then
            if new_arith = xlUnsigned then
                truncated_val := zero_ext(vec(old_width-1 downto right_of_dp),
                                          new_width);
            else
                truncated_val := sign_ext(vec(old_width-1 downto right_of_dp),
                                          new_width);
            end if;
        else
            if new_arith = xlUnsigned then
                truncated_val := zero_ext(pad_LSB(vec, old_width +
                                                  abs(right_of_dp)), new_width);
            else
                truncated_val := sign_ext(pad_LSB(vec, old_width +
                                                  abs(right_of_dp)), new_width);
            end if;
        end if;
        one_or_zero := (others => '0');
        if (right_of_dp >= 1) and (right_of_dp <= old_width) then
            if (is_point_five(vec(right_of_dp-1 downto 0)) = false) then
                one_or_zero(0) :=  vec(right_of_dp-1);
            else
                one_or_zero(0) :=  vec(right_of_dp);
            end if;
        end if;
        if new_arith = xlSigned then
            result := signed_to_std_logic_vector(std_logic_vector_to_signed(truncated_val) +
                                                 std_logic_vector_to_signed(one_or_zero));
        else
            result := unsigned_to_std_logic_vector(std_logic_vector_to_unsigned(truncated_val) +
                                                  std_logic_vector_to_unsigned(one_or_zero));
        end if;
        return result;
    end;
    function saturation_arith(inp:  std_logic_vector;  old_width, old_bin_pt,
                              old_arith, new_width, new_bin_pt, new_arith
                              : INTEGER)
        return std_logic_vector
    is
        constant left_of_dp : integer := (old_width - old_bin_pt) -
                                         (new_width - new_bin_pt);
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
        variable overflow : boolean;
    begin
        vec := inp;
        overflow := true;
        result := (others => '0');
        if (new_width >= old_width) then
            overflow := false;
        end if;
        if ((old_arith = xlSigned and new_arith = xlSigned) and (old_width > new_width)) then
            if all_same(vec(old_width-1 downto new_width-1)) then
                overflow := false;
            end if;
        end if;
        if (old_arith = xlSigned and new_arith = xlUnsigned) then
            if (old_width > new_width) then
                if all_zeros(vec(old_width-1 downto new_width)) then
                    overflow := false;
                end if;
            else
                if (old_width = new_width) then
                    if (vec(new_width-1) = '0') then
                        overflow := false;
                    end if;
                end if;
            end if;
        end if;
        if (old_arith = xlUnsigned and new_arith = xlUnsigned) then
            if (old_width > new_width) then
                if all_zeros(vec(old_width-1 downto new_width)) then
                    overflow := false;
                end if;
            else
                if (old_width = new_width) then
                    overflow := false;
                end if;
            end if;
        end if;
        if ((old_arith = xlUnsigned and new_arith = xlSigned) and (old_width > new_width)) then
            if all_same(vec(old_width-1 downto new_width-1)) then
                overflow := false;
            end if;
        end if;
        if overflow then
            if new_arith = xlSigned then
                if vec(old_width-1) = '0' then
                    result := max_signed(new_width);
                else
                    result := min_signed(new_width);
                end if;
            else
                if ((old_arith = xlSigned) and vec(old_width-1) = '1') then
                    result := (others => '0');
                else
                    result := (others => '1');
                end if;
            end if;
        else
            if (old_arith = xlSigned) and (new_arith = xlUnsigned) then
                if (vec(old_width-1) = '1') then
                    vec := (others => '0');
                end if;
            end if;
            if new_width <= old_width then
                result := vec(new_width-1 downto 0);
            else
                if new_arith = xlUnsigned then
                    result := zero_ext(vec, new_width);
                else
                    result := sign_ext(vec, new_width);
                end if;
            end if;
        end if;
        return result;
    end;
   function wrap_arith(inp:  std_logic_vector;  old_width, old_bin_pt,
                       old_arith, new_width, new_bin_pt, new_arith : INTEGER)
        return std_logic_vector
    is
        variable result : std_logic_vector(new_width-1 downto 0);
        variable result_arith : integer;
    begin
        if (old_arith = xlSigned) and (new_arith = xlUnsigned) then
            result_arith := xlSigned;
        end if;
        result := cast(inp, old_bin_pt, new_width, new_bin_pt, result_arith);
        return result;
    end;
    function fractional_bits(a_bin_pt, b_bin_pt: INTEGER) return INTEGER is
    begin
        return max(a_bin_pt, b_bin_pt);
    end;
    function integer_bits(a_width, a_bin_pt, b_width, b_bin_pt: INTEGER)
        return INTEGER is
    begin
        return  max(a_width - a_bin_pt, b_width - b_bin_pt);
    end;
    function pad_LSB(inp : std_logic_vector; new_width: integer)
        return STD_LOGIC_VECTOR
    is
        constant orig_width : integer := inp'length;
        variable vec : std_logic_vector(orig_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
        variable pos : integer;
        constant pad_pos : integer := new_width - orig_width - 1;
    begin
        vec := inp;
        pos := new_width-1;
        if (new_width >= orig_width) then
            for i in orig_width-1 downto 0 loop
                result(pos) := vec(i);
                pos := pos - 1;
            end loop;
            if pad_pos >= 0 then
                for i in pad_pos downto 0 loop
                    result(i) := '0';
                end loop;
            end if;
        end if;
        return result;
    end;
    function sign_ext(inp : std_logic_vector; new_width : INTEGER)
        return std_logic_vector
    is
        constant old_width : integer := inp'length;
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if new_width >= old_width then
            result(old_width-1 downto 0) := vec;
            if new_width-1 >= old_width then
                for i in new_width-1 downto old_width loop
                    result(i) := vec(old_width-1);
                end loop;
            end if;
        else
            result(new_width-1 downto 0) := vec(new_width-1 downto 0);
        end if;
        return result;
    end;
    function zero_ext(inp : std_logic_vector; new_width : INTEGER)
        return std_logic_vector
    is
        constant old_width : integer := inp'length;
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if new_width >= old_width then
            result(old_width-1 downto 0) := vec;
            if new_width-1 >= old_width then
                for i in new_width-1 downto old_width loop
                    result(i) := '0';
                end loop;
            end if;
        else
            result(new_width-1 downto 0) := vec(new_width-1 downto 0);
        end if;
        return result;
    end;
    function zero_ext(inp : std_logic; new_width : INTEGER)
        return std_logic_vector
    is
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        result(0) := inp;
        for i in new_width-1 downto 1 loop
            result(i) := '0';
        end loop;
        return result;
    end;
    function extend_MSB(inp : std_logic_vector; new_width, arith : INTEGER)
        return std_logic_vector
    is
        constant orig_width : integer := inp'length;
        variable vec : std_logic_vector(orig_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if arith = xlUnsigned then
            result := zero_ext(vec, new_width);
        else
            result := sign_ext(vec, new_width);
        end if;
        return result;
    end;
    function pad_LSB(inp : std_logic_vector; new_width, arith: integer)
        return STD_LOGIC_VECTOR
    is
        constant orig_width : integer := inp'length;
        variable vec : std_logic_vector(orig_width-1 downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
        variable pos : integer;
    begin
        vec := inp;
        pos := new_width-1;
        if (arith = xlUnsigned) then
            result(pos) := '0';
            pos := pos - 1;
        else
            result(pos) := vec(orig_width-1);
            pos := pos - 1;
        end if;
        if (new_width >= orig_width) then
            for i in orig_width-1 downto 0 loop
                result(pos) := vec(i);
                pos := pos - 1;
            end loop;
            if pos >= 0 then
                for i in pos downto 0 loop
                    result(i) := '0';
                end loop;
            end if;
        end if;
        return result;
    end;
    function align_input(inp : std_logic_vector; old_width, delta, new_arith,
                         new_width: INTEGER)
        return std_logic_vector
    is
        variable vec : std_logic_vector(old_width-1 downto 0);
        variable padded_inp : std_logic_vector((old_width + delta)-1  downto 0);
        variable result : std_logic_vector(new_width-1 downto 0);
    begin
        vec := inp;
        if delta > 0 then
            padded_inp := pad_LSB(vec, old_width+delta);
            result := extend_MSB(padded_inp, new_width, new_arith);
        else
            result := extend_MSB(vec, new_width, new_arith);
        end if;
        return result;
    end;
    function max(L, R: INTEGER) return INTEGER is
    begin
        if L > R then
            return L;
        else
            return R;
        end if;
    end;
    function min(L, R: INTEGER) return INTEGER is
    begin
        if L < R then
            return L;
        else
            return R;
        end if;
    end;
    function "="(left,right: STRING) return boolean is
    begin
        if (left'length /= right'length) then
            return false;
        else
            test : for i in 1 to left'length loop
                if left(i) /= right(i) then
                    return false;
                end if;
            end loop test;
            return true;
        end if;
    end;
    -- synopsys translate_off
    function is_binary_string_invalid (inp : string)
        return boolean
    is
        variable vec : string(1 to inp'length);
        variable result : boolean;
    begin
        vec := inp;
        result := false;
        for i in 1 to vec'length loop
            if ( vec(i) = 'X' ) then
                result := true;
            end if;
        end loop;
        return result;
    end;
    function is_binary_string_undefined (inp : string)
        return boolean
    is
        variable vec : string(1 to inp'length);
        variable result : boolean;
    begin
        vec := inp;
        result := false;
        for i in 1 to vec'length loop
            if ( vec(i) = 'U' ) then
                result := true;
            end if;
        end loop;
        return result;
    end;
    function is_XorU(inp : std_logic_vector)
        return boolean
    is
        constant width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
        variable result : boolean;
    begin
        vec := inp;
        result := false;
        for i in 0 to width-1 loop
            if (vec(i) = 'U') or (vec(i) = 'X') then
                result := true;
            end if;
        end loop;
        return result;
    end;
    function to_real(inp : std_logic_vector; bin_pt : integer; arith : integer)
        return real
    is
        variable  vec : std_logic_vector(inp'length-1 downto 0);
        variable result, shift_val, undefined_real : real;
        variable neg_num : boolean;
    begin
        vec := inp;
        result := 0.0;
        neg_num := false;
        if vec(inp'length-1) = '1' then
            neg_num := true;
        end if;
        for i in 0 to inp'length-1 loop
            if  vec(i) = 'U' or vec(i) = 'X' then
                return undefined_real;
            end if;
            if arith = xlSigned then
                if neg_num then
                    if vec(i) = '0' then
                        result := result + 2.0**i;
                    end if;
                else
                    if vec(i) = '1' then
                        result := result + 2.0**i;
                    end if;
                end if;
            else
                if vec(i) = '1' then
                    result := result + 2.0**i;
                end if;
            end if;
        end loop;
        if arith = xlSigned then
            if neg_num then
                result := result + 1.0;
                result := result * (-1.0);
            end if;
        end if;
        shift_val := 2.0**(-1*bin_pt);
        result := result * shift_val;
        return result;
    end;
    function std_logic_to_real(inp : std_logic; bin_pt : integer; arith : integer)
        return real
    is
        variable result : real := 0.0;
    begin
        if inp = '1' then
            result := 1.0;
        end if;
        if arith = xlSigned then
            assert false
                report "It doesn't make sense to convert a 1 bit number to a signed real.";
        end if;
        return result;
    end;
    -- synopsys translate_on
    function integer_to_std_logic_vector (inp : integer;  width, arith : integer)
        return std_logic_vector
    is
        variable result : std_logic_vector(width-1 downto 0);
        variable unsigned_val : unsigned(width-1 downto 0);
        variable signed_val : signed(width-1 downto 0);
    begin
        if (arith = xlSigned) then
            signed_val := to_signed(inp, width);
            result := signed_to_std_logic_vector(signed_val);
        else
            unsigned_val := to_unsigned(inp, width);
            result := unsigned_to_std_logic_vector(unsigned_val);
        end if;
        return result;
    end;
    function std_logic_vector_to_integer (inp : std_logic_vector;  arith : integer)
        return integer
    is
        constant width : integer := inp'length;
        variable unsigned_val : unsigned(width-1 downto 0);
        variable signed_val : signed(width-1 downto 0);
        variable result : integer;
    begin
        if (arith = xlSigned) then
            signed_val := std_logic_vector_to_signed(inp);
            result := to_integer(signed_val);
        else
            unsigned_val := std_logic_vector_to_unsigned(inp);
            result := to_integer(unsigned_val);
        end if;
        return result;
    end;
    function std_logic_to_integer(constant inp : std_logic := '0')
        return integer
    is
    begin
        if inp = '1' then
            return 1;
        else
            return 0;
        end if;
    end;
    function makeZeroBinStr (width : integer) return STRING is
        variable result : string(1 to width+3);
    begin
        result(1) := '0';
        result(2) := 'b';
        for i in 3 to width+2 loop
            result(i) := '0';
        end loop;
        result(width+3) := '.';
        return result;
    end;
    -- synopsys translate_off
    function real_string_to_std_logic_vector (inp : string;  width, bin_pt, arith : integer)
        return std_logic_vector
    is
        variable result : std_logic_vector(width-1 downto 0);
    begin
        result := (others => '0');
        return result;
    end;
    function real_to_std_logic_vector (inp : real;  width, bin_pt, arith : integer)
        return std_logic_vector
    is
        variable real_val : real;
        variable int_val : integer;
        variable result : std_logic_vector(width-1 downto 0) := (others => '0');
        variable unsigned_val : unsigned(width-1 downto 0) := (others => '0');
        variable signed_val : signed(width-1 downto 0) := (others => '0');
    begin
        real_val := inp;
        int_val := integer(real_val * 2.0**(bin_pt));
        if (arith = xlSigned) then
            signed_val := to_signed(int_val, width);
            result := signed_to_std_logic_vector(signed_val);
        else
            unsigned_val := to_unsigned(int_val, width);
            result := unsigned_to_std_logic_vector(unsigned_val);
        end if;
        return result;
    end;
    -- synopsys translate_on
    function valid_bin_string (inp : string)
        return boolean
    is
        variable vec : string(1 to inp'length);
    begin
        vec := inp;
        if (vec(1) = '0' and vec(2) = 'b') then
            return true;
        else
            return false;
        end if;
    end;
    function hex_string_to_std_logic_vector(inp: string; width : integer)
        return std_logic_vector is
        constant strlen       : integer := inp'LENGTH;
        variable result       : std_logic_vector(width-1 downto 0);
        variable bitval       : std_logic_vector((strlen*4)-1 downto 0);
        variable posn         : integer;
        variable ch           : character;
        variable vec          : string(1 to strlen);
    begin
        vec := inp;
        result := (others => '0');
        posn := (strlen*4)-1;
        for i in 1 to strlen loop
            ch := vec(i);
            case ch is
                when '0' => bitval(posn downto posn-3) := "0000";
                when '1' => bitval(posn downto posn-3) := "0001";
                when '2' => bitval(posn downto posn-3) := "0010";
                when '3' => bitval(posn downto posn-3) := "0011";
                when '4' => bitval(posn downto posn-3) := "0100";
                when '5' => bitval(posn downto posn-3) := "0101";
                when '6' => bitval(posn downto posn-3) := "0110";
                when '7' => bitval(posn downto posn-3) := "0111";
                when '8' => bitval(posn downto posn-3) := "1000";
                when '9' => bitval(posn downto posn-3) := "1001";
                when 'A' | 'a' => bitval(posn downto posn-3) := "1010";
                when 'B' | 'b' => bitval(posn downto posn-3) := "1011";
                when 'C' | 'c' => bitval(posn downto posn-3) := "1100";
                when 'D' | 'd' => bitval(posn downto posn-3) := "1101";
                when 'E' | 'e' => bitval(posn downto posn-3) := "1110";
                when 'F' | 'f' => bitval(posn downto posn-3) := "1111";
                when others => bitval(posn downto posn-3) := "XXXX";
                               -- synopsys translate_off
                               ASSERT false
                                   REPORT "Invalid hex value" SEVERITY ERROR;
                               -- synopsys translate_on
            end case;
            posn := posn - 4;
        end loop;
        if (width <= strlen*4) then
            result :=  bitval(width-1 downto 0);
        else
            result((strlen*4)-1 downto 0) := bitval;
        end if;
        return result;
    end;
    function bin_string_to_std_logic_vector (inp : string)
        return std_logic_vector
    is
        variable pos : integer;
        variable vec : string(1 to inp'length);
        variable result : std_logic_vector(inp'length-1 downto 0);
    begin
        vec := inp;
        pos := inp'length-1;
        result := (others => '0');
        for i in 1 to vec'length loop
            -- synopsys translate_off
            if (pos < 0) and (vec(i) = '0' or vec(i) = '1' or vec(i) = 'X' or vec(i) = 'U')  then
                assert false
                    report "Input string is larger than output std_logic_vector. Truncating output.";
                return result;
            end if;
            -- synopsys translate_on
            if vec(i) = '0' then
                result(pos) := '0';
                pos := pos - 1;
            end if;
            if vec(i) = '1' then
                result(pos) := '1';
                pos := pos - 1;
            end if;
            -- synopsys translate_off
            if (vec(i) = 'X' or vec(i) = 'U') then
                result(pos) := 'U';
                pos := pos - 1;
            end if;
            -- synopsys translate_on
        end loop;
        return result;
    end;
    function bin_string_element_to_std_logic_vector (inp : string;  width, index : integer)
        return std_logic_vector
    is
        constant str_width : integer := width + 4;
        constant inp_len : integer := inp'length;
        constant num_elements : integer := (inp_len + 1)/str_width;
        constant reverse_index : integer := (num_elements-1) - index;
        variable left_pos : integer;
        variable right_pos : integer;
        variable vec : string(1 to inp'length);
        variable result : std_logic_vector(width-1 downto 0);
    begin
        vec := inp;
        result := (others => '0');
        if (reverse_index = 0) and (reverse_index < num_elements) and (inp_len-3 >= width) then
            left_pos := 1;
            right_pos := width + 3;
            result := bin_string_to_std_logic_vector(vec(left_pos to right_pos));
        end if;
        if (reverse_index > 0) and (reverse_index < num_elements) and (inp_len-3 >= width) then
            left_pos := (reverse_index * str_width) + 1;
            right_pos := left_pos + width + 2;
            result := bin_string_to_std_logic_vector(vec(left_pos to right_pos));
        end if;
        return result;
    end;
   -- synopsys translate_off
    function std_logic_vector_to_bin_string(inp : std_logic_vector)
        return string
    is
        variable vec : std_logic_vector(1 to inp'length);
        variable result : string(vec'range);
    begin
        vec := inp;
        for i in vec'range loop
            result(i) := to_char(vec(i));
        end loop;
        return result;
    end;
    function std_logic_to_bin_string(inp : std_logic)
        return string
    is
        variable result : string(1 to 3);
    begin
        result(1) := '0';
        result(2) := 'b';
        result(3) := to_char(inp);
        return result;
    end;
    function std_logic_vector_to_bin_string_w_point(inp : std_logic_vector; bin_pt : integer)
        return string
    is
        variable width : integer := inp'length;
        variable vec : std_logic_vector(width-1 downto 0);
        variable str_pos : integer;
        variable result : string(1 to width+3);
    begin
        vec := inp;
        str_pos := 1;
        result(str_pos) := '0';
        str_pos := 2;
        result(str_pos) := 'b';
        str_pos := 3;
        for i in width-1 downto 0  loop
            if (((width+3) - bin_pt) = str_pos) then
                result(str_pos) := '.';
                str_pos := str_pos + 1;
            end if;
            result(str_pos) := to_char(vec(i));
            str_pos := str_pos + 1;
        end loop;
        if (bin_pt = 0) then
            result(str_pos) := '.';
        end if;
        return result;
    end;
    function real_to_bin_string(inp : real;  width, bin_pt, arith : integer)
        return string
    is
        variable result : string(1 to width);
        variable vec : std_logic_vector(width-1 downto 0);
    begin
        vec := real_to_std_logic_vector(inp, width, bin_pt, arith);
        result := std_logic_vector_to_bin_string(vec);
        return result;
    end;
    function real_to_string (inp : real) return string
    is
        variable result : string(1 to display_precision) := (others => ' ');
    begin
        result(real'image(inp)'range) := real'image(inp);
        return result;
    end;
    -- synopsys translate_on
end conv_pkg;

-------------------------------------------------------------------
-- System Generator version 13.2 VHDL source file.
--
-- Copyright(C) 2011 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2011 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
-- synopsys translate_off
library unisim;
use unisim.vcomponents.all;
-- synopsys translate_on
library IEEE;
use IEEE.std_logic_1164.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;
entity srl17e is
    generic (width : integer:=16;
             latency : integer :=8);
    port (clk   : in std_logic;
          ce    : in std_logic;
          d     : in std_logic_vector(width-1 downto 0);
          q     : out std_logic_vector(width-1 downto 0));
end srl17e;
architecture structural of srl17e is
    component SRL16E
        port (D   : in STD_ULOGIC;
              CE  : in STD_ULOGIC;
              CLK : in STD_ULOGIC;
              A0  : in STD_ULOGIC;
              A1  : in STD_ULOGIC;
              A2  : in STD_ULOGIC;
              A3  : in STD_ULOGIC;
              Q   : out STD_ULOGIC);
    end component;
    attribute syn_black_box of SRL16E : component is true;
    attribute fpga_dont_touch of SRL16E : component is "true";
    component FDE
        port(
            Q  :        out   STD_ULOGIC;
            D  :        in    STD_ULOGIC;
            C  :        in    STD_ULOGIC;
            CE :        in    STD_ULOGIC);
    end component;
    attribute syn_black_box of FDE : component is true;
    attribute fpga_dont_touch of FDE : component is "true";
    constant a : std_logic_vector(4 downto 0) :=
        integer_to_std_logic_vector(latency-2,5,xlSigned);
    signal d_delayed : std_logic_vector(width-1 downto 0);
    signal srl16_out : std_logic_vector(width-1 downto 0);
begin
    d_delayed <= d after 200 ps;
    reg_array : for i in 0 to width-1 generate
        srl16_used: if latency > 1 generate
            u1 : srl16e port map(clk => clk,
                                 d => d_delayed(i),
                                 q => srl16_out(i),
                                 ce => ce,
                                 a0 => a(0),
                                 a1 => a(1),
                                 a2 => a(2),
                                 a3 => a(3));
        end generate;
        srl16_not_used: if latency <= 1 generate
            srl16_out(i) <= d_delayed(i);
        end generate;
        fde_used: if latency /= 0  generate
            u2 : fde port map(c => clk,
                              d => srl16_out(i),
                              q => q(i),
                              ce => ce);
        end generate;
        fde_not_used: if latency = 0  generate
            q(i) <= srl16_out(i);
        end generate;
    end generate;
 end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;
entity synth_reg is
    generic (width           : integer := 8;
             latency         : integer := 1);
    port (i       : in std_logic_vector(width-1 downto 0);
          ce      : in std_logic;
          clr     : in std_logic;
          clk     : in std_logic;
          o       : out std_logic_vector(width-1 downto 0));
end synth_reg;
architecture structural of synth_reg is
    component srl17e
        generic (width : integer:=16;
                 latency : integer :=8);
        port (clk : in std_logic;
              ce  : in std_logic;
              d   : in std_logic_vector(width-1 downto 0);
              q   : out std_logic_vector(width-1 downto 0));
    end component;
    function calc_num_srl17es (latency : integer)
        return integer
    is
        variable remaining_latency : integer;
        variable result : integer;
    begin
        result := latency / 17;
        remaining_latency := latency - (result * 17);
        if (remaining_latency /= 0) then
            result := result + 1;
        end if;
        return result;
    end;
    constant complete_num_srl17es : integer := latency / 17;
    constant num_srl17es : integer := calc_num_srl17es(latency);
    constant remaining_latency : integer := latency - (complete_num_srl17es * 17);
    type register_array is array (num_srl17es downto 0) of
        std_logic_vector(width-1 downto 0);
    signal z : register_array;
begin
    z(0) <= i;
    complete_ones : if complete_num_srl17es > 0 generate
        srl17e_array: for i in 0 to complete_num_srl17es-1 generate
            delay_comp : srl17e
                generic map (width => width,
                             latency => 17)
                port map (clk => clk,
                          ce  => ce,
                          d       => z(i),
                          q       => z(i+1));
        end generate;
    end generate;
    partial_one : if remaining_latency > 0 generate
        last_srl17e : srl17e
            generic map (width => width,
                         latency => remaining_latency)
            port map (clk => clk,
                      ce  => ce,
                      d   => z(num_srl17es-1),
                      q   => z(num_srl17es));
    end generate;
    o <= z(num_srl17es);
end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;
entity synth_reg_reg is
    generic (width           : integer := 8;
             latency         : integer := 1);
    port (i       : in std_logic_vector(width-1 downto 0);
          ce      : in std_logic;
          clr     : in std_logic;
          clk     : in std_logic;
          o       : out std_logic_vector(width-1 downto 0));
end synth_reg_reg;
architecture behav of synth_reg_reg is
  type reg_array_type is array (latency-1 downto 0) of std_logic_vector(width -1 downto 0);
  signal reg_bank : reg_array_type := (others => (others => '0'));
  signal reg_bank_in : reg_array_type := (others => (others => '0'));
  attribute syn_allow_retiming : boolean;
  attribute syn_srlstyle : string;
  attribute syn_allow_retiming of reg_bank : signal is true;
  attribute syn_allow_retiming of reg_bank_in : signal is true;
  attribute syn_srlstyle of reg_bank : signal is "registers";
  attribute syn_srlstyle of reg_bank_in : signal is "registers";
begin
  latency_eq_0: if latency = 0 generate
    o <= i;
  end generate latency_eq_0;
  latency_gt_0: if latency >= 1 generate
    o <= reg_bank(latency-1);
    reg_bank_in(0) <= i;
    loop_gen: for idx in latency-2 downto 0 generate
      reg_bank_in(idx+1) <= reg_bank(idx);
    end generate loop_gen;
    sync_loop: for sync_idx in latency-1 downto 0 generate
      sync_proc: process (clk)
      begin
        if clk'event and clk = '1' then
          if ce = '1'  then
            reg_bank(sync_idx) <= reg_bank_in(sync_idx);
          end if;
        end if;
      end process sync_proc;
    end generate sync_loop;
  end generate latency_gt_0;
end behav;

-------------------------------------------------------------------
-- System Generator version 13.2 VHDL source file.
--
-- Copyright(C) 2011 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2011 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
-- synopsys translate_off
library unisim;
use unisim.vcomponents.all;
-- synopsys translate_on
library IEEE;
use IEEE.std_logic_1164.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;
entity single_reg_w_init is
  generic (
    width: integer := 8;
    init_index: integer := 0;
    init_value: bit_vector := b"0000"
  );
  port (
    i: in std_logic_vector(width - 1 downto 0);
    ce: in std_logic;
    clr: in std_logic;
    clk: in std_logic;
    o: out std_logic_vector(width - 1 downto 0)
  );
end single_reg_w_init;
architecture structural of single_reg_w_init is
  function build_init_const(width: integer;
                            init_index: integer;
                            init_value: bit_vector)
    return std_logic_vector
  is
    variable result: std_logic_vector(width - 1 downto 0);
  begin
    if init_index = 0 then
      result := (others => '0');
    elsif init_index = 1 then
      result := (others => '0');
      result(0) := '1';
    else
      result := to_stdlogicvector(init_value);
    end if;
    return result;
  end;
  component fdre
    port (
      q: out std_ulogic;
      d: in  std_ulogic;
      c: in  std_ulogic;
      ce: in  std_ulogic;
      r: in  std_ulogic
    );
  end component;
  attribute syn_black_box of fdre: component is true;
  attribute fpga_dont_touch of fdre: component is "true";
  component fdse
    port (
      q: out std_ulogic;
      d: in  std_ulogic;
      c: in  std_ulogic;
      ce: in  std_ulogic;
      s: in  std_ulogic
    );
  end component;
  attribute syn_black_box of fdse: component is true;
  attribute fpga_dont_touch of fdse: component is "true";
  constant init_const: std_logic_vector(width - 1 downto 0)
    := build_init_const(width, init_index, init_value);
begin
  fd_prim_array: for index in 0 to width - 1 generate
    bit_is_0: if (init_const(index) = '0') generate
      fdre_comp: fdre
        port map (
          c => clk,
          d => i(index),
          q => o(index),
          ce => ce,
          r => clr
        );
    end generate;
    bit_is_1: if (init_const(index) = '1') generate
      fdse_comp: fdse
        port map (
          c => clk,
          d => i(index),
          q => o(index),
          ce => ce,
          s => clr
        );
    end generate;
  end generate;
end architecture structural;
-- synopsys translate_off
library unisim;
use unisim.vcomponents.all;
-- synopsys translate_on
library IEEE;
use IEEE.std_logic_1164.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;
entity synth_reg_w_init is
  generic (
    width: integer := 8;
    init_index: integer := 0;
    init_value: bit_vector := b"0000";
    latency: integer := 1
  );
  port (
    i: in std_logic_vector(width - 1 downto 0);
    ce: in std_logic;
    clr: in std_logic;
    clk: in std_logic;
    o: out std_logic_vector(width - 1 downto 0)
  );
end synth_reg_w_init;
architecture structural of synth_reg_w_init is
  component single_reg_w_init
    generic (
      width: integer := 8;
      init_index: integer := 0;
      init_value: bit_vector := b"0000"
    );
    port (
      i: in std_logic_vector(width - 1 downto 0);
      ce: in std_logic;
      clr: in std_logic;
      clk: in std_logic;
      o: out std_logic_vector(width - 1 downto 0)
    );
  end component;
  signal dly_i: std_logic_vector((latency + 1) * width - 1 downto 0);
  signal dly_clr: std_logic;
begin
  latency_eq_0: if (latency = 0) generate
    o <= i;
  end generate;
  latency_gt_0: if (latency >= 1) generate
    dly_i((latency + 1) * width - 1 downto latency * width) <= i
      after 200 ps;
    dly_clr <= clr after 200 ps;
    fd_array: for index in latency downto 1 generate
       reg_comp: single_reg_w_init
          generic map (
            width => width,
            init_index => init_index,
            init_value => init_value
          )
          port map (
            clk => clk,
            i => dly_i((index + 1) * width - 1 downto index * width),
            o => dly_i(index * width - 1 downto (index - 1) * width),
            ce => ce,
            clr => dly_clr
          );
    end generate;
    o <= dly_i(width - 1 downto 0);
  end generate;
end structural;

-------------------------------------------------------------------
-- System Generator version 13.2 VHDL source file.
--
-- Copyright(C) 2011 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2011 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
-- synopsys translate_off
library XilinxCoreLib;
-- synopsys translate_on
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;
entity xladdsub is
  generic (
    core_name0: string := "";
    a_width: integer := 16;
    a_bin_pt: integer := 4;
    a_arith: integer := xlUnsigned;
    c_in_width: integer := 16;
    c_in_bin_pt: integer := 4;
    c_in_arith: integer := xlUnsigned;
    c_out_width: integer := 16;
    c_out_bin_pt: integer := 4;
    c_out_arith: integer := xlUnsigned;
    b_width: integer := 8;
    b_bin_pt: integer := 2;
    b_arith: integer := xlUnsigned;
    s_width: integer := 17;
    s_bin_pt: integer := 4;
    s_arith: integer := xlUnsigned;
    rst_width: integer := 1;
    rst_bin_pt: integer := 0;
    rst_arith: integer := xlUnsigned;
    en_width: integer := 1;
    en_bin_pt: integer := 0;
    en_arith: integer := xlUnsigned;
    full_s_width: integer := 17;
    full_s_arith: integer := xlUnsigned;
    mode: integer := xlAddMode;
    extra_registers: integer := 0;
    latency: integer := 0;
    quantization: integer := xlTruncate;
    overflow: integer := xlWrap;
    c_latency: integer := 0;
    c_output_width: integer := 17;
    c_has_c_in : integer := 0;
    c_has_c_out : integer := 0
  );
  port (
    a: in std_logic_vector(a_width - 1 downto 0);
    b: in std_logic_vector(b_width - 1 downto 0);
    c_in : in std_logic_vector (0 downto 0) := "0";
    ce: in std_logic;
    clr: in std_logic := '0';
    clk: in std_logic;
    rst: in std_logic_vector(rst_width - 1 downto 0) := "0";
    en: in std_logic_vector(en_width - 1 downto 0) := "1";
    c_out : out std_logic_vector (0 downto 0);
    s: out std_logic_vector(s_width - 1 downto 0)
  );
end xladdsub;
architecture behavior of xladdsub is
  component synth_reg
    generic (
      width: integer := 16;
      latency: integer := 5
    );
    port (
      i: in std_logic_vector(width - 1 downto 0);
      ce: in std_logic;
      clr: in std_logic;
      clk: in std_logic;
      o: out std_logic_vector(width - 1 downto 0)
    );
  end component;
  function format_input(inp: std_logic_vector; old_width, delta, new_arith,
                        new_width: integer)
    return std_logic_vector
  is
    variable vec: std_logic_vector(old_width-1 downto 0);
    variable padded_inp: std_logic_vector((old_width + delta)-1  downto 0);
    variable result: std_logic_vector(new_width-1 downto 0);
  begin
    vec := inp;
    if (delta > 0) then
      padded_inp := pad_LSB(vec, old_width+delta);
      result := extend_MSB(padded_inp, new_width, new_arith);
    else
      result := extend_MSB(vec, new_width, new_arith);
    end if;
    return result;
  end;
  constant full_s_bin_pt: integer := fractional_bits(a_bin_pt, b_bin_pt);
  constant full_a_width: integer := full_s_width;
  constant full_b_width: integer := full_s_width;
  signal full_a: std_logic_vector(full_a_width - 1 downto 0);
  signal full_b: std_logic_vector(full_b_width - 1 downto 0);
  signal core_s: std_logic_vector(full_s_width - 1 downto 0);
  signal conv_s: std_logic_vector(s_width - 1 downto 0);
  signal temp_cout : std_logic;
  signal internal_clr: std_logic;
  signal internal_ce: std_logic;
  signal extra_reg_ce: std_logic;
  signal override: std_logic;
  signal logic1: std_logic_vector(0 downto 0);
  component addsb_11_0_f45daeb7eb283db0
    port (
          a: in std_logic_vector(33 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(33 - 1 downto 0)
    );
  end component;
  attribute syn_black_box of addsb_11_0_f45daeb7eb283db0:
    component is true;
  attribute fpga_dont_touch of addsb_11_0_f45daeb7eb283db0:
    component is "true";
  attribute box_type of addsb_11_0_f45daeb7eb283db0:
    component  is "black_box";
  component addsb_11_0_994b511eee23f4bc
    port (
          a: in std_logic_vector(65 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(65 - 1 downto 0)
    );
  end component;
  attribute syn_black_box of addsb_11_0_994b511eee23f4bc:
    component is true;
  attribute fpga_dont_touch of addsb_11_0_994b511eee23f4bc:
    component is "true";
  attribute box_type of addsb_11_0_994b511eee23f4bc:
    component  is "black_box";
begin
  internal_clr <= (clr or (rst(0))) and ce;
  internal_ce <= ce and en(0);
  logic1(0) <= '1';
  addsub_process: process (a, b, core_s)
  begin
    full_a <= format_input (a, a_width, b_bin_pt - a_bin_pt, a_arith,
                            full_a_width);
    full_b <= format_input (b, b_width, a_bin_pt - b_bin_pt, b_arith,
                            full_b_width);
    conv_s <= convert_type (core_s, full_s_width, full_s_bin_pt, full_s_arith,
                            s_width, s_bin_pt, s_arith, quantization, overflow);
  end process addsub_process;

  comp0: if ((core_name0 = "addsb_11_0_f45daeb7eb283db0")) generate
    core_instance0: addsb_11_0_f45daeb7eb283db0
      port map (
         a => full_a,
         s => core_s,
         b => full_b
      );
  end generate;
  comp1: if ((core_name0 = "addsb_11_0_994b511eee23f4bc")) generate
    core_instance1: addsb_11_0_994b511eee23f4bc
      port map (
         a => full_a,
         s => core_s,
         b => full_b
      );
  end generate;
  latency_test: if (extra_registers > 0) generate
      override_test: if (c_latency > 1) generate
       override_pipe: synth_reg
          generic map (
            width => 1,
            latency => c_latency
          )
          port map (
            i => logic1,
            ce => internal_ce,
            clr => internal_clr,
            clk => clk,
            o(0) => override);
       extra_reg_ce <= ce and en(0) and override;
      end generate override_test;
      no_override: if ((c_latency = 0) or (c_latency = 1)) generate
       extra_reg_ce <= ce and en(0);
      end generate no_override;
      extra_reg: synth_reg
        generic map (
          width => s_width,
          latency => extra_registers
        )
        port map (
          i => conv_s,
          ce => extra_reg_ce,
          clr => internal_clr,
          clk => clk,
          o => s
        );
      cout_test: if (c_has_c_out = 1) generate
      c_out_extra_reg: synth_reg
        generic map (
          width => 1,
          latency => extra_registers
        )
        port map (
          i(0) => temp_cout,
          ce => extra_reg_ce,
          clr => internal_clr,
          clk => clk,
          o => c_out
        );
      end generate cout_test;
  end generate;
  latency_s: if ((latency = 0) or (extra_registers = 0)) generate
    s <= conv_s;
  end generate latency_s;
  latency0: if (((latency = 0) or (extra_registers = 0)) and
                 (c_has_c_out = 1)) generate
    c_out(0) <= temp_cout;
  end generate latency0;
  tie_dangling_cout: if (c_has_c_out = 0) generate
    c_out <= "0";
  end generate tie_dangling_cout;
end architecture behavior;

-------------------------------------------------------------------
-- System Generator version 13.2 VHDL source file.
--
-- Copyright(C) 2011 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2011 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
-- synopsys translate_off
library XilinxCoreLib;
-- synopsys translate_on
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;
entity xlmult is
  generic (
    core_name0: string := "";
    a_width: integer := 4;
    a_bin_pt: integer := 2;
    a_arith: integer := xlSigned;
    b_width: integer := 4;
    b_bin_pt: integer := 1;
    b_arith: integer := xlSigned;
    p_width: integer := 8;
    p_bin_pt: integer := 2;
    p_arith: integer := xlSigned;
    rst_width: integer := 1;
    rst_bin_pt: integer := 0;
    rst_arith: integer := xlUnsigned;
    en_width: integer := 1;
    en_bin_pt: integer := 0;
    en_arith: integer := xlUnsigned;
    quantization: integer := xlTruncate;
    overflow: integer := xlWrap;
    extra_registers: integer := 0;
    c_a_width: integer := 7;
    c_b_width: integer := 7;
    c_type: integer := 0;
    c_a_type: integer := 0;
    c_b_type: integer := 0;
    c_pipelined: integer := 1;
    c_baat: integer := 4;
    multsign: integer := xlSigned;
    c_output_width: integer := 16
  );
  port (
    a: in std_logic_vector(a_width - 1 downto 0);
    b: in std_logic_vector(b_width - 1 downto 0);
    ce: in std_logic;
    clr: in std_logic;
    clk: in std_logic;
    core_ce: in std_logic := '0';
    core_clr: in std_logic := '0';
    core_clk: in std_logic := '0';
    rst: in std_logic_vector(rst_width - 1 downto 0);
    en: in std_logic_vector(en_width - 1 downto 0);
    p: out std_logic_vector(p_width - 1 downto 0)
  );
end xlmult;
architecture behavior of xlmult is
  component synth_reg
    generic (
      width: integer := 16;
      latency: integer := 5
    );
    port (
      i: in std_logic_vector(width - 1 downto 0);
      ce: in std_logic;
      clr: in std_logic;
      clk: in std_logic;
      o: out std_logic_vector(width - 1 downto 0)
    );
  end component;
  component mult_11_2_fbbb37799c4f3417
    port (
      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0)
    );
  end component;
  attribute syn_black_box of mult_11_2_fbbb37799c4f3417:
    component is true;
  attribute fpga_dont_touch of mult_11_2_fbbb37799c4f3417:
    component is "true";
  attribute box_type of mult_11_2_fbbb37799c4f3417:
    component  is "black_box";
  component mult_11_2_88bc300346481aca
    port (
      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0)
    );
  end component;
  attribute syn_black_box of mult_11_2_88bc300346481aca:
    component is true;
  attribute fpga_dont_touch of mult_11_2_88bc300346481aca:
    component is "true";
  attribute box_type of mult_11_2_88bc300346481aca:
    component  is "black_box";
  component mult_11_2_5b844aa5e3ab40e9
    port (
      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0)
    );
  end component;
  attribute syn_black_box of mult_11_2_5b844aa5e3ab40e9:
    component is true;
  attribute fpga_dont_touch of mult_11_2_5b844aa5e3ab40e9:
    component is "true";
  attribute box_type of mult_11_2_5b844aa5e3ab40e9:
    component  is "black_box";
  component mult_11_2_874e4cbe208f3604
    port (
      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0)
    );
  end component;
  attribute syn_black_box of mult_11_2_874e4cbe208f3604:
    component is true;
  attribute fpga_dont_touch of mult_11_2_874e4cbe208f3604:
    component is "true";
  attribute box_type of mult_11_2_874e4cbe208f3604:
    component  is "black_box";
  component mult_11_2_f16a7a44cbd48451
    port (
      b: in std_logic_vector(c_b_width - 1 downto 0);
      p: out std_logic_vector(c_output_width - 1 downto 0);
      clk: in std_logic;
      ce: in std_logic;
      sclr: in std_logic;
      a: in std_logic_vector(c_a_width - 1 downto 0)
    );
  end component;
  attribute syn_black_box of mult_11_2_f16a7a44cbd48451:
    component is true;
  attribute fpga_dont_touch of mult_11_2_f16a7a44cbd48451:
    component is "true";
  attribute box_type of mult_11_2_f16a7a44cbd48451:
    component  is "black_box";
  signal tmp_a: std_logic_vector(c_a_width - 1 downto 0);
  signal conv_a: std_logic_vector(c_a_width - 1 downto 0);
  signal tmp_b: std_logic_vector(c_b_width - 1 downto 0);
  signal conv_b: std_logic_vector(c_b_width - 1 downto 0);
  signal tmp_p: std_logic_vector(c_output_width - 1 downto 0);
  signal conv_p: std_logic_vector(p_width - 1 downto 0);
  -- synopsys translate_off
  signal real_a, real_b, real_p: real;
  -- synopsys translate_on
  signal rfd: std_logic;
  signal rdy: std_logic;
  signal nd: std_logic;
  signal internal_ce: std_logic;
  signal internal_clr: std_logic;
  signal internal_core_ce: std_logic;
begin
-- synopsys translate_off
-- synopsys translate_on
  internal_ce <= ce and en(0);
  internal_core_ce <= core_ce and en(0);
  internal_clr <= (clr or rst(0)) and ce;
  nd <= internal_ce;
  input_process:  process (a,b)
  begin
    tmp_a <= zero_ext(a, c_a_width);
    tmp_b <= zero_ext(b, c_b_width);
  end process;
  output_process: process (tmp_p)
  begin
    conv_p <= convert_type(tmp_p, c_output_width, a_bin_pt+b_bin_pt, multsign,
                           p_width, p_bin_pt, p_arith, quantization, overflow);
  end process;
  comp0: if ((core_name0 = "mult_11_2_fbbb37799c4f3417")) generate
    core_instance0: mult_11_2_fbbb37799c4f3417
      port map (
        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b
      );
  end generate;
  comp1: if ((core_name0 = "mult_11_2_88bc300346481aca")) generate
    core_instance1: mult_11_2_88bc300346481aca
      port map (
        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b
      );
  end generate;
  comp2: if ((core_name0 = "mult_11_2_5b844aa5e3ab40e9")) generate
    core_instance2: mult_11_2_5b844aa5e3ab40e9
      port map (
        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b
      );
  end generate;
  comp3: if ((core_name0 = "mult_11_2_874e4cbe208f3604")) generate
    core_instance3: mult_11_2_874e4cbe208f3604
      port map (
        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b
      );
  end generate;
  comp4: if ((core_name0 = "mult_11_2_f16a7a44cbd48451")) generate
    core_instance4: mult_11_2_f16a7a44cbd48451
      port map (
        a => tmp_a,
        clk => clk,
        ce => internal_ce,
        sclr => internal_clr,
        p => tmp_p,
        b => tmp_b
      );
  end generate;
  latency_gt_0: if (extra_registers > 0) generate
    reg: synth_reg
      generic map (
        width => p_width,
        latency => extra_registers
      )
      port map (
        i => conv_p,
        ce => internal_ce,
        clr => internal_clr,
        clk => clk,
        o => p
      );
  end generate;
  latency_eq_0: if (extra_registers = 0) generate
    p <= conv_p;
  end generate;
end architecture behavior;

-------------------------------------------------------------------
-- System Generator version 13.2 VHDL source file.
--
-- Copyright(C) 2011 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2011 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
-- synopsys translate_off
library XilinxCoreLib;
-- synopsys translate_on
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;
entity xlcmult is
  generic (
    core_name0: string := "";
    a_width: integer := 4;
    a_bin_pt: integer := 2;
    a_arith: integer := xlSigned;
    b_width: integer := 4;
    b_bin_pt: integer := 2;
    b_arith: integer := xlSigned;
    p_width: integer := 8;
    p_bin_pt: integer := 2;
    p_arith: integer := xlSigned;
    rst_width: integer := 1;
    rst_bin_pt: integer := 0;
    rst_arith: integer := xlUnsigned;
    en_width: integer := 1;
    en_bin_pt: integer := 0;
    en_arith: integer := xlUnsigned;
    multsign: integer := xlSigned;
    quantization: integer := xlTruncate;
    overflow: integer := xlWrap;
    extra_registers: integer := 0;
    c_a_width: integer := 7;
    c_b_width: integer := 7;
    c_a_type: integer := 0;
    c_b_type: integer := 0;
    c_type: integer := 0;
    const_bin_pt: integer := 1;
    zero_const : integer := 0;
    c_output_width: integer := 16
  );
  port (
    a: in std_logic_vector(a_width - 1 downto 0);
    ce: in std_logic;
    clr: in std_logic;
    clk: in std_logic;
    core_ce: in std_logic:= '0';
    core_clr: in std_logic:= '0';
    core_clk: in std_logic:= '0';
    rst: in std_logic_vector(rst_width - 1 downto 0);
    en: in std_logic_vector(en_width - 1 downto 0);
    p: out std_logic_vector(p_width - 1 downto 0)
  );
end xlcmult;
architecture behavior of xlcmult is
  component synth_reg
    generic (
      width: integer := 16;
      latency: integer := 5
    );
    port (
      i: in std_logic_vector(width - 1 downto 0);
      ce: in std_logic;
      clr: in std_logic;
      clk: in std_logic;
      o: out std_logic_vector(width - 1 downto 0)
    );
  end component;
  signal tmp_a: std_logic_vector(c_a_width - 1 downto 0);
  signal tmp_p: std_logic_vector(c_output_width - 1 downto 0);
  signal conv_p: std_logic_vector(p_width - 1 downto 0);
  -- synopsys translate_off
  signal real_a, real_p: real;
  -- synopsys translate_on
  signal nd: std_logic;
  signal internal_ce: std_logic;
  signal internal_clr: std_logic;
  signal internal_core_ce: std_logic;
  component cmlt_11_2_a7f98d96f4ab0004
    port (
      p: out std_logic_vector(c_output_width - 1 downto 0);
      a: in std_logic_vector(c_a_width - 1 downto 0)
    );
  end component;
  attribute syn_black_box of cmlt_11_2_a7f98d96f4ab0004:
    component is true;
  attribute fpga_dont_touch of cmlt_11_2_a7f98d96f4ab0004:
    component is "true";
  attribute box_type of cmlt_11_2_a7f98d96f4ab0004:
    component  is "black_box";
  component cmlt_11_2_bdd3d0413063c796
    port (
      p: out std_logic_vector(c_output_width - 1 downto 0);
      a: in std_logic_vector(c_a_width - 1 downto 0)
    );
  end component;
  attribute syn_black_box of cmlt_11_2_bdd3d0413063c796:
    component is true;
  attribute fpga_dont_touch of cmlt_11_2_bdd3d0413063c796:
    component is "true";
  attribute box_type of cmlt_11_2_bdd3d0413063c796:
    component  is "black_box";
  component cmlt_11_2_c07debef2aeadcba
    port (
      p: out std_logic_vector(c_output_width - 1 downto 0);
      a: in std_logic_vector(c_a_width - 1 downto 0)
    );
  end component;
  attribute syn_black_box of cmlt_11_2_c07debef2aeadcba:
    component is true;
  attribute fpga_dont_touch of cmlt_11_2_c07debef2aeadcba:
    component is "true";
  attribute box_type of cmlt_11_2_c07debef2aeadcba:
    component  is "black_box";
begin
  -- synopsys translate_off
  -- synopsys translate_on
  input_process: process(a)
    variable tmp_p_bin_pt, tmp_p_arith: integer;
  begin
    tmp_a <= zero_ext(a, c_a_width);
  end process;
  output_process: process(tmp_p)
  begin
    conv_p <= convert_type(tmp_p, c_output_width, a_bin_pt+b_bin_pt, multsign,
                           p_width, p_bin_pt, p_arith, quantization, overflow);
  end process;
  internal_ce <= ce and en(0);
  internal_core_ce <= core_ce and en(0);
  internal_clr <= (clr or rst(0)) and ce;
  nd <= internal_ce;
  comp0: if ((core_name0 = "cmlt_11_2_a7f98d96f4ab0004")) generate
    core_instance0: cmlt_11_2_a7f98d96f4ab0004
      port map (
      p => tmp_p,
      a => tmp_a
      );
  end generate;
  comp1: if ((core_name0 = "cmlt_11_2_bdd3d0413063c796")) generate
    core_instance1: cmlt_11_2_bdd3d0413063c796
      port map (
      p => tmp_p,
      a => tmp_a
      );
  end generate;
  comp2: if ((core_name0 = "cmlt_11_2_c07debef2aeadcba")) generate
    core_instance2: cmlt_11_2_c07debef2aeadcba
      port map (
      p => tmp_p,
      a => tmp_a
      );
  end generate;
  latency_gt_0: if (extra_registers > 0) and (zero_const = 0)
  generate
    reg: synth_reg
      generic map (
        width => p_width,
        latency => extra_registers
      )
      port map (
        i => conv_p,
        ce => internal_ce,
        clr => internal_clr,
        clk => clk,
        o => p
      );
  end generate;
  latency0: if ( (extra_registers = 0) and (zero_const = 0) )
  generate
    p <= conv_p;
  end generate latency0;
  zero_constant: if (zero_const = 1)
  generate
    p <= integer_to_std_logic_vector(0,p_width,p_arith);
  end generate zero_constant;
end architecture behavior;

-------------------------------------------------------------------
-- System Generator version 13.2 VHDL source file.
--
-- Copyright(C) 2011 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2011 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
library IEEE;
use IEEE.std_logic_1164.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;
entity xldelay is
   generic(width        : integer := -1;
           latency      : integer := -1;
           reg_retiming : integer := 0);
   port(d       : in std_logic_vector (width-1 downto 0);
        ce      : in std_logic;
        clk     : in std_logic;
        en      : in std_logic;
        q       : out std_logic_vector (width-1 downto 0));
end xldelay;
architecture behavior of xldelay is
   component synth_reg
      generic (width       : integer;
               latency     : integer);
      port (i       : in std_logic_vector(width-1 downto 0);
            ce      : in std_logic;
            clr     : in std_logic;
            clk     : in std_logic;
            o       : out std_logic_vector(width-1 downto 0));
   end component;
   component synth_reg_reg
      generic (width       : integer;
               latency     : integer);
      port (i       : in std_logic_vector(width-1 downto 0);
            ce      : in std_logic;
            clr     : in std_logic;
            clk     : in std_logic;
            o       : out std_logic_vector(width-1 downto 0));
   end component;
   signal internal_ce  : std_logic;
begin
   internal_ce  <= ce and en;
   srl_delay: if (reg_retiming = 0) or (latency < 1) generate
     synth_reg_srl_inst : synth_reg
       generic map (
         width   => width,
         latency => latency)
       port map (
         i   => d,
         ce  => internal_ce,
         clr => '0',
         clk => clk,
         o   => q);
   end generate srl_delay;
   reg_delay: if (reg_retiming = 1) and (latency >= 1) generate
     synth_reg_reg_inst : synth_reg_reg
       generic map (
         width   => width,
         latency => latency)
       port map (
         i   => d,
         ce  => internal_ce,
         clr => '0',
         clk => clk,
         o   => q);
   end generate reg_delay;
end architecture behavior;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;

entity constant_37567836aa is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_37567836aa;


architecture behavior of constant_37567836aa is
begin
  op <= "00000000000000000000000000000000";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;

entity constant_ebdfb0074f is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_ebdfb0074f;


architecture behavior of constant_ebdfb0074f is
begin
  op <= "00000000000000000000000000000001";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;

entity constant_a54a5a8e79 is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_a54a5a8e79;


architecture behavior of constant_a54a5a8e79 is
begin
  op <= "00000000000000000000000000000010";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;

entity constant_d8b3fb90c0 is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_d8b3fb90c0;


architecture behavior of constant_d8b3fb90c0 is
begin
  op <= "00000000000000000000000000000011";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;

entity constant_03ef95f888 is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_03ef95f888;


architecture behavior of constant_03ef95f888 is
begin
  op <= "00000000000000000000000000000100";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;

entity constant_2b1256111c is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_2b1256111c;


architecture behavior of constant_2b1256111c is
begin
  op <= "00000000000000000000000000000101";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;

entity constant_d742892668 is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_d742892668;


architecture behavior of constant_d742892668 is
begin
  op <= "00000000000000000000000000000110";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;

entity constant_426bc09745 is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_426bc09745;


architecture behavior of constant_426bc09745 is
begin
  op <= "00000000000000000000000000000111";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;

-- Generated from Simulink block "local_address/Local Address"

entity local_address_entity_2bb196f87a is
  port (
    address: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    offset: in std_logic_vector(31 downto 0); 
    size: in std_logic_vector(31 downto 0); 
    local_address: out std_logic_vector(31 downto 0)
  );
end local_address_entity_2bb196f87a;

architecture structural of local_address_entity_2bb196f87a is
  signal addr_0_net_x0: std_logic_vector(31 downto 0);
  signal addsub_s_net_x1: std_logic_vector(31 downto 0);
  signal addsub_s_net_x2: std_logic_vector(31 downto 0);
  signal ce_1_sg_x0: std_logic;
  signal clk_1_sg_x0: std_logic;
  signal delay1_q_net_x0: std_logic_vector(31 downto 0);
  signal mult_p_net: std_logic_vector(31 downto 0);

begin
  addr_0_net_x0 <= address;
  ce_1_sg_x0 <= ce_1;
  clk_1_sg_x0 <= clk_1;
  addsub_s_net_x1 <= offset;
  delay1_q_net_x0 <= size;
  local_address <= addsub_s_net_x2;

  addsub: entity local_address_lib.xladdsub
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 32,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 32,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 33,
      core_name0 => "addsb_11_0_f45daeb7eb283db0",
      extra_registers => 0,
      full_s_arith => 1,
      full_s_width => 33,
      latency => 0,
      overflow => 2,
      quantization => 1,
      s_arith => xlUnsigned,
      s_bin_pt => 0,
      s_width => 32
    )
    port map (
      a => mult_p_net,
      b => addsub_s_net_x1,
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      en => "1",
      s => addsub_s_net_x2
    );

  mult: entity local_address_lib.xlmult
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 32,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 32,
      c_a_type => 1,
      c_a_width => 32,
      c_b_type => 1,
      c_b_width => 32,
      c_baat => 32,
      c_output_width => 64,
      c_type => 1,
      core_name0 => "mult_11_2_fbbb37799c4f3417",
      extra_registers => 1,
      multsign => 1,
      overflow => 2,
      p_arith => xlUnsigned,
      p_bin_pt => 0,
      p_width => 32,
      quantization => 1
    )
    port map (
      a => delay1_q_net_x0,
      b => addr_0_net_x0,
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      core_ce => ce_1_sg_x0,
      core_clk => clk_1_sg_x0,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;

-- Generated from Simulink block "local_address/Subsystem"

entity subsystem_entity_77cff812b1 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    offset_base: in std_logic_vector(31 downto 0); 
    warp_lane_id: in std_logic_vector(1 downto 0); 
    warp_size_num: in std_logic_vector(31 downto 0); 
    offset: out std_logic_vector(31 downto 0)
  );
end subsystem_entity_77cff812b1;

architecture structural of subsystem_entity_77cff812b1 is
  signal addsub1_s_net: std_logic_vector(31 downto 0);
  signal addsub_s_net_x2: std_logic_vector(31 downto 0);
  signal ce_1_sg_x8: std_logic;
  signal clk_1_sg_x8: std_logic;
  signal cmult1_p_net: std_logic_vector(63 downto 0);
  signal cmult2_p_net: std_logic_vector(31 downto 0);
  signal constant_op_net_x0: std_logic_vector(31 downto 0);
  signal delay_q_net_x0: std_logic_vector(1 downto 0);
  signal mult3_p_net_x0: std_logic_vector(31 downto 0);

begin
  ce_1_sg_x8 <= ce_1;
  clk_1_sg_x8 <= clk_1;
  mult3_p_net_x0 <= offset_base;
  delay_q_net_x0 <= warp_lane_id;
  constant_op_net_x0 <= warp_size_num;
  offset <= addsub_s_net_x2;

  addsub: entity local_address_lib.xladdsub
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 32,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 64,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 65,
      core_name0 => "addsb_11_0_994b511eee23f4bc",
      extra_registers => 0,
      full_s_arith => 1,
      full_s_width => 65,
      latency => 0,
      overflow => 2,
      quantization => 1,
      s_arith => xlUnsigned,
      s_bin_pt => 0,
      s_width => 32
    )
    port map (
      a => mult3_p_net_x0,
      b => cmult1_p_net,
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      clr => '0',
      en => "1",
      s => addsub_s_net_x2
    );

  addsub1: entity local_address_lib.xladdsub
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 32,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 32,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 33,
      core_name0 => "addsb_11_0_f45daeb7eb283db0",
      extra_registers => 0,
      full_s_arith => 1,
      full_s_width => 33,
      latency => 0,
      overflow => 2,
      quantization => 1,
      s_arith => xlUnsigned,
      s_bin_pt => 0,
      s_width => 32
    )
    port map (
      a => cmult2_p_net,
      b => constant_op_net_x0,
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      clr => '0',
      en => "1",
      s => addsub1_s_net
    );

  cmult1: entity local_address_lib.xlcmult
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 32,
      b_bin_pt => 0,
      c_a_type => 1,
      c_a_width => 32,
      c_b_type => 1,
      c_b_width => 32,
      c_output_width => 64,
      core_name0 => "cmlt_11_2_a7f98d96f4ab0004",
      extra_registers => 0,
      multsign => 1,
      overflow => 1,
      p_arith => xlUnsigned,
      p_bin_pt => 0,
      p_width => 64,
      quantization => 1,
      zero_const => 0
    )
    port map (
      a => addsub1_s_net,
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      clr => '0',
      core_ce => ce_1_sg_x8,
      core_clk => clk_1_sg_x8,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => cmult1_p_net
    );

  cmult2: entity local_address_lib.xlcmult
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 2,
      b_bin_pt => 0,
      c_a_type => 1,
      c_a_width => 2,
      c_b_type => 1,
      c_b_width => 32,
      c_output_width => 34,
      core_name0 => "cmlt_11_2_bdd3d0413063c796",
      extra_registers => 0,
      multsign => 1,
      overflow => 2,
      p_arith => xlUnsigned,
      p_bin_pt => 0,
      p_width => 32,
      quantization => 1,
      zero_const => 0
    )
    port map (
      a => delay_q_net_x0,
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      clr => '0',
      core_ce => ce_1_sg_x8,
      core_clk => clk_1_sg_x8,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => cmult2_p_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;

-- Generated from Simulink block "local_address/offset_base"

entity offset_base_entity_d182c5eac1 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    core_id: in std_logic_vector(7 downto 0); 
    num_warps: in std_logic_vector(4 downto 0); 
    warp_id: in std_logic_vector(4 downto 0); 
    warp_size_by_4: in std_logic_vector(37 downto 0); 
    offset_base: out std_logic_vector(31 downto 0)
  );
end offset_base_entity_d182c5eac1;

architecture structural of offset_base_entity_d182c5eac1 is
  signal addsub_s_net: std_logic_vector(32 downto 0);
  signal ce_1_sg_x16: std_logic;
  signal clk_1_sg_x16: std_logic;
  signal cmult_p_net_x0: std_logic_vector(37 downto 0);
  signal core_id_net_x0: std_logic_vector(7 downto 0);
  signal delay_q_net: std_logic_vector(4 downto 0);
  signal mult2_p_net: std_logic_vector(31 downto 0);
  signal mult3_p_net_x8: std_logic_vector(31 downto 0);
  signal num_warps_net_x0: std_logic_vector(4 downto 0);
  signal warp_id_net_x0: std_logic_vector(4 downto 0);

begin
  ce_1_sg_x16 <= ce_1;
  clk_1_sg_x16 <= clk_1;
  core_id_net_x0 <= core_id;
  num_warps_net_x0 <= num_warps;
  warp_id_net_x0 <= warp_id;
  cmult_p_net_x0 <= warp_size_by_4;
  offset_base <= mult3_p_net_x8;

  addsub: entity local_address_lib.xladdsub
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 32,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 5,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 33,
      core_name0 => "addsb_11_0_f45daeb7eb283db0",
      extra_registers => 0,
      full_s_arith => 1,
      full_s_width => 33,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlUnsigned,
      s_bin_pt => 0,
      s_width => 33
    )
    port map (
      a => mult2_p_net,
      b => delay_q_net,
      ce => ce_1_sg_x16,
      clk => clk_1_sg_x16,
      clr => '0',
      en => "1",
      s => addsub_s_net
    );

  delay: entity local_address_lib.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 5
    )
    port map (
      ce => ce_1_sg_x16,
      clk => clk_1_sg_x16,
      d => warp_id_net_x0,
      en => '1',
      q => delay_q_net
    );

  mult2: entity local_address_lib.xlmult
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 5,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 8,
      c_a_type => 1,
      c_a_width => 5,
      c_b_type => 1,
      c_b_width => 8,
      c_baat => 5,
      c_output_width => 13,
      c_type => 1,
      core_name0 => "mult_11_2_88bc300346481aca",
      extra_registers => 0,
      multsign => 1,
      overflow => 2,
      p_arith => xlUnsigned,
      p_bin_pt => 0,
      p_width => 32,
      quantization => 1
    )
    port map (
      a => num_warps_net_x0,
      b => core_id_net_x0,
      ce => ce_1_sg_x16,
      clk => clk_1_sg_x16,
      clr => '0',
      core_ce => ce_1_sg_x16,
      core_clk => clk_1_sg_x16,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult2_p_net
    );

  mult3: entity local_address_lib.xlmult
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 38,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 33,
      c_a_type => 1,
      c_a_width => 38,
      c_b_type => 1,
      c_b_width => 33,
      c_baat => 38,
      c_output_width => 71,
      c_type => 1,
      core_name0 => "mult_11_2_5b844aa5e3ab40e9",
      extra_registers => 1,
      multsign => 1,
      overflow => 2,
      p_arith => xlUnsigned,
      p_bin_pt => 0,
      p_width => 32,
      quantization => 1
    )
    port map (
      a => cmult_p_net_x0,
      b => addsub_s_net,
      ce => ce_1_sg_x16,
      clk => clk_1_sg_x16,
      clr => '0',
      core_ce => ce_1_sg_x16,
      core_clk => clk_1_sg_x16,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult3_p_net_x8
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;

-- Generated from Simulink block "local_address/size"

entity size_entity_ff97ec0dfa is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    core_count: in std_logic_vector(7 downto 0); 
    num_warps: in std_logic_vector(4 downto 0); 
    warp_size_by_4: in std_logic_vector(37 downto 0); 
    size: out std_logic_vector(31 downto 0)
  );
end size_entity_ff97ec0dfa;

architecture structural of size_entity_ff97ec0dfa is
  signal ce_1_sg_x17: std_logic;
  signal clk_1_sg_x17: std_logic;
  signal cmult_p_net_x1: std_logic_vector(37 downto 0);
  signal core_count_net_x0: std_logic_vector(7 downto 0);
  signal delay_q_net: std_logic_vector(37 downto 0);
  signal mult1_p_net_x0: std_logic_vector(31 downto 0);
  signal mult_p_net: std_logic_vector(31 downto 0);
  signal num_warps_net_x1: std_logic_vector(4 downto 0);

begin
  ce_1_sg_x17 <= ce_1;
  clk_1_sg_x17 <= clk_1;
  core_count_net_x0 <= core_count;
  num_warps_net_x1 <= num_warps;
  cmult_p_net_x1 <= warp_size_by_4;
  size <= mult1_p_net_x0;

  delay: entity local_address_lib.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 38
    )
    port map (
      ce => ce_1_sg_x17,
      clk => clk_1_sg_x17,
      d => cmult_p_net_x1,
      en => '1',
      q => delay_q_net
    );

  mult: entity local_address_lib.xlmult
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 8,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 5,
      c_a_type => 1,
      c_a_width => 8,
      c_b_type => 1,
      c_b_width => 5,
      c_baat => 8,
      c_output_width => 13,
      c_type => 1,
      core_name0 => "mult_11_2_874e4cbe208f3604",
      extra_registers => 0,
      multsign => 1,
      overflow => 2,
      p_arith => xlUnsigned,
      p_bin_pt => 0,
      p_width => 32,
      quantization => 1
    )
    port map (
      a => core_count_net_x0,
      b => num_warps_net_x1,
      ce => ce_1_sg_x17,
      clk => clk_1_sg_x17,
      clr => '0',
      core_ce => ce_1_sg_x17,
      core_clk => clk_1_sg_x17,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult_p_net
    );

  mult1: entity local_address_lib.xlmult
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 32,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 38,
      c_a_type => 1,
      c_a_width => 32,
      c_b_type => 1,
      c_b_width => 38,
      c_baat => 32,
      c_output_width => 70,
      c_type => 1,
      core_name0 => "mult_11_2_f16a7a44cbd48451",
      extra_registers => 1,
      multsign => 1,
      overflow => 2,
      p_arith => xlUnsigned,
      p_bin_pt => 0,
      p_width => 32,
      quantization => 1
    )
    port map (
      a => mult_p_net,
      b => delay_q_net,
      ce => ce_1_sg_x17,
      clk => clk_1_sg_x17,
      clr => '0',
      core_ce => ce_1_sg_x17,
      core_clk => clk_1_sg_x17,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => mult1_p_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library local_address_lib;
use local_address_lib.conv_pkg.all;

-- Generated from Simulink block "local_address"

entity local_address is
  port (
    addr_0i: in std_logic_vector(31 downto 0); 
    addr_1i: in std_logic_vector(31 downto 0); 
    addr_2i: in std_logic_vector(31 downto 0); 
    addr_3i: in std_logic_vector(31 downto 0); 
    addr_4i: in std_logic_vector(31 downto 0); 
    addr_5i: in std_logic_vector(31 downto 0); 
    addr_6i: in std_logic_vector(31 downto 0); 
    addr_7i: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    core_count: in std_logic_vector(7 downto 0); 
    core_id: in std_logic_vector(7 downto 0); 
    num_warps: in std_logic_vector(4 downto 0); 
    warp_id: in std_logic_vector(4 downto 0); 
    warp_lane_id: in std_logic_vector(1 downto 0); 
    warp_size: in std_logic_vector(5 downto 0); 
    local_addr_0i: out std_logic_vector(31 downto 0); 
    local_addr_1i: out std_logic_vector(31 downto 0); 
    local_addr_2i: out std_logic_vector(31 downto 0); 
    local_addr_3i: out std_logic_vector(31 downto 0); 
    local_addr_4i: out std_logic_vector(31 downto 0); 
    local_addr_5i: out std_logic_vector(31 downto 0); 
    local_addr_6i: out std_logic_vector(31 downto 0); 
    local_addr_7i: out std_logic_vector(31 downto 0)
  );
end local_address;

architecture structural of local_address is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "local_address,sysgen_core,{clock_period=10.00000000,clocking=Clock_Enables,compilation=NGC_Netlist,sample_periods=1.00000000000,testbench=0,total_blocks=185,xilinx_adder_subtracter_block=25,xilinx_constant_block_block=8,xilinx_constant_multiplier_block=17,xilinx_delay_block=4,xilinx_gateway_in_block=14,xilinx_gateway_out_block=8,xilinx_multiplier_block=12,xilinx_resource_estimator_block=1,xilinx_system_generator_block=1,}";

  signal addr_0i_net: std_logic_vector(31 downto 0);
  signal addr_1i_net: std_logic_vector(31 downto 0);
  signal addr_2i_net: std_logic_vector(31 downto 0);
  signal addr_3i_net: std_logic_vector(31 downto 0);
  signal addr_4i_net: std_logic_vector(31 downto 0);
  signal addr_5i_net: std_logic_vector(31 downto 0);
  signal addr_6i_net: std_logic_vector(31 downto 0);
  signal addr_7i_net: std_logic_vector(31 downto 0);
  signal addsub_s_net_x10: std_logic_vector(31 downto 0);
  signal addsub_s_net_x11: std_logic_vector(31 downto 0);
  signal addsub_s_net_x12: std_logic_vector(31 downto 0);
  signal addsub_s_net_x13: std_logic_vector(31 downto 0);
  signal addsub_s_net_x14: std_logic_vector(31 downto 0);
  signal addsub_s_net_x15: std_logic_vector(31 downto 0);
  signal addsub_s_net_x16: std_logic_vector(31 downto 0);
  signal addsub_s_net_x17: std_logic_vector(31 downto 0);
  signal ce_1_sg_x18: std_logic;
  signal clk_1_sg_x18: std_logic;
  signal cmult_p_net_x1: std_logic_vector(37 downto 0);
  signal constant1_op_net_x0: std_logic_vector(31 downto 0);
  signal constant2_op_net_x0: std_logic_vector(31 downto 0);
  signal constant3_op_net_x0: std_logic_vector(31 downto 0);
  signal constant4_op_net_x0: std_logic_vector(31 downto 0);
  signal constant5_op_net_x0: std_logic_vector(31 downto 0);
  signal constant6_op_net_x0: std_logic_vector(31 downto 0);
  signal constant7_op_net_x0: std_logic_vector(31 downto 0);
  signal constant_op_net_x0: std_logic_vector(31 downto 0);
  signal core_count_net: std_logic_vector(7 downto 0);
  signal core_id_net: std_logic_vector(7 downto 0);
  signal delay1_q_net_x7: std_logic_vector(31 downto 0);
  signal delay_q_net_x7: std_logic_vector(1 downto 0);
  signal local_addr_0i_net: std_logic_vector(31 downto 0);
  signal local_addr_1i_net: std_logic_vector(31 downto 0);
  signal local_addr_2i_net: std_logic_vector(31 downto 0);
  signal local_addr_3i_net: std_logic_vector(31 downto 0);
  signal local_addr_4i_net: std_logic_vector(31 downto 0);
  signal local_addr_5i_net: std_logic_vector(31 downto 0);
  signal local_addr_6i_net: std_logic_vector(31 downto 0);
  signal local_addr_7i_net: std_logic_vector(31 downto 0);
  signal mult1_p_net_x0: std_logic_vector(31 downto 0);
  signal mult3_p_net_x8: std_logic_vector(31 downto 0);
  signal num_warps_net: std_logic_vector(4 downto 0);
  signal warp_id_net: std_logic_vector(4 downto 0);
  signal warp_lane_id_net: std_logic_vector(1 downto 0);
  signal warp_size_net: std_logic_vector(5 downto 0);

begin
  addr_0i_net <= addr_0i;
  addr_1i_net <= addr_1i;
  addr_2i_net <= addr_2i;
  addr_3i_net <= addr_3i;
  addr_4i_net <= addr_4i;
  addr_5i_net <= addr_5i;
  addr_6i_net <= addr_6i;
  addr_7i_net <= addr_7i;
  ce_1_sg_x18 <= ce_1;
  clk_1_sg_x18 <= clk_1;
  core_count_net <= core_count;
  core_id_net <= core_id;
  num_warps_net <= num_warps;
  warp_id_net <= warp_id;
  warp_lane_id_net <= warp_lane_id;
  warp_size_net <= warp_size;
  local_addr_0i <= local_addr_0i_net;
  local_addr_1i <= local_addr_1i_net;
  local_addr_2i <= local_addr_2i_net;
  local_addr_3i <= local_addr_3i_net;
  local_addr_4i <= local_addr_4i_net;
  local_addr_5i <= local_addr_5i_net;
  local_addr_6i <= local_addr_6i_net;
  local_addr_7i <= local_addr_7i_net;

  cmult: entity local_address_lib.xlcmult
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 6,
      b_bin_pt => 0,
      c_a_type => 1,
      c_a_width => 6,
      c_b_type => 1,
      c_b_width => 32,
      c_output_width => 38,
      core_name0 => "cmlt_11_2_c07debef2aeadcba",
      extra_registers => 0,
      multsign => 1,
      overflow => 1,
      p_arith => xlUnsigned,
      p_bin_pt => 0,
      p_width => 38,
      quantization => 1,
      zero_const => 0
    )
    port map (
      a => warp_size_net,
      ce => ce_1_sg_x18,
      clk => clk_1_sg_x18,
      clr => '0',
      core_ce => ce_1_sg_x18,
      core_clk => clk_1_sg_x18,
      core_clr => '1',
      en => "1",
      rst => "0",
      p => cmult_p_net_x1
    );

  constant1: entity local_address_lib.constant_ebdfb0074f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant1_op_net_x0
    );

  constant2: entity local_address_lib.constant_a54a5a8e79
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant2_op_net_x0
    );

  constant3: entity local_address_lib.constant_d8b3fb90c0
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant3_op_net_x0
    );

  constant4: entity local_address_lib.constant_03ef95f888
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant4_op_net_x0
    );

  constant5: entity local_address_lib.constant_2b1256111c
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant5_op_net_x0
    );

  constant6: entity local_address_lib.constant_d742892668
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant6_op_net_x0
    );

  constant7: entity local_address_lib.constant_426bc09745
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant7_op_net_x0
    );

  constant_x0: entity local_address_lib.constant_37567836aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net_x0
    );

  delay: entity local_address_lib.xldelay
    generic map (
      latency => 6,
      reg_retiming => 0,
      width => 2
    )
    port map (
      ce => ce_1_sg_x18,
      clk => clk_1_sg_x18,
      d => warp_lane_id_net,
      en => '1',
      q => delay_q_net_x7
    );

  delay1: entity local_address_lib.xldelay
    generic map (
      latency => 3,
      reg_retiming => 0,
      width => 32
    )
    port map (
      ce => ce_1_sg_x18,
      clk => clk_1_sg_x18,
      d => mult1_p_net_x0,
      en => '1',
      q => delay1_q_net_x7
    );

  local_address1_4755b921fa: entity local_address_lib.local_address_entity_2bb196f87a
    port map (
      address => addr_1i_net,
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      offset => addsub_s_net_x11,
      size => delay1_q_net_x7,
      local_address => local_addr_1i_net
    );

  local_address2_50678725f9: entity local_address_lib.local_address_entity_2bb196f87a
    port map (
      address => addr_2i_net,
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      offset => addsub_s_net_x12,
      size => delay1_q_net_x7,
      local_address => local_addr_2i_net
    );

  local_address3_f6599fe27e: entity local_address_lib.local_address_entity_2bb196f87a
    port map (
      address => addr_3i_net,
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      offset => addsub_s_net_x13,
      size => delay1_q_net_x7,
      local_address => local_addr_3i_net
    );

  local_address4_1ad606f351: entity local_address_lib.local_address_entity_2bb196f87a
    port map (
      address => addr_4i_net,
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      offset => addsub_s_net_x14,
      size => delay1_q_net_x7,
      local_address => local_addr_4i_net
    );

  local_address5_435e21ef13: entity local_address_lib.local_address_entity_2bb196f87a
    port map (
      address => addr_5i_net,
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      offset => addsub_s_net_x15,
      size => delay1_q_net_x7,
      local_address => local_addr_5i_net
    );

  local_address6_73b63f5c04: entity local_address_lib.local_address_entity_2bb196f87a
    port map (
      address => addr_6i_net,
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      offset => addsub_s_net_x16,
      size => delay1_q_net_x7,
      local_address => local_addr_6i_net
    );

  local_address7_d9559052f4: entity local_address_lib.local_address_entity_2bb196f87a
    port map (
      address => addr_7i_net,
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      offset => addsub_s_net_x17,
      size => delay1_q_net_x7,
      local_address => local_addr_7i_net
    );

  local_address_2bb196f87a: entity local_address_lib.local_address_entity_2bb196f87a
    port map (
      address => addr_0i_net,
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      offset => addsub_s_net_x10,
      size => delay1_q_net_x7,
      local_address => local_addr_0i_net
    );

  offset_base_d182c5eac1: entity local_address_lib.offset_base_entity_d182c5eac1
    port map (
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      core_id => core_id_net,
      num_warps => num_warps_net,
      warp_id => warp_id_net,
      warp_size_by_4 => cmult_p_net_x1,
      offset_base => mult3_p_net_x8
    );

  size_ff97ec0dfa: entity local_address_lib.size_entity_ff97ec0dfa
    port map (
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      core_count => core_count_net,
      num_warps => num_warps_net,
      warp_size_by_4 => cmult_p_net_x1,
      size => mult1_p_net_x0
    );

  subsystem1_8da6749eb1: entity local_address_lib.subsystem_entity_77cff812b1
    port map (
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      offset_base => mult3_p_net_x8,
      warp_lane_id => delay_q_net_x7,
      warp_size_num => constant1_op_net_x0,
      offset => addsub_s_net_x11
    );

  subsystem2_62ebc8eb2e: entity local_address_lib.subsystem_entity_77cff812b1
    port map (
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      offset_base => mult3_p_net_x8,
      warp_lane_id => delay_q_net_x7,
      warp_size_num => constant2_op_net_x0,
      offset => addsub_s_net_x12
    );

  subsystem3_a7f3d966a9: entity local_address_lib.subsystem_entity_77cff812b1
    port map (
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      offset_base => mult3_p_net_x8,
      warp_lane_id => delay_q_net_x7,
      warp_size_num => constant3_op_net_x0,
      offset => addsub_s_net_x13
    );

  subsystem4_d56e36e36a: entity local_address_lib.subsystem_entity_77cff812b1
    port map (
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      offset_base => mult3_p_net_x8,
      warp_lane_id => delay_q_net_x7,
      warp_size_num => constant4_op_net_x0,
      offset => addsub_s_net_x14
    );

  subsystem5_d803640782: entity local_address_lib.subsystem_entity_77cff812b1
    port map (
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      offset_base => mult3_p_net_x8,
      warp_lane_id => delay_q_net_x7,
      warp_size_num => constant5_op_net_x0,
      offset => addsub_s_net_x15
    );

  subsystem6_c0780a64c1: entity local_address_lib.subsystem_entity_77cff812b1
    port map (
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      offset_base => mult3_p_net_x8,
      warp_lane_id => delay_q_net_x7,
      warp_size_num => constant6_op_net_x0,
      offset => addsub_s_net_x16
    );

  subsystem7_8f6537f36d: entity local_address_lib.subsystem_entity_77cff812b1
    port map (
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      offset_base => mult3_p_net_x8,
      warp_lane_id => delay_q_net_x7,
      warp_size_num => constant7_op_net_x0,
      offset => addsub_s_net_x17
    );

  subsystem_77cff812b1: entity local_address_lib.subsystem_entity_77cff812b1
    port map (
      ce_1 => ce_1_sg_x18,
      clk_1 => clk_1_sg_x18,
      offset_base => mult3_p_net_x8,
      warp_lane_id => delay_q_net_x7,
      warp_size_num => constant_op_net_x0,
      offset => addsub_s_net_x10
    );

end structural;
