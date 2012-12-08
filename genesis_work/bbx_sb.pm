package bbx_sb;
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
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/bbx_sb.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/bbx_sb.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/bbx_sb.vp"
print { $self->{OutfileHandle} } '/*';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * bbx_sb';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * The bounding box score board: ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   This scoreboard checks that the output ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   of the bounding box moudle is correct.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   It does this by checking the function against';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   the golden model, which is imported using DPI.';print { $self->{OutfileHandle} } "\n"; 
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
 my $pipe_depth = parameter(Name=>'PipelineDepth',
                            Val=>3, Min=>1, Step=>1, 
                            Doc=>"Number of Pipe Stages in bbox module");
 my $filename   = parameter(Name=>'Filename',
                            Val=>"sb_log/bbx_sb.log", 
                            Doc=>"Log file name");

 # some handful subroutines

 # Convert a Fixed Point Number to a Floating
 sub unFix {
   my $signal_name = shift @_;
   my $radix = shift @_;
   return " 1.0 * $signal_name / ( 128\'d1 << $radix ) ";
 }
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'import "DPI" pure function int rastBBox_bbox_check( ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int v0_x, //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			    			    int v0_y, //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int v1_x, //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int v1_y, //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int v2_x, //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int v2_y, //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int v3_x, //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int v3_y, //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int q, //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int valid_Poly,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int ll_x, //BBOX';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int ll_y, //BBOX';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int ur_x, //BBOX';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int ur_y, //BBOX';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int ss_w_lg2, //Subsample';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int screen_w, //Screen';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int screen_h, //Screen';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int valid , //BBoX';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int r_shift, //Config';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    int r_val     //Congig ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						    );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'module '; print { $self->{OutfileHandle} } mname(); print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '(';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] poly_R10S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0],';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic 			      validPoly_R10H , // Valid Data for Operation   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic 			      isQuad_R10H , // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] box_R13S[1:0][1:0] , // 2 Sets X,Y Fixed Point Values   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] poly_R13S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0] , // 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic 			      validPoly_R13H , // Valid Data for Operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic 			      isQuad_R13H , // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic [1:0][1:0] 	      invalidate_R10H,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic 			      clk , // Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic 			      rst , // Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic 			      halt_RnnnnL , // Halt Signal   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] screen_RnnnnS[1:0] , // Screen Dimensions';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic [3:0] 		      subSample_RnnnnU                  // SubSample_Interval';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ');';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]   poly_RnnS['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic                       validPoly_RnnH ;                  // Valid Data for Operation   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic                       isQuad_RnnH ;                     // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic [1:0][1:0] 	       invalidate_RnnH;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int 		       ss_w_lg2;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int 		       one;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int 		       file;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign one = 1 ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   initial begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      file = $fopen("'; print { $self->{OutfileHandle} } $filename; print { $self->{OutfileHandle} } '","w");';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   always_comb begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      unique case( 1\'b1 )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( subSample_RnnnnU[0] ): ss_w_lg2 = 3;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( subSample_RnnnnU[1] ): ss_w_lg2 = 2;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( subSample_RnnnnU[2] ): ss_w_lg2 = 1;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( subSample_RnnnnU[3] ): ss_w_lg2 = 0;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      endcase';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Check that Bounding Box is Correct';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   always @(posedge clk) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      if( validPoly_RnnH ) begin //check only when the polygon is valid';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 if(one != rastBBox_bbox_check( ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(poly_RnnS[0][0]), //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(poly_RnnS[0][1]), //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(poly_RnnS[1][0]), //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(poly_RnnS[1][1]), //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(poly_RnnS[2][0]), //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(poly_RnnS[2][1]), //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(poly_RnnS['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1][0]), //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(poly_RnnS['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1][1]), //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(isQuad_RnnH)    , //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(validPoly_RnnH)    , //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(box_R13S[0][0] ), //BBOX';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(box_R13S[0][1] ), //BBOX';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(box_R13S[1][0] ), //BBOX';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(box_R13S[1][1] ), //BBOX';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     ss_w_lg2,                //Subsample';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(screen_RnnnnS[0] ), //Screen';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(screen_RnnnnS[1] ), //Screen';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'(validPoly_R13H),  //Polygon Valid';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     '; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } ',                   //Config';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     int\'( 128\'d1 << '; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } ' )  //Congig ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     )) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "@%0t: Bounding BOX ERROR!!\\n" , $time );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	         $fwrite( file , "validPoly_RnnH=%b validPoly_R13H=%b", validPoly_RnnH, validPoly_R13H );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "\\n\\t\\t" );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "uP.v_0.x: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_RnnS[0][0]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "uP.v_0.y: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_RnnS[0][1]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "uP.v_1.x: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_RnnS[1][0]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "uP.v_1.y: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_RnnS[1][1]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "\\n\\t\\t" );		 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "uP.v_2.x: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_RnnS[2][0]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "uP.v_2.y: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_RnnS[2][1]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 if( isQuad_R13H ) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		    $fwrite( file , "uP.v_3.x: %f\\t" , '; print { $self->{OutfileHandle} } unFix("poly_RnnS[$verts-1][0]", $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		    $fwrite( file , "uP.v_3.y: %f\\t" , '; print { $self->{OutfileHandle} } unFix("poly_RnnS[$verts-1][1]", $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "\\n\\t\\t" );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file, "box.ll.x:%f\\t",  '; print { $self->{OutfileHandle} } unFix('box_R13S[0][0]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file, "box.ll.y:%f\\t",  '; print { $self->{OutfileHandle} } unFix('box_R13S[0][1]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file, "box.ur.x:%f\\t",  '; print { $self->{OutfileHandle} } unFix('box_R13S[1][0]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file, "box.ur.y:%f\\t",  '; print { $self->{OutfileHandle} } unFix('box_R13S[1][1]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	         $fwrite( file , "\\n" );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    if (~validPoly_R13H) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       $fwrite( file , "\\n\\t\\t" );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       $fwrite( file, "box_R12S[0][0] > screen_RnnnnS[0]:%b\\n",  invalidate_RnnH[0][0] );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       $fwrite( file, "box_R12S[0][1] > screen_RnnnnS[1]:%b\\n",  invalidate_RnnH[0][1] );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       $fwrite( file, "box_R12S[1][0] < 0:%b\\n",  invalidate_RnnH[1][0] );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       $fwrite( file, "box_R12S[1][1] < 0:%b\\n",  invalidate_RnnH[1][1] );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       $fwrite( file , "\\n" );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   assert(0) else $error("@%0t: ERROR: Bounding Box Check Failed", $time);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	end // if (one != rastBBox_bbox_check(...';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      end // if ( validPoly_R13H )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end // always @ (posedge clk)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
   	 my $d_01 = generate( 'dff3', "d_01", 
	                        BitWidth=>$sig_fig,
	                        ArraySize1=>$verts,
	                        ArraySize2=>$axis,
	                        PipelineDepth=>$pipe_depth,
	                        Retime=>'NO' );
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_01->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 .in(poly_R10S) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(halt_RnnnnL | ~validPoly_R13H),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out(poly_RnnS));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 ';print { $self->{OutfileHandle} } "\n"; 
	 my $d_02 = generate( 'dff', "d_02", 
	                        BitWidth=>2,
	                        PipelineDepth=>$pipe_depth,
	                        Retime=>'NO' );
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_02->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 .in({validPoly_R10H, isQuad_R10H}) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(halt_RnnnnL | ~validPoly_R13H),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out({validPoly_RnnH, isQuad_RnnH}));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
      	 my $d_03 = generate( 'dff', "d_03", 
	                        BitWidth=>4,
	                        PipelineDepth=>$pipe_depth,
	                        Retime=>'NO' );
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_03->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 .in(invalidate_R10H) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(halt_RnnnnL | ~validPoly_R13H),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out(invalidate_RnnH));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   always @(posedge clk) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      assert( rst | ( '; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '==3 && !isQuad_RnnH ) || '; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '==4 )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	else $error( "time=%10t ERROR: Saw a quad in a non-quad system", $time );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   property sig_eq_con( rst, a , b , c );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      @(posedge clk) rst | ((a==b) | !c);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   endproperty';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Check that signals should match';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assert property( sig_eq_con( rst, poly_RnnS[0][0] , poly_R13S[0][0]  , validPoly_RnnH )); ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assert property( sig_eq_con( rst, poly_RnnS[0][1] , poly_R13S[0][1]  , validPoly_RnnH )); ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assert property( sig_eq_con( rst, poly_RnnS[1][0] , poly_R13S[1][0]  , validPoly_RnnH )); ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assert property( sig_eq_con( rst, poly_RnnS[1][1] , poly_R13S[1][1]  , validPoly_RnnH )); ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assert property( sig_eq_con( rst, poly_RnnS[2][0] , poly_R13S[2][0]  , validPoly_RnnH )); ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assert property( sig_eq_con( rst, poly_RnnS[2][1] , poly_R13S[2][1]  , validPoly_RnnH )); ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assert property( sig_eq_con( rst, isQuad_RnnH     , isQuad_R13H      , validPoly_RnnH )); ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule ';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/bbx_sb.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
