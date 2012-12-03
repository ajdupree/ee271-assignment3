package test_iterator;
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
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/test_iterator.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/test_iterator.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/test_iterator.vp"
print { $self->{OutfileHandle} } '/*';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Bounding Box Sample Test Iteration';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Inputs:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    BBox and MicroPolygon Information';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Outputs:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    Subsample location and Micropolygon Information';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Function:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    Iterate from left to right bottom to top';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    across the bounding box.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    While iterating set the halt signal in';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    order to hold the bounding box pipeline in';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    place.  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Long Description:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    The iterator starts in the waiting state,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    when a valid micropolygon bounding box';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    appears at the input. It will enter the';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    testing state the next cycle with a ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    sample equivelant to the lower left ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    cooridinate of the bounding box.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    While in the testing state, the next sample';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    for each cycle should be one sample interval ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    to the right, except when the current sample';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    is at the right edge.  If the current sample';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    is at the right edge, the next sample should';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    be one row up.  Additionally, if the current';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    sample is on the top row and the right edge,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    next cycles sample should be invalid and ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    equivelant to the lower left vertice and';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    next cycles state should be waiting.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Author: John Brunhaver';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Created:      Thu 07/23/09';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Last Updated: Tue 10/01/10';print { $self->{OutfileHandle} } "\n"; 
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
                            Val=>1, Min=>1, Max=>1, Step=>1, 
                            Doc=>"How many pipe stages are in this block");
 my $mod_FSM = parameter(Name=>'ModifiedFSM',
                            Val=>'NO', List=>['YES', 'NO'],
                            Doc=>"Use Modified FSM to eliminate a wait state");

 # Convert a Fixed Point Number to a Floating
 sub unFix {
   my $signal_name = shift @_;
   my $radix = shift @_;
   return " 1.0 * $signal_name / ( 128\'d1 << $radix ) ";
 }
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
print { $self->{OutfileHandle} } 'module '; print { $self->{OutfileHandle} } mname(); print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Input Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	poly_R13S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0], //Micropolygon to Iterate Over';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] color_R13U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0] , //Color of Poly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 				isQuad_R13H, //Micropolygon is quad';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	box_R13S[1:0][1:0], //Box to iterate for subsamples';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 				validPoly_R13H, //Micropolygon is valid';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Control Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic [3:0] 			subSample_RnnnnU , //Subsample width ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic 			halt_RnnnnL , //Halt -> hold current micropoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Note that this block generates';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Global Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 				clk, // Clock';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 				rst, // Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Outputs';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] poly_R14S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0], //Micropolygon to Sample Test';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] color_R14U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0] , //Color of Poly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] sample_R14S[1:0], //Sample Location to Be Tested';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic 			isQuad_R14H, //Micropygon is quad';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic 			validSamp_R14H                   //Sample and Micropolygon are Valid';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // This module implement a Moore machine to iterarte sample points in bbox';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Recall: a Moore machine is an FSM whose output values are determined ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // solely by its current state.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // A simple way to build a Moore machine is to make states for every output';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // and the values of the current states are the outputs themselves';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Now we create the signals for the next states of each outputs and ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // then instantiate registers for storing these states';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	next_poly_R14S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0]; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic unsigned  ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] next_color_R14U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	next_sample_R14S[1:0];  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				next_isQuad_R14H;                   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				next_validSamp_R14H;                 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				next_halt_RnnnnL;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Instantiate registers for storing these states';print { $self->{OutfileHandle} } "\n"; 
    my $d301 = generate( 'dff3', "d301", 
                           BitWidth=>$sig_fig,
                           ArraySize1=>$verts,
                           ArraySize2=>$axis,
                           PipelineDepth=>1,
                           Retime=>'NO' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d301->instantiate(); print { $self->{OutfileHandle} } '(';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			  .in(next_poly_R14S) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			  .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			  .out(poly_R14S));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $d302 = generate( 'dff2', "d302", 
                           BitWidth=>$sig_fig,
                           ArraySize1=>$colors,
                           PipelineDepth=>1,
                           Retime=>'NO' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d302->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .in(next_color_R14U) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .out(color_R14U));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $d303 = generate( 'dff2', "d303", 
                           BitWidth=>$sig_fig,
                           ArraySize1=>2,
                           PipelineDepth=>1,
                           Retime=>'NO' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d303->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .in(next_sample_R14S) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .out(sample_R14S));				 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $d304 = generate( 'dff', "d304", 
                           BitWidth=>3,
                           PipelineDepth=>1,
                           Retime=>'NO' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d304->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .in({next_validSamp_R14H, next_isQuad_R14H, next_halt_RnnnnL}) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .out({validSamp_R14H, isQuad_R14H, halt_RnnnnL}));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Instantiate registers for storing these states';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  ';print { $self->{OutfileHandle} } "\n"; 
    if ($mod_FSM eq 'NO') {
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //////';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //////  RTL code for original FSM Goes Here';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //////';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // To build this FSM we want to have two more state: one is the working';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // status of this FSM, and the other is the current bounding box where';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // we iterate sample points';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // defin two more states, box_R14S and state_R14H';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	box_R14S[1:0][1:0];    		// the state for current bounding box';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	next_box_R14S[1:0][1:0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   typedef enum logic {';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		       WAIT_STATE, TEST_STATE';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		       } state_t;  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   state_t                        state_R14H;     //State Designation (Waiting or Testing)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   state_t                        next_state_R14H;        //Next Cycles State ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	// instantiate registers for storing these two states';print { $self->{OutfileHandle} } "\n"; 
    my $d305 = generate( 'dff3', "d305", 
                           BitWidth=>$sig_fig,
                           ArraySize1=>2,
                           ArraySize2=>2,
                           PipelineDepth=>1,
                           Retime=>'NO' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d305->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .in(next_box_R14S) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .out(box_R14S));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   ';print { $self->{OutfileHandle} } "\n"; 
    my $d306 = generate( 'dff', "d306", 
                           BitWidth=>1,
                           PipelineDepth=>1,
                           Retime=>'NO' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d306->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .in(next_state_R14H) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .out(state_R14H));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	// define some helper signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	next_up_samp_R14S[1:0]; //If jump up, next sample';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	next_rt_samp_R14S[1:0]; //If jump right, next sample';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				at_right_edg_R14H;      //Current sample at right edge?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				at_top_edg_R14H;        //Current sample at top edge?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				at_end_box_R14H;        //Cur samp at end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ////// PLACE YOUR CODE HERE ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Current Sample location at Top Edge?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign at_top_edg_R14H =  sample_R14S[1] == box_R14S[1][1];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Current Sample location at Right Edge?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  at_right_edg_R14H = sample_R14S[0] == box_R14S[1][0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //At End of Box';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  at_end_box_R14H = at_top_edg_R14H & at_right_edg_R14H;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Calculate The Sample to the Right of the Current Sample';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign next_rt_samp_R14S[0]['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-4:0] = \'0;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign next_rt_samp_R14S[0]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-3] = sample_R14S[0]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-3]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     +  { \'0 , subSample_RnnnnU } ; // X-Val is Increment';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  next_rt_samp_R14S[1] = sample_R14S[1] ; // Y-val is same';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Calculate the Sample that is The Up Iteration';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign next_up_samp_R14S[0] = box_R14S[0][0] ; //X-Val is left bbox edge';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  next_up_samp_R14S[1]['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-4:0] = \'0; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  next_up_samp_R14S[1]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-3] = sample_R14S[1]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-3]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     +  { \'0 , subSample_RnnnnU } ; // Y-Val is Increment      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //State Machine Control';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   always_comb begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      unique case( state_R14H )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '        ( WAIT_STATE ): begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_sample_R14S    = box_R13S[0];  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_validSamp_R14H = validPoly_R13H ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_isQuad_R14H    = isQuad_R13H;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_state_R14H     = validPoly_R13H ? TEST_STATE ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				 : WAIT_STATE;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_poly_R14S      = poly_R13S ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_color_R14U     = color_R13U ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_box_R14S       = box_R13S ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_halt_RnnnnL    = ~validPoly_R13H ; // halt for new uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( TEST_STATE ): begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_sample_R14S    =  at_right_edg_R14H ?  next_up_samp_R14S ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				  : next_rt_samp_R14S ;  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_validSamp_R14H =  ~at_end_box_R14H ; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_isQuad_R14H    =   isQuad_R14H ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_state_R14H     =   at_end_box_R14H ? WAIT_STATE ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				   : TEST_STATE ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_poly_R14S      =   poly_R14S ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_color_R14U     =   color_R14U ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_box_R14S       =   box_R14S ; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_halt_RnnnnL    =   at_end_box_R14H  ; //unHalt when done';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	end      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      endcase // case ( state_R14H )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end //always_comb';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //////';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //////  RTL code for original FSM Goes Here';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //////';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    } else { # use Modified FSM
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //////';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //////  RTL code for modified FSM Goes Here';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //////';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ////// PLACE YOUR CODE HERE ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // defin two more states, box_R14S and state_R14H';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	box_R14S[1:0][1:0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	next_box_R14S[1:0][1:0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    typedef enum 			logic {';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					       LAST_SAMP, NORM_SAMP';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					       } state_t;  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   state_t                        state_R14H;     //State Designation (Waiting or Testing)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   state_t                        next_state_R14H;        //Next Cycles State';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	// instantiate registers for storing these two states';print { $self->{OutfileHandle} } "\n"; 
    my $d305 = generate( 'dff3', "d305", 
                           BitWidth=>$sig_fig,
                           ArraySize1=>2,
                           ArraySize2=>2,
                           PipelineDepth=>1,
                           Retime=>'NO' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d305->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .in(next_box_R14S) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .out(box_R14S));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   ';print { $self->{OutfileHandle} } "\n"; 
    my $d306 = generate( 'dff', "d306", 
                           BitWidth=>1,
                           PipelineDepth=>1,
                           Retime=>'NO' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d306->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .in(next_state_R14H) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   .out(state_R14H));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	// define some helper signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	next_up_samp_R14S[1:0]; //If jump up, next sample';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	next_rt_samp_R14S[1:0]; //If jump right, next sample';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				at_right_edg_R14H;      //Current sample at right edge?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				at_top_edg_R14H;        //Current sample at top edge?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				at_end_box_R14H;        //Cur samp at end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				next_at_end_R14H;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // calculation the values of helper signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign   next_at_end_R14H = next_sample_R14S[1] == next_box_R14S[1][1] ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     & next_sample_R14S[0] == next_box_R14S[1][0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Current Sample location at Top Edge?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  at_top_edg_R14H =  sample_R14S[1] == box_R14S[1][1];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Current Sample location at Right Edge?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  at_right_edg_R14H = sample_R14S[0] == box_R14S[1][0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Calculate The Sample to the Right of the Current Sample';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  next_rt_samp_R14S[0]['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-4:0] = \'0;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  next_rt_samp_R14S[0]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-3] = sample_R14S[0]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-3]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     +  { \'0 , subSample_RnnnnU } ; // X-Val is Increment';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  next_rt_samp_R14S[1] = sample_R14S[1] ; // Y-val is same';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Calculate the Sample that is The Up Iteration';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  next_up_samp_R14S[0] = box_R14S[0][0] ; //X-Val is left bbox edge';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign next_up_samp_R14S[1]['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-4:0] = \'0; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  next_up_samp_R14S[1]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-3] = sample_R14S[1]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-3]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     +  { \'0 , subSample_RnnnnU } ; // Y-Val is Increment      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //State Machine Control';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   always_comb begin ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      unique case( state_R14H )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '        ( LAST_SAMP ): begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_sample_R14S    = box_R13S[0] ;  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_state_R14H     = validPoly_R13H & ~next_at_end_R14H ? NORM_SAMP ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				 : LAST_SAMP;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_poly_R14S      = poly_R13S ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_color_R14U     = color_R13U ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_box_R14S       = box_R13S ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_halt_RnnnnL    = ~(validPoly_R13H & ~next_at_end_R14H); // halt for new uPoly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_validSamp_R14H = validPoly_R13H ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_isQuad_R14H    = isQuad_R13H;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( NORM_SAMP ): begin ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   // current sample point is not the last one, ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   // so next one is always in the same box and valid';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_sample_R14S    =  at_right_edg_R14H ?  next_up_samp_R14S ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				  : next_rt_samp_R14S ;  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_state_R14H     =  next_at_end_R14H ? LAST_SAMP : NORM_SAMP ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_poly_R14S      =  poly_R14S ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_color_R14U     =  color_R14U ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_box_R14S       =  box_R14S ; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_halt_RnnnnL    =  next_at_end_R14H; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_validSamp_R14H =  1\'b1 ; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   next_isQuad_R14H    =  isQuad_R14H ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	end      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      endcase // case ( state_R14H )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end //always_comb';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //////';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //////  RTL code for modified FSM Goes Here';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //////';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    }
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Error Checking Assertions';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Define a Less Than Property';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //  a should be less than b';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   property rb_lt( rst, a , b , c );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      @(posedge clk) rst | ((a<=b) | !c);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   endproperty';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Check that Proposed Sample is in BBox';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assert property( rb_lt( rst, next_sample_R14S[0] , next_box_R14S[1][0] , next_validSamp_R14H ));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assert property( rb_lt( rst, next_sample_R14S[1] , next_box_R14S[1][1] , next_validSamp_R14H ));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assert property( rb_lt( rst, next_box_R14S[0][0] , next_sample_R14S[0] , next_validSamp_R14H ));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assert property( rb_lt( rst, next_box_R14S[0][1] , next_sample_R14S[1] , next_validSamp_R14H ));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Check that Proposed Sample is in BBox';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Error Checking Assertions';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/test_iterator.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
