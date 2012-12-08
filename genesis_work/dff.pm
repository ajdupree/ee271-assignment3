package dff;
use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

use Exporter;
use FileHandle;
use Env; # Make environment variables available


use Genesis2::Manager 1.00;
use Genesis2::UniqueModule 1.00;

@ISA = qw(Exporter Genesis2::UniqueModule);
@EXPORT = qw();
@EXPORT_OK = qw();
$VERSION = '1.0';
sub get_SrcSuffix {Genesis2::UniqueModule::private_to_me(); return ".vp";};
sub get_OutfileSuffix {Genesis2::UniqueModule::private_to_me(); return ".v"};
############################### Module Starts Here ###########################


  sub to_verilog{ 
      # START PRE-GENERATED TO_VERILOG PREFIX CODE >>>
      my $self = shift;
      
      print STDERR "$self->{BaseModuleName}->to_verilog: Start user code\n" 
	  if $self->{Debug} & 8;
      # <<< END PRE-GENERATED TO_VERILOG PREFIX CODE
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/rtl/dff.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/rtl/dff.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/rtl/dff.vp"
print { $self->{OutfileHandle} } '/*';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' This is a Genesis wrapper of DW pipeline regs with en singal';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '/* ***************************************************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Change bar:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * -----------';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Date           Author    Description';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Sep 20, 2012   jingpu    init version';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *                          ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ***************************************************************************/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '/*******************************************************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * PARAMETERIZATION';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ****************************************************************************/';print { $self->{OutfileHandle} } "\n"; 
 # module parameters
 my $width           = parameter(Name=>'BitWidth', 
                                 Val=>64, Min=>1, Step=>1, 
                                 Doc=>"Signal bit widths");
 my $pipe_depth      = parameter(Name=>'PipelineDepth', 
                                 Val=>1, Min=>0, Step=>1, 
                                 Doc=>"Pipeline depth");
 my $retime_Status   = parameter(Name=>'Retime' ,
                                 Val=>'NO' , List=>[ 'YES' , 'NO' ] , 
                                 Doc=>"Pipeline Is Retimeable" ) ;
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'module '; print { $self->{OutfileHandle} } mname; print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		input logic ['; print { $self->{OutfileHandle} } $width-1; print { $self->{OutfileHandle} } ':0]  in, ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		input logic 		    clk, reset, en, ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		output logic ['; print { $self->{OutfileHandle} } $width-1; print { $self->{OutfileHandle} } ':0] out';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   /* synopsys dc_tcl_script_begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    set_ungroup [current_design] true';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    set_flatten true -effort high -phase true -design [current_design]';print { $self->{OutfileHandle} } "\n"; 
     #   https://solvnet.synopsys.com/dow_retrieve/G-2012.03/manpages/syn2/set_dont_retime.html
     if( $retime_Status eq 'YES' ){
print { $self->{OutfileHandle} } '    set_dont_retime [current_design] false ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    set_optimize_registers true -design [current_design]';print { $self->{OutfileHandle} } "\n"; 
     } elsif (  $retime_Status eq 'NO' ){
print { $self->{OutfileHandle} } '    set_dont_retime [current_design] true';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    set_optimize_registers false -design [current_design]';print { $self->{OutfileHandle} } "\n"; 
     } else {
        self->error( "Unexpected branch condition in retiming elaboration...\n" ) ;   
    }
print { $self->{OutfileHandle} } '    */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    if ($pipe_depth>0) {
print { $self->{OutfileHandle} } '   //   DW03_pipe_reg #('; print { $self->{OutfileHandle} } $pipe_depth; print { $self->{OutfileHandle} } ','; print { $self->{OutfileHandle} } $width; print { $self->{OutfileHandle} } ') dff ( .A(in) , .clk(clk) , .B(out) ) ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   DW_pl_reg #(.stages('; print { $self->{OutfileHandle} } $pipe_depth+1; print { $self->{OutfileHandle} } '),.in_reg(0),.out_reg(0),.width('; print { $self->{OutfileHandle} } $width; print { $self->{OutfileHandle} } '),.rst_mode(0)) dff ( .data_in(in) , .clk(clk) , .data_out(out), .rst_n(!reset), .enable({'; print { $self->{OutfileHandle} } $pipe_depth; print { $self->{OutfileHandle} } '{en}}) );';print { $self->{OutfileHandle} } "\n"; 
    } else {
print { $self->{OutfileHandle} } '   //    assign out = in;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign out = in & (~{'; print { $self->{OutfileHandle} } $width; print { $self->{OutfileHandle} } '{reset}});';print { $self->{OutfileHandle} } "\n"; 
    }
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/rtl/dff.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
