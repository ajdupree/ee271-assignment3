package hash_jtree;
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
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/rtl/hash_jtree.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/rtl/hash_jtree.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/rtl/hash_jtree.vp"
print { $self->{OutfileHandle} } '/*';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Hashing Function';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Inputs:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    MicroPolygon and Sample Information';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Outputs:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    Jittered Sample Position and Buffered Micropolygon';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Function:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    Calc on offset for the sample.  This is used for';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    stochastic sampling reasons.  Note that this is ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    a simplified hashing mechanism.  An in depth ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    discussion of stochastic sampling in rendering';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    can be found here:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    http://doi.acm.org/10.1145/7529.8927 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Long Description:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    The basic idea is to use a tree of xor';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    functions to generate a displacement ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    from the sample center.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Author: John Brunhaver';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Created:      Thu 10/01/10';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Last Updated: Tue 10/15/10';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Copyright 2009 <jbrunhaver@gmail.com>   ';print { $self->{OutfileHandle} } "\n"; 
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
                            Val=>3, Min=>0, Step=>1, 
                            Doc=>"How many pipe stages are in this block");
 
 # local variables
 my $hash_in_width = ($sig_fig-4)*2; 	# to catch that hash is brittle
 my $hash_out_width = $radix - 2;      	# to catch taht hash is brittle
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
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
print { $self->{OutfileHandle} } '(';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  //Input Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic signed    ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] poly_R14S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0],  //Micropolygon to Sample Test';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic unsigned  ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] color_R14U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0] ,         //Color of Poly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic signed    ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] sample_R14S[1:0],                //Sample Location to Be Tested';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic        	             validSamp_R14H,                  //Sample and Micropolygon are Valid';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic         		     isQuad_R14H,                     //Micropygon is quad';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  //Global Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input	logic	                     clk,                // Clock';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input logic	                     rst,                // Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  //Control Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  input  logic          [3:0]        subSample_RnnnnU ,   //Subsample width ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  //Outputs';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  output logic signed   ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] poly_R16S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0], // Micropolygon to Iterate Over';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  output logic unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] color_R16U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0] ,        // Color of Poly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  output logic signed   ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] sample_R16S[1:0],               // Sample Location    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  output logic                       validSamp_R16H,                 // A valid sample location';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  output logic                       isQuad_R16H                     //Micropolygon is quad';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // output for retiming registers';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]     poly_R16S_retime['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0]; // Micropolygon to Iterate Over';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 			     unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]   color_R16U_retime['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0];      // Color of Poly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]     sample_R16S_retime[1:0];   // Sample Location    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 			     validSamp_R16H_retime;                    // A valid sample location';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 			     isQuad_R16H_retime;   //Micropolygon is quad  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // output for retiming registers';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic ['; print { $self->{OutfileHandle} } $hash_out_width; print { $self->{OutfileHandle} } '-1:0] 	     hash_mask_R14H ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic ['; print { $self->{OutfileHandle} } $hash_out_width; print { $self->{OutfileHandle} } '-1:0] 	     jitt_val_R14H[1:0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 		     sample_jitted_R14S[1:0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   always_comb begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      assert( $onehot(subSample_RnnnnU) ) ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      unique case ( 1\'b1 )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(subSample_RnnnnU[3]): hash_mask_R14H = 8\'b11111111 ; //MSAA = 1';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(subSample_RnnnnU[2]): hash_mask_R14H = 8\'b01111111 ; //MSAA = 4';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(subSample_RnnnnU[1]): hash_mask_R14H = 8\'b00111111 ; //MSAA = 16';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(subSample_RnnnnU[0]): hash_mask_R14H = 8\'b00011111 ; //MSAA = 64';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      endcase // case ( 1\'b1 )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   /*always @( posedge clk ) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      #100;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     $display( "SV: %.10x %.10x \\n" , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		{ sample_R14S[1]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:4] , sample_R14S[0]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:4]} ,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		{ sample_R14S[0]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:4] , sample_R14S[1]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:4]} );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $display( "SV:  %.8b %.8b %.8b %.8b \\n" , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       xjit_hash.arr32_RnnH[31:24], xjit_hash.arr32_RnnH[23:16],';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       xjit_hash.arr32_RnnH[15:8], xjit_hash.arr32_RnnH[7:0]);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $display( "SV: %.8b %.8b \\n" , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		xjit_hash.arr16_RnnH[15:8], xjit_hash.arr16_RnnH[7:0]);  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $display( "SV: %.8b \\n" , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		xjit_hash.arr16_RnnH[15:8] ^ xjit_hash.arr16_RnnH[7:0] );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $display( "SV: %.8b \\n" , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 jitt_val_R14H[0]);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $display( "SV:  %.8b %.8b %.8b %.8b \\n" , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       yjit_hash.arr32_RnnH[31:24], yjit_hash.arr32_RnnH[23:16],';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       yjit_hash.arr32_RnnH[15:8], yjit_hash.arr32_RnnH[7:0]);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $display( "SV: %.8b %.8b  \\n" , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		yjit_hash.arr16_RnnH[15:8], yjit_hash.arr16_RnnH[7:0]);  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $display( "SV: %.8b \\n" , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		yjit_hash.arr16_RnnH[15:8] ^ yjit_hash.arr16_RnnH[7:0] );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $display( "SV: %.8b \\n" , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 jitt_val_R14H[1]);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end*/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $xjit_hash = generate ('tree_hash', ' xjit_hash',
                               InWidth=>$hash_in_width,
                               OutWidth=>$hash_out_width );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $xjit_hash -> instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      .in_RnnH( { sample_R14S[1]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:4] , sample_R14S[0]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:4]}   ),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      .mask_RnnH( hash_mask_R14H ),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      .out_RnnH( jitt_val_R14H[0] )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $yjit_hash = generate ('tree_hash', ' yjit_hash',
                               InWidth=>$hash_in_width,
                               OutWidth=>$hash_out_width );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $yjit_hash -> instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      .in_RnnH( { sample_R14S[0]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:4] , sample_R14S[1]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:4]} ),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      .mask_RnnH( hash_mask_R14H ),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      .out_RnnH( jitt_val_R14H[1] )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Jitter the sample coordinates';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign sample_jitted_R14S[0] =  { sample_R14S[0]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] }       ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '                                 | { '; print { $self->{OutfileHandle} } $sig_fig - $radix; print { $self->{OutfileHandle} } '\'b0,                 //23:10 = 14 bits';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     jitt_val_R14H[0]['; print { $self->{OutfileHandle} } $hash_out_width; print { $self->{OutfileHandle} } '-1:0], //7:0 = 8 bits';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '                                     '; print { $self->{OutfileHandle} } $radix - $hash_out_width; print { $self->{OutfileHandle} } '\'b0 };     //1:0 = 2 bits  ==> 24 bits total  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Jitter the sample coordinates';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign sample_jitted_R14S[1] =  { sample_R14S[1]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] }       ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '                                 | { '; print { $self->{OutfileHandle} } $sig_fig - $radix; print { $self->{OutfileHandle} } '\'b0,                 //23:10 = 14 bits';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     jitt_val_R14H[1]['; print { $self->{OutfileHandle} } $hash_out_width; print { $self->{OutfileHandle} } '-1:0], //7:0 = 8 bits';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '                                     '; print { $self->{OutfileHandle} } $radix - $hash_out_width; print { $self->{OutfileHandle} } '\'b0 };     //1:0 = 2 bits  ==> 24 bits total  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Flop R14 to R16_retime with retiming registers	';print { $self->{OutfileHandle} } "\n"; 
	 my $d_hash_r1 = generate( 'dff3', "d_hash_r1", 
	                        BitWidth=>$sig_fig,
	                        ArraySize1=>$verts,
	                        ArraySize2=>$axis,
	                        PipelineDepth=>$pipe_depth-1,
	                        Retime=>'YES' );
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_hash_r1->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 .in(poly_R14S) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out(poly_R16S_retime));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 ';print { $self->{OutfileHandle} } "\n"; 
	 my $d_hash_r2 = generate( 'dff2', "d_hash_r2", 
	                        BitWidth=>$sig_fig,
	                        ArraySize1=>$colors,
	                        PipelineDepth=>$pipe_depth-1,
	                        Retime=>'YES' );
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_hash_r2->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 .in(color_R14U) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out(color_R16U_retime));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 ';print { $self->{OutfileHandle} } "\n"; 
	 my $d_hash_r3 = generate( 'dff2', "d_hash_r3", 
	                        BitWidth=>$sig_fig,
	                        ArraySize1=>2,
	                        PipelineDepth=>$pipe_depth-1,
	                        Retime=>'YES' );
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_hash_r3->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 .in(sample_jitted_R14S) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out(sample_R16S_retime));	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 ';print { $self->{OutfileHandle} } "\n"; 
	 my $d_hash_r4 = generate( 'dff', "d_hash_r4", 
	                        BitWidth=>2,
	                        PipelineDepth=>$pipe_depth-1,
	                        Retime=>'YES' );
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_hash_r4->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .in({validSamp_R14H, isQuad_R14H}) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out({validSamp_R16H_retime, isQuad_R16H_retime}));		';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Flop R14 to R16_retime with retiming registers			';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	//Flop R16_retime to R16 with fixed registers';print { $self->{OutfileHandle} } "\n"; 
	 my $d_hash_f1 = generate( 'dff3', "d_hash_f1", 
	                        BitWidth=>$sig_fig,
	                        ArraySize1=>$verts,
	                        ArraySize2=>$axis,
	                        PipelineDepth=>1,
	                        Retime=>'NO' );
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_hash_f1->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 .in(poly_R16S_retime) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out(poly_R16S));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 ';print { $self->{OutfileHandle} } "\n"; 
	 my $d_hash_f2 = generate( 'dff2', "d_hash_f2", 
	                        BitWidth=>$sig_fig,
	                        ArraySize1=>$colors,
	                        PipelineDepth=>1,
	                        Retime=>'NO' );
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_hash_f2->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 .in(color_R16U_retime) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out(color_R16U));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 ';print { $self->{OutfileHandle} } "\n"; 
	 my $d_hash_f3 = generate( 'dff2', "d_hash_f3", 
	                        BitWidth=>$sig_fig,
	                        ArraySize1=>2,
	                        PipelineDepth=>1,
	                        Retime=>'NO' );
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_hash_f3->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 .in(sample_R16S_retime) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out(sample_R16S));	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 ';print { $self->{OutfileHandle} } "\n"; 
	 my $d_hash_f4 = generate( 'dff', "d_hash_f4", 
	                        BitWidth=>2,
	                        PipelineDepth=>1,
	                        Retime=>'NO' );
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_hash_f4->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .in({validSamp_R16H_retime, isQuad_R16H_retime}) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out({validSamp_R16H, isQuad_R16H}));	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	//Flop R16_retime to R16 with fixed registers				 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/rtl/hash_jtree.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
