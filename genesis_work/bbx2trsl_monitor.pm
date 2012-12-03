package bbx2trsl_monitor;
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
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/bbx2trsl_monitor.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/bbx2trsl_monitor.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/bbx2trsl_monitor.vp"
print { $self->{OutfileHandle} } '/*';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * bbx2trsl_monitor';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   This module monitors the interface between the ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   bounding box module and the sample traversal state';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   machine module.  It prints those outputs to a ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   human readable file';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  /****************************************************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Change bar:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * -----------';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Date           Author    Description';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Sep 22, 2012   jingpu    ported from John\'s original code to Genesis';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *                          ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ***************************************************************************/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '/******************************************************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * PARAMETERIZATION';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ***************************************************************************/';print { $self->{OutfileHandle} } "\n"; 
 # module parameters
 my $sig_fig    = parameter(Name=>'SigFig',
                            Val=>24, Min=>1, Step=>1, 
                            Doc=>"Bits in color and position.");
 my $radix      = parameter(Name=>'Radix',
                            Val=>10, Min=>1, Step=>1, 
                            Doc=>"Fraction bits in color and position");
 my $verts      = parameter(Name=>'Vertices',
                            Val=>3, Min=>3, Step=>1, 
                            Doc=>"Maximum Vertices in micropolygon");
 my $axis       = parameter(Name=>'Axis',
                            Val=>3, Min=>1, Step=>1, 
                            Doc=>"Number of axis foreach vertex 3 is (x,y,z).");
 my $colors     = parameter(Name=>'Colors',
                            Val=>3, Min=>1, Step=>1, 
                            Doc=>"Number of color channels");
 my $filename   = parameter(Name=>'Filename',
                            Val=>"mon_log/bbx2trsl.log", 
                            Doc=>"Log file name");

 # some handful subroutines

 # Convert a Fixed Point Number to a Floating
 sub unFix {
   my $signal_name = shift @_;
   my $radix = shift @_;
   return " 1.0 * $signal_name / ( 128\'d1 << $radix ) ";
 }
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'module '; print { $self->{OutfileHandle} } mname(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]   box_R13S[1:0][1:0],      // 2 Sets X,Y Fixed Point Values   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]   poly_R13S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0],     // 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input                       validPoly_R13H,          // Valid Data for Operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input 		       isQuad_R13H,             // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input 		       clk ,                     // Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input 		       rst ,                     // Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input 		       halt_RnnnnL              //Halt Signal  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		      );	      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '/* In general only interesting things happen here when';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   not halted, otherwise we can just print halted */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '/* Setup Phase */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   initial begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      integer file;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      file = $fopen("'; print { $self->{OutfileHandle} } $filename; print { $self->{OutfileHandle} } '","w");';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $fwrite( file , " ++++++++++++++++++++++++++++++++++++++++ \\n" );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $fwrite( file , " Simulation Start \\n" );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $fwrite( file , " ++++++++++++++++++++++++++++++++++++++++ \\n" );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $fwrite( file , "\\n" );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      @(negedge rst) ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      while(1) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 if( halt_RnnnnL ) ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      if( validPoly_R13H ) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "@%0t: " , $time );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "\\n\\t\\t" );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "uP.v_0.x: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_R13S[0][0]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "uP.v_0.y: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_R13S[0][1]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "uP.v_1.x: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_R13S[1][0]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "uP.v_1.y: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_R13S[1][1]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "\\n\\t\\t" );		 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "uP.v_2.x: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_R13S[2][0]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "uP.v_2.y: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_R13S[2][1]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 ';print { $self->{OutfileHandle} } "\n"; 
	 if(	 $verts >= 4 ) {
print { $self->{OutfileHandle} } '		 if( isQuad_R13H ) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		    $fwrite( file , "uP.v_3.x: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_R13S[3][0]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		    $fwrite( file , "uP.v_3.y: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_R13S[3][1]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 end';print { $self->{OutfileHandle} } "\n"; 
	 }
print { $self->{OutfileHandle} } '	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "\\n\\t\\t" );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file, "box.ll.x:%f\\t",  '; print { $self->{OutfileHandle} } unFix('box_R13S[0][0]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file, "box.ll.y:%f\\t",  '; print { $self->{OutfileHandle} } unFix('box_R13S[0][1]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file, "box.ur.x:%f\\t",  '; print { $self->{OutfileHandle} } unFix('box_R13S[1][0]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file, "box.ur.y:%f\\t",  '; print { $self->{OutfileHandle} } unFix('box_R13S[1][1]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "\\n");';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      end else begin // if ( validPoly_R10H )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "@%0t: Invalid Data \\n" , $time );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      end    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   end else begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      $fwrite( file , "@%0t: Halted \\n" , $time );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      end // while (1)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule ';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/bbx2trsl_monitor.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
