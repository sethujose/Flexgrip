
open(PIDFILE, '> pidfile.txt') || die 'Couldn\'t write process ID to file.';
print PIDFILE "$$\n";
close(PIDFILE);

eval {
  # Call script(s).
  my $instrs;
  my $results = [];
$ENV{'SYSGEN'} = 'C:/Xilinx/14.3/ISE_DS/ISE/sysgen';
  use Sg;
  $instrs = {
    'HDLCodeGenStatus' => 0.0,
    'HDL_PATH' => 'C:/Users/andryc/Dropbox/GPGPU/gpgpu-1.0.1/matlab/integer_compute_set_pred',
    'TEMP' => 'C:/Users/andryc/AppData/Local/Temp',
    'TMP' => 'C:/Users/andryc/AppData/Local/Temp',
    'Temp' => 'C:/Users/andryc/AppData/Local/Temp',
    'Tmp' => 'C:/Users/andryc/AppData/Local/Temp',
    'base_system_period_hardware' => 10.0,
    'base_system_period_simulink' => 1.0,
    'block_icon_display' => 'Default',
    'block_type' => 'sysgen',
    'block_version' => '',
    'ce_clr' => 0.0,
    'clock_domain' => 'default',
    'clock_loc' => '',
    'clock_wrapper' => 'Clock Enables',
    'clock_wrapper_sgadvanced' => '',
    'compilation' => 'NGC Netlist',
    'compilation_lut' => {
      'keys' => [
        'HDL Netlist',
        'NGC Netlist',
      ],
      'values' => [
        'target1',
        'target2',
      ],
    },
    'compilation_target' => 'NGC Netlist',
    'core_generation' => 1.0,
    'core_generation_sgadvanced' => '',
    'core_is_deployed' => 0.0,
    'coregen_core_generation_tmpdir' => 'C:/Users/andryc/AppData/Local/Temp/sysgentmp-Andryc/cg_wk/c48367923b74a871f',
    'coregen_part_family' => 'virtex6',
    'createTestbench' => 0,
    'create_interface_document' => 'off',
    'dbl_ovrd' => -1.0,
    'dbl_ovrd_sgadvanced' => '',
    'dcm_input_clock_period' => 10.0,
    'deprecated_control' => 'off',
    'deprecated_control_sgadvanced' => '',
    'design' => 'compute_set_pred_i',
    'design_full_path' => 'C:\\Users\\andryc\\Dropbox\\GPGPU\\gpgpu-1.0.1\\matlab\\integer_compute_set_pred\\compute_set_pred_i.mdl',
    'device' => 'xc6vlx240t-1ff1156',
    'device_speed' => '-1',
    'directory' => 'C:/Users/andryc/Dropbox/GPGPU/gpgpu-1.0.1/matlab/integer_compute_set_pred/ngc_netlist',
    'dsp_cache_root_path' => 'C:/Users/andryc/AppData/Local/Temp/sysgentmp-Andryc',
    'eval_field' => '0',
    'fileDeliveryDefaults' => [
      [
        '(?i)\\.vhd$',
        { 'fileName' => 'C:/Users/andryc/Dropbox/GPGPU/gpgpu-1.0.1/matlab/integer_compute_set_pred/ngc_netlist/sysgen/perl_results.vhd', },
      ],
      [
        '(?i)\\.v$',
        { 'fileName' => 'C:/Users/andryc/Dropbox/GPGPU/gpgpu-1.0.1/matlab/integer_compute_set_pred/ngc_netlist/sysgen/perl_results.v', },
      ],
    ],
    'fxdptinstalled' => 0.0,
    'generateUsing71FrontEnd' => 1,
    'generating_island_subsystem_handle' => 2089.00048828125,
    'generating_subsystem_handle' => 2089.00048828125,
    'generation_directory' => './ngc_netlist',
    'has_advanced_control' => '0',
    'hdlDir' => 'C:/Xilinx/14.3/ISE_DS/ISE/sysgen/hdl',
    'hdlKind' => 'vhdl',
    'hdl_path' => 'C:/Users/andryc/Dropbox/GPGPU/gpgpu-1.0.1/matlab/integer_compute_set_pred',
    'impl_file' => 'ISE Defaults*',
    'incr_netlist' => 'off',
    'incr_netlist_sgadvanced' => '',
    'infoedit' => ' System Generator',
    'isdeployed' => 0,
    'ise_version' => '14.3i',
    'master_sysgen_token_handle' => 2090.00048828125,
    'matlab' => 'C:/Program Files/MATLAB/R2011a',
    'matlab_fixedpoint' => 0.0,
    'mdlHandle' => 2089.00048828125,
    'mdlPath' => 'C:/Users/andryc/Dropbox/GPGPU/gpgpu-1.0.1/matlab/integer_compute_set_pred/compute_set_pred_i.mdl',
    'modelDiagnostics' => [
      {
        'count' => 70.0,
        'isMask' => 0.0,
        'type' => 'compute_set_pred_i Total blocks',
      },
      {
        'count' => 5.0,
        'isMask' => 0.0,
        'type' => 'Constant',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'DiscretePulseGenerator',
      },
      {
        'count' => 5.0,
        'isMask' => 0.0,
        'type' => 'Inport',
      },
      {
        'count' => 3.0,
        'isMask' => 0.0,
        'type' => 'Outport',
      },
      {
        'count' => 51.0,
        'isMask' => 0.0,
        'type' => 'S-Function',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'SubSystem',
      },
      {
        'count' => 2.0,
        'isMask' => 0.0,
        'type' => 'Terminator',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Adder/Subtracter Block',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Arithmetic Relational Operator Block',
      },
      {
        'count' => 3.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Bit Slice Extractor Block',
      },
      {
        'count' => 7.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Bus Multiplexer Block',
      },
      {
        'count' => 10.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Constant Block Block',
      },
      {
        'count' => 5.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway In Block',
      },
      {
        'count' => 3.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Gateway Out Block',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Inverter Block',
      },
      {
        'count' => 4.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Logical Block Block',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Negate Block Block',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Resource Estimator Block',
      },
      {
        'count' => 1.0,
        'isMask' => 1.0,
        'type' => 'Xilinx System Generator Block',
      },
      {
        'count' => 10.0,
        'isMask' => 1.0,
        'type' => 'Xilinx Type Converter Block',
      },
    ],
    'model_globals_initialized' => 1.0,
    'model_path' => 'C:/Users/andryc/Dropbox/GPGPU/gpgpu-1.0.1/matlab/integer_compute_set_pred/compute_set_pred_i.mdl',
    'myxilinx' => 'C:/Xilinx/14.3/ISE_DS/ISE',
    'ngc_config' => {
      'include_cf' => 1.0,
      'include_clockwrapper' => 0.0,
    },
    'ngc_files' => [ 'xlpersistentdff.ngc', ],
    'num_sim_cycles' => '10',
    'package' => 'ff1156',
    'part' => 'xc6vlx240t',
    'partFamily' => 'virtex6',
    'port_data_types_enabled' => 0.0,
    'postgeneration_fcn' => 'xlNGCPostGeneration',
    'preserve_hierarchy' => 0.0,
    'proj_type' => 'Project Navigator',
    'run_coregen' => 'off',
    'run_coregen_sgadvanced' => '',
    'sample_time_colors_enabled' => 0.0,
    'sampletimecolors' => 0.0,
    'settings_fcn' => 'xlngcsettings',
    'sg_blockgui_xml' => '',
    'sg_icon_stat' => '50,50,-1,-1,token,white,0,07734,right,,[ ],[ ]',
    'sg_list_contents' => '',
    'sg_mask_display' => 'fprintf(\'\',\'COMMENT: begin icon graphics\');
patch([0 50 50 0 0 ],[0 0 50 50 0 ],[1 1 1 ]);
patch([1.6375 16.81 27.31 37.81 48.31 27.31 12.1375 1.6375 ],[36.655 36.655 47.155 36.655 47.155 47.155 47.155 36.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 27.31 16.81 1.6375 12.1375 ],[26.155 26.155 36.655 36.655 26.155 ],[0.698039 0.0313725 0.219608 ]);
patch([1.6375 16.81 27.31 12.1375 1.6375 ],[15.655 15.655 26.155 26.155 15.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 48.31 37.81 27.31 16.81 1.6375 12.1375 ],[5.155 5.155 15.655 5.155 15.655 15.655 5.155 ],[0.698039 0.0313725 0.219608 ]);
fprintf(\'\',\'COMMENT: end icon graphics\');
fprintf(\'\',\'COMMENT: begin icon text\');
fprintf(\'\',\'COMMENT: end icon text\');',
    'sg_version' => '',
    'sggui_pos' => '-1,-1,-1,-1',
    'simulation_island_subsystem_handle' => 2089.00048828125,
    'simulink_accelerator_running' => 0.0,
    'simulink_debugger_running' => 0.0,
    'simulink_period' => 1.0,
    'speed' => '-1',
    'synth_file' => 'XST Defaults*',
    'synthesisTool' => 'XST',
    'synthesis_language' => 'vhdl',
    'synthesis_tool' => 'XST',
    'synthesis_tool_sgadvanced' => '',
    'sysclk_period' => 10.0,
    'sysgen' => 'C:/Xilinx/14.3/ISE_DS/ISE/sysgen',
    'sysgenRoot' => 'C:/Xilinx/14.3/ISE_DS/ISE/sysgen',
    'sysgenTokenSettings' => {
      'base_system_period_hardware' => 10.0,
      'base_system_period_simulink' => 1.0,
      'block_icon_display' => 'Default',
      'block_type' => 'sysgen',
      'block_version' => '',
      'ce_clr' => 0.0,
      'clock_loc' => '',
      'clock_wrapper' => 'Clock Enables',
      'clock_wrapper_sgadvanced' => '',
      'compilation' => 'NGC Netlist',
      'compilation_lut' => {
        'keys' => [
          'HDL Netlist',
          'NGC Netlist',
        ],
        'values' => [
          'target1',
          'target2',
        ],
      },
      'core_generation' => 1.0,
      'core_generation_sgadvanced' => '',
      'coregen_part_family' => 'virtex6',
      'create_interface_document' => 'off',
      'dbl_ovrd' => -1.0,
      'dbl_ovrd_sgadvanced' => '',
      'dcm_input_clock_period' => 10.0,
      'deprecated_control' => 'off',
      'deprecated_control_sgadvanced' => '',
      'directory' => './ngc_netlist',
      'eval_field' => '0',
      'has_advanced_control' => '0',
      'impl_file' => 'ISE Defaults*',
      'incr_netlist' => 'off',
      'incr_netlist_sgadvanced' => '',
      'infoedit' => ' System Generator',
      'master_sysgen_token_handle' => 2090.00048828125,
      'ngc_config' => {
        'include_cf' => 1.0,
        'include_clockwrapper' => 0.0,
      },
      'package' => 'ff1156',
      'part' => 'xc6vlx240t',
      'postgeneration_fcn' => 'xlNGCPostGeneration',
      'preserve_hierarchy' => 0.0,
      'proj_type' => 'Project Navigator',
      'run_coregen' => 'off',
      'run_coregen_sgadvanced' => '',
      'settings_fcn' => 'xlngcsettings',
      'sg_blockgui_xml' => '',
      'sg_icon_stat' => '50,50,-1,-1,token,white,0,07734,right,,[ ],[ ]',
      'sg_list_contents' => '',
      'sg_mask_display' => 'fprintf(\'\',\'COMMENT: begin icon graphics\');
patch([0 50 50 0 0 ],[0 0 50 50 0 ],[1 1 1 ]);
patch([1.6375 16.81 27.31 37.81 48.31 27.31 12.1375 1.6375 ],[36.655 36.655 47.155 36.655 47.155 47.155 47.155 36.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 27.31 16.81 1.6375 12.1375 ],[26.155 26.155 36.655 36.655 26.155 ],[0.698039 0.0313725 0.219608 ]);
patch([1.6375 16.81 27.31 12.1375 1.6375 ],[15.655 15.655 26.155 26.155 15.655 ],[0.933333 0.203922 0.141176 ]);
patch([12.1375 48.31 37.81 27.31 16.81 1.6375 12.1375 ],[5.155 5.155 15.655 5.155 15.655 15.655 5.155 ],[0.698039 0.0313725 0.219608 ]);
fprintf(\'\',\'COMMENT: end icon graphics\');
fprintf(\'\',\'COMMENT: begin icon text\');
fprintf(\'\',\'COMMENT: end icon text\');',
      'sggui_pos' => '-1,-1,-1,-1',
      'simulation_island_subsystem_handle' => 2089.00048828125,
      'simulink_period' => 1.0,
      'speed' => '-1',
      'synth_file' => 'XST Defaults*',
      'synthesis_language' => 'vhdl',
      'synthesis_tool' => 'XST',
      'synthesis_tool_sgadvanced' => '',
      'sysclk_period' => 10.0,
      'testbench' => 0,
      'testbench_sgadvanced' => '',
      'trim_vbits' => 1.0,
      'trim_vbits_sgadvanced' => '',
      'xilinx_device' => 'xc6vlx240t-1ff1156',
      'xilinxfamily' => 'virtex6',
    },
    'sysgen_Root' => 'C:/Xilinx/14.3/ISE_DS/ISE/sysgen',
    'systemClockPeriod' => 10.0,
    'tempdir' => 'C:/Users/andryc/AppData/Local/Temp',
    'testbench' => 0,
    'testbench_sgadvanced' => '',
    'tmpDir' => 'C:/Users/andryc/Dropbox/GPGPU/gpgpu-1.0.1/matlab/integer_compute_set_pred/ngc_netlist/sysgen',
    'trim_vbits' => 1.0,
    'trim_vbits_sgadvanced' => '',
    'use_strict_names' => 1,
    'user_tips_enabled' => 0.0,
    'usertemp' => 'C:/Users/andryc/AppData/Local/Temp/sysgentmp-Andryc',
    'using71Netlister' => 1,
    'verilog_files' => [
      'conv_pkg.v',
      'synth_reg.v',
      'synth_reg_w_init.v',
      'convert_type.v',
    ],
    'version' => '',
    'vhdl_files' => [
      'conv_pkg.vhd',
      'synth_reg.vhd',
      'synth_reg_w_init.vhd',
    ],
    'vsimtime' => '385.000000 ns',
    'xilinx' => 'C:/Xilinx/14.3/ISE_DS/ISE',
    'xilinx_device' => 'xc6vlx240t-1ff1156',
    'xilinx_family' => 'virtex6',
    'xilinx_package' => 'ff1156',
    'xilinx_part' => 'xc6vlx240t',
    'xilinxdevice' => 'xc6vlx240t-1ff1156',
    'xilinxfamily' => 'virtex6',
    'xilinxpart' => 'xc6vlx240t',
  };
  push(@$results, &Sg::setAttributes($instrs));
  use SgDeliverFile;
  $instrs = {
    'collaborationName' => 'conv_pkg.vhd',
    'sourceFile' => 'hdl/conv_pkg.vhd',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'synth_reg.vhd',
    'sourceFile' => 'hdl/synth_reg.vhd',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'synth_reg_w_init.vhd',
    'sourceFile' => 'hdl/synth_reg_w_init.vhd',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'collaborationName' => 'xlpersistentdff.ngc',
    'sourceFile' => 'hdl/xlpersistentdff.ngc',
    'templateKeyValues' => {},
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  use SgGenerateCores;
  $instrs = [
    'SELECT Adder_Subtracter virtex6 Xilinx,_Inc. 11.0',
    '# 14.3_P.40xd',
    '# DEVICE virtex6',
    '# VHDL',
    'CSET AINIT_Value = 0',
    'CSET A_Type = Signed',
    'CSET A_Width = 9',
    'CSET Add_Mode = Subtract',
    'CSET B_Constant = false',
    'CSET B_Type = Signed',
    'CSET B_Value = 0',
    'CSET B_Width = 9',
    'CSET Borrow_Sense = Active_Low',
    'CSET Bypass = false',
    'CSET Bypass_CE_Priority = Bypass_Overrides_CE',
    'CSET Bypass_Sense = Active_Low',
    'CSET CE = false',
    'CSET C_In = false',
    'CSET C_Out = false',
    'CSET Implementation = Fabric',
    'CSET Latency = 0',
    'CSET Out_Width = 9',
    'CSET SCLR = false',
    'CSET SINIT = false',
    'CSET SINIT_Value = 0',
    'CSET SSET = false',
    'CSET Sync_CE_Priority = Sync_Overrides_CE',
    'CSET Sync_Ctrl_Priority = Reset_Overrides_Set',
    'CSET component_name = addsb_11_0_466a9d5db3d8f7f1',
    'GENERATE',
  ];
  push(@$results, &SgGenerateCores::saveXcoSequence($instrs));
  $instrs = {
    'entity_declaration_hash' => '357b8b5eacac17262cb0d4187f212222',
    'sourceFile' => 'hdl/xladdsub.vhd',
    'templateKeyValues' => {
      'core_component_def' => '    a: in std_logic_vector(9 - 1 downto 0);
    s: out std_logic_vector(c_output_width - 1 downto 0);
    b: in std_logic_vector(9 - 1 downto 0)',
      'core_instance_text' => '         a => full_a,
         s => core_s,
         b => full_b',
      'core_name0' => 'addsb_11_0_466a9d5db3d8f7f1',
      'entityName' => 'xladdsub_compute_set_pred_i',
      'entity_name.0' => 'xladdsub',
      'needs_core' => 1,
      'vivado_flow' => 0,
    },
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'd79079c104728231229f8185fe35b4f8',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000001";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_b437b02512',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '26c90b101ce1ca8b2f28c242a8215ef7',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "0";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_963ed6358a',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '6881e3e9fe47f0cbdc2e654a4e3326e1',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_91ef1678ca',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '65d967845ca1d478bce14d8d6f0962c4',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000010";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_bc54100077',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'c8ac2f8b02c35d537ca2d762269f7a07',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "00000000000000000000000000000000";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_37567836aa',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '13366d021ddc9f5413827bc05cb9e24f',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
begin
  op <= "1";
end',
      'crippled_entity' => 'is
  port (
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'constant_6293007044',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'cf5ba7be3a4bf79cb6bfa1834ed2b2bd',
    'sourceFile' => 'C:/Xilinx/14.3/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e6c1fd4680ffc49a3e0b272754ec93dd',
    'sourceFile' => 'C:/Xilinx/14.3/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'f420deb39c01ad7bfd4b40ab22181864',
    'sourceFile' => 'C:/Xilinx/14.3/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '33f674b69dcef0617a4d55fe530d5432',
    'sourceFile' => 'C:/Xilinx/14.3/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '92b59a6e864157eb0c7582b2128de4a9',
    'sourceFile' => 'C:/Xilinx/14.3/ISE_DS/ISE/sysgen/hdl/xlconvert.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'b32a0080f8f47e0be7ec44c6ad81b20b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_1_26: boolean;
  type array_type_op_mem_22_20 is array (0 to (1 - 1)) of boolean;
  signal op_mem_22_20: array_type_op_mem_22_20 := (
    0 => false);
  signal op_mem_22_20_front_din: boolean;
  signal op_mem_22_20_back: boolean;
  signal op_mem_22_20_push_front_pop_back_en: std_logic;
  signal internal_ip_12_1_bitnot: boolean;
begin
  ip_1_26 <= ((ip) = "1");
  op_mem_22_20_back <= op_mem_22_20(0);
  proc_op_mem_22_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_22_20_push_front_pop_back_en = \'1\')) then
        op_mem_22_20(0) <= op_mem_22_20_front_din;
      end if;
    end if;
  end process proc_op_mem_22_20;
  internal_ip_12_1_bitnot <= ((not boolean_to_vector(ip_1_26)) = "1");
  op_mem_22_20_push_front_pop_back_en <= \'0\';
  op <= boolean_to_vector(internal_ip_12_1_bitnot);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((1 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'inverter_e5b38cca3b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '298203483c3de52896eed04fd75246a4',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  fully_2_1_bit <= d0_1_24 and d1_1_27;
  y <= std_logic_to_vector(fully_2_1_bit);
end',
      'crippled_entity' => 'is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'logical_80f90b97d0',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '79cfaf8c15ce6d93b744ee6a4a4e8394',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d0_1_24: std_logic;
  signal d1_1_27: std_logic;
  signal fully_2_1_bit: std_logic;
begin
  d0_1_24 <= d0(0);
  d1_1_27 <= d1(0);
  fully_2_1_bit <= d0_1_24 or d1_1_27;
  y <= std_logic_to_vector(fully_2_1_bit);
end',
      'crippled_entity' => 'is
  port (
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'logical_aacf6e1b0e',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '0301e9e974c7da39ede3cf9ae5627260',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal d0_1_24: std_logic_vector((8 - 1) downto 0);
  signal d1_1_27: std_logic_vector((8 - 1) downto 0);
  signal fully_2_1_bit: std_logic_vector((8 - 1) downto 0);
begin
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  fully_2_1_bit <= d0_1_24 or d1_1_27;
  y <= fully_2_1_bit;
end',
      'crippled_entity' => 'is
  port (
    d0 : in std_logic_vector((8 - 1) downto 0);
    d1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'logical_a8f7ff4c23',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '1e0a9d9e7c70d8021f169965ce93b29b',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((8 - 1) downto 0);
  signal d1_1_27: std_logic_vector((8 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((8 - 1) downto 0);
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
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((8 - 1) downto 0);
    d1 : in std_logic_vector((8 - 1) downto 0);
    y : out std_logic_vector((8 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_2af8d8c05a',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '205f49b8f029a5b0a8f51ed1f632988a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((1 - 1) downto 0);
  signal d0_1_24: std_logic_vector((16 - 1) downto 0);
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
        unregy_join_6_1 <= cast(d0_1_24, 0, 32, 0, xlSigned);
      when others =>
        unregy_join_6_1 <= d1_1_27;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((16 - 1) downto 0);
    d1 : in std_logic_vector((32 - 1) downto 0);
    y : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_6ef2c99a1b',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'a67675da377eed7dad976173deacf8d4',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
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
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((1 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_67acc0d350',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '8cf7b10ef370de3ab8bf4fc683447a55',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal sel_1_20: std_logic_vector((2 - 1) downto 0);
  signal d0_1_24: std_logic_vector((1 - 1) downto 0);
  signal d1_1_27: std_logic_vector((1 - 1) downto 0);
  signal d2_1_30: std_logic_vector((1 - 1) downto 0);
  signal unregy_join_6_1: std_logic_vector((1 - 1) downto 0);
begin
  sel_1_20 <= sel;
  d0_1_24 <= d0;
  d1_1_27 <= d1;
  d2_1_30 <= d2;
  proc_switch_6_1: process (d0_1_24, d1_1_27, d2_1_30, sel_1_20)
  is
  begin
    case sel_1_20 is 
      when "00" =>
        unregy_join_6_1 <= d0_1_24;
      when "01" =>
        unregy_join_6_1 <= d1_1_27;
      when others =>
        unregy_join_6_1 <= d2_1_30;
    end case;
  end process proc_switch_6_1;
  y <= unregy_join_6_1;
end',
      'crippled_entity' => 'is
  port (
    sel : in std_logic_vector((2 - 1) downto 0);
    d0 : in std_logic_vector((1 - 1) downto 0);
    d1 : in std_logic_vector((1 - 1) downto 0);
    d2 : in std_logic_vector((1 - 1) downto 0);
    y : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'mux_a3706fc7d1',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'af50c263cf31d9ef3ad108082ee25120',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal ip_18_25: signed((31 - 1) downto 0);
  type array_type_op_mem_48_20 is array (0 to (1 - 1)) of signed((32 - 1) downto 0);
  signal op_mem_48_20: array_type_op_mem_48_20 := (
    0 => "00000000000000000000000000000000");
  signal op_mem_48_20_front_din: signed((32 - 1) downto 0);
  signal op_mem_48_20_back: signed((32 - 1) downto 0);
  signal op_mem_48_20_push_front_pop_back_en: std_logic;
  signal cast_35_24: signed((32 - 1) downto 0);
  signal internal_ip_35_9_neg: signed((32 - 1) downto 0);
  signal internal_ip_join_30_1: signed((32 - 1) downto 0);
begin
  ip_18_25 <= std_logic_vector_to_signed(ip);
  op_mem_48_20_back <= op_mem_48_20(0);
  proc_op_mem_48_20: process (clk)
  is
    variable i: integer;
  begin
    if (clk\'event and (clk = \'1\')) then
      if ((ce = \'1\') and (op_mem_48_20_push_front_pop_back_en = \'1\')) then
        op_mem_48_20(0) <= op_mem_48_20_front_din;
      end if;
    end if;
  end process proc_op_mem_48_20;
  cast_35_24 <= s2s_cast(ip_18_25, 0, 32, 0);
  internal_ip_35_9_neg <=  -cast_35_24;
  proc_if_30_1: process (internal_ip_35_9_neg)
  is
  begin
    if false then
      internal_ip_join_30_1 <= std_logic_vector_to_signed("00000000000000000000000000000000");
    else 
      internal_ip_join_30_1 <= internal_ip_35_9_neg;
    end if;
  end process proc_if_30_1;
  op_mem_48_20_push_front_pop_back_en <= \'0\';
  op <= signed_to_std_logic_vector(internal_ip_join_30_1);
end',
      'crippled_entity' => 'is
  port (
    ip : in std_logic_vector((31 - 1) downto 0);
    op : out std_logic_vector((32 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'negate_9ede1a16c5',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '668d4767dd9fabf0888d3b81a82e9bcb',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((32 - 1) downto 0);
  signal b_1_34: unsigned((32 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((32 - 1) downto 0);
    b : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_3ffd1d0a40',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '7b127f0a26c67c6c852f4f15baea8508',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: signed((32 - 1) downto 0);
  signal b_1_34: signed((32 - 1) downto 0);
  signal result_16_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_signed(a);
  b_1_34 <= std_logic_vector_to_signed(b);
  result_16_3_rel <= a_1_31 < b_1_34;
  op <= boolean_to_vector(result_16_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((32 - 1) downto 0);
    b : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_3ff7ebf1f0',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '816b5d61e8f7bfeca466199f7675b15a',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: unsigned((32 - 1) downto 0);
  signal b_1_34: unsigned((32 - 1) downto 0);
  signal result_16_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_unsigned(a);
  b_1_34 <= std_logic_vector_to_unsigned(b);
  result_16_3_rel <= a_1_31 < b_1_34;
  op <= boolean_to_vector(result_16_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((32 - 1) downto 0);
    b : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_59ca12fcca',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => 'e6e28dea125302432c542d43166b83e5',
    'sourceFile' => 'hdl/xlmcode.vhd',
    'templateKeyValues' => {
      'crippled_architecture' => 'is
  signal a_1_31: signed((32 - 1) downto 0);
  signal b_1_34: signed((32 - 1) downto 0);
  signal result_12_3_rel: boolean;
begin
  a_1_31 <= std_logic_vector_to_signed(a);
  b_1_34 <= std_logic_vector_to_signed(b);
  result_12_3_rel <= a_1_31 = b_1_34;
  op <= boolean_to_vector(result_12_3_rel);
end',
      'crippled_entity' => 'is
  port (
    a : in std_logic_vector((32 - 1) downto 0);
    b : in std_logic_vector((32 - 1) downto 0);
    op : out std_logic_vector((1 - 1) downto 0);
    clk : in std_logic;
    ce : in std_logic;
    clr : in std_logic);
end',
      'entity_name' => 'relational_73637bf7b8',
    },
  };
  push(@$results, &SgDeliverFile::deliverFile($instrs));
  $instrs = {
    'entity_declaration_hash' => '0a22601cc3873c2ce2bcb15dd24da471',
    'sourceFile' => 'C:/Xilinx/14.3/ISE_DS/ISE/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => '92b899423dd950a535441069ad1845e4',
    'sourceFile' => 'C:/Xilinx/14.3/ISE_DS/ISE/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  $instrs = {
    'entity_declaration_hash' => 'fba76939822114f8fcb2dcdaf70fcf34',
    'sourceFile' => 'C:/Xilinx/14.3/ISE_DS/ISE/sysgen/hdl/xlslice.vhd',
  };
  push(@$results, &SgDeliverFile::saveCollaborationInfo($instrs));
  local *wrapup = $Sg::{'wrapup'};
  push(@$results, &Sg::wrapup())   if (defined(&wrapup));
  local *wrapup = $SgDeliverFile::{'wrapup'};
  push(@$results, &SgDeliverFile::wrapup())   if (defined(&wrapup));
  local *wrapup = $SgGenerateCores::{'wrapup'};
  push(@$results, &SgGenerateCores::wrapup())   if (defined(&wrapup));
  use Carp qw(croak);
  $ENV{'SYSGEN'} = 'C:/Xilinx/14.3/ISE_DS/ISE/sysgen';
  open(RESULTS, '> C:/Users/andryc/Dropbox/GPGPU/gpgpu-1.0.1/matlab/integer_compute_set_pred/ngc_netlist/sysgen/script_results3758053006644828118') || 
    croak 'couldn\'t open C:/Users/andryc/Dropbox/GPGPU/gpgpu-1.0.1/matlab/integer_compute_set_pred/ngc_netlist/sysgen/script_results3758053006644828118';
  binmode(RESULTS);
  print RESULTS &Sg::toString($results) . "\n";
  close(RESULTS) || 
    croak 'trouble writing C:/Users/andryc/Dropbox/GPGPU/gpgpu-1.0.1/matlab/integer_compute_set_pred/ngc_netlist/sysgen/script_results3758053006644828118';
};

if ($@) {
  open(RESULTS, '> C:/Users/andryc/Dropbox/GPGPU/gpgpu-1.0.1/matlab/integer_compute_set_pred/ngc_netlist/sysgen/script_results3758053006644828118') || 
    croak 'couldn\'t open C:/Users/andryc/Dropbox/GPGPU/gpgpu-1.0.1/matlab/integer_compute_set_pred/ngc_netlist/sysgen/script_results3758053006644828118';
  binmode(RESULTS);
  print RESULTS $@ . "\n";
  close(RESULTS) || 
    croak 'trouble writing C:/Users/andryc/Dropbox/GPGPU/gpgpu-1.0.1/matlab/integer_compute_set_pred/ngc_netlist/sysgen/script_results3758053006644828118';
  exit(1);
}

exit(0);
