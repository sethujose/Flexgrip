#
# Created by System Generator     Mon Dec 10 17:57:22 2012
#
# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator.
#

namespace eval ::xilinx::dsptool::iseproject::param {
    set SynthStrategyName {XST Defaults*}
    set ImplStrategyName {ISE Defaults*}
    set Compilation {NGC Netlist}
    set Project {compute_set_pred_i_cw}
    set DSPFamily {Virtex6}
    set DSPDevice {xc6vlx240t}
    set DSPPackage {ff1156}
    set DSPSpeed {-1}
    set HDLLanguage {vhdl}
    set SynthesisTool {XST}
    set Simulator {Modelsim-SE}
    set ReadCores {False}
    set MapEffortLevel {High}
    set ParEffortLevel {High}
    set Frequency {100}
    set CreateInterfaceDocument {off}
    set NewXSTParser {1}
	if { [ string equal $Compilation {IP Packager} ] == 1 } {
		set PostProjectCreationProc {dsp_package_for_vivado_ip_integrator}
		set IP_Library_Text {SysGen}
		set IP_Vendor_Text {Xilinx}
		set IP_Version_Text {1.0}
		set IP_Categories_Text {System Generator for DSP}
		set IP_Common_Repos {0}
		set IP_Dir {}
		set IP_LifeCycle_Menu {1}
		set IP_Description    {}
		
	}
    set ProjectFiles {
        {{compute_set_pred_i_cw.vhd} -view All}
        {{compute_set_pred_i.vhd} -view All}
        {{compute_set_pred_i_cw.ucf}}
        {{compute_set_pred_i_cw.xdc}}
        {{C:\Users\andryc\Dropbox\GPGPU\gpgpu-1.0.1\matlab\integer_compute_set_pred\compute_set_pred_i.mdl}}
    }
    set TopLevelModule {compute_set_pred_i_cw}
    set SynthesisConstraintsFile {compute_set_pred_i_cw.xcf}
    set ImplementationStopView {Structural}
    set ProjectGenerator {SysgenDSP}
}
    source SgIseProject.tcl
    ::xilinx::dsptool::iseproject::create
