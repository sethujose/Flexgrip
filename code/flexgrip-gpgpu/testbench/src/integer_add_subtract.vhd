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
-- You must compile the wrapper file addsb_11_0_00f8ab8b20d7905d.vhd when simulating
-- the core, addsb_11_0_00f8ab8b20d7905d. When compiling the wrapper file, be sure to
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
ENTITY addsb_11_0_00f8ab8b20d7905d IS
  PORT (
    a : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    s : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
  );
END addsb_11_0_00f8ab8b20d7905d;

ARCHITECTURE addsb_11_0_00f8ab8b20d7905d_a OF addsb_11_0_00f8ab8b20d7905d IS
-- synthesis translate_off
COMPONENT wrapped_addsb_11_0_00f8ab8b20d7905d
  PORT (
    a : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(47 DOWNTO 0);
    s : OUT STD_LOGIC_VECTOR(47 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_addsb_11_0_00f8ab8b20d7905d USE ENTITY XilinxCoreLib.c_addsub_v11_0(behavioral)
    GENERIC MAP (
      c_a_type => 0,
      c_a_width => 48,
      c_add_mode => 0,
      c_ainit_val => "0",
      c_b_constant => 0,
      c_b_type => 0,
      c_b_value => "000000000000000000000000000000000000000000000000",
      c_b_width => 48,
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
      c_out_width => 48,
      c_sclr_overrides_sset => 0,
      c_sinit_val => "0",
      c_verbosity => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_addsb_11_0_00f8ab8b20d7905d
  PORT MAP (
    a => a,
    b => b,
    s => s
  );
-- synthesis translate_on

END addsb_11_0_00f8ab8b20d7905d_a;
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
-- You must compile the wrapper file addsb_11_0_291525a2942bda7b.vhd when simulating
-- the core, addsb_11_0_291525a2942bda7b. When compiling the wrapper file, be sure to
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
ENTITY addsb_11_0_291525a2942bda7b IS
  PORT (
    a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    add : IN STD_LOGIC;
    c_in : IN STD_LOGIC;
    c_out : OUT STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END addsb_11_0_291525a2942bda7b;

ARCHITECTURE addsb_11_0_291525a2942bda7b_a OF addsb_11_0_291525a2942bda7b IS
-- synthesis translate_off
COMPONENT wrapped_addsb_11_0_291525a2942bda7b
  PORT (
    a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    add : IN STD_LOGIC;
    c_in : IN STD_LOGIC;
    c_out : OUT STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_addsb_11_0_291525a2942bda7b USE ENTITY XilinxCoreLib.c_addsub_v11_0(behavioral)
    GENERIC MAP (
      c_a_type => 1,
      c_a_width => 32,
      c_add_mode => 2,
      c_ainit_val => "0",
      c_b_constant => 0,
      c_b_type => 1,
      c_b_value => "00000000000000000000000000000000",
      c_b_width => 32,
      c_borrow_low => 1,
      c_bypass_low => 0,
      c_ce_overrides_bypass => 1,
      c_ce_overrides_sclr => 0,
      c_has_bypass => 0,
      c_has_c_in => 1,
      c_has_c_out => 1,
      c_has_ce => 0,
      c_has_sclr => 0,
      c_has_sinit => 0,
      c_has_sset => 0,
      c_implementation => 0,
      c_latency => 0,
      c_out_width => 32,
      c_sclr_overrides_sset => 0,
      c_sinit_val => "0",
      c_verbosity => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_addsb_11_0_291525a2942bda7b
  PORT MAP (
    a => a,
    b => b,
    add => add,
    c_in => c_in,
    c_out => c_out,
    s => s
  );
-- synthesis translate_on

END addsb_11_0_291525a2942bda7b_a;
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
-- You must compile the wrapper file addsb_11_0_3ecbf8f489c06845.vhd when simulating
-- the core, addsb_11_0_3ecbf8f489c06845. When compiling the wrapper file, be sure to
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
ENTITY addsb_11_0_3ecbf8f489c06845 IS
  PORT (
    a : IN STD_LOGIC_VECTOR(33 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(33 DOWNTO 0);
    add : IN STD_LOGIC;
    c_in : IN STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(33 DOWNTO 0)
  );
END addsb_11_0_3ecbf8f489c06845;

ARCHITECTURE addsb_11_0_3ecbf8f489c06845_a OF addsb_11_0_3ecbf8f489c06845 IS
-- synthesis translate_off
COMPONENT wrapped_addsb_11_0_3ecbf8f489c06845
  PORT (
    a : IN STD_LOGIC_VECTOR(33 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(33 DOWNTO 0);
    add : IN STD_LOGIC;
    c_in : IN STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(33 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_addsb_11_0_3ecbf8f489c06845 USE ENTITY XilinxCoreLib.c_addsub_v11_0(behavioral)
    GENERIC MAP (
      c_a_type => 0,
      c_a_width => 34,
      c_add_mode => 2,
      c_ainit_val => "0",
      c_b_constant => 0,
      c_b_type => 0,
      c_b_value => "0000000000000000000000000000000000",
      c_b_width => 34,
      c_borrow_low => 1,
      c_bypass_low => 0,
      c_ce_overrides_bypass => 1,
      c_ce_overrides_sclr => 0,
      c_has_bypass => 0,
      c_has_c_in => 1,
      c_has_c_out => 0,
      c_has_ce => 0,
      c_has_sclr => 0,
      c_has_sinit => 0,
      c_has_sset => 0,
      c_implementation => 0,
      c_latency => 0,
      c_out_width => 34,
      c_sclr_overrides_sset => 0,
      c_sinit_val => "0",
      c_verbosity => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_addsb_11_0_3ecbf8f489c06845
  PORT MAP (
    a => a,
    b => b,
    add => add,
    c_in => c_in,
    s => s
  );
-- synthesis translate_on

END addsb_11_0_3ecbf8f489c06845_a;
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
-- You must compile the wrapper file addsb_11_0_752d8e8280337df5.vhd when simulating
-- the core, addsb_11_0_752d8e8280337df5. When compiling the wrapper file, be sure to
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
ENTITY addsb_11_0_752d8e8280337df5 IS
  PORT (
    a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END addsb_11_0_752d8e8280337df5;

ARCHITECTURE addsb_11_0_752d8e8280337df5_a OF addsb_11_0_752d8e8280337df5 IS
-- synthesis translate_off
COMPONENT wrapped_addsb_11_0_752d8e8280337df5
  PORT (
    a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    s : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_addsb_11_0_752d8e8280337df5 USE ENTITY XilinxCoreLib.c_addsub_v11_0(behavioral)
    GENERIC MAP (
      c_a_type => 0,
      c_a_width => 32,
      c_add_mode => 0,
      c_ainit_val => "0",
      c_b_constant => 0,
      c_b_type => 0,
      c_b_value => "00000000000000000000000000000000",
      c_b_width => 32,
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
      c_out_width => 32,
      c_sclr_overrides_sset => 0,
      c_sinit_val => "0",
      c_verbosity => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_addsb_11_0_752d8e8280337df5
  PORT MAP (
    a => a,
    b => b,
    s => s
  );
-- synthesis translate_on

END addsb_11_0_752d8e8280337df5_a;
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
-- You must compile the wrapper file addsb_11_0_9afe43fd5ec86008.vhd when simulating
-- the core, addsb_11_0_9afe43fd5ec86008. When compiling the wrapper file, be sure to
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
ENTITY addsb_11_0_9afe43fd5ec86008 IS
  PORT (
    a : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    add : IN STD_LOGIC;
    c_in : IN STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
  );
END addsb_11_0_9afe43fd5ec86008;

ARCHITECTURE addsb_11_0_9afe43fd5ec86008_a OF addsb_11_0_9afe43fd5ec86008 IS
-- synthesis translate_off
COMPONENT wrapped_addsb_11_0_9afe43fd5ec86008
  PORT (
    a : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(17 DOWNTO 0);
    add : IN STD_LOGIC;
    c_in : IN STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(17 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_addsb_11_0_9afe43fd5ec86008 USE ENTITY XilinxCoreLib.c_addsub_v11_0(behavioral)
    GENERIC MAP (
      c_a_type => 0,
      c_a_width => 18,
      c_add_mode => 2,
      c_ainit_val => "0",
      c_b_constant => 0,
      c_b_type => 0,
      c_b_value => "000000000000000000",
      c_b_width => 18,
      c_borrow_low => 1,
      c_bypass_low => 0,
      c_ce_overrides_bypass => 1,
      c_ce_overrides_sclr => 0,
      c_has_bypass => 0,
      c_has_c_in => 1,
      c_has_c_out => 0,
      c_has_ce => 0,
      c_has_sclr => 0,
      c_has_sinit => 0,
      c_has_sset => 0,
      c_implementation => 0,
      c_latency => 0,
      c_out_width => 18,
      c_sclr_overrides_sset => 0,
      c_sinit_val => "0",
      c_verbosity => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_addsb_11_0_9afe43fd5ec86008
  PORT MAP (
    a => a,
    b => b,
    add => add,
    c_in => c_in,
    s => s
  );
-- synthesis translate_on

END addsb_11_0_9afe43fd5ec86008_a;
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
-- You must compile the wrapper file addsb_11_0_ff5e7816e515836d.vhd when simulating
-- the core, addsb_11_0_ff5e7816e515836d. When compiling the wrapper file, be sure to
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
ENTITY addsb_11_0_ff5e7816e515836d IS
  PORT (
    a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    add : IN STD_LOGIC;
    c_in : IN STD_LOGIC;
    c_out : OUT STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END addsb_11_0_ff5e7816e515836d;

ARCHITECTURE addsb_11_0_ff5e7816e515836d_a OF addsb_11_0_ff5e7816e515836d IS
-- synthesis translate_off
COMPONENT wrapped_addsb_11_0_ff5e7816e515836d
  PORT (
    a : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    b : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
    add : IN STD_LOGIC;
    c_in : IN STD_LOGIC;
    c_out : OUT STD_LOGIC;
    s : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
  );
END COMPONENT;

-- Configuration specification
  FOR ALL : wrapped_addsb_11_0_ff5e7816e515836d USE ENTITY XilinxCoreLib.c_addsub_v11_0(behavioral)
    GENERIC MAP (
      c_a_type => 1,
      c_a_width => 16,
      c_add_mode => 2,
      c_ainit_val => "0",
      c_b_constant => 0,
      c_b_type => 1,
      c_b_value => "0000000000000000",
      c_b_width => 16,
      c_borrow_low => 1,
      c_bypass_low => 0,
      c_ce_overrides_bypass => 1,
      c_ce_overrides_sclr => 0,
      c_has_bypass => 0,
      c_has_c_in => 1,
      c_has_c_out => 1,
      c_has_ce => 0,
      c_has_sclr => 0,
      c_has_sinit => 0,
      c_has_sset => 0,
      c_implementation => 0,
      c_latency => 0,
      c_out_width => 16,
      c_sclr_overrides_sset => 0,
      c_sinit_val => "0",
      c_verbosity => 0,
      c_xdevicefamily => "virtex6"
    );
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_addsb_11_0_ff5e7816e515836d
  PORT MAP (
    a => a,
    b => b,
    add => add,
    c_in => c_in,
    c_out => c_out,
    s => s
  );
-- synthesis translate_on

END addsb_11_0_ff5e7816e515836d_a;

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
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;
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
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;
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
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;
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
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;
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
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;
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
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;
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
  component addsb_11_0_752d8e8280337df5
    port (
          a: in std_logic_vector(32 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(32 - 1 downto 0)
    );
  end component;
  attribute syn_black_box of addsb_11_0_752d8e8280337df5:
    component is true;
  attribute fpga_dont_touch of addsb_11_0_752d8e8280337df5:
    component is "true";
  attribute box_type of addsb_11_0_752d8e8280337df5:
    component  is "black_box";
  component addsb_11_0_00f8ab8b20d7905d
    port (
          a: in std_logic_vector(48 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(48 - 1 downto 0)
    );
  end component;
  attribute syn_black_box of addsb_11_0_00f8ab8b20d7905d:
    component is true;
  attribute fpga_dont_touch of addsb_11_0_00f8ab8b20d7905d:
    component is "true";
  attribute box_type of addsb_11_0_00f8ab8b20d7905d:
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

  comp0: if ((core_name0 = "addsb_11_0_752d8e8280337df5")) generate
    core_instance0: addsb_11_0_752d8e8280337df5
      port map (
         a => full_a,
         s => core_s,
         b => full_b
      );
  end generate;
  comp1: if ((core_name0 = "addsb_11_0_00f8ab8b20d7905d")) generate
    core_instance1: addsb_11_0_00f8ab8b20d7905d
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
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity constant_515f6b5526 is
  port (
    op : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_515f6b5526;


architecture behavior of constant_515f6b5526 is
begin
  op <= "0100000000000000";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity inverter_1ca63a13a1 is
  port (
    ip : in std_logic_vector((16 - 1) downto 0);
    op : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end inverter_1ca63a13a1;


architecture behavior of inverter_1ca63a13a1 is
  signal ip_1_26: unsigned((16 - 1) downto 0);
  type array_type_op_mem_22_20 is array (0 to (1 - 1)) of unsigned((16 - 1) downto 0);
  signal op_mem_22_20: array_type_op_mem_22_20 := (
    0 => "0000000000000000");
  signal op_mem_22_20_front_din: unsigned((16 - 1) downto 0);
  signal op_mem_22_20_back: unsigned((16 - 1) downto 0);
  signal op_mem_22_20_push_front_pop_back_en: std_logic;
  signal internal_ip_12_1_bitnot: unsigned((16 - 1) downto 0);
begin
  ip_1_26 <= std_logic_vector_to_unsigned(ip);
  op_mem_22_20_back <= op_mem_22_20(0);
  proc_op_mem_22_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_22_20_push_front_pop_back_en = '1')) then
        op_mem_22_20(0) <= op_mem_22_20_front_din;
      end if;
    end if;
  end process proc_op_mem_22_20;
  internal_ip_12_1_bitnot <= std_logic_vector_to_unsigned(not unsigned_to_std_logic_vector(ip_1_26));
  op_mem_22_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(internal_ip_12_1_bitnot);
end behavior;


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
use IEEE.std_logic_arith.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;
entity xlslice is
    generic (
        new_msb      : integer := 9;
        new_lsb      : integer := 1;
        x_width      : integer := 16;
        y_width      : integer := 8);
    port (
        x : in std_logic_vector (x_width-1 downto 0);
        y : out std_logic_vector (y_width-1 downto 0));
end xlslice;
architecture behavior of xlslice is
begin
    y <= x(new_msb downto new_lsb);
end  behavior;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity inverter_6a3d3dd4e5 is
  port (
    ip : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end inverter_6a3d3dd4e5;


architecture behavior of inverter_6a3d3dd4e5 is
  signal ip_1_26: unsigned((32 - 1) downto 0);
  type array_type_op_mem_22_20 is array (0 to (1 - 1)) of unsigned((32 - 1) downto 0);
  signal op_mem_22_20: array_type_op_mem_22_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_22_20_front_din: unsigned((32 - 1) downto 0);
  signal op_mem_22_20_back: unsigned((32 - 1) downto 0);
  signal op_mem_22_20_push_front_pop_back_en: std_logic;
  signal internal_ip_12_1_bitnot: unsigned((32 - 1) downto 0);
begin
  ip_1_26 <= std_logic_vector_to_unsigned(ip);
  op_mem_22_20_back <= op_mem_22_20(0);
  proc_op_mem_22_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_22_20_push_front_pop_back_en = '1')) then
        op_mem_22_20(0) <= op_mem_22_20_front_din;
      end if;
    end if;
  end process proc_op_mem_22_20;
  internal_ip_12_1_bitnot <= std_logic_vector_to_unsigned(not unsigned_to_std_logic_vector(ip_1_26));
  op_mem_22_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(internal_ip_12_1_bitnot);
end behavior;


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
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;
entity convert_func_call is
    generic (
        din_width    : integer := 16;
        din_bin_pt   : integer := 4;
        din_arith    : integer := xlUnsigned;
        dout_width   : integer := 8;
        dout_bin_pt  : integer := 2;
        dout_arith   : integer := xlUnsigned;
        quantization : integer := xlTruncate;
        overflow     : integer := xlWrap);
    port (
        din : in std_logic_vector (din_width-1 downto 0);
        result : out std_logic_vector (dout_width-1 downto 0));
end convert_func_call;
architecture behavior of convert_func_call is
begin
    result <= convert_type(din, din_width, din_bin_pt, din_arith,
                           dout_width, dout_bin_pt, dout_arith,
                           quantization, overflow);
end behavior;
library IEEE;
use IEEE.std_logic_1164.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;
entity xlconvert is
    generic (
        din_width    : integer := 16;
        din_bin_pt   : integer := 4;
        din_arith    : integer := xlUnsigned;
        dout_width   : integer := 8;
        dout_bin_pt  : integer := 2;
        dout_arith   : integer := xlUnsigned;
        en_width     : integer := 1;
        en_bin_pt    : integer := 0;
        en_arith     : integer := xlUnsigned;
        bool_conversion : integer :=0;
        latency      : integer := 0;
        quantization : integer := xlTruncate;
        overflow     : integer := xlWrap);
    port (
        din : in std_logic_vector (din_width-1 downto 0);
        en  : in std_logic_vector (en_width-1 downto 0);
        ce  : in std_logic;
        clr : in std_logic;
        clk : in std_logic;
        dout : out std_logic_vector (dout_width-1 downto 0));
end xlconvert;
architecture behavior of xlconvert is
    component synth_reg
        generic (width       : integer;
                 latency     : integer);
        port (i       : in std_logic_vector(width-1 downto 0);
              ce      : in std_logic;
              clr     : in std_logic;
              clk     : in std_logic;
              o       : out std_logic_vector(width-1 downto 0));
    end component;
    component convert_func_call
        generic (
            din_width    : integer := 16;
            din_bin_pt   : integer := 4;
            din_arith    : integer := xlUnsigned;
            dout_width   : integer := 8;
            dout_bin_pt  : integer := 2;
            dout_arith   : integer := xlUnsigned;
            quantization : integer := xlTruncate;
            overflow     : integer := xlWrap);
        port (
            din : in std_logic_vector (din_width-1 downto 0);
            result : out std_logic_vector (dout_width-1 downto 0));
    end component;
    -- synopsys translate_off
    -- synopsys translate_on
    signal result : std_logic_vector(dout_width-1 downto 0);
    signal internal_ce : std_logic;
begin
    -- synopsys translate_off
    -- synopsys translate_on
    internal_ce <= ce and en(0);

    bool_conversion_generate : if (bool_conversion = 1)
    generate
      result <= din;
    end generate;
    std_conversion_generate : if (bool_conversion = 0)
    generate
      convert : convert_func_call
        generic map (
          din_width   => din_width,
          din_bin_pt  => din_bin_pt,
          din_arith   => din_arith,
          dout_width  => dout_width,
          dout_bin_pt => dout_bin_pt,
          dout_arith  => dout_arith,
          quantization => quantization,
          overflow     => overflow)
        port map (
          din => din,
          result => result);
    end generate;
    latency_test : if (latency > 0) generate
        reg : synth_reg
            generic map (
              width => dout_width,
              latency => latency
            )
            port map (
              i => result,
              ce => internal_ce,
              clr => clr,
              clk => clk,
              o => dout
            );
    end generate;
    latency0 : if (latency = 0)
    generate
        dout <= result;
    end generate latency0;
end  behavior;
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity mux_2c45f290ed is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((16 - 1) downto 0);
    d1 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end mux_2c45f290ed;


architecture behavior of mux_2c45f290ed is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((16 - 1) downto 0);
  signal d1_1_27: std_logic_vector((16 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((16 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity relational_0772726c19 is
  port (
    a : in std_logic_vector((16 - 1) downto 0);
    b : in std_logic_vector((16 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end relational_0772726c19;


architecture behavior of relational_0772726c19 is
  signal a_1_31: signed((16 - 1) downto 0);
  signal b_1_34: signed((16 - 1) downto 0);
  signal result_16_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_signed(a);
  b_1_34 <= std_logic_vector_to_signed(b);
  result_16_3_rel <= a_1_31 < b_1_34;
  op <= boolean_to_vector(result_16_3_rel);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity mux_c83fe79b0f is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((32 - 1) downto 0);
    d1 : in std_logic_vector((32 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end mux_c83fe79b0f;


architecture behavior of mux_c83fe79b0f is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((32 - 1) downto 0);
  signal d1_1_27: std_logic_vector((32 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((32 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity relational_3ff7ebf1f0 is
  port (
    a : in std_logic_vector((32 - 1) downto 0);
    b : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end relational_3ff7ebf1f0;


architecture behavior of relational_3ff7ebf1f0 is
  signal a_1_31: signed((32 - 1) downto 0);
  signal b_1_34: signed((32 - 1) downto 0);
  signal result_16_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_signed(a);
  b_1_34 <= std_logic_vector_to_signed(b);
  result_16_3_rel <= a_1_31 < b_1_34;
  op <= boolean_to_vector(result_16_3_rel);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity logical_604045dd09 is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    d2 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end logical_604045dd09;


architecture behavior of logical_604045dd09 is
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  signal d2_1_30: std_logic_vector((1 - 1) downto 0);
  signal fully_2_1_bit: std_logic_vector((1 - 1) downto 0);
begin
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  fully_2_1_bit <= d0_1_24 xor d1_1_27 xor d2_1_30;
  y <= fully_2_1_bit;
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity logical_938d99ac11 is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end logical_938d99ac11;


architecture behavior of logical_938d99ac11 is
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  signal fully_2_1_bit: std_logic_vector((1 - 1) downto 0);
begin
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  fully_2_1_bit <= d0_1_24 and d1_1_27;
  y <= fully_2_1_bit;
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity logical_3e1f051fb7 is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end logical_3e1f051fb7;


architecture behavior of logical_3e1f051fb7 is
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  signal fully_2_1_bit: std_logic_vector((1 - 1) downto 0);
begin
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  fully_2_1_bit <= d0_1_24 or d1_1_27;
  y <= fully_2_1_bit;
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity logical_9d76333483 is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end logical_9d76333483;


architecture behavior of logical_9d76333483 is
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  signal fully_2_1_bit: std_logic_vector((1 - 1) downto 0);
begin
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  fully_2_1_bit <= d0_1_24 xor d1_1_27;
  y <= fully_2_1_bit;
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity inverter_e2b989a05e is
  port (
    ip : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end inverter_e2b989a05e;


architecture behavior of inverter_e2b989a05e is
  signal ip_1_26: unsigned((1 - 1) downto 0);
  type array_type_op_mem_22_20 is array (0 to (1 - 1)) of unsigned((1 - 1) downto 0);
  signal op_mem_22_20: array_type_op_mem_22_20 := (
    0 => "0");
  signal op_mem_22_20_front_din: unsigned((1 - 1) downto 0);
  signal op_mem_22_20_back: unsigned((1 - 1) downto 0);
  signal op_mem_22_20_push_front_pop_back_en: std_logic;
  signal internal_ip_12_1_bitnot: unsigned((1 - 1) downto 0);
begin
  ip_1_26 <= std_logic_vector_to_unsigned(ip);
  op_mem_22_20_back <= op_mem_22_20(0);
  proc_op_mem_22_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk'event and (clk = '1')) then
      if ((ce = '1') and (op_mem_22_20_push_front_pop_back_en = '1')) then
        op_mem_22_20(0) <= op_mem_22_20_front_din;
      end if;
    end if;
  end process proc_op_mem_22_20;
  internal_ip_12_1_bitnot <= std_logic_vector_to_unsigned(not unsigned_to_std_logic_vector(ip_1_26));
  op_mem_22_20_push_front_pop_back_en <= '0';
  op <= unsigned_to_std_logic_vector(internal_ip_12_1_bitnot);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity mux_112ed141f4 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end mux_112ed141f4;


architecture behavior of mux_112ed141f4 is
  signal sel_1_20: std_logic;
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  signal sel_internal_2_1_convert: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((1 - 1) downto 0);
begin
  sel_1_20 <= sel(0);
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  sel_internal_2_1_convert <= cast(std_logic_to_vector(sel_1_20), 0, 1, 0, xlUnsigned);
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_internal_2_1_convert)
  is
  begin
    case sel_internal_2_1_convert is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;


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
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;
entity xladdsubmode is
  generic (
    core_name0: string := "";
    a_width: integer := 16;
    a_bin_pt: integer := 4;
    a_arith: integer := xlUnsigned;
    b_width: integer := 8;
    b_bin_pt: integer := 2;
    b_arith: integer := xlUnsigned;
    c_in_width: integer := 16;
    c_in_bin_pt: integer := 4;
    c_in_arith: integer := xlUnsigned;
    c_out_width: integer := 16;
    c_out_bin_pt: integer := 4;
    c_out_arith: integer := xlUnsigned;
    s_width: integer := 17;
    s_bin_pt: integer := 4;
    s_arith: integer := xlUnsigned;
    rst_width: integer := 1;
    rst_bin_pt: integer := 0;
    rst_arith: integer := xlUnsigned;
    en_width: integer := 1;
    en_bin_pt: integer := 0;
    en_arith: integer := xlUnsigned;
    padded_width: integer := 16;
    full_s_width: integer := 17;
    full_s_arith: integer := xlUnsigned;
    mode_width: integer := 1;
    mode_bin_pt: integer := 0;
    mode_arith: integer := xlUnsigned;
    extra_registers: integer := 0;
    latency: integer := 0;
    quantization: integer := xlTruncate;
    overflow: integer := xlWrap;
    c_a_width: integer := 16;
    c_b_width: integer := 8;
    c_a_type: integer := 1;
    c_b_type: integer := 1;
    c_has_sclr: integer := 0;
    c_has_ce: integer := 0;
    c_latency: integer := 0;
    c_output_width: integer := 17;
    c_enable_rlocs: integer := 1;
    c_has_c_in  : integer := 0;
    c_has_c_out : integer := 0);
  port (
    a     : in std_logic_vector(a_width - 1 downto 0);
    b     : in std_logic_vector(b_width - 1 downto 0);
    c_in  : in std_logic_vector (0 downto 0) := (others => '0');
    mode  : in std_logic_vector(mode_width - 1 downto 0) := (others => '0');
    ce    : in std_logic;
    clr   : in std_logic := '0';
    clk   : in std_logic;
    rst   : in std_logic_vector(rst_width - 1 downto 0) := (others => '0');
    en    : in std_logic_vector(en_width - 1 downto 0) := (others => '1');
    c_out : out std_logic_vector (0 downto 0);
    s     : out std_logic_vector(s_width - 1 downto 0)
  );
end xladdsubmode;
architecture behavior of xladdsubmode is
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
    if delta > 0 then
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
  signal full_s: std_logic_vector(full_s_width - 1 downto 0);
  signal core_s: std_logic_vector(full_s_width - 1 downto 0);
  signal conv_s: std_logic_vector(s_width - 1 downto 0);
  signal add: std_logic;
  -- synopsys translate_off
  signal real_a, real_b, real_s: real;
  -- synopsys translate_on
  signal internal_clr: std_logic;
  signal internal_ce: std_logic;
  signal extra_reg_ce: std_logic;
  signal override: std_logic;
  signal logic1: std_logic_vector(0 downto 0);
  signal temp_cout : std_logic;
  component addsb_11_0_9afe43fd5ec86008
    port (
          a: in std_logic_vector(18 - 1 downto 0);
    c_in: in std_logic;
    add: in std_logic;
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(18 - 1 downto 0)
    );
  end component;
  attribute syn_black_box of addsb_11_0_9afe43fd5ec86008:
    component is true;
  attribute fpga_dont_touch of addsb_11_0_9afe43fd5ec86008:
    component is "true";
  attribute box_type of addsb_11_0_9afe43fd5ec86008:
    component  is "black_box";
  component addsb_11_0_ff5e7816e515836d
    port (
          a: in std_logic_vector(16 - 1 downto 0);
    c_in: in std_logic;
    c_out: out std_logic;
    add: in std_logic;
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(16 - 1 downto 0)
    );
  end component;
  attribute syn_black_box of addsb_11_0_ff5e7816e515836d:
    component is true;
  attribute fpga_dont_touch of addsb_11_0_ff5e7816e515836d:
    component is "true";
  attribute box_type of addsb_11_0_ff5e7816e515836d:
    component  is "black_box";
  component addsb_11_0_3ecbf8f489c06845
    port (
          a: in std_logic_vector(34 - 1 downto 0);
    c_in: in std_logic;
    add: in std_logic;
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(34 - 1 downto 0)
    );
  end component;
  attribute syn_black_box of addsb_11_0_3ecbf8f489c06845:
    component is true;
  attribute fpga_dont_touch of addsb_11_0_3ecbf8f489c06845:
    component is "true";
  attribute box_type of addsb_11_0_3ecbf8f489c06845:
    component  is "black_box";
  component addsb_11_0_291525a2942bda7b
    port (
          a: in std_logic_vector(32 - 1 downto 0);
    c_in: in std_logic;
    c_out: out std_logic;
    add: in std_logic;
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(32 - 1 downto 0)
    );
  end component;
  attribute syn_black_box of addsb_11_0_291525a2942bda7b:
    component is true;
  attribute fpga_dont_touch of addsb_11_0_291525a2942bda7b:
    component is "true";
  attribute box_type of addsb_11_0_291525a2942bda7b:
    component  is "black_box";
begin
  internal_clr <= (clr or (rst(0))) and ce;
  internal_ce <= ce and en(0);
  logic1(0) <= '1';
  addsubmode_process: process(a, b, core_s)
  begin
    full_a <= format_input(a, a_width, b_bin_pt - a_bin_pt, a_arith,
                           full_a_width);
    full_b <= format_input(b, b_width, a_bin_pt - b_bin_pt, b_arith,
                           full_b_width);
    conv_s <= convert_type(core_s, full_s_width, full_s_bin_pt, full_s_arith,
                           s_width, s_bin_pt, s_arith, quantization, overflow);
    -- synopsys translate_off
    -- synopsys translate_on
  end process addsubmode_process;
  add <= not(mode(0));
  comp0: if ((core_name0 = "addsb_11_0_9afe43fd5ec86008")) generate
    core_instance0: addsb_11_0_9afe43fd5ec86008
      port map (
         a => full_a,
         add => add,
         c_in => c_in(0),
         s => core_s,
         b => full_b
      );
  end generate;
  comp1: if ((core_name0 = "addsb_11_0_ff5e7816e515836d")) generate
    core_instance1: addsb_11_0_ff5e7816e515836d
      port map (
         a => full_a,
         add => add,
         c_in => c_in(0),
         c_out => temp_cout,
         s => core_s,
         b => full_b
      );
  end generate;
  comp2: if ((core_name0 = "addsb_11_0_3ecbf8f489c06845")) generate
    core_instance2: addsb_11_0_3ecbf8f489c06845
      port map (
         a => full_a,
         add => add,
         c_in => c_in(0),
         s => core_s,
         b => full_b
      );
  end generate;
  comp3: if ((core_name0 = "addsb_11_0_291525a2942bda7b")) generate
    core_instance3: addsb_11_0_291525a2942bda7b
      port map (
         a => full_a,
         add => add,
         c_in => c_in(0),
         c_out => temp_cout,
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
        o(0) => override
      );
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

   cout_test : if (c_has_c_out = 1) generate
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
  end generate latency_test;
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
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity concat_a369e00c6b is
  port (
    in0 : in std_logic_vector((16 - 1) downto 0);
    in1 : in std_logic_vector((16 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end concat_a369e00c6b;


architecture behavior of concat_a369e00c6b is
  signal in0_1_23: unsigned((16 - 1) downto 0);
  signal in1_1_27: unsigned((16 - 1) downto 0);
  signal y_2_1_concat: unsigned((32 - 1) downto 0);
begin
  in0_1_23 <= std_logic_vector_to_unsigned(in0);
  in1_1_27 <= std_logic_vector_to_unsigned(in1);
  y_2_1_concat <= std_logic_vector_to_unsigned(unsigned_to_std_logic_vector(in0_1_23) & unsigned_to_std_logic_vector(in1_1_27));
  y <= unsigned_to_std_logic_vector(y_2_1_concat);
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity constant_9f5572ba51 is
  port (
    op : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_9f5572ba51;


architecture behavior of constant_9f5572ba51 is
begin
  op <= "0000000000000000";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

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
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity constant_e48c5a6fd1 is
  port (
    op : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_e48c5a6fd1;


architecture behavior of constant_e48c5a6fd1 is
begin
  op <= "0111111111111111";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity constant_38c2d03959 is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_38c2d03959;


architecture behavior of constant_38c2d03959 is
begin
  op <= "01111111111111111111111111111111";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity constant_24edfb480a is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_24edfb480a;


architecture behavior of constant_24edfb480a is
begin
  op <= "10000000000000000000000000000000";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity constant_fb4ee6ff0a is
  port (
    op : out std_logic_vector((16 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_fb4ee6ff0a;


architecture behavior of constant_fb4ee6ff0a is
begin
  op <= "1000000000000000";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity constant_963ed6358a is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end constant_963ed6358a;


architecture behavior of constant_963ed6358a is
begin
  op <= "0";
end behavior;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

entity mux_67acc0d350 is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end mux_67acc0d350;


architecture behavior of mux_67acc0d350 is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((1 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  proc_switch_6_1: process (d0_1_24, d1_1_27, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "0" =>
        unregy_join_6_1 <= d0_1_24;
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end behavior;


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
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;
entity xlregister is
   generic (d_width          : integer := 5;
            init_value       : bit_vector := b"00");
   port (d   : in std_logic_vector (d_width-1 downto 0);
         rst : in std_logic_vector(0 downto 0) := "0";
         en  : in std_logic_vector(0 downto 0) := "1";
         ce  : in std_logic;
         clk : in std_logic;
         q   : out std_logic_vector (d_width-1 downto 0));
end xlregister;
architecture behavior of xlregister is
   component synth_reg_w_init
      generic (width      : integer;
               init_index : integer;
               init_value : bit_vector;
               latency    : integer);
      port (i   : in std_logic_vector(width-1 downto 0);
            ce  : in std_logic;
            clr : in std_logic;
            clk : in std_logic;
            o   : out std_logic_vector(width-1 downto 0));
   end component;
   -- synopsys translate_off
   signal real_d, real_q           : real;
   -- synopsys translate_on
   signal internal_clr             : std_logic;
   signal internal_ce              : std_logic;
begin
   internal_clr <= rst(0) and ce;
   internal_ce  <= en(0) and ce;
   synth_reg_inst : synth_reg_w_init
      generic map (width      => d_width,
                   init_index => 2,
                   init_value => init_value,
                   latency    => 1)
      port map (i   => d,
                ce  => internal_ce,
                clr => internal_clr,
                clk => clk,
                o   => q);
end architecture behavior;
library IEEE;
use IEEE.std_logic_1164.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

-- Generated from Simulink block "integer_add_subtract/Integer Add Subtract/16-bit Two's Complement"

entity x16_bit_two_s_complement_entity_5285698910 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    n: in std_logic_vector(31 downto 0); 
    n_comp: out std_logic_vector(15 downto 0)
  );
end x16_bit_two_s_complement_entity_5285698910;

architecture structural of x16_bit_two_s_complement_entity_5285698910 is
  signal a_in_net_x0: std_logic_vector(31 downto 0);
  signal addsub_s_net_x0: std_logic_vector(15 downto 0);
  signal ce_1_sg_x0: std_logic;
  signal clk_1_sg_x0: std_logic;
  signal constant8_op_net: std_logic_vector(15 downto 0);
  signal inverter_op_net: std_logic_vector(15 downto 0);
  signal slice_y_net: std_logic_vector(15 downto 0);

begin
  ce_1_sg_x0 <= ce_1;
  clk_1_sg_x0 <= clk_1;
  a_in_net_x0 <= n;
  n_comp <= addsub_s_net_x0;

  addsub: entity int_add_sub_lib.xladdsub
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 16,
      b_arith => xlSigned,
      b_bin_pt => 14,
      b_width => 16,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 32,
      core_name0 => "addsb_11_0_752d8e8280337df5",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 32,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlUnsigned,
      s_bin_pt => 0,
      s_width => 16
    )
    port map (
      a => inverter_op_net,
      b => constant8_op_net,
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      en => "1",
      s => addsub_s_net_x0
    );

  constant8: entity int_add_sub_lib.constant_515f6b5526
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant8_op_net
    );

  inverter: entity int_add_sub_lib.inverter_1ca63a13a1
    port map (
      ce => ce_1_sg_x0,
      clk => clk_1_sg_x0,
      clr => '0',
      ip => slice_y_net,
      op => inverter_op_net
    );

  slice: entity int_add_sub_lib.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 15,
      x_width => 32,
      y_width => 16
    )
    port map (
      x => a_in_net_x0,
      y => slice_y_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

-- Generated from Simulink block "integer_add_subtract/Integer Add Subtract/32-bit Two's Complement"

entity x32_bit_two_s_complement_entity_f923917e92 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    n: in std_logic_vector(31 downto 0); 
    n_comp: out std_logic_vector(31 downto 0)
  );
end x32_bit_two_s_complement_entity_f923917e92;

architecture structural of x32_bit_two_s_complement_entity_f923917e92 is
  signal a_in_net_x1: std_logic_vector(31 downto 0);
  signal addsub_s_net_x0: std_logic_vector(31 downto 0);
  signal ce_1_sg_x2: std_logic;
  signal clk_1_sg_x2: std_logic;
  signal constant8_op_net: std_logic_vector(15 downto 0);
  signal inverter_op_net: std_logic_vector(31 downto 0);

begin
  ce_1_sg_x2 <= ce_1;
  clk_1_sg_x2 <= clk_1;
  a_in_net_x1 <= n;
  n_comp <= addsub_s_net_x0;

  addsub: entity int_add_sub_lib.xladdsub
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 32,
      b_arith => xlSigned,
      b_bin_pt => 14,
      b_width => 16,
      c_has_c_out => 0,
      c_latency => 0,
      c_output_width => 48,
      core_name0 => "addsb_11_0_00f8ab8b20d7905d",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 48,
      latency => 0,
      overflow => 1,
      quantization => 1,
      s_arith => xlUnsigned,
      s_bin_pt => 0,
      s_width => 32
    )
    port map (
      a => inverter_op_net,
      b => constant8_op_net,
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      en => "1",
      s => addsub_s_net_x0
    );

  constant8: entity int_add_sub_lib.constant_515f6b5526
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant8_op_net
    );

  inverter: entity int_add_sub_lib.inverter_6a3d3dd4e5
    port map (
      ce => ce_1_sg_x2,
      clk => clk_1_sg_x2,
      clr => '0',
      ip => a_in_net_x1,
      op => inverter_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

-- Generated from Simulink block "integer_add_subtract/Integer Add Subtract/Subsystem"

entity subsystem_entity_d34cafe437 is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    o_greater: in std_logic_vector(15 downto 0); 
    o_less: in std_logic_vector(15 downto 0); 
    overflow: in std_logic; 
    r_sign: in std_logic_vector(15 downto 0); 
    r_unsign: in std_logic_vector(15 downto 0); 
    sat_en: in std_logic; 
    zero: in std_logic_vector(15 downto 0); 
    r: out std_logic_vector(15 downto 0)
  );
end subsystem_entity_d34cafe437;

architecture structural of subsystem_entity_d34cafe437 is
  signal ce_1_sg_x4: std_logic;
  signal clk_1_sg_x4: std_logic;
  signal constant12_op_net_x0: std_logic_vector(15 downto 0);
  signal constant16_op_net_x0: std_logic_vector(15 downto 0);
  signal constant9_op_net_x0: std_logic_vector(15 downto 0);
  signal convert2_dout_net_x0: std_logic_vector(15 downto 0);
  signal convert3_dout_net: std_logic;
  signal mux1_y_net: std_logic_vector(15 downto 0);
  signal mux7_y_net_x0: std_logic_vector(15 downto 0);
  signal mux8_y_net: std_logic_vector(15 downto 0);
  signal register2_q_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(15 downto 0);
  signal relational_op_net: std_logic;
  signal saturate_in_net_x0: std_logic;

begin
  ce_1_sg_x4 <= ce_1;
  clk_1_sg_x4 <= clk_1;
  constant16_op_net_x0 <= o_greater;
  constant12_op_net_x0 <= o_less;
  register2_q_net_x0 <= overflow;
  convert2_dout_net_x0 <= r_sign;
  register_q_net_x0 <= r_unsign;
  saturate_in_net_x0 <= sat_en;
  constant9_op_net_x0 <= zero;
  r <= mux7_y_net_x0;

  convert3: entity int_add_sub_lib.xlconvert
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
      ce => ce_1_sg_x4,
      clk => clk_1_sg_x4,
      clr => '0',
      din(0) => relational_op_net,
      en => "1",
      dout(0) => convert3_dout_net
    );

  mux1: entity int_add_sub_lib.mux_2c45f290ed
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => constant16_op_net_x0,
      d1 => constant12_op_net_x0,
      sel(0) => convert3_dout_net,
      y => mux1_y_net
    );

  mux7: entity int_add_sub_lib.mux_2c45f290ed
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => register_q_net_x0,
      d1 => mux8_y_net,
      sel(0) => saturate_in_net_x0,
      y => mux7_y_net_x0
    );

  mux8: entity int_add_sub_lib.mux_2c45f290ed
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => register_q_net_x0,
      d1 => mux1_y_net,
      sel(0) => register2_q_net_x0,
      y => mux8_y_net
    );

  relational: entity int_add_sub_lib.relational_0772726c19
    port map (
      a => convert2_dout_net_x0,
      b => constant9_op_net_x0,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

-- Generated from Simulink block "integer_add_subtract/Integer Add Subtract/Subsystem1"

entity subsystem1_entity_2ddb20951e is
  port (
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    o_greater: in std_logic_vector(31 downto 0); 
    o_less: in std_logic_vector(31 downto 0); 
    overflow: in std_logic; 
    r_sign: in std_logic_vector(31 downto 0); 
    r_unsign: in std_logic_vector(31 downto 0); 
    sat_en: in std_logic; 
    zero: in std_logic_vector(31 downto 0); 
    r: out std_logic_vector(31 downto 0)
  );
end subsystem1_entity_2ddb20951e;

architecture structural of subsystem1_entity_2ddb20951e is
  signal ce_1_sg_x5: std_logic;
  signal clk_1_sg_x5: std_logic;
  signal constant10_op_net_x0: std_logic_vector(31 downto 0);
  signal constant13_op_net_x0: std_logic_vector(31 downto 0);
  signal constant15_op_net_x0: std_logic_vector(31 downto 0);
  signal convert3_dout_net_x0: std_logic;
  signal convert3_dout_net_x1: std_logic_vector(31 downto 0);
  signal mux1_y_net: std_logic_vector(31 downto 0);
  signal mux7_y_net_x0: std_logic_vector(31 downto 0);
  signal mux8_y_net: std_logic_vector(31 downto 0);
  signal register3_q_net_x0: std_logic_vector(31 downto 0);
  signal register5_q_net_x0: std_logic;
  signal relational_op_net: std_logic;
  signal saturate_in_net_x1: std_logic;

begin
  ce_1_sg_x5 <= ce_1;
  clk_1_sg_x5 <= clk_1;
  constant15_op_net_x0 <= o_greater;
  constant13_op_net_x0 <= o_less;
  register5_q_net_x0 <= overflow;
  convert3_dout_net_x1 <= r_sign;
  register3_q_net_x0 <= r_unsign;
  saturate_in_net_x1 <= sat_en;
  constant10_op_net_x0 <= zero;
  r <= mux7_y_net_x0;

  convert3: entity int_add_sub_lib.xlconvert
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
      ce => ce_1_sg_x5,
      clk => clk_1_sg_x5,
      clr => '0',
      din(0) => relational_op_net,
      en => "1",
      dout(0) => convert3_dout_net_x0
    );

  mux1: entity int_add_sub_lib.mux_c83fe79b0f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => constant15_op_net_x0,
      d1 => constant13_op_net_x0,
      sel(0) => convert3_dout_net_x0,
      y => mux1_y_net
    );

  mux7: entity int_add_sub_lib.mux_c83fe79b0f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => register3_q_net_x0,
      d1 => mux8_y_net,
      sel(0) => saturate_in_net_x1,
      y => mux7_y_net_x0
    );

  mux8: entity int_add_sub_lib.mux_c83fe79b0f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => register3_q_net_x0,
      d1 => mux1_y_net,
      sel(0) => register5_q_net_x0,
      y => mux8_y_net
    );

  relational: entity int_add_sub_lib.relational_3ff7ebf1f0
    port map (
      a => convert3_dout_net_x1,
      b => constant10_op_net_x0,
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => relational_op_net
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

-- Generated from Simulink block "integer_add_subtract/Integer Add Subtract/Unsigned 16-bit AddSub/Subsystem"

entity subsystem_entity_8975c7645f is
  port (
    a: in std_logic_vector(15 downto 0); 
    b: in std_logic_vector(15 downto 0); 
    r: in std_logic_vector(15 downto 0); 
    a31: out std_logic; 
    b31: out std_logic; 
    c30: out std_logic
  );
end subsystem_entity_8975c7645f;

architecture structural of subsystem_entity_8975c7645f is
  signal logical3_y_net_x0: std_logic;
  signal mux2_y_net_x0: std_logic_vector(15 downto 0);
  signal mux3_y_net_x0: std_logic_vector(15 downto 0);
  signal slice1_y_net: std_logic;
  signal slice2_y_net_x0: std_logic;
  signal slice_y_net_x0: std_logic;
  signal uaddsub16s_s_net_x0: std_logic_vector(15 downto 0);

begin
  mux2_y_net_x0 <= a;
  mux3_y_net_x0 <= b;
  uaddsub16s_s_net_x0 <= r;
  a31 <= slice_y_net_x0;
  b31 <= slice2_y_net_x0;
  c30 <= logical3_y_net_x0;

  logical3: entity int_add_sub_lib.logical_604045dd09
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => slice_y_net_x0,
      d1(0) => slice1_y_net,
      d2(0) => slice2_y_net_x0,
      y(0) => logical3_y_net_x0
    );

  slice: entity int_add_sub_lib.xlslice
    generic map (
      new_lsb => 15,
      new_msb => 15,
      x_width => 16,
      y_width => 1
    )
    port map (
      x => mux2_y_net_x0,
      y(0) => slice_y_net_x0
    );

  slice1: entity int_add_sub_lib.xlslice
    generic map (
      new_lsb => 15,
      new_msb => 15,
      x_width => 16,
      y_width => 1
    )
    port map (
      x => mux3_y_net_x0,
      y(0) => slice1_y_net
    );

  slice2: entity int_add_sub_lib.xlslice
    generic map (
      new_lsb => 15,
      new_msb => 15,
      x_width => 16,
      y_width => 1
    )
    port map (
      x => uaddsub16s_s_net_x0,
      y(0) => slice2_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

-- Generated from Simulink block "integer_add_subtract/Integer Add Subtract/Unsigned 16-bit AddSub/Subsystem1"

entity subsystem1_entity_4820eca80b is
  port (
    a31_1: in std_logic; 
    b31_1: in std_logic; 
    c30: in std_logic; 
    overflow: out std_logic
  );
end subsystem1_entity_4820eca80b;

architecture structural of subsystem1_entity_4820eca80b is
  signal logical3_y_net_x1: std_logic;
  signal logical4_y_net: std_logic;
  signal logical5_y_net: std_logic;
  signal logical6_y_net: std_logic;
  signal logical7_y_net: std_logic;
  signal logical8_y_net_x0: std_logic;
  signal mux_y_net_x0: std_logic;
  signal slice2_y_net_x1: std_logic;

begin
  mux_y_net_x0 <= a31_1;
  slice2_y_net_x1 <= b31_1;
  logical3_y_net_x1 <= c30;
  overflow <= logical8_y_net_x0;

  logical4: entity int_add_sub_lib.logical_938d99ac11
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => mux_y_net_x0,
      d1(0) => slice2_y_net_x1,
      y(0) => logical4_y_net
    );

  logical5: entity int_add_sub_lib.logical_3e1f051fb7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => mux_y_net_x0,
      d1(0) => slice2_y_net_x1,
      y(0) => logical5_y_net
    );

  logical6: entity int_add_sub_lib.logical_938d99ac11
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical3_y_net_x1,
      d1(0) => logical5_y_net,
      y(0) => logical6_y_net
    );

  logical7: entity int_add_sub_lib.logical_3e1f051fb7
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical4_y_net,
      d1(0) => logical6_y_net,
      y(0) => logical7_y_net
    );

  logical8: entity int_add_sub_lib.logical_9d76333483
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => logical3_y_net_x1,
      d1(0) => logical7_y_net,
      y(0) => logical8_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

-- Generated from Simulink block "integer_add_subtract/Integer Add Subtract/Unsigned 16-bit AddSub"

entity unsigned_16_bit_addsub_entity_5fce5f6967 is
  port (
    a: in std_logic_vector(15 downto 0); 
    b: in std_logic_vector(15 downto 0); 
    ce_1: in std_logic; 
    cin: in std_logic; 
    clk_1: in std_logic; 
    sub_en: in std_logic; 
    cout: out std_logic; 
    overflow: out std_logic; 
    r: out std_logic_vector(15 downto 0)
  );
end unsigned_16_bit_addsub_entity_5fce5f6967;

architecture structural of unsigned_16_bit_addsub_entity_5fce5f6967 is
  signal ce_1_sg_x6: std_logic;
  signal clk_1_sg_x6: std_logic;
  signal convert_dout_net_x0: std_logic;
  signal inverter_op_net: std_logic;
  signal logical3_y_net_x1: std_logic;
  signal logical8_y_net_x1: std_logic;
  signal mux2_y_net_x1: std_logic_vector(15 downto 0);
  signal mux3_y_net_x1: std_logic_vector(15 downto 0);
  signal mux6_y_net_x0: std_logic;
  signal mux_y_net_x0: std_logic;
  signal slice2_y_net_x1: std_logic;
  signal slice_y_net_x0: std_logic;
  signal uaddsub16s_s_net_x0: std_logic_vector(15 downto 0);
  signal uaddsub16w_c_out_net_x0: std_logic;
  signal uaddsub16w_s_net_x0: std_logic_vector(15 downto 0);

begin
  mux2_y_net_x1 <= a;
  mux3_y_net_x1 <= b;
  ce_1_sg_x6 <= ce_1;
  mux6_y_net_x0 <= cin;
  clk_1_sg_x6 <= clk_1;
  convert_dout_net_x0 <= sub_en;
  cout <= uaddsub16w_c_out_net_x0;
  overflow <= logical8_y_net_x1;
  r <= uaddsub16w_s_net_x0;

  inverter: entity int_add_sub_lib.inverter_e2b989a05e
    port map (
      ce => ce_1_sg_x6,
      clk => clk_1_sg_x6,
      clr => '0',
      ip(0) => slice_y_net_x0,
      op(0) => inverter_op_net
    );

  mux: entity int_add_sub_lib.mux_112ed141f4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => slice_y_net_x0,
      d1(0) => inverter_op_net,
      sel(0) => convert_dout_net_x0,
      y(0) => mux_y_net_x0
    );

  subsystem1_4820eca80b: entity int_add_sub_lib.subsystem1_entity_4820eca80b
    port map (
      a31_1 => mux_y_net_x0,
      b31_1 => slice2_y_net_x1,
      c30 => logical3_y_net_x1,
      overflow => logical8_y_net_x1
    );

  subsystem_8975c7645f: entity int_add_sub_lib.subsystem_entity_8975c7645f
    port map (
      a => mux2_y_net_x1,
      b => mux3_y_net_x1,
      r => uaddsub16s_s_net_x0,
      a31 => slice_y_net_x0,
      b31 => slice2_y_net_x1,
      c30 => logical3_y_net_x1
    );

  uaddsub16s: entity int_add_sub_lib.xladdsubmode
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 16,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 16,
      c_has_c_out => 0,
      c_in_arith => xlUnsigned,
      c_in_bin_pt => 0,
      c_in_width => 1,
      c_latency => 0,
      c_output_width => 18,
      core_name0 => "addsb_11_0_9afe43fd5ec86008",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 18,
      latency => 0,
      mode_arith => xlUnsigned,
      mode_bin_pt => 0,
      mode_width => 1,
      overflow => 2,
      quantization => 1,
      s_arith => xlUnsigned,
      s_bin_pt => 0,
      s_width => 16
    )
    port map (
      a => mux2_y_net_x1,
      b => mux3_y_net_x1,
      c_in(0) => mux6_y_net_x0,
      ce => ce_1_sg_x6,
      clk => clk_1_sg_x6,
      clr => '0',
      en => "1",
      mode(0) => convert_dout_net_x0,
      s => uaddsub16s_s_net_x0
    );

  uaddsub16w: entity int_add_sub_lib.xladdsubmode
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 16,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 16,
      c_has_c_out => 1,
      c_in_arith => xlUnsigned,
      c_in_bin_pt => 0,
      c_in_width => 1,
      c_latency => 0,
      c_out_arith => xlUnsigned,
      c_out_bin_pt => 0,
      c_out_width => 1,
      c_output_width => 16,
      core_name0 => "addsb_11_0_ff5e7816e515836d",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 16,
      latency => 0,
      mode_arith => xlUnsigned,
      mode_bin_pt => 0,
      mode_width => 1,
      overflow => 1,
      quantization => 1,
      s_arith => xlUnsigned,
      s_bin_pt => 0,
      s_width => 16
    )
    port map (
      a => mux2_y_net_x1,
      b => mux3_y_net_x1,
      c_in(0) => mux6_y_net_x0,
      ce => ce_1_sg_x6,
      clk => clk_1_sg_x6,
      clr => '0',
      en => "1",
      mode(0) => convert_dout_net_x0,
      c_out(0) => uaddsub16w_c_out_net_x0,
      s => uaddsub16w_s_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

-- Generated from Simulink block "integer_add_subtract/Integer Add Subtract/Unsigned 32-bit AddSub/Subsystem"

entity subsystem_entity_c344200761 is
  port (
    a: in std_logic_vector(31 downto 0); 
    b: in std_logic_vector(31 downto 0); 
    r: in std_logic_vector(31 downto 0); 
    a31: out std_logic; 
    b31: out std_logic; 
    c30: out std_logic
  );
end subsystem_entity_c344200761;

architecture structural of subsystem_entity_c344200761 is
  signal logical3_y_net_x0: std_logic;
  signal mux4_y_net_x0: std_logic_vector(31 downto 0);
  signal mux5_y_net_x0: std_logic_vector(31 downto 0);
  signal slice1_y_net: std_logic;
  signal slice2_y_net_x0: std_logic;
  signal slice_y_net_x0: std_logic;
  signal uaddsub32s_s_net_x0: std_logic_vector(31 downto 0);

begin
  mux4_y_net_x0 <= a;
  mux5_y_net_x0 <= b;
  uaddsub32s_s_net_x0 <= r;
  a31 <= slice_y_net_x0;
  b31 <= slice2_y_net_x0;
  c30 <= logical3_y_net_x0;

  logical3: entity int_add_sub_lib.logical_604045dd09
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => slice_y_net_x0,
      d1(0) => slice1_y_net,
      d2(0) => slice2_y_net_x0,
      y(0) => logical3_y_net_x0
    );

  slice: entity int_add_sub_lib.xlslice
    generic map (
      new_lsb => 31,
      new_msb => 31,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => mux4_y_net_x0,
      y(0) => slice_y_net_x0
    );

  slice1: entity int_add_sub_lib.xlslice
    generic map (
      new_lsb => 31,
      new_msb => 31,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => mux5_y_net_x0,
      y(0) => slice1_y_net
    );

  slice2: entity int_add_sub_lib.xlslice
    generic map (
      new_lsb => 31,
      new_msb => 31,
      x_width => 32,
      y_width => 1
    )
    port map (
      x => uaddsub32s_s_net_x0,
      y(0) => slice2_y_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

-- Generated from Simulink block "integer_add_subtract/Integer Add Subtract/Unsigned 32-bit AddSub"

entity unsigned_32_bit_addsub_entity_aa7d7e5e13 is
  port (
    a: in std_logic_vector(31 downto 0); 
    b: in std_logic_vector(31 downto 0); 
    ce_1: in std_logic; 
    cin: in std_logic; 
    clk_1: in std_logic; 
    sub_en: in std_logic; 
    cout: out std_logic; 
    overflow: out std_logic; 
    r: out std_logic_vector(31 downto 0)
  );
end unsigned_32_bit_addsub_entity_aa7d7e5e13;

architecture structural of unsigned_32_bit_addsub_entity_aa7d7e5e13 is
  signal ce_1_sg_x7: std_logic;
  signal clk_1_sg_x7: std_logic;
  signal convert_dout_net_x1: std_logic;
  signal inverter_op_net: std_logic;
  signal logical3_y_net_x1: std_logic;
  signal logical8_y_net_x1: std_logic;
  signal mux4_y_net_x1: std_logic_vector(31 downto 0);
  signal mux5_y_net_x1: std_logic_vector(31 downto 0);
  signal mux6_y_net_x1: std_logic;
  signal mux_y_net_x0: std_logic;
  signal slice2_y_net_x1: std_logic;
  signal slice_y_net_x0: std_logic;
  signal uaddsub32s_s_net_x0: std_logic_vector(31 downto 0);
  signal uaddsub32w_c_out_net_x0: std_logic;
  signal uaddsub32w_s_net_x0: std_logic_vector(31 downto 0);

begin
  mux4_y_net_x1 <= a;
  mux5_y_net_x1 <= b;
  ce_1_sg_x7 <= ce_1;
  mux6_y_net_x1 <= cin;
  clk_1_sg_x7 <= clk_1;
  convert_dout_net_x1 <= sub_en;
  cout <= uaddsub32w_c_out_net_x0;
  overflow <= logical8_y_net_x1;
  r <= uaddsub32w_s_net_x0;

  inverter: entity int_add_sub_lib.inverter_e2b989a05e
    port map (
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      clr => '0',
      ip(0) => slice_y_net_x0,
      op(0) => inverter_op_net
    );

  mux: entity int_add_sub_lib.mux_112ed141f4
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => slice_y_net_x0,
      d1(0) => inverter_op_net,
      sel(0) => convert_dout_net_x1,
      y(0) => mux_y_net_x0
    );

  subsystem1_b26dd812db: entity int_add_sub_lib.subsystem1_entity_4820eca80b
    port map (
      a31_1 => mux_y_net_x0,
      b31_1 => slice2_y_net_x1,
      c30 => logical3_y_net_x1,
      overflow => logical8_y_net_x1
    );

  subsystem_c344200761: entity int_add_sub_lib.subsystem_entity_c344200761
    port map (
      a => mux4_y_net_x1,
      b => mux5_y_net_x1,
      r => uaddsub32s_s_net_x0,
      a31 => slice_y_net_x0,
      b31 => slice2_y_net_x1,
      c30 => logical3_y_net_x1
    );

  uaddsub32s: entity int_add_sub_lib.xladdsubmode
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 32,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 32,
      c_has_c_out => 0,
      c_in_arith => xlUnsigned,
      c_in_bin_pt => 0,
      c_in_width => 1,
      c_latency => 0,
      c_output_width => 34,
      core_name0 => "addsb_11_0_3ecbf8f489c06845",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 34,
      latency => 0,
      mode_arith => xlUnsigned,
      mode_bin_pt => 0,
      mode_width => 1,
      overflow => 2,
      quantization => 1,
      s_arith => xlUnsigned,
      s_bin_pt => 0,
      s_width => 32
    )
    port map (
      a => mux4_y_net_x1,
      b => mux5_y_net_x1,
      c_in(0) => mux6_y_net_x1,
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      clr => '0',
      en => "1",
      mode(0) => convert_dout_net_x1,
      s => uaddsub32s_s_net_x0
    );

  uaddsub32w: entity int_add_sub_lib.xladdsubmode
    generic map (
      a_arith => xlUnsigned,
      a_bin_pt => 0,
      a_width => 32,
      b_arith => xlUnsigned,
      b_bin_pt => 0,
      b_width => 32,
      c_has_c_out => 1,
      c_in_arith => xlUnsigned,
      c_in_bin_pt => 0,
      c_in_width => 1,
      c_latency => 0,
      c_out_arith => xlUnsigned,
      c_out_bin_pt => 0,
      c_out_width => 1,
      c_output_width => 32,
      core_name0 => "addsb_11_0_291525a2942bda7b",
      extra_registers => 0,
      full_s_arith => 2,
      full_s_width => 32,
      latency => 0,
      mode_arith => xlUnsigned,
      mode_bin_pt => 0,
      mode_width => 1,
      overflow => 1,
      quantization => 1,
      s_arith => xlUnsigned,
      s_bin_pt => 0,
      s_width => 32
    )
    port map (
      a => mux4_y_net_x1,
      b => mux5_y_net_x1,
      c_in(0) => mux6_y_net_x1,
      ce => ce_1_sg_x7,
      clk => clk_1_sg_x7,
      clr => '0',
      en => "1",
      mode(0) => convert_dout_net_x1,
      c_out(0) => uaddsub32w_c_out_net_x0,
      s => uaddsub32w_s_net_x0
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

-- Generated from Simulink block "integer_add_subtract/Integer Add Subtract"

entity integer_add_subtract_entity_e9a806f736 is
  port (
    a: in std_logic_vector(31 downto 0); 
    a_neg: in std_logic; 
    b: in std_logic_vector(31 downto 0); 
    b_neg: in std_logic; 
    ce_1: in std_logic; 
    cin: in std_logic; 
    clk_1: in std_logic; 
    saturate: in std_logic; 
    sub_en: in std_logic; 
    w32: in std_logic; 
    cout: out std_logic; 
    overflow: out std_logic; 
    result: out std_logic_vector(31 downto 0)
  );
end integer_add_subtract_entity_e9a806f736;

architecture structural of integer_add_subtract_entity_e9a806f736 is
  signal a_in_net_x2: std_logic_vector(31 downto 0);
  signal a_neg_in_net_x0: std_logic;
  signal addsub_s_net_x0: std_logic_vector(15 downto 0);
  signal addsub_s_net_x1: std_logic_vector(15 downto 0);
  signal addsub_s_net_x2: std_logic_vector(31 downto 0);
  signal addsub_s_net_x3: std_logic_vector(31 downto 0);
  signal b_in_net_x2: std_logic_vector(31 downto 0);
  signal b_neg_in_net_x0: std_logic;
  signal carry_in_net_x0: std_logic;
  signal ce_1_sg_x8: std_logic;
  signal clk_1_sg_x8: std_logic;
  signal concat_y_net: std_logic_vector(31 downto 0);
  signal constant10_op_net_x0: std_logic_vector(31 downto 0);
  signal constant12_op_net_x0: std_logic_vector(15 downto 0);
  signal constant13_op_net_x0: std_logic_vector(31 downto 0);
  signal constant15_op_net_x0: std_logic_vector(31 downto 0);
  signal constant16_op_net_x0: std_logic_vector(15 downto 0);
  signal constant8_op_net: std_logic;
  signal constant9_op_net_x0: std_logic_vector(15 downto 0);
  signal constant_op_net: std_logic_vector(15 downto 0);
  signal convert2_dout_net_x0: std_logic_vector(15 downto 0);
  signal convert3_dout_net_x1: std_logic_vector(31 downto 0);
  signal convert_dout_net_x1: std_logic;
  signal logical8_y_net_x1: std_logic;
  signal logical8_y_net_x2: std_logic;
  signal mux1_y_net_x0: std_logic_vector(31 downto 0);
  signal mux2_y_net_x1: std_logic_vector(15 downto 0);
  signal mux3_y_net_x1: std_logic_vector(15 downto 0);
  signal mux4_y_net_x1: std_logic_vector(31 downto 0);
  signal mux5_y_net_x1: std_logic_vector(31 downto 0);
  signal mux6_y_net_x1: std_logic;
  signal mux7_y_net_x0: std_logic_vector(15 downto 0);
  signal mux7_y_net_x1: std_logic_vector(31 downto 0);
  signal mux7_y_net_x2: std_logic;
  signal mux8_y_net_x0: std_logic;
  signal register1_q_net: std_logic;
  signal register2_q_net_x0: std_logic;
  signal register3_q_net_x0: std_logic_vector(31 downto 0);
  signal register4_q_net: std_logic;
  signal register5_q_net_x0: std_logic;
  signal register_q_net_x0: std_logic_vector(15 downto 0);
  signal saturate_in_net_x2: std_logic;
  signal slice1_y_net: std_logic_vector(15 downto 0);
  signal slice_y_net: std_logic_vector(15 downto 0);
  signal sub_en_net_x0: std_logic;
  signal uaddsub16w_c_out_net_x0: std_logic;
  signal uaddsub16w_s_net_x0: std_logic_vector(15 downto 0);
  signal uaddsub32w_c_out_net_x0: std_logic;
  signal uaddsub32w_s_net_x0: std_logic_vector(31 downto 0);
  signal w32_in_net_x0: std_logic;

begin
  a_in_net_x2 <= a;
  a_neg_in_net_x0 <= a_neg;
  b_in_net_x2 <= b;
  b_neg_in_net_x0 <= b_neg;
  ce_1_sg_x8 <= ce_1;
  carry_in_net_x0 <= cin;
  clk_1_sg_x8 <= clk_1;
  saturate_in_net_x2 <= saturate;
  sub_en_net_x0 <= sub_en;
  w32_in_net_x0 <= w32;
  cout <= mux7_y_net_x2;
  overflow <= mux8_y_net_x0;
  result <= mux1_y_net_x0;

  concat: entity int_add_sub_lib.concat_a369e00c6b
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      in0 => constant_op_net,
      in1 => mux7_y_net_x0,
      y => concat_y_net
    );

  constant10: entity int_add_sub_lib.constant_37567836aa
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant10_op_net_x0
    );

  constant12: entity int_add_sub_lib.constant_e48c5a6fd1
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant12_op_net_x0
    );

  constant13: entity int_add_sub_lib.constant_38c2d03959
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant13_op_net_x0
    );

  constant15: entity int_add_sub_lib.constant_24edfb480a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant15_op_net_x0
    );

  constant16: entity int_add_sub_lib.constant_fb4ee6ff0a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant16_op_net_x0
    );

  constant8: entity int_add_sub_lib.constant_963ed6358a
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op(0) => constant8_op_net
    );

  constant9: entity int_add_sub_lib.constant_9f5572ba51
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant9_op_net_x0
    );

  constant_x0: entity int_add_sub_lib.constant_9f5572ba51
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      op => constant_op_net
    );

  convert: entity int_add_sub_lib.xlconvert
    generic map (
      bool_conversion => 1,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 1,
      dout_arith => 1,
      dout_bin_pt => 0,
      dout_width => 1,
      latency => 0,
      overflow => xlWrap,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      clr => '0',
      din(0) => sub_en_net_x0,
      en => "1",
      dout(0) => convert_dout_net_x1
    );

  convert2: entity int_add_sub_lib.xlconvert
    generic map (
      bool_conversion => 0,
      din_arith => 1,
      din_bin_pt => 0,
      din_width => 16,
      dout_arith => 2,
      dout_bin_pt => 0,
      dout_width => 16,
      latency => 0,
      overflow => xlSaturate,
      quantization => xlTruncate
    )
    port map (
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      clr => '0',
      din => register_q_net_x0,
      en => "1",
      dout => convert2_dout_net_x0
    );

  convert3: entity int_add_sub_lib.xlconvert
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
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      clr => '0',
      din => register3_q_net_x0,
      en => "1",
      dout => convert3_dout_net_x1
    );

  mux1: entity int_add_sub_lib.mux_c83fe79b0f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => concat_y_net,
      d1 => mux7_y_net_x1,
      sel(0) => w32_in_net_x0,
      y => mux1_y_net_x0
    );

  mux2: entity int_add_sub_lib.mux_2c45f290ed
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => slice_y_net,
      d1 => addsub_s_net_x0,
      sel(0) => a_neg_in_net_x0,
      y => mux2_y_net_x1
    );

  mux3: entity int_add_sub_lib.mux_2c45f290ed
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => slice1_y_net,
      d1 => addsub_s_net_x1,
      sel(0) => b_neg_in_net_x0,
      y => mux3_y_net_x1
    );

  mux4: entity int_add_sub_lib.mux_c83fe79b0f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => a_in_net_x2,
      d1 => addsub_s_net_x2,
      sel(0) => a_neg_in_net_x0,
      y => mux4_y_net_x1
    );

  mux5: entity int_add_sub_lib.mux_c83fe79b0f
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0 => b_in_net_x2,
      d1 => addsub_s_net_x3,
      sel(0) => b_neg_in_net_x0,
      y => mux5_y_net_x1
    );

  mux6: entity int_add_sub_lib.mux_67acc0d350
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => carry_in_net_x0,
      d1(0) => constant8_op_net,
      sel(0) => saturate_in_net_x2,
      y(0) => mux6_y_net_x1
    );

  mux7: entity int_add_sub_lib.mux_67acc0d350
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => register1_q_net,
      d1(0) => register4_q_net,
      sel(0) => w32_in_net_x0,
      y(0) => mux7_y_net_x2
    );

  mux8: entity int_add_sub_lib.mux_67acc0d350
    port map (
      ce => '0',
      clk => '0',
      clr => '0',
      d0(0) => register2_q_net_x0,
      d1(0) => register5_q_net_x0,
      sel(0) => w32_in_net_x0,
      y(0) => mux8_y_net_x0
    );

  register1: entity int_add_sub_lib.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      d(0) => uaddsub16w_c_out_net_x0,
      en => "1",
      rst => "0",
      q(0) => register1_q_net
    );

  register2: entity int_add_sub_lib.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      d(0) => logical8_y_net_x1,
      en => "1",
      rst => "0",
      q(0) => register2_q_net_x0
    );

  register3: entity int_add_sub_lib.xlregister
    generic map (
      d_width => 32,
      init_value => b"00000000000000000000000000000000"
    )
    port map (
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      d => uaddsub32w_s_net_x0,
      en => "1",
      rst => "0",
      q => register3_q_net_x0
    );

  register4: entity int_add_sub_lib.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      d(0) => uaddsub32w_c_out_net_x0,
      en => "1",
      rst => "0",
      q(0) => register4_q_net
    );

  register5: entity int_add_sub_lib.xlregister
    generic map (
      d_width => 1,
      init_value => b"0"
    )
    port map (
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      d(0) => logical8_y_net_x2,
      en => "1",
      rst => "0",
      q(0) => register5_q_net_x0
    );

  register_x0: entity int_add_sub_lib.xlregister
    generic map (
      d_width => 16,
      init_value => b"0000000000000000"
    )
    port map (
      ce => ce_1_sg_x8,
      clk => clk_1_sg_x8,
      d => uaddsub16w_s_net_x0,
      en => "1",
      rst => "0",
      q => register_q_net_x0
    );

  slice: entity int_add_sub_lib.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 15,
      x_width => 32,
      y_width => 16
    )
    port map (
      x => a_in_net_x2,
      y => slice_y_net
    );

  slice1: entity int_add_sub_lib.xlslice
    generic map (
      new_lsb => 0,
      new_msb => 15,
      x_width => 32,
      y_width => 16
    )
    port map (
      x => b_in_net_x2,
      y => slice1_y_net
    );

  subsystem1_2ddb20951e: entity int_add_sub_lib.subsystem1_entity_2ddb20951e
    port map (
      ce_1 => ce_1_sg_x8,
      clk_1 => clk_1_sg_x8,
      o_greater => constant15_op_net_x0,
      o_less => constant13_op_net_x0,
      overflow => register5_q_net_x0,
      r_sign => convert3_dout_net_x1,
      r_unsign => register3_q_net_x0,
      sat_en => saturate_in_net_x2,
      zero => constant10_op_net_x0,
      r => mux7_y_net_x1
    );

  subsystem_d34cafe437: entity int_add_sub_lib.subsystem_entity_d34cafe437
    port map (
      ce_1 => ce_1_sg_x8,
      clk_1 => clk_1_sg_x8,
      o_greater => constant16_op_net_x0,
      o_less => constant12_op_net_x0,
      overflow => register2_q_net_x0,
      r_sign => convert2_dout_net_x0,
      r_unsign => register_q_net_x0,
      sat_en => saturate_in_net_x2,
      zero => constant9_op_net_x0,
      r => mux7_y_net_x0
    );

  unsigned_16_bit_addsub_5fce5f6967: entity int_add_sub_lib.unsigned_16_bit_addsub_entity_5fce5f6967
    port map (
      a => mux2_y_net_x1,
      b => mux3_y_net_x1,
      ce_1 => ce_1_sg_x8,
      cin => mux6_y_net_x1,
      clk_1 => clk_1_sg_x8,
      sub_en => convert_dout_net_x1,
      cout => uaddsub16w_c_out_net_x0,
      overflow => logical8_y_net_x1,
      r => uaddsub16w_s_net_x0
    );

  unsigned_32_bit_addsub_aa7d7e5e13: entity int_add_sub_lib.unsigned_32_bit_addsub_entity_aa7d7e5e13
    port map (
      a => mux4_y_net_x1,
      b => mux5_y_net_x1,
      ce_1 => ce_1_sg_x8,
      cin => mux6_y_net_x1,
      clk_1 => clk_1_sg_x8,
      sub_en => convert_dout_net_x1,
      cout => uaddsub32w_c_out_net_x0,
      overflow => logical8_y_net_x2,
      r => uaddsub32w_s_net_x0
    );

  x16_bit_two_s_complement1_1ac3ac84ed: entity int_add_sub_lib.x16_bit_two_s_complement_entity_5285698910
    port map (
      ce_1 => ce_1_sg_x8,
      clk_1 => clk_1_sg_x8,
      n => b_in_net_x2,
      n_comp => addsub_s_net_x1
    );

  x16_bit_two_s_complement_5285698910: entity int_add_sub_lib.x16_bit_two_s_complement_entity_5285698910
    port map (
      ce_1 => ce_1_sg_x8,
      clk_1 => clk_1_sg_x8,
      n => a_in_net_x2,
      n_comp => addsub_s_net_x0
    );

  x32_bit_two_s_complement1_8b0fae5272: entity int_add_sub_lib.x32_bit_two_s_complement_entity_f923917e92
    port map (
      ce_1 => ce_1_sg_x8,
      clk_1 => clk_1_sg_x8,
      n => b_in_net_x2,
      n_comp => addsub_s_net_x3
    );

  x32_bit_two_s_complement_f923917e92: entity int_add_sub_lib.x32_bit_two_s_complement_entity_f923917e92
    port map (
      ce_1 => ce_1_sg_x8,
      clk_1 => clk_1_sg_x8,
      n => a_in_net_x2,
      n_comp => addsub_s_net_x2
    );

end structural;
library IEEE;
use IEEE.std_logic_1164.all;
library int_add_sub_lib;
use int_add_sub_lib.conv_pkg.all;

-- Generated from Simulink block "integer_add_subtract"

entity integer_add_subtract is
  port (
    a_in: in std_logic_vector(31 downto 0); 
    a_neg_in: in std_logic; 
    b_in: in std_logic_vector(31 downto 0); 
    b_neg_in: in std_logic; 
    carry_in: in std_logic; 
    ce_1: in std_logic; 
    clk_1: in std_logic; 
    saturate_in: in std_logic; 
    sub_en: in std_logic; 
    w32_in: in std_logic; 
    carry_out: out std_logic; 
    overflow_out: out std_logic; 
    result_out: out std_logic_vector(31 downto 0)
  );
end integer_add_subtract;

architecture structural of integer_add_subtract is
  attribute core_generation_info: string;
  attribute core_generation_info of structural : architecture is "integer_add_subtract,sysgen_core,{clock_period=3.33333333,clocking=Clock_Enables,compilation=NGC_Netlist,sample_periods=1.00000000000,testbench=0,total_blocks=181,xilinx_adder_subtracter_block=8,xilinx_arithmetic_relational_operator_block=2,xilinx_bit_slice_extractor_block=10,xilinx_bus_concatenator_block=1,xilinx_bus_multiplexer_block=16,xilinx_constant_block_block=12,xilinx_gateway_in_block=8,xilinx_gateway_out_block=3,xilinx_inverter_block=6,xilinx_logical_block_block=12,xilinx_register_block=6,xilinx_resource_estimator_block=1,xilinx_system_generator_block=1,xilinx_type_converter_block=5,}";

  signal a_in_net: std_logic_vector(31 downto 0);
  signal a_neg_in_net: std_logic;
  signal b_in_net: std_logic_vector(31 downto 0);
  signal b_neg_in_net: std_logic;
  signal carry_in_net: std_logic;
  signal carry_out_net: std_logic;
  signal ce_1_sg_x9: std_logic;
  signal clk_1_sg_x9: std_logic;
  signal overflow_out_net: std_logic;
  signal result_out_net: std_logic_vector(31 downto 0);
  signal saturate_in_net: std_logic;
  signal sub_en_net: std_logic;
  signal w32_in_net: std_logic;

begin
  a_in_net <= a_in;
  a_neg_in_net <= a_neg_in;
  b_in_net <= b_in;
  b_neg_in_net <= b_neg_in;
  carry_in_net <= carry_in;
  ce_1_sg_x9 <= ce_1;
  clk_1_sg_x9 <= clk_1;
  saturate_in_net <= saturate_in;
  sub_en_net <= sub_en;
  w32_in_net <= w32_in;
  carry_out <= carry_out_net;
  overflow_out <= overflow_out_net;
  result_out <= result_out_net;

  integer_add_subtract_e9a806f736: entity int_add_sub_lib.integer_add_subtract_entity_e9a806f736
    port map (
      a => a_in_net,
      a_neg => a_neg_in_net,
      b => b_in_net,
      b_neg => b_neg_in_net,
      ce_1 => ce_1_sg_x9,
      cin => carry_in_net,
      clk_1 => clk_1_sg_x9,
      saturate => saturate_in_net,
      sub_en => sub_en_net,
      w32 => w32_in_net,
      cout => carry_out_net,
      overflow => overflow_out_net,
      result => result_out_net
    );

end structural;
