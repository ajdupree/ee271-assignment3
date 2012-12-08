package testbench;
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
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/testbench.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/testbench.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/testbench.vp"
print { $self->{OutfileHandle} } ' /*   Simulation bench for Hider';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  *   Author: John Brunhaver, Ofer Shacham';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  *   Created:          09/21/09';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  *   Last Updated:     10/06/10';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  *   Copyright 2009 <jbrunhaver@gmail.com>  <shacham@stanford.edu> ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '/* ***************************************************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Change bar:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * -----------';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Date           Author    Description';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Sep 20, 2012   jingpu    ported from John\'s original code to Genesis';print { $self->{OutfileHandle} } "\n"; 
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
                            Val=>3, Min=>1, Step=>1, 
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
 my $dut_obj    = parameter(Name=>'DUT_obj',
                            Val=>0, 
                            Doc=>"the dut pbj pointer");
 # local variables
 my $delay_r2z_mon = $pipes_samp;
 my $delay_r2z_sb = $pipes_samp;
 my $delay_bbx_sb = $pipes_box;
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '//Environment Constants';print { $self->{OutfileHandle} } "\n"; 
 #`define T_CLK 1000
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
 #`timescale 1ps/1ps
print { $self->{OutfileHandle} } '//Environment Constants';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'module '; print { $self->{OutfileHandle} } mname(); print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '(';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     // Output Signals (to DUT inputs)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     output logic signed   ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]  poly_R10S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0] , // Poly Position';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     output logic unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]  color_R10U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0] ,         // Color of Poly';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     output logic 	                isQuad_R10H ,                    // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     output logic 	                validPoly_R10H ,                 // Valid Data for Operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     // Output Control Signals (to DUT inputs)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     output logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]    screen_RnnnnS[1:0] , // Screen Dimensions';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     output logic        [3:0]   	subSample_RnnnnU ,   // SubSample_Interval';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     // Global Signals ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     input logic                        clk,                 // Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     output logic                        rst,                 // Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     // Input Control Signals (from DUT outputs)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     input logic                       halt_RnnnnL,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 input logic											 poly_R13S,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     // Input Signals (from DUT outputs)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     input logic signed   ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] hit_R18S['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0],       // Hit Location';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     input logic unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] color_R18U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0] ,  // Color of Poly ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     input logic                       hit_valid_R18H            // Is this a hit?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ');';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Some simulation variables';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int seed;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int timeout;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int dummy; // for random number generator initialization';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   string  testname;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int ss_w_lg2_RnnnnS;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //BENCH Logical Signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 		       test_finish;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   /*****************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   * Instance Driver';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   *****************************************/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //probably need to fix....';print { $self->{OutfileHandle} } "\n"; 
     my $rast_driver = generate( 'rast_driver', "rast_driver", 
	                        SigFig=>$sig_fig,
	                        Radix=>$radix,
	                        Vertices=>$verts,
	                        Axis=>$axis,
	                        Colors=>$colors);
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $rast_driver -> instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .halt_RnnnnL('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.halt_RnnnnL) ,  // Input:  Indicates No Work Should Be Done';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .validPoly_R13H('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.validPoly_R13H) ,  // Input: indicates state of BBox output ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.poly_R10S(poly_R10S) ,                // Output: 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .isQuad_R10H(isQuad_R10H)  ,           // Output: Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .color_R10U(color_R10U) ,              // Output: Color of Polygon';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .validPoly_R10H(validPoly_R10H),       // Output: Valid Data for Operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .screen_RnnnnS(screen_RnnnnS) ,        // Output: Screen Dimensions';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .subSample_RnnnnU(subSample_RnnnnU),   // Output: SubSample_Interval';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .ss_w_lg2_RnnnnS(ss_w_lg2_RnnnnS),     // Output: SubSample_Interval';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .clk(clk),                             // Input:  Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .rst(rst)                              // Input:  Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   /******************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   * ZBuff Model';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ******************************************/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    ';print { $self->{OutfileHandle} } "\n"; 
	 my $zbuff = generate( 'zbuff', "zbuff", 
	                        SigFig=>$sig_fig,
	                        Radix=>$radix,
	                        Vertices=>$verts,
	                        Axis=>$axis,
	                        Colors=>$colors,
	                        Filename=>"f_image.ppm");
print { $self->{OutfileHandle} } '    '; print { $self->{OutfileHandle} } $zbuff -> instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .clk(clk),                // Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .rst(rst),                // Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .screen_RnnnnS(screen_RnnnnS) ,        // Output: Screen Dimensions';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .subSample_RnnnnU(subSample_RnnnnU),   // Output: SubSample_Interval';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .ss_w_lg2_RnnnnS(ss_w_lg2_RnnnnS),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     .hit_R18S(hit_R18S),             //Sample Location and depth';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .color_R18U(color_R18U),         //Color of Sample Hit';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .hit_valid_R18H(hit_valid_R18H)  //Is sample hit valid';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   /*****************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   * Instance Scoreboards';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   *****************************************/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    ';print { $self->{OutfileHandle} } "\n"; 
	 my $bbx_sb = generate( 'bbx_sb', "bbx_sb", 
	                        SigFig=>$sig_fig,
	                        Radix=>$radix,
	                        Vertices=>$verts,
	                        Axis=>$axis,
	                        Colors=>$colors,
	                        PipelineDepth=>$delay_bbx_sb,
	                        Filename=>"sb_log/bbx_sb.log");
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $bbx_sb -> instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		   .poly_R10S(poly_R10S) ,                      // Input: 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		   .validPoly_R10H(validPoly_R10H),             // Input: Valid Polygon';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   	   .isQuad_R10H(isQuad_R10H) ,                  // Input: Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		   .poly_R13S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.poly_R13S) ,            // Input: 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		   .box_R13S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.box_R13S),		// Input: Bound Box';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		   .validPoly_R13H('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.validPoly_R13H) ,  // Input: Valid Data for Operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		   .isQuad_R13H('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.isQuad_R13H) ,        // Input: Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			       .invalidate_R10H('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.bbox.invalidate_R10H),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		   .clk(clk),                                   // Input: Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		   .rst(rst),                                   // Input: Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		   .halt_RnnnnL('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.halt_RnnnnL),         // Input: Halt Signal			';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		   .screen_RnnnnS(screen_RnnnnS),               // Screen Size';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	           .subSample_RnnnnU (subSample_RnnnnU)         // Flag for subsample';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '							       ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
     my $smpl_sb = generate( 'smpl_sb', "smpl_sb", 
	                        SigFig=>$sig_fig,
	                        Radix=>$radix,
	                        Vertices=>$verts,
	                        Axis=>$axis,
	                        Colors=>$colors,
	                        PipelineDepth=>$delay_r2z_sb,
	                        Filename=>"sb_log/smpl_sb.log");
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $smpl_sb -> instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 		 .poly_R16S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.poly_R16S),           // 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .color_R16U('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.color_R16U),         // Polygon Color';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .isQuad_R16H('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.isQuad_R16H),       // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 	 .validSamp_R16H('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.validSamp_R16H), ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .sample_R16S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.sample_R16S),       // Will change for JIT -todo';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  			 .clk(clk),                // Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' 			 .rst(rst),                // Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .hit_R18S(hit_R18S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .color_R18U(color_R18U),         // Polygon Color			      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .hit_valid_R18H(hit_valid_R18H) ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '								   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			  );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			  ';print { $self->{OutfileHandle} } "\n"; 
     my $smpl_cnt_sb = generate( 'smpl_cnt_sb', "smpl_cnt_sb", 
	                        SigFig=>$sig_fig,
	                        Radix=>$radix,
	                        Vertices=>$verts,
	                        Axis=>$axis,
	                        Colors=>$colors,
	                        PipelineDepth=>$delay_r2z_sb+1,
	                        Filename=>"sb_log/smpl_cnt_sb.log");
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $smpl_cnt_sb -> instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 		 .poly_R16S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.poly_R16S),           // 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .color_R16U('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.color_R16U),         // Polygon Color';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .isQuad_R16H('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.isQuad_R16H),       // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 	 .validSamp_R16H('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.validSamp_R16H), ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .sample_R16S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.sample_R16S),       // Will change for JIT -todo';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  			 .clk(clk),                // Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' 			 .rst(rst),                // Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .hit_R18S(hit_R18S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .color_R18U(color_R18U),         // Polygon Color			      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .hit_valid_R18H(hit_valid_R18H) ,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 	 .screen_RnnnnS(screen_RnnnnS),         // Screen Size';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	                 .subSample_RnnnnU(subSample_RnnnnU),    // Flag for subsample';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '							   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .s_x_RnnS('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.hash_jtree.sample_R14S[0]) ,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '                         .s_y_RnnS('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.hash_jtree.sample_R14S[1]) ,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '                         .jitter_x_RnnS('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.hash_jtree.jitt_val_R14H[0]) ,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '                         .jitter_y_RnnS('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.hash_jtree.jitt_val_R14H[1]) ,  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .s_j_x_RnnS('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.hash_jtree.sample_jitted_R14S[0]),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .s_j_y_RnnS('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.hash_jtree.sample_jitted_R14S[1])';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	/*****************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   * Instance Monitors';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   *****************************************/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
     my $perf_mon = generate( 'perf_monitor', "perf_mon", 
	                        SigFig=>$sig_fig,
	                        Radix=>$radix,
	                        Vertices=>$verts,
	                        Axis=>$axis,
	                        Colors=>$colors,
	                        PipelineDepth=>$delay_r2z_mon);
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $perf_mon -> instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .poly_R10S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.poly_R10S),           // ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 		 .poly_R16S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.poly_R16S),           // 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .color_R16U('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.color_R16U),         // Polygon Color';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .isQuad_R16H('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.isQuad_R16H),       // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 	 .validSamp_R16H('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.validSamp_R16H), ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .sample_R16S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.sample_R16S),       // Will change for JIT -todo';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  			 .clk(clk),                // Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' 			 .rst(rst),                // Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .hit_R18S(hit_R18S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .color_R18U('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.color_R18U),         // Polygon Color			      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .hit_valid_R18H(hit_valid_R18H) ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '									   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '									   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '									   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
    if(0) { # turn this off when you run big test vectors
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
     my $gm2rst_mon = generate( 'gm2rst_monitor', "gm2rst_mon", 
	                        SigFig=>$sig_fig,
	                        Radix=>$radix,
	                        Vertices=>$verts,
	                        Axis=>$axis,
	                        Colors=>$colors,
	                        Filename=>"mon_log/gm2rst.log");
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $gm2rst_mon -> instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.poly_R10S(poly_R10S) ,            // Input: 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.isQuad_R10H (isQuad_R10H) ,       // Input: Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.validPoly_R10H(validPoly_R10H) ,  // Input: Valid Data for Operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.screen_RnnnnS(screen_RnnnnS) ,        // Input: Screen Dimensions';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.subSample_RnnnnU (subSample_RnnnnU),  // Input: SubSample_Interval';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.clk(clk),                             // Input: Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.rst(rst),                             // Input: Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		        .halt_RnnnnL('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.halt_RnnnnL)     // Input: Halt Signal			';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '								     );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
        my $bbx2trsl_mon = generate( 'bbx2trsl_monitor', "bbx2trsl_mon", 
	                        SigFig=>$sig_fig,
	                        Radix=>$radix,
	                        Vertices=>$verts,
	                        Axis=>$axis,
	                        Colors=>$colors,
	                        Filename=>"mon_log/bbx2trsl.log");
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $bbx2trsl_mon -> instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.poly_R13S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.poly_R13S) ,            // Input: 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.isQuad_R13H('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.isQuad_R13H) ,// Input: Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.box_R13S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.box_R13S),					     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.validPoly_R13H('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.validPoly_R13H) ,  // Input: Valid Data for Operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '						     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.clk(clk),                             // Input: Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.rst(rst),                             // Input: Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.halt_RnnnnL('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.halt_RnnnnL)     // Input: Halt Signal			';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '									   );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
     my $trsl2smpl_mon = generate( 'trsl2smpl_monitor', "trsl2smpl_mon", 
	                        SigFig=>$sig_fig,
	                        Radix=>$radix,
	                        Vertices=>$verts,
	                        Axis=>$axis,
	                        Colors=>$colors,
	                        Filename=>"mon_log/trsl2smple.log");
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $trsl2smpl_mon -> instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.box_R13S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.box_R13S),               //Bounding Box       ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.box_R14S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.test_iterator.box_R14S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' 			.poly_R14S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.poly_R14S) ,           ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.isQuad_R14H('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.isQuad_R14H) ,                    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.sample_R14S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.sample_R14S),         //Sample Location ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.validSamp_R14H('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.validSamp_R14H),   // Valid Data for Operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.clk(clk),                                       // Input: Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.rst(rst),                                       // Input: Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '				     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			.halt_RnnnnL('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.halt_RnnnnL)              // Input: Halt Signal';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '										);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   							   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '										';print { $self->{OutfileHandle} } "\n"; 
     my $rst2zbuff_mon = generate( 'rst2zbuff_monitor', "rst2zbuff_mon", 
	                        SigFig=>$sig_fig,
	                        Radix=>$radix,
	                        Vertices=>$verts,
	                        Axis=>$axis,
	                        Colors=>$colors,
	                        PipelineDepth=>$delay_r2z_mon,
	                        Filename=>"mon_log/rst2zbuff.log");
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $rst2zbuff_mon -> instantiate(); print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 		 .poly_R16S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.poly_R16S),           // 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .color_R16U('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.color_R16U),         // Polygon Color';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .isQuad_R16H('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.isQuad_R16H),       // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		 	 .validSamp_R16H('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.validSamp_R16H), ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .sample_R16S('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.sample_R16S),       // Will change for JIT -todo';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '  			 .clk(clk),                // Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' 			 .rst(rst),                // Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .hit_R18S(hit_R18S),';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .color_R18U('; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '.color_R18U),         // Polygon Color			      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			 .hit_valid_R18H(hit_valid_R18H) ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '									   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '									   );';print { $self->{OutfileHandle} } "\n"; 
	 }
print { $self->{OutfileHandle} } '		';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   /*****************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    * Main simulation task';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    *****************************************/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   initial begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      rst = 1\'b1;    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      '; print { $self->{OutfileHandle} } $rast_driver->iname(); print { $self->{OutfileHandle} } '.InitLines();';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $display("time=%10t ************** Loading Arguments *****************", $time);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ProcessArgs();';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '       $display("Seed=%d ", seed);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      dummy = $random(seed); // initial the random number generator';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      repeat (15) @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      '; print { $self->{OutfileHandle} } $rast_driver->iname(); print { $self->{OutfileHandle} } '.testname = testname; // tell the driver what to drive';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      '; print { $self->{OutfileHandle} } $rast_driver->iname(); print { $self->{OutfileHandle} } '.InitTest();';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      repeat (15) @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      '; print { $self->{OutfileHandle} } $zbuff->iname(); print { $self->{OutfileHandle} } '.init_buffers();';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      repeat (15) @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $display("time=%10t ************** Runnning Test *****************", $time);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      rst = 1\'b0;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      if ($test$plusargs("af")) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 $toggle_start(); //start activity factor extraction';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      '; print { $self->{OutfileHandle} } $rast_driver->iname(); print { $self->{OutfileHandle} } '.testname = testname; // tell the driver what to drive';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      '; print { $self->{OutfileHandle} } $rast_driver->iname(); print { $self->{OutfileHandle} } '.RunTest(); // Tell the driver to start';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      while (!'; print { $self->{OutfileHandle} } $rast_driver->iname(); print { $self->{OutfileHandle} } '.TestFinish) // wait for driver to finish';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	@(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      repeat (15) @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      if ($test$plusargs("af")) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 $toggle_stop(); //activity factor extraction end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      end  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      '; print { $self->{OutfileHandle} } $zbuff->iname(); print { $self->{OutfileHandle} } '.write_image();';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '       if ($test$plusargs("af")) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	  $display("time=%10t ******* Printing AF Extraction *********\\n",$time);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	  $toggle_report("af_extraction.saif",1.0e-9,'; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } ');	  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '       end  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $display("time=%10t ********************FINISH***********************", $time);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $display("Cycles: %d uPoly: %d sampleTests: %d sampleHits: %d \\n" ,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       '; print { $self->{OutfileHandle} } $perf_mon->iname(); print { $self->{OutfileHandle} } '.cycle_count  , '; print { $self->{OutfileHandle} } $perf_mon->iname(); print { $self->{OutfileHandle} } '.micropolygon_count ,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       '; print { $self->{OutfileHandle} } $perf_mon->iname(); print { $self->{OutfileHandle} } '.sample_count , '; print { $self->{OutfileHandle} } $perf_mon->iname(); print { $self->{OutfileHandle} } '.sample_hit_count );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $display("JJ: uPoly / cycle : %f " , (1.0*'; print { $self->{OutfileHandle} } $perf_mon->iname(); print { $self->{OutfileHandle} } '.micropolygon_count)/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       (1.0* '; print { $self->{OutfileHandle} } $perf_mon->iname(); print { $self->{OutfileHandle} } '.cycle_count));';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $display("JJ: cycle / uPoly : %f " , ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       (1.0* '; print { $self->{OutfileHandle} } $perf_mon->iname(); print { $self->{OutfileHandle} } '.cycle_count)/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       (1.0*'; print { $self->{OutfileHandle} } $perf_mon->iname(); print { $self->{OutfileHandle} } '.micropolygon_count) );   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      //Call Function for Zbuff write out.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $finish(2);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end // initial begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Timeout mechanism';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   initial begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      repeat(timeout) @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '       $display("time=%10t ***************** ERROR: TIMEOUT  *******************", $time);     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      $finish(2);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   /****************************************************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    * Auxiliary Tasks:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    * *************************************************************************/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   task ProcessArgs;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '         // if this is a "+wave" run, it must record all signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '         if ( $test$plusargs("wave") ) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '            //         levels  instance';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '            $display("time=%10t Starting Wave Capture", $time);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '            /*';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $vcdpluson(0,'; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } '); //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '            $vcdpluson(0,rast_driver); //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '            $vcdpluson(0,bbox_scoreboard); //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '            $vcdpluson(0,sampletest_scoreboard); //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '            $vcdpluson(0,sampletest_count_scoreboard); //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '            ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $vcdplusmemon(0,'; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } ');';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $vcdplusmemon(0,rast_driver); //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '            $vcdplusmemon(0,bbox_scoreboard); //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '            $vcdplusmemon(0,sampletest_scoreboard); //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '            $vcdplusmemon(0,sampletest_count_scoreboard); //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $vcdplusmemon(0,'; print { $self->{OutfileHandle} } $zbuff->iname(); print { $self->{OutfileHandle} } '.hit_R18S); //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $vcdplusmemon(0,'; print { $self->{OutfileHandle} } $zbuff->iname(); print { $self->{OutfileHandle} } '.color_R18U); //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $vcdplusmemon(0,'; print { $self->{OutfileHandle} } $zbuff->iname(); print { $self->{OutfileHandle} } '.color); //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $vcdpluson(0,zbuff); //';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '            */';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $vcdplusmemon(0);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $vcdpluson(0);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '         end // if ( $test$plusargs("wave") )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 if ( $test$plusargs("af") ) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $set_gate_level_monitoring("rtl_on");';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $set_toggle_region( '; print { $self->{OutfileHandle} } $dut_obj->get_instance_path(); print { $self->{OutfileHandle} } ' ); //select scope for aqctivity factor extraction';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '         // look for +seed+12345 runtime args';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '         if ($test$plusargs("seed")) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $value$plusargs("seed=%d", seed);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $display("Simulation will run with random seed=%0d", seed);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '         end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '         else begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    seed=12345;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $display("Simulation run with default random seed=%0d", seed);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '         // look for +timout+1000 runtime args';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '         if ($test$plusargs("timeout")) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $value$plusargs("timeout=%d", timeout);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $display("Simulation will timout after %0d cycles", timeout);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '         end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '         else begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    timeout=50000000 ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $display("Simulation will timout after %0d cycles", timeout);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 // look for +testname=sample_test.dat type of argument';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '         if ($test$plusargs("testname")) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $value$plusargs("testname=%s", testname);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $display("Simulation will use test file %s", testname);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '         end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '         else begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    testname="tests/sample_test.dat";';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    $display("Simulation will use test file %s", testname);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   endtask // ProcessArgs';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   /****************************************************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    * Auxiliary Tasks:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    * *************************************************************************/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule ';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/testbench.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
