
-------------------------------------------------------------------
-- System Generator version 14.3 VHDL source file.
--
-- Copyright(C) 2012 by Xilinx, Inc.  All rights reserved.  This
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
-- text at all times.  (c) Copyright 1995-2012 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
-- The following code must appear in the VHDL architecture header:

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component compute_set_pred_i  port (
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
end component;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body.  Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : compute_set_pred_i
  port map (
    ce_1 => ce_1,
    clk_1 => clk_1,
    is_signed_in => is_signed_in,
    set_cond_in => set_cond_in,
    src_1_in => src_1_in,
    src_2_in => src_2_in,
    w32_in => w32_in,
    result_out => result_out,
    sign_out => sign_out,
    zero_out => zero_out);
-- INST_TAG_END ------ End INSTANTIATION Template ------------
