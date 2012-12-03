package sampletest;
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
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/sampletest.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/sampletest.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/sampletest.vp"
print { $self->{OutfileHandle} } '/*';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Performs Sample Test on Micropolygon';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Inputs:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    Sample and MicroPolygon Information';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Outputs:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    Subsample Hit Flag, Subsample location, and Micropolygon Information';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Function:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    Utilizing Edge Equations determine whether the ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    sample location lies inside the micropolygon.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    In the simple case of the triangle, this will';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    occur when the sample lies to one side of all';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    three lines (either all left or all right).';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    This corresponds to the minterm 000 and 111.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    Additionally, if backface culling is performed,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    then only keep the case of all right.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Edge Equation:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    For an edge defined as travelling from the ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    vertice (x_1,y_1) to (x_2,y_2), the sample';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    (x_s,y_s) lies to the right of the line';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    if the following expression is true:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    0 >  ( x_1 - x_s ) * ( y_2 - y_s ) - ( x_2 - x_s ) * ( y_1 - y_s )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    otherwise it lies on the line (exactly 0) or ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    to the left of the line.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    This block evaluates the six edges described by the';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    micropolygons vertices,  to determine which';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    side of the lines the sample point lies.  Then it';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    determines if the sample point lies in the micropolygon';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    by or\'ing the appropriate minterms.  In the case of ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    the triangle only three edges are relevant.  In the';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    case of the quadrilateral five edges are relevant.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Author: John Brunhaver';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Created:      Thu 07/23/09';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Last Updated: Tue 10/06/10';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Copyright 2009 <jbrunhaver@gmail.com>   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  NOTE: This file contains solutions to assignment 2';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  BUG!!!!';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' */';print { $self->{OutfileHandle} } "\n"; 
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
                            Val=>2, Min=>1, Step=>1, 
                            Doc=>"How many pipe stages are in this block");
 
 # local variables
 my $edges = ($verts == 3) ? 3 : 5 ;
 my $shortSF = $sig_fig;
 my $MRound = 2 * $shortSF - $radix;
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '/* A Note on Signal Names:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Most signals have a suffix of the form _RxxxxN ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * where R indicates that it is a Raster Block signal';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * xxxx indicates the clock slice that it belongs to';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * and N indicates the type of signal that it is.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * H indicates logic high, L indicates logic low,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * U indicates unsigned fixed point, and S indicates';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * signed fixed point.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'module  '; print { $self->{OutfileHandle} } mname(); print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  ( ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    input logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]  poly_R16S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0], // Micropolygon to Iterate Over';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    input logic 			 unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] color_R16U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0] , // Color of Poly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    input logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]  sample_R16S[1:0], // Sample Location    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    input logic 			 validSamp_R16H, // A valid sample location';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    input logic 			 isQuad_R16H, //Micropolygon is quad';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    input logic 			 clk, // Clock';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    input logic 			 rst, // Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    output logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] hit_R18S['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0], // Hit Location';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    output logic 			 unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] color_R18U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0] , // Color of Poly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    output logic 			 hit_valid_R18H                   // Is hit good';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // output for retiming registers	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	 hit_R18S_retime['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0];   // Hit Location';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				 unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]  color_R18U_retime['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0];   // Color of Poly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				 hit_valid_R18H_retime;   // Is hit good';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // output for retiming registers	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Signals in Access Order  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	 poly_shift_R16S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0][1:0]; // Micropolygon to Iterate Over    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	 edge_R16S['; print { $self->{OutfileHandle} } $edges; print { $self->{OutfileHandle} } '-1:0][1:0][1:0]; //Edges ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed [2*'; print { $self->{OutfileHandle} } $shortSF; print { $self->{OutfileHandle} } '-1:0] 	 dist_lg_R16S['; print { $self->{OutfileHandle} } $edges; print { $self->{OutfileHandle} } '-1:0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $MRound; print { $self->{OutfileHandle} } '-1:0] 	 dist_R16S['; print { $self->{OutfileHandle} } $edges; print { $self->{OutfileHandle} } '-1:0];  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic ['; print { $self->{OutfileHandle} } $edges; print { $self->{OutfileHandle} } '-1:0] 		 edge_chk1_R16;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				 sample_hit_R16H ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				 hit_valid_R16H ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 				 norm_factor_R16S ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	 hit_R16S['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0];  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Signals in Access Order ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   /* Organize Edge Data*/';print { $self->{OutfileHandle} } "\n"; 
    for( my $i = 0 ; $i < $verts ; $i++ ) {
    	for( my $j = 0 ; $j < 2 ; $j++ ) {
print { $self->{OutfileHandle} } '   always_comb begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      poly_shift_R16S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $j; print { $self->{OutfileHandle} } '] = poly_R16S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } ']['; print { $self->{OutfileHandle} } $j; print { $self->{OutfileHandle} } '] - sample_R16S['; print { $self->{OutfileHandle} } $j; print { $self->{OutfileHandle} } '];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end //always_comb';print { $self->{OutfileHandle} } "\n"; 
    	}
    }
print { $self->{OutfileHandle} } '   /* Organize Edge Data */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   /*Calculate Distance*/';print { $self->{OutfileHandle} } "\n"; 
    if( $verts == 3 ) {
print { $self->{OutfileHandle} } '   always_comb begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      edge_R16S[0][1] = poly_shift_R16S[1];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      edge_R16S[0][0] = poly_shift_R16S[0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      edge_R16S[1][1] = poly_shift_R16S[2];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      edge_R16S[1][0] = poly_shift_R16S[1];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      edge_R16S[2][1] = poly_shift_R16S[0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      edge_R16S[2][0] = poly_shift_R16S[2];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end //always_comb';print { $self->{OutfileHandle} } "\n"; 
    }
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    for( my $i = 0 ; $i < $edges ; $i++) {
print { $self->{OutfileHandle} } '   always_comb begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      dist_lg_R16S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } '] =     edge_R16S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } '][0][0] * edge_R16S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } '][1][1]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     -  edge_R16S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } '][0][1] * edge_R16S['; print { $self->{OutfileHandle} } $i; print { $self->{OutfileHandle} } '][1][0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end	    ';print { $self->{OutfileHandle} } "\n"; 
    }
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    if( $edges == 3 ) {
print { $self->{OutfileHandle} } '   always_comb begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      edge_chk1_R16[0] =  dist_lg_R16S[0]  <=  0 ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      edge_chk1_R16[1] =  dist_lg_R16S[1]  <   0 ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      edge_chk1_R16[2] =  dist_lg_R16S[2]  <=  0 ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end  ';print { $self->{OutfileHandle} } "\n"; 
    } elsif( $edges == 5 ) {
print { $self->{OutfileHandle} } '   always_comb begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      assert( 0 ) else $fatal( "Sample test unit not configured for 4 Vertices\\n");';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end  ';print { $self->{OutfileHandle} } "\n"; 
    }
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign hit_valid_R16H = & {edge_chk1_R16[2:0], validSamp_R16H}; //Back Face Cull Case';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   /*Calculate Distance*/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Calculate Depth as depth of first vertex';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Note that a barrycentric interpolation would';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // be more accurate';print { $self->{OutfileHandle} } "\n"; 
    if( $verts == 3) {
print { $self->{OutfileHandle} } '   always_comb begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      hit_R16S[1:0] = sample_R16S[1:0]; //Make sure you use unjittered sample';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      hit_R16S[2] = poly_R16S[0][2]; // z value equals the z value of the first vertex';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end';print { $self->{OutfileHandle} } "\n"; 
    }
print { $self->{OutfileHandle} } '   //TODO: Calculate Depth by berrycentric intropolation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   /* Flop R16 to R18_retime with retiming registers*/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $d_samp_r1 = generate( 'dff2', "d_samp_r1", 
                           BitWidth=>$sig_fig,
                           ArraySize1=>$axis,
                           PipelineDepth=>$pipe_depth-1,
                           Retime=>'YES' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d_samp_r1->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				.in(hit_R16S) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				.clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				.out(hit_R18S_retime));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $d_samp_r2 = generate( 'dff2', "d_samp_r2", 
                           BitWidth=>$sig_fig,
                           ArraySize1=>$colors,
                           PipelineDepth=>$pipe_depth-1,
                           Retime=>'YES' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d_samp_r2->instantiate(); print { $self->{OutfileHandle} } '(';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .in(color_R16U) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .out(color_R18U_retime));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $d_samp_r3 = generate( 'dff', "d_samp_r3", 
                           BitWidth=>1,
                           PipelineDepth=>$pipe_depth-1,
                           Retime=>'YES' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d_samp_r3->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				.in(hit_valid_R16H) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				.clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				.out(hit_valid_R18H_retime));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   /* Flop R16 to R18_retime with retiming registers*/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   /* Flop R18_retime to R18 with fixed registers */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $d_samp_f1 = generate( 'dff2', "d_samp_f1", 
                           BitWidth=>$sig_fig,
                           ArraySize1=>$axis,
                           PipelineDepth=>1,
                           Retime=>'NO' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d_samp_f1->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				.in(hit_R18S_retime) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				.clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				.out(hit_R18S));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $d_samp_f2 = generate( 'dff2', "d_samp_f2", 
                           BitWidth=>$sig_fig,
                           ArraySize1=>$colors,
                           PipelineDepth=>1,
                           Retime=>'NO' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d_samp_f2->instantiate(); print { $self->{OutfileHandle} } '(';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .in(color_R18U_retime) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .out(color_R18U));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    my $d_samp_f3 = generate( 'dff', "d_samp_f3", 
                           BitWidth=>1,
                           PipelineDepth=>1,
                           Retime=>'NO' );
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $d_samp_f3->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				.in(hit_valid_R18H_retime) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				.clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				.out(hit_valid_R18H));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   /* Flop R18_retime to R18 with fixed registers */ ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/rtl/sampletest.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
