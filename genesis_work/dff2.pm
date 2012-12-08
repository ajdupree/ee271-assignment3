package dff2;
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
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/rtl/dff2.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/rtl/dff2.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/rtl/dff2.vp"
print { $self->{OutfileHandle} } '/*';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' This is a two dimentional array of DFFs';print { $self->{OutfileHandle} } "\n"; 
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
print { $self->{OutfileHandle} } '/******************************************************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * PARAMETERIZATION';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ***************************************************************************/';print { $self->{OutfileHandle} } "\n"; 
 # module parameters
 my $bitwidth        = parameter(Name=>'BitWidth', 
                                 Val=>64, Min=>1, Step=>1, 
                                 Doc=>"Signal bit widths");
 my $array_size      = parameter(Name=>'ArraySize1', 
                                 Val=>64, Min=>1, Step=>1, 
                                 Doc=>"The size of array's first dimention");
 my $pipe_depth      = parameter(Name=>'PipelineDepth', 
                                 Val=>1, Min=>0, Step=>1, 
                                 Doc=>"Pipeline depth");
 my $retime_Status   = parameter(Name=>'Retime' ,
                                 Val=>'NO' , List=>[ 'YES' , 'NO' ] , 
                                 Doc=>"Pipeline Is Retimeable" ) ;
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'module '; print { $self->{OutfileHandle} } mname; print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		input logic ['; print { $self->{OutfileHandle} } $bitwidth-1; print { $self->{OutfileHandle} } ':0]  in['; print { $self->{OutfileHandle} } $array_size-1; print { $self->{OutfileHandle} } ':0], ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		input logic 		       clk, reset, en, ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		output logic ['; print { $self->{OutfileHandle} } $bitwidth-1; print { $self->{OutfileHandle} } ':0] out['; print { $self->{OutfileHandle} } $array_size-1; print { $self->{OutfileHandle} } ':0]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		);	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my @dffs = ();
    for( my $i = 0; $i < $array_size; $i++) {
    	$dffs[$i] = generate( 'dff', "dff_$i", 
                                BitWidth=>$bitwidth,
                                PipelineDepth=>$pipe_depth,
                                Retime=>$retime_Status );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $dffs[$i]->instantiate(); print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     (.in(in['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } ']) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .clk(clk) , .reset(reset), .en(en),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .out(out['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } ']));';print { $self->{OutfileHandle} } "\n"; 
    }
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule ';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/rtl/dff2.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
