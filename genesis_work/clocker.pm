package clocker;
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
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/verif/clocker.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/verif/clocker.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/verif/clocker.vp"
print { $self->{OutfileHandle} } '// Simulation module for generating a clock';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '// by Ofer Shacham shacham@stanford.edu';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '/* ***************************************************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Change bar:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * -----------';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Date           Author    Description';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Sep 22, 2012   jingpu    ported from Ofer\'s original code to Genesis';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *                          ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ***************************************************************************/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '/******************************************************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * PARAMETERIZATION';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ***************************************************************************/';print { $self->{OutfileHandle} } "\n"; 
 # module parameters
 my $period    = parameter(Name=>'Period',
                            Val=>1000, Min=>1, Step=>1, 
                            Doc=>"Period of the generated clock signal");
 my $half_period1 = $period / 2;
 my $half_period2 = $period - $half_period1;
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'module '; print { $self->{OutfileHandle} } mname(); print { $self->{OutfileHandle} } '  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    output logic clk';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   initial begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      while(1) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 #'; print { $self->{OutfileHandle} } $half_period1; print { $self->{OutfileHandle} } ' clk = 1\'b0;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 #'; print { $self->{OutfileHandle} } $half_period2; print { $self->{OutfileHandle} } ' clk = 1\'b1;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule // clocker';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/verif/clocker.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
