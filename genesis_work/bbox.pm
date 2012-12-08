package bbox;
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
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/bbox.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/bbox.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/bbox.vp"
print { $self->{OutfileHandle} } '/*';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Bounding Box Module';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Inputs: ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   3 x,y,z vertices corresponding to tri ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   1 valid bit, indicating triangle is valid data';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Config Inputs:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   2 x,y vertices indicating screen dimensions';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   1 integer representing square root of SS (16MSAA->4)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *      we will assume config values are held in some';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *      register and are valid given a valid polygon';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Control Input:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   1 halt signal indicating that no work should be done ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Outputs:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   2 vertices describing a clamped bounding box';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   1 Valid signal indicating that bounding ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *           box and triangle value is valid';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   3 x,y vertices corresponding to tri';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Global Signals: ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   clk, rst';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Function:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Determine a bounding box for the polygon';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   represented by the vertices.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Clamp the Bounding Box to the subsample pixel';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   space';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Clip the Bounding Box to Screen Space';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Halt operating but retain values if next stage is busy';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Long Description:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   This bounding box block accepts a polygon described with three';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   vertices and determines a set of sample points to test against';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   the micropolygon.  These sample points correspond to the ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   either the pixels in the final image or the pixel fragments ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   that compose the pixel if multisample anti-aliasing (MSAA)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   is enabled.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   The inputs to the box are clocked with a bank of dflops.  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   After the data is clocked, a bounding box is determined ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   for the micropolygon. A bounding box can be determined ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   through calculating the maxima and minima for x and y to ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   generate a lower left vertice and upper right';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   vertice.  This data is then clocked.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   The bounding box next needs to be clamped to the fragment grid.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   This can be accomplished through rounding the bounding box values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   to the fragment grid.  Additionally, any sample points that exist';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   outside of screen space should be rejected.  So the bounding box';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   can be clipped to the visible screen space.  This clipping is done';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   using the screen signal.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   The Halt signal is utilized to hold the current polygon bounding box.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   This is because one bounding box operation could correspond to';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   multiple sample test operations later in the pipe.  As these samples';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   can take a number of cycles to complete, the data held in the bounding';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   box stage needs to be preserved.  The halt signal is also required for ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   when the write device is full/busy.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   The valid signal is utilized to indicate whether or a polygon ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   is actual data.  This can be useful if the device being read from,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   has no more micropolygons.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Author: John Brunhaver';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Created:      Thu 07/23/09';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Last Updated: Fri 09/30/10';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Copyright 2009 <jbrunhaver@gmail.com>   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '/* A Note on Signal Names:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Most signals have a suffix of the form _RxxxxN ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * where R indicates that it is a Raster Block signal';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * xxxx indicates the clock slice that it belongs to';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * N indicates the type of signal that it is.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    H indicates logic high, ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    L indicates logic low,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    U indicates unsigned fixed point, ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    S indicates signed fixed point.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
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
                            Val=>3, Min=>1, Step=>1, 
                            Doc=>"How many pipe stages are in this block");
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'module '; print { $self->{OutfileHandle} } mname(); print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Input Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	poly_R10S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0] , // Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 				unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] color_R10U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0] , // Color of Poly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 				isQuad_R10H , // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 				validPoly_R10H , // Valid Data for Operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Control Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 				halt_RnnnnL, // Indicates No Work Should Be Done';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	screen_RnnnnS[1:0] , // Screen Dimensions';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic [3:0] 			subSample_RnnnnU , // SubSample_Interval';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Global Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 				clk, // Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic 				rst, // Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Outout Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] poly_R13S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0], // 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic 			unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] color_R13U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0] , // Color of Poly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic 			isQuad_R13H, // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] box_R13S[1:0][1:0], // 2 Sets X,Y Fixed Point Values  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic 			validPoly_R13H                  // Valid Data for Operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Signals In Clocking Order';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //R10 Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic [1:0][5:0] 			cmp_R10H ;             // Comparison Results';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic [1:0][1:0]['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0] 	bbox_sel_R10H ;        // Decoded Select for Unclamped Bbox  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	box_R10S[1:0][1:0];    // 2 Sets X,Y Fixed Point Values    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	rounded_box_R10S[1:0][1:0];  // 2 Sets X,Y Fixed Point Values   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	increment_box_R10S[1:0];     // 1 Set X,Y Fixed Point Values ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic [1:0][1:0] 			clamp_R10H;                  // signal require clamping';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic [1:0][1:0] 			invalidate_R10H;             // polygon out of bounds';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	out_box_R10S[1:0][1:0];      // bounds for output';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				outvalid_R10H;               // output is valid';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //R10 Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // output for retiming registers';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	poly_R13S_retime['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0]; // 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] color_R13U_retime['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0];        // Color of Poly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	box_R13S_retime[1:0][1:0];             // 2 Sets X,Y Fixed Point Values  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				isQuad_R13H_retime;                   // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				validPoly_R13H_retime ;                 // Valid Data for Operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // output for retiming registers';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	//logic for backface culling';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-5:0] edges [1:0][1:0]; // two edges, two axes. edges 1-2 and 2-3';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	logic signed [47:0] z_crossproduct, z1, z2;	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	logic cull;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	//log for bubble smashing';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	logic halt_smash;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	//Backface culling. Detect backward facing polygons, set valid_samp low';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 always_comb begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 	//v2 - v1';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 	edges[0][0] = poly_R10S[1][0]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-5:0] - poly_R10S[0][0]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-5:0]; //v2[x]-v1[x]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		edges[0][1] = poly_R10S[1][1]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-5:0] - poly_R10S[0][1]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-5:0]; //v2[y]-v1[y]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		//v3-v2';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 	edges[1][0] = poly_R10S[2][0]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-5:0] - poly_R10S[1][0]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-5:0]; //v3[x]-v2[x]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		edges[1][1] = poly_R10S[2][1]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-5:0] - poly_R10S[1][1]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-5:0]; //v3[y]-v2[y]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		z_crossproduct = (edges[0][0]*edges[1][1])-(edges[0][1]*edges[1][0]); //z output of cross product';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		cull = (z_crossproduct > 0) ? 1\'b1 : 1\'b0; //z > 0 implies backfacing which means cull';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 end ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 //Bubble smashing';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 /*Halt signal is logic LOW. So this combined signal should be LOW if we want it to halt.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 As such, this signal will only halt the bbox if the halt signal is LOW ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 AND the outvalid is HIGH. */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 assign halt_smash = halt_RnnnnL | ~validPoly_R13H;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
    if( $verts == 3 ) {
print { $self->{OutfileHandle} } '	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   /*	//v2 - v1';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 	assign edges[0][0] = poly_R10S[1][0] - poly_R10S[0][0]; //v2[x]-v1[x]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		assign edges[0][1] = poly_R10S[1][1] - poly_R10S[0][1]; //v2[y]-v1[y]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		//v3-v2';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 	assign edges[1][0] = poly_R10S[2][0] - poly_R10S[1][0]; //v3[x]-v2[x]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		assign edges[1][1] = poly_R10S[2][1] - poly_R10S[1][1]; //v3[y]-v2[y]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		assign z1 = edges[0][0]*edges[1][1];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		assign z2 = edges[0][1]*edges[1][0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		assign z_crossproduct = z1 - z2; //z output of cross product';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		assign cull = (z_crossproduct > 0) ? 1\'b1 : 1\'b0; //z > 0 implies backfacing which means cull';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '*/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Note: <= might be faster than < and functionally equivelant here';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   always_comb begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Compare X';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      cmp_R10H[0][0] =  poly_R10S[0][0] <  poly_R10S[1][0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      cmp_R10H[0][1] =  poly_R10S[0][0] <  poly_R10S[2][0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      cmp_R10H[0][2] =  poly_R10S[1][0] <  poly_R10S[2][0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      cmp_R10H[0][5:3] = 3\'b0;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Compare Y';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      cmp_R10H[1][0] =  poly_R10S[0][1] <  poly_R10S[1][1] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      cmp_R10H[1][1] =  poly_R10S[0][1] <  poly_R10S[2][1] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      cmp_R10H[1][2] =  poly_R10S[1][1] <  poly_R10S[2][1] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      cmp_R10H[1][5:3] = 3\'b0;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   always_comb begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Decoded Select';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //  sel[n][m][p]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //  n=0 -> ll n=1 -> ur';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //  m=0 -> x  m=1 -> y';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //  p correspeonds to vertice index';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      // X';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      bbox_sel_R10H[0][0][0] =  cmp_R10H[0][0] &  cmp_R10H[0][1] ;	    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      bbox_sel_R10H[0][0][1] = !cmp_R10H[0][0] &  cmp_R10H[0][2] ; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      bbox_sel_R10H[0][0][2] = !cmp_R10H[0][1] & !cmp_R10H[0][2] ; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      bbox_sel_R10H[1][0][0] = !cmp_R10H[0][0] & !cmp_R10H[0][1] ; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      bbox_sel_R10H[1][0][1] =  cmp_R10H[0][0] & !cmp_R10H[0][2] ; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      bbox_sel_R10H[1][0][2] =  cmp_R10H[0][1] &  cmp_R10H[0][2] ; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      // Y';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      bbox_sel_R10H[0][1][0] =  cmp_R10H[1][0] &  cmp_R10H[1][1]  ; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      bbox_sel_R10H[0][1][1] = !cmp_R10H[1][0] &  cmp_R10H[1][2]  ; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      bbox_sel_R10H[0][1][2] = !cmp_R10H[1][1] & !cmp_R10H[1][2]  ; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      bbox_sel_R10H[1][1][0] = !cmp_R10H[1][0] & !cmp_R10H[1][1]  ; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      bbox_sel_R10H[1][1][1] =  cmp_R10H[1][0] & !cmp_R10H[1][2]  ; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      bbox_sel_R10H[1][1][2] =  cmp_R10H[1][1] &  cmp_R10H[1][2]  ; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Check that the Select is OneHot (only one bit in array is 1)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      assert( rst | $onehot( bbox_sel_R10H[0][0] )) ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	else $error("%b \\n",bbox_sel_R10H[0][0]) ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      assert( rst |  $onehot( bbox_sel_R10H[1][0] )) ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	else $error("%b \\n",bbox_sel_R10H[1][0]);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      assert( rst |  $onehot( bbox_sel_R10H[0][1] )) ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	else $error("%b \\n",bbox_sel_R10H[0][1]) ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      assert( rst |  $onehot( bbox_sel_R10H[1][1] )) ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	else $error("%b \\n",bbox_sel_R10H[1][1]);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Check that the Select is OneHot (only one bit in array is 1)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Perform the Selection';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //  note that unique indicates that ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //  one and only one select signal will be valid';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //  and that only one case event will occur   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //  This will synthesize to a simple mux with decoded select';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Upper Right X Select';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      unique case( 1\'b1 )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( bbox_sel_R10H[1][0][0] ): box_R10S[1][0] = poly_R10S[0][0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( bbox_sel_R10H[1][0][1] ): box_R10S[1][0] = poly_R10S[1][0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( bbox_sel_R10H[1][0][2] ): box_R10S[1][0] = poly_R10S[2][0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      endcase // ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Lower Left X Select';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      unique case( 1\'b1 )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( bbox_sel_R10H[0][0][0] ): box_R10S[0][0] = poly_R10S[0][0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( bbox_sel_R10H[0][0][1] ): box_R10S[0][0] = poly_R10S[1][0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( bbox_sel_R10H[0][0][2] ): box_R10S[0][0] = poly_R10S[2][0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      endcase //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Upper Right Y Select';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      unique case( 1\'b1 )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( bbox_sel_R10H[1][1][0] ): box_R10S[1][1] = poly_R10S[0][1] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( bbox_sel_R10H[1][1][1] ): box_R10S[1][1] = poly_R10S[1][1] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( bbox_sel_R10H[1][1][2] ): box_R10S[1][1] = poly_R10S[2][1] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      endcase // ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Lower Left Y Select';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      unique case( 1\'b1 )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( bbox_sel_R10H[0][1][0] ): box_R10S[0][1] = poly_R10S[0][1] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( bbox_sel_R10H[0][1][1] ): box_R10S[0][1] = poly_R10S[1][1] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	( bbox_sel_R10H[0][1][2] ): box_R10S[0][1] = poly_R10S[2][1] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      endcase //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //End Selection of Bounding Box    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end // always_comb ';print { $self->{OutfileHandle} } "\n"; 
    }  
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Round Values to Subsample Interval';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // We will use the floor operation for rounding.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // To floor a signal, we simply turn all of the bits';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // below a specific '; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } ' to 0.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // The complication here is that there are 4 setting.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // 1x MSAA eq. to 1 sample per pixel';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // 4x MSAA eq to 4 samples per pixel, a sample is';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // half a pixel on a side';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // 16x MSAA eq to 16 sample per pixel, a sample is';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // a quarter pixel on a side.  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // 64x MSAA eq to 64 samples per pixel, a sample is';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // an eighth of a pixel on a side.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Note: Cleverly converting the MSAA signal';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //       to a mask would allow you to do this operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //       as a bitwise and operation.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Why is it a floor operation?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //  TODO -> Explanation of why it is floor';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Round LowerLeft and UpperRight for X and Y';print { $self->{OutfileHandle} } "\n"; 
    for( my $i = 0 ; $i < 2 ; $i++ ) {
    	for( my $j = 0 ; $j < 2 ; $j++ ) {
print { $self->{OutfileHandle} } '   always_comb begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Integer Portion of LL Remains the Same ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      rounded_box_R10S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $j; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '] ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     = box_R10S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $j; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Fractional Portion LL less than Subsample set to 0';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      rounded_box_R10S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $j; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-4:0] ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	= '; print { $self->{OutfileHandle} } $radix-3; print { $self->{OutfileHandle} } '\'b0;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Mux for Correct Roundoff Point ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      assert( $onehot( subSample_RnnnnU )) else $fatal( "onehot\\n");';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      unique case( subSample_RnnnnU )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b0001): // 64x MSAA';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	  rounded_box_R10S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $j; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-3] ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       = { box_R10S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $j; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-3] };  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b0010): // 16x MSAA';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 rounded_box_R10S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $j; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-3] ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	  = { box_R10S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $j; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-2] , 1\'b0 };  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b0100): // 4x MSAA';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    rounded_box_R10S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $j; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-3] ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	  = { box_R10S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $j; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-1] , 2\'b0 }; ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b1000): // 1x MSAA';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    rounded_box_R10S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $j; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-3] ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	  = { 3\'b0 } ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      endcase // case ( subSample_RnnnnU )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Assertion Checks at end of Module';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end // always_comb';print { $self->{OutfileHandle} } "\n"; 
   		}
    }
print { $self->{OutfileHandle} } '   //Round Values to Subsample Interval';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Check if Unclamped Box Requires Clipping or Rejection';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   always_comb begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Clamp if LL is down/left of screen origin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      clamp_R10H[0][0] = box_R10S[0][0] < 0 ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      clamp_R10H[0][1] = box_R10S[0][1] < 0 ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Clamp if UR is up/right of Screen';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      clamp_R10H[1][0] = box_R10S[1][0] > screen_RnnnnS[0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      clamp_R10H[1][1] = box_R10S[1][1] > screen_RnnnnS[1] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Invalid if BBox is up/right of Screen';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      invalidate_R10H[0][0] = box_R10S[0][0] > screen_RnnnnS[0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      invalidate_R10H[0][1] = box_R10S[0][1] > screen_RnnnnS[1] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Invalid if BBox is down/left of Screen';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      invalidate_R10H[1][0] = box_R10S[1][0] < 0 ;	    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      invalidate_R10H[1][1] = box_R10S[1][1] < 0 ;	    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Check if Unclamped Box Requires Clipping or Rejection';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Select Between Clipped Bounds and Rounded Bounds';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   always_comb begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      out_box_R10S[0][0] = ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   clamp_R10H[0][0] ? 0 : rounded_box_R10S[0][0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      out_box_R10S[0][1] = ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   clamp_R10H[0][1] ? 0 : rounded_box_R10S[0][1] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      out_box_R10S[1][0] = ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   clamp_R10H[1][0] ? screen_RnnnnS[0] : rounded_box_R10S[1][0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      out_box_R10S[1][1] = ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			   clamp_R10H[1][1] ? screen_RnnnnS[1] : rounded_box_R10S[1][1];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Select Between Screen Bounds and Rounded Bounds';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  outvalid_R10H = ~( | invalidate_R10H ) & validPoly_R10H & ~cull;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Flop Clamped Box to R13_retime with retiming registers';print { $self->{OutfileHandle} } "\n"; 
    my $d_bbx_r1 = generate( 'dff3', "d_bbx_r1", 
                           BitWidth=>$sig_fig,
                           ArraySize1=>$verts,
                           ArraySize2=>$axis,
                           PipelineDepth=>$pipe_depth-1,
                           Retime=>'YES' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d_bbx_r1->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .in(poly_R10S) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .clk(clk) , .reset(rst), .en(halt_smash),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .out(poly_R13S_retime));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $d_bbx_r2 = generate( 'dff2', "d_bbx_r2", 
                           BitWidth=>$sig_fig,
                           ArraySize1=>$colors,
                           PipelineDepth=>$pipe_depth-1,
                           Retime=>'YES' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d_bbx_r2->instantiate(); print { $self->{OutfileHandle} } '(';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      .in(color_R10U) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      .clk(clk) , .reset(rst), .en(halt_smash),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      .out(color_R13U_retime));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $d_bbx_r3 = generate( 'dff3', "d_bbx_r3", 
                           BitWidth=>$sig_fig,
                           ArraySize1=>2,
                           ArraySize2=>2,
                           PipelineDepth=>$pipe_depth-1,
                           Retime=>'YES' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d_bbx_r3->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .in(out_box_R10S) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .clk(clk) , .reset(rst), .en(halt_smash),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .out(box_R13S_retime));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $d_bbx_r4 = generate( 'dff', "d_bbx_r4", 
                           BitWidth=>2,
                           PipelineDepth=>$pipe_depth-1,
                           Retime=>'YES' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d_bbx_r4->instantiate(); print { $self->{OutfileHandle} } '(';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      .in({isQuad_R10H, outvalid_R10H}) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      .clk(clk) , .reset(rst), .en(halt_smash),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      .out({isQuad_R13H_retime, validPoly_R13H_retime}));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Flop Clamped Box to R13_retime with retiming registers';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Flop R13_retime to R13 with fixed registers';print { $self->{OutfileHandle} } "\n"; 
    my $d_bbx_f1 = generate( 'dff3', "d_bbx_f1", 
                           BitWidth=>$sig_fig,
                           ArraySize1=>$verts,
                           ArraySize2=>$axis,
                           PipelineDepth=>1,
                           Retime=>'NO' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d_bbx_f1->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .in(poly_R13S_retime) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .clk(clk) , .reset(rst), .en(halt_smash),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .out(poly_R13S));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $d_bbx_f2 = generate( 'dff2', "d_bbx_f2", 
                           BitWidth=>$sig_fig,
                           ArraySize1=>$colors,
                           PipelineDepth=>1,
                           Retime=>'NO' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d_bbx_f2->instantiate(); print { $self->{OutfileHandle} } '(';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      .in(color_R13U_retime) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      .clk(clk) , .reset(rst), .en(halt_smash),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      .out(color_R13U));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $d_bbx_f3 = generate( 'dff3', "d_bbx_f3", 
                           BitWidth=>$sig_fig,
                           ArraySize1=>2,
                           ArraySize2=>2,
                           PipelineDepth=>1,
                           Retime=>'NO' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d_bbx_f3->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .in(box_R13S_retime) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .clk(clk) , .reset(rst), .en(halt_smash),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .out(box_R13S));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $d_bbx_f4 = generate( 'dff', "d_bbx_f4", 
                           BitWidth=>2,
                           PipelineDepth=>1,
                           Retime=>'NO' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d_bbx_f4->instantiate(); print { $self->{OutfileHandle} } '(';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      .in({isQuad_R13H_retime, validPoly_R13H_retime}) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      .clk(clk) , .reset(rst), .en(halt_smash),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      .out({isQuad_R13H, validPoly_R13H}));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Flop R13_retime to R13 with fixed registers';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Error Checking Assertions';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Define a Less Than Property';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //  a should be less than b';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   property rb_lt( rst, a , b , c );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      @(posedge clk) rst | ((a<=b) | !c);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   endproperty';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Check that Lower Left of Bounding Box is less than equal Upper Right';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assert property( rb_lt( rst, box_R13S[0][0] , box_R13S[1][0] , validPoly_R13H ));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assert property( rb_lt( rst, box_R13S[0][1] , box_R13S[1][1] , validPoly_R13H ));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Check that Lower Left of Bounding Box is less than equal Upper Right';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Error Checking Assertions';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/bbox.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
