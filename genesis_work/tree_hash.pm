package tree_hash;
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
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/tree_hash.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/tree_hash.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/tree_hash.vp"
print { $self->{OutfileHandle} } '/*';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Hashing Function';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Inputs:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    N-Wide Signal';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Outputs:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    M-Bit Hashed signal';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Function:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    Calc a simple hash value useing an xor tree';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Author: John Brunhaver';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Created:      Thu 10/01/10';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Last Updated: Tue 10/16/10';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Copyright 2010 <jbrunhaver@gmail.com>   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '/* ***************************************************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Change bar:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * -----------';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Date           Author    Description';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Sep 19, 2012   jingpu    ported from John\'s original code to Genesis';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *                          ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ***************************************************************************/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '/******************************************************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * PARAMETERIZATION';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ***************************************************************************/';print { $self->{OutfileHandle} } "\n"; 
 # module parameters
 my $in_width   = parameter(Name=>'InWidth',
                            Val=>40, Min=>40, Step=>1, Max=>40,
                            Doc=>"Width of Input");
 my $out_width  = parameter(Name=>'OutWidth',
                            Val=>8, Min=>8, Step=>1, Max=>8,
                            Doc=>"Width of output");
 # Note that these are not yet configurable
 # this module depends on these statements being 40,8
 # note that it is possible to build a recursive version
 # of this module which can generically build a hash tree
 # for arbitrary N and M.  
 # General strategy:
 #   *Reduce input to a width that (2^n) * Output Width
 #   *Swizel and reduce to 2^(n-1) and repeat 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '/* A Note on Signal Names:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Most signals have a suffix of the form _RxxN ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * where R indicates that it is a Raster Block signal';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * xx indicates the clock slice that it belongs to';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * and N indicates the type of signal that it is.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * H indicates logic high, L indicates logic low,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * U indicates unsigned fixed point, and S indicates';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * signed fixed point.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'module '; print { $self->{OutfileHandle} } mname(); print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Input Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 	unsigned ['; print { $self->{OutfileHandle} } $in_width; print { $self->{OutfileHandle} } '-1:0] in_RnnH, //Input signal to derive hash from';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 	unsigned ['; print { $self->{OutfileHandle} } $out_width; print { $self->{OutfileHandle} } '-1:0] mask_RnnH, //A mask to apply to the hashed output';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Output Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic unsigned ['; print { $self->{OutfileHandle} } $out_width; print { $self->{OutfileHandle} } '-1:0] out_RnnH   //Output signal that has been hashed and masked';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 	unsigned [31:0] 	arr32_RnnH ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 	unsigned [15:0] 	arr16_RnnH ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //'; print { $self->{OutfileHandle} } $in_width; print { $self->{OutfileHandle} } 'ot that this is brittle and will break for any config that isn\'t 40:8';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  arr32_RnnH[7:0]   = in_RnnH[7:0]   ^ in_RnnH[15:8]  ; // 0 = 0 ^ 1 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign   arr32_RnnH[15:8]  = in_RnnH[15:8]  ^ in_RnnH[23:16] ; // 1 = 1 ^ 2  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign   arr32_RnnH[23:16] = in_RnnH[23:16] ^ in_RnnH[31:24] ; // 2 = 2 ^ 3 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign   arr32_RnnH[31:24] = in_RnnH[31:24] ^ in_RnnH[39:32] ; // 3 = 3 ^ 4';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign   arr16_RnnH[7:0] = arr32_RnnH[7:0] ^ arr32_RnnH[23:16] ; // 0 = 0 ^ 2 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign   arr16_RnnH[15:8] = arr32_RnnH[15:8] ^ arr32_RnnH[31:24] ; // 1 ^ 3';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign   out_RnnH['; print { $self->{OutfileHandle} } $out_width; print { $self->{OutfileHandle} } '-1:0] = ( arr16_RnnH[7:0] ^ arr16_RnnH[15:8] ) & mask_RnnH[7:0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/tree_hash.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
