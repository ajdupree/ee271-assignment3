package smpl_sb;
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
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/smpl_sb.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/smpl_sb.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/smpl_sb.vp"
print { $self->{OutfileHandle} } '/*';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * sampl_sb monitor';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Sample Test Function Score Board';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   This module calls a DPI function ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   to see if the sample test is correct.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Output error to file and stdout';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Author: John Brunhaver, Ofer Shacham';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Created:          09/21/09';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Last Updated:     10/06/10';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Copyright 2009 <jbrunhaver@gmail.com>  <shacham@stanford.edu> ';print { $self->{OutfileHandle} } "\n"; 
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
                            Val=>"sb_log/smpl_sb.log", 
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
print { $self->{OutfileHandle} } 'import "DPI" pure function int rastBBox_stest_check( int   v0_x, //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						int   v0_y,      //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						int   v1_x,      //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						int   v1_y,      //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						int   v2_x,      //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						int   v2_y,      //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						int   v3_x,      //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						int   v3_y,      //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						int   q,         //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						int   s_x,       //SAMPLE ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						int   s_y,       //SAMPLE';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						int   hit        //HIT';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						);   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'module '; print { $self->{OutfileHandle} } mname(); print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '(';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic signed   ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]  poly_R16S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0],  // 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]  color_R16U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0],          // 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic                        isQuad_R16H,                     // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic                        validSamp_R16H,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic signed   ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]  sample_R16S[1:0],';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic                        clk,                // Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic                        rst,                // Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]   hit_R18S['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0],';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]   color_R18U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0],';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input                             hit_valid_R18H ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ');';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Pipe Signals for Later Evaluation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed   ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]  poly_RnnS['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0];    // 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]  color_RnnU['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 		        isQuad_RnnH;                       // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 		        validSamp_RnnH;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed   ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]  sample_RnnS[1:0];             //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Pipe Signals for Later Evaluation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Helper Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int 		       one;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int 		       file;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign one = 1 ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Helper Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   initial begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      file = $fopen("'; print { $self->{OutfileHandle} } $filename; print { $self->{OutfileHandle} } '","w");';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   always @(posedge clk) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      assert( rst | ( '; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '==3 && !isQuad_RnnH ) || '; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '==4 )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	else $error( "time=%10t ERROR: Saw a quad in a non-quad system", $time );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Check if Sample in uPoly test is correct';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   always @(posedge clk) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      #100;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '       if(validSamp_RnnH ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   &&';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   one !=  rastBBox_stest_check( int\'(poly_RnnS[0][0]), //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				         int\'(poly_RnnS[0][1]), //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 int\'(poly_RnnS[1][0]), //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 int\'(poly_RnnS[1][1]), //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 int\'(poly_RnnS[2][0]), //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 int\'(poly_RnnS[2][1]), //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 int\'(poly_RnnS['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1][0]), //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 int\'(poly_RnnS['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1][1]), //uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 int\'(isQuad_RnnH)    , //uPoly	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 int\'(sample_RnnS[0]) , //SAMPLE ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 int\'(sample_RnnS[1]) , //SAMPLE';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 int\'(hit_valid_R18H)   //IS HIT';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      )) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $fwrite( file , "@%0t: Sample Test ERROR!!!!\\n\\t\\t" , $time );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $fwrite( file , "uP.v_0.x: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_RnnS[0][0]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $fwrite( file , "uP.v_0.y: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_RnnS[0][1]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $fwrite( file , "uP.v_1.x: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_RnnS[1][0]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $fwrite( file , "uP.v_1.y: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_RnnS[1][1]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 $fwrite( file , "\\n\\t\\t" );		 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $fwrite( file , "uP.v_2.x: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_RnnS[2][0]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $fwrite( file , "uP.v_2.y: %f\\t" , '; print { $self->{OutfileHandle} } unFix('poly_RnnS[2][1]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    if( isQuad_RnnH ) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       $fwrite( file , "uP.v_3.x: %f\\t" , '; print { $self->{OutfileHandle} } unFix("poly_RnnS[$verts-1][0]", $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       $fwrite( file , "uP.v_3.y: %f\\t" , '; print { $self->{OutfileHandle} } unFix("poly_RnnS[$verts-1][1]", $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $fwrite( file , "\\n\\t\\t" );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $fwrite( file , "sample.x:%f\\t",  '; print { $self->{OutfileHandle} } unFix('sample_RnnS[0]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $fwrite( file , "sample.y:%f\\t",  '; print { $self->{OutfileHandle} } unFix('sample_RnnS[1]', $radix); print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $fwrite( file , "hit:%b\\n" , hit_valid_R18H );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	  assert( 0 ) else $error( "time=%10t ERROR: Sample Test Check Failed", $time );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '       end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '/* Pipe Required Signals */';print { $self->{OutfileHandle} } "\n"; 
	 my $d_01 = generate( 'dff3', "d_01", 
	                        BitWidth=>$sig_fig,
	                        ArraySize1=>$verts,
	                        ArraySize2=>$axis,
	                        PipelineDepth=>$pipe_depth,
	                        Retime=>'NO' );
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_01->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 .in(poly_R16S) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out(poly_RnnS));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 ';print { $self->{OutfileHandle} } "\n"; 
	 my $d_02 = generate( 'dff2', "d_02", 
	                        BitWidth=>$sig_fig,
	                        ArraySize1=>$colors,
	                        PipelineDepth=>$pipe_depth,
	                        Retime=>'NO' );
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_02->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 .in(color_R16U) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out(color_RnnU));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	';print { $self->{OutfileHandle} } "\n"; 
	 my $d_03 = generate( 'dff2', "d_03", 
	                        BitWidth=>$sig_fig,
	                        ArraySize1=>2,
	                        PipelineDepth=>$pipe_depth,
	                        Retime=>'NO' );
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_03->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 .in(sample_R16S) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out(sample_RnnS));				 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 						';print { $self->{OutfileHandle} } "\n"; 
	 my $d_04 = generate( 'dff', "d_04", 
	                        BitWidth=>2,
	                        PipelineDepth=>$pipe_depth,
	                        Retime=>'NO' );
print { $self->{OutfileHandle} } '	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_04->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 .in({validSamp_R16H, isQuad_R16H}) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out({validSamp_RnnH, isQuad_RnnH}));	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '/* Pipe Required Signals */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule ';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/smpl_sb.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
