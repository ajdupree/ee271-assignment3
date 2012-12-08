package top_rast;
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
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/verif/top_rast.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/verif/top_rast.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/verif/top_rast.vp"
print { $self->{OutfileHandle} } '/******************************************************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * File: top_rast.vp';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Author: Jing Pu';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Description:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * top for rast';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Change bar:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * -----------';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Date          Author   Description';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Sep 18, 1812  jingpu   init version';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ****************************************************************************/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' module '; print { $self->{OutfileHandle} } mname; print { $self->{OutfileHandle} } '();';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
    # first generate the DUT obj and get params from it
    my $dut_obj = generate_base('rast', 'rast');
    my $sig_fig = $dut_obj->get_param('SigFig');
    my $radix = $dut_obj->get_param('Radix');
    my $verts = $dut_obj->get_param('Vertices');
    my $axis = $dut_obj->get_param('Axis');
    my $colors = $dut_obj->get_param('Colors');
    my $pipes_box = $dut_obj->get_param('PipesBox');
    my $pipes_iter = $dut_obj->get_param('PipesIter');
    my $pipes_hash = $dut_obj->get_param('PipesHash');
    my $pipes_samp = $dut_obj->get_param('PipesSamp');
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   /*****************************************';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    * wires to connect design and environment';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    *****************************************/';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //DUT INPUTS';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed   ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] poly_R10S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0] ;   // 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] color_R10U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0] ;   // 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 		        isQuad_R10H ;           // Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 		        validPoly_R10H ;        // Valid Data for Operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //DUT INPUTS';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //DUT CONFIG';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed   ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] screen_RnnnnS[1:0];       // Screen Dimensions';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic          [3:0]         subSample_RnnnnU ;        // SubSample_Interval';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //DUT CONFIG';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //DUT GLOBAL';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 		        clk ;                     // Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 		        rst ;                     // Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //DUT GLOBAL';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //DUT OUTPUTS';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 		        halt_RnnnnL;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic signed   ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] hit_R18S['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0]; //Sample hit Location';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] color_R18U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0]; //Sample hit Location';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 		        hit_valid_R18H ;  //Did Sample Hit?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //DUT OUTPUTS';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // instantiate the DUT';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $dut_obj -> instantiate(); print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .poly_R10S(poly_R10S) ,            // Input: 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .color_R10U(color_R10U) ,            // Input: 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .isQuad_R10H (isQuad_R10H) ,       // Input: Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .validPoly_R10H(validPoly_R10H) ,  // Input: Valid Data for Operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .screen_RnnnnS(screen_RnnnnS) ,        // Input: Screen Dimensions';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .subSample_RnnnnU (subSample_RnnnnU),  // Input: SubSample_Interval';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .clk(clk),                             // Input: Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .rst(rst),                             // Input: Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .halt_RnnnnL(halt_RnnnnL), ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .hit_R18S(hit_R18S),             // Output: Sample Location Tested';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .color_R18U(color_R18U) ,            // Input: 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .hit_valid_R18H(hit_valid_R18H)  // Output: Does Sample lie in uPoly     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	// generate clocker';print { $self->{OutfileHandle} } "\n"; 
    my $clk_obj = generate('clocker', 'clocker', Period=>1000);
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $clk_obj -> instantiate(); print { $self->{OutfileHandle} } '  ( .clk(clk) );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // generate testbench';print { $self->{OutfileHandle} } "\n"; 
     my $bench_obj = generate( 'testbench', "testbench", 
	                        SigFig=>$sig_fig,
	                        Radix=>$radix,
	                        Vertices=>$verts,
	                        Axis=>$axis,
	                        Colors=>$colors,
	                        PipesBox=>$pipes_box,
	                        PipesIter=>$pipes_iter,
	                        PipesHash=>$pipes_hash,
	                        PipesSamp=>$pipes_samp,
	                        DUT_obj=>$dut_obj);
print { $self->{OutfileHandle} } '   '; print { $self->{OutfileHandle} } $bench_obj -> instantiate(); print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      // Output Signals (to DUT inputs)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      .poly_R10S(poly_R10S) ,            ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .color_R10U(color_R10U) ,           ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .isQuad_R10H (isQuad_R10H) ,     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .validPoly_R10H(validPoly_R10H) ,  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	          // Output Control Signals (to DUT inputs)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .screen_RnnnnS(screen_RnnnnS) ,        ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .subSample_RnnnnU (subSample_RnnnnU), ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	          // Global Signals ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .clk(clk),                            ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .rst(rst),                            ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	          // Input Control Signals (from DUT outputs)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .halt_RnnnnL(halt_RnnnnL), ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	          // Input Signals (from DUT outputs)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .hit_R18S(hit_R18S),             ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .color_R18U(color_R18U) ,          ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     .hit_valid_R18H(hit_valid_R18H)  ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule //';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/verif/top_rast.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
