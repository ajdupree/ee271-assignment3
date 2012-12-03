package perf_monitor;
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
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/perf_monitor.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/perf_monitor.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/perf_monitor.vp"
print { $self->{OutfileHandle} } '/*';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Performance monitor ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * This module monitors the number of sample hits and the cycle counts';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Author: John Brunhaver, Ofer Shacham';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Created:          09/21/09';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Last Updated:     10/06/10';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Copyright 2009 <jbrunhaver@gmail.com>  <shacham@stanford.edu> ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' /****************************************************************************';print { $self->{OutfileHandle} } "\n"; 
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

 # some handful subroutines

 # Convert a Fixed Point Number to a Floating
 sub unFix {
   my $signal_name = shift @_;
   my $radix = shift @_;
   return " 1.0 * $signal_name / ( 128\'d1 << $radix ) ";
 }
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
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Pipe Signals for Later Evaluation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed   ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]  poly_RnnS['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0];    // 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed   ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]  poly_Rn1S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0];    // 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 		        isQuad_RnnH;                       // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 		        validSamp_RnnH;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Pipe Signals for Later Evaluation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
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
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
      	 my $d_011 = generate( 'dff3', "d_011", 
	                        BitWidth=>$sig_fig,
	                        ArraySize1=>$verts,
	                        ArraySize2=>$axis,
	                        PipelineDepth=>$pipe_depth-1,
	                        Retime=>'NO' );
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_011->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 .in(poly_R16S) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out(poly_Rn1S));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 			 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 						';print { $self->{OutfileHandle} } "\n"; 
	 my $d_04 = generate( 'dff', "d_04", 
	                        BitWidth=>2,
	                        PipelineDepth=>$pipe_depth,
	                        Retime=>'NO' );
print { $self->{OutfileHandle} } '	';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	'; print { $self->{OutfileHandle} } $d_04->instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 .in({validSamp_R16H, isQuad_R16H}) , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .clk(clk) , .reset(rst), .en(1\'b1),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     .out({validSamp_RnnH, isQuad_RnnH}));	        ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '					 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int sample_count;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int sample_hit_count;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int micropolygon_count;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int cycle_count;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Count the total Number of Valid Samples';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   initial begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      sample_count = 0;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      sample_hit_count = 0;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      micropolygon_count = 0;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      cycle_count = 0 ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      @(negedge rst) ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      while(1) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 sample_count = validSamp_RnnH ? (sample_count + 1) : sample_count;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 sample_hit_count = ( validSamp_RnnH && hit_valid_R18H ) ? ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			    ( sample_hit_count + 1 ) : sample_hit_count;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 micropolygon_count = ( poly_Rn1S != poly_RnnS ) ?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      ( micropolygon_count + 1 ) : micropolygon_count;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 cycle_count++ ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 if (sample_count % 100000 == 0) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		$display("time=%10t \\t%10d samples processed, %10d of them hit", $time, sample_count, sample_hit_count);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Count the total Number of Valid Samples';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/perf_monitor.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
