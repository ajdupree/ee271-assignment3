package rast;
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
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/rast.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/rast.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/rast.vp"
print { $self->{OutfileHandle} } '/*';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Reyes Style Hider:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  This module accepts a stream of micropolygons';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  and produces a stream of fragments';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  This module contains three submodules:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    -bounding box module which generates the bounding box';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *     for a micropolygon';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    -test iterator module which iterates over the bounding ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    -sample test function which tests to see if the sample';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *     location from the bounding box lay inside the micropolygon';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Author: John Brunhaver';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Created:          09/21/09';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Last Updated: TUE 10/20/09';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Copyright 2009 <jbrunhaver@gmail.com>   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
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
 my $pipes_box  = parameter(Name=>'PipesBox',
                            Val=>5, Min=>1, Step=>1, 
                            Doc=>"Number of Pipe Stages in bbox module");
 my $pipes_iter = parameter(Name=>'PipesIter',
                            Val=>1, Min=>1, Step=>1, 
                            Doc=>"Number of Pipe Stages in iter module");
 my $pipes_hash = parameter(Name=>'PipesHash',
                            Val=>2, Min=>1, Step=>1, 
                            Doc=>"Number of pipe stages in hash module");
 my $pipes_samp = parameter(Name=>'PipesSamp',
                            Val=>4, Min=>1, Step=>1, 
                            Doc=>"Number of Pipe Stages in sample module");
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'module '; print { $self->{OutfileHandle} } mname(); print { $self->{OutfileHandle} } '  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Input Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	poly_R10S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0] , // Poly Position';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 				unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] color_R10U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0] , // Color of Poly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 				isQuad_R10H , // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 				validPoly_R10H , // Valid Data for Operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Input Control Signals ( ala CSR )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	screen_RnnnnS[1:0] , // Screen Dimensions';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic [3:0] 			subSample_RnnnnU , // SubSample_Interval';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Global Signals ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 				clk, // Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 				rst, // Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Output Control Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic 			halt_RnnnnL,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Output Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] hit_R18S['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0], // Hit Location';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic 			unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] color_R18U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0] , // Color of Poly ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic 			hit_valid_R18H            // Is this a hit?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Intermediate Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic  signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	box_R13S[1:0][1:0];             // 2 Sets X,Y Fixed Point Values   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic  signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	poly_R13S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0]; // 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]  color_R13U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0]  ;       // Color of Poly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				validPoly_R13H;                 // Valid Data for Operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				isQuad_R13H;                    // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	poly_R14S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0]; //Micropolygon to Sample Test';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]   color_R14U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0] ;         // Color of Poly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				isQuad_R14H;                    //Micropygon is quad';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	sample_R14S[1:0];               //Sample Location to Be Tested';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				validSamp_R14H;                 //Sample and Micropolygon are Valid';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	poly_R16S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0]; //Micropolygon to Sample Test';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]   color_R16U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0] ;         //Color of Poly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				isQuad_R16H;                    //Micropygon is quad';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	sample_R16S[1:0];               //Sample Location to Be Tested';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				validSamp_R16H;                 //Sample and Micropolygon are Valid';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 		zero;                     //fudge signal to hold zero as a reset value';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic [127:0] 			big_zero;                 //fudge signal to hold zero as a reset value';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Intermediate Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign big_zero = 128\'d0;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign zero = big_zero['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0];  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //TODO: Missing Micropolygon color';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //TODO: Make param pipedepth work';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $bbox = generate( 'bbox', "bbox", 
                           SigFig=>$sig_fig,
                           Radix=>$radix,
                           Vertices=>$verts,
                           Axis=>$axis,
                           Colors=>$colors,
                           PipelineDepth=>$pipes_box);
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $bbox -> instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			     .poly_R10S(poly_R10S) ,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			     .color_R10U(color_R10U) ,	      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			     .isQuad_R10H(isQuad_R10H) ,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			     .validPoly_R10H(validPoly_R10H) ,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			     .halt_RnnnnL(halt_RnnnnL) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			     .screen_RnnnnS(screen_RnnnnS) ,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			     .subSample_RnnnnU(subSample_RnnnnU) ,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			     .clk(clk),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			     .rst(rst),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			     .poly_R13S(poly_R13S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			     .color_R13U(color_R13U) ,	      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			     .isQuad_R13H(isQuad_R13H),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			     .box_R13S(box_R13S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			     .validPoly_R13H(validPoly_R13H) ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			     ) ; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $test_iterator = generate( 'test_iterator', "test_iterator", 
                           SigFig=>$sig_fig,
                           Radix=>$radix,
                           Vertices=>$verts,
                           Axis=>$axis,
                           Colors=>$colors,
                           PipelineDepth=>$pipes_iter);
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $test_iterator -> instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .poly_R13S(poly_R13S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .color_R13U(color_R13U) ,	      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .isQuad_R13H(isQuad_R13H),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .box_R13S(box_R13S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .validPoly_R13H(validPoly_R13H),	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .subSample_RnnnnU(subSample_RnnnnU) ,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .halt_RnnnnL(halt_RnnnnL), ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .clk(clk),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .rst(rst),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .poly_R14S(poly_R14S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .color_R14U(color_R14U) ,	      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .isQuad_R14H(isQuad_R14H),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .sample_R14S(sample_R14S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .validSamp_R14H(validSamp_R14H) ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      ) ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
    my $hash_jtree = generate( 'hash_jtree', "hash_jtree", 
                           SigFig=>$sig_fig,
                           Radix=>$radix,
                           Vertices=>$verts,
                           Axis=>$axis,
                           Colors=>$colors,
                           PipelineDepth=>$pipes_hash);
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $hash_jtree -> instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				   .poly_R14S(poly_R14S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				   .color_R14U(color_R14U) ,	      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				   .isQuad_R14H(isQuad_R14H),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				   .sample_R14S(sample_R14S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				   .validSamp_R14H(validSamp_R14H),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				   .subSample_RnnnnU(subSample_RnnnnU) ,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				   .clk(clk),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				   .rst(rst),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				   .poly_R16S(poly_R16S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				   .color_R16U(color_R16U),			';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				   .sample_R16S(sample_R16S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				   .validSamp_R16H(validSamp_R16H),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				   .isQuad_R16H(isQuad_R16H)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
    my $sampletest = generate( 'sampletest', "sampletest", 
                           SigFig=>$sig_fig,
                           Radix=>$radix,
                           Vertices=>$verts,
                           Axis=>$axis,
                           Colors=>$colors,
                           PipelineDepth=>$pipes_samp);
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $sampletest -> instantiate(); print { $self->{OutfileHandle} } ' (   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .poly_R16S(poly_R16S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .color_R16U(color_R16U),			';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .sample_R16S(sample_R16S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .validSamp_R16H(validSamp_R16H),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .isQuad_R16H(isQuad_R16H),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .clk(clk),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .rst(rst),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .hit_R18S( hit_R18S ),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .color_R18U( color_R18U ),						 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      .hit_valid_R18H( hit_valid_R18H ) ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				      );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/rast.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
