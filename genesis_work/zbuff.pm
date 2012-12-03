package zbuff;
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
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/zbuff.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/zbuff.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/zbuff.vp"
print { $self->{OutfileHandle} } '/*';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  zbuff.v';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Model of a z-buffer';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Inputs:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Sample Location';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Sample Hit';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Sample Depth';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Sample Color';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Outputs:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   None -> Writes an image file at simulation end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *  Function:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Implement Zbuffer algorithm';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Write image at simualtion end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Author: John Brunhaver';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Created:      Mon 10/18/10';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Last Updated: Mon 10/18/10';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *   Copyright 2010 <jbrunhaver@gmail.com>   ';print { $self->{OutfileHandle} } "\n"; 
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
 my $filename   = parameter(Name=>'Filename',
                            Val=>"f_image.ppm", 
                            Doc=>"Output image file name");
print { $self->{OutfileHandle} } '// TODO: comput log2 using perl function';print { $self->{OutfileHandle} } "\n"; 
 my $fb_l2     = parameter(Name=>'FB_log2',
                            Val=>11, Min=>1, Step=>1, 
                            Doc=>"Log_2 of Greatest Pixel Width");
 my $fb     = parameter(Name=>'FB',
                            Val=>2048, Min=>1, Step=>1, 
                            Doc=>"Greatest Pixel Width or Pixel Height for simulation");
 my $ss_l2     = parameter(Name=>'SS_log2',
                            Val=>2, Min=>1, Step=>1, 
                            Doc=>"Number of bits needed for maximum subsampling index");
 my $ss     = parameter(Name=>'SS',
                            Val=>4, Min=>1, Step=>1, 
                            Doc=>"Greatest number of x ind needed for subsampling 4-> 16x MSAA");
 my $colorP     = parameter(Name=>'ColorP',
                            Val=>12, Min=>1, Step=>1, 
                            Doc=>"Bits of Precision in Color");
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
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'import "DPI" pure function ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'int zbuff_init( int w,    //Screen Width';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		int h,    //Screen Width';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		int ss_w  //Subsample Width';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		); ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'import "DPI" pure function    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'int zbuff_rop(  int x ,   //Hit Loc. X';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		int y ,   //Hit Loc. Y';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		int ss_x ,  //'; print { $self->{OutfileHandle} } $ss; print { $self->{OutfileHandle} } ' Hit loc X';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		int ss_y ,  //'; print { $self->{OutfileHandle} } $ss; print { $self->{OutfileHandle} } ' Hit Loc Y';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		int d , //actually a uint';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		int R , //actually a ushort';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		int G , //actually a ushort';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		int B   //actually a ushort';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		) ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'import "DPI" pure function ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'int write_ppm( );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'module '; print { $self->{OutfileHandle} } mname(); print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ( ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     input logic                     clk,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     input logic                     rst,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     input logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] screen_RnnnnS[1:0],              // Input: Screen Dimensions';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     input logic        [3:0]        subSample_RnnnnU,                // Input: SubSample_Interval';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     input int                   ss_w_lg2_RnnnnS,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     input logic signed   ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] hit_R18S['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0],';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     input logic unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] color_R18U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0],';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     input logic                       hit_valid_R18H';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    //                               ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic unsigned ['; print { $self->{OutfileHandle} } $fb_l2; print { $self->{OutfileHandle} } '-1:0]  x_ind;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic unsigned ['; print { $self->{OutfileHandle} } $fb_l2; print { $self->{OutfileHandle} } '-1:0]  y_ind;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic unsigned ['; print { $self->{OutfileHandle} } $ss_l2; print { $self->{OutfileHandle} } '-1:0]  x_ss_ind;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic unsigned ['; print { $self->{OutfileHandle} } $ss_l2; print { $self->{OutfileHandle} } '-1:0]  y_ss_ind;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] depth;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] color['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int unsigned     x_max ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int unsigned     y_max ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int unsigned     ss_max ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int unsigned     ss_rate ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]           zero ;                     //fudge signal to hold zero as a reset value';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic [127:0] 		big_zero;                 //fudge signal to hold zero as a reset value';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign big_zero = 128\'d0;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign zero = big_zero['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  depth = unsigned\'(hit_R18S[2]);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  x_ind = hit_R18S[0][('; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '+'; print { $self->{OutfileHandle} } $fb_l2; print { $self->{OutfileHandle} } '-1):'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign  y_ind = hit_R18S[1][('; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '+'; print { $self->{OutfileHandle} } $fb_l2; print { $self->{OutfileHandle} } '-1):'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //Brittle Only works for '; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '=3';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign color[0] = color_R18U[0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign color[1] = color_R18U[1];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign color[2] = color_R18U[2];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign x_max = screen_RnnnnS[0]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign y_max = screen_RnnnnS[1]['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   always_comb begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      unique case ( subSample_RnnnnU )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b1000 ): x_ss_ind['; print { $self->{OutfileHandle} } $ss_l2; print { $self->{OutfileHandle} } '-1:0] =   zero['; print { $self->{OutfileHandle} } $ss_l2; print { $self->{OutfileHandle} } '-1:0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b0100 ): x_ss_ind['; print { $self->{OutfileHandle} } $ss_l2; print { $self->{OutfileHandle} } '-1:0] = { zero['; print { $self->{OutfileHandle} } $ss_l2; print { $self->{OutfileHandle} } '-1:1] , hit_R18S[0]['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-1] }  ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b0010 ): x_ss_ind['; print { $self->{OutfileHandle} } $ss_l2; print { $self->{OutfileHandle} } '-1:0] = { zero['; print { $self->{OutfileHandle} } $ss_l2; print { $self->{OutfileHandle} } '-1:1] , hit_R18S[0]['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-2] }  ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b0001 ): x_ss_ind['; print { $self->{OutfileHandle} } $ss_l2; print { $self->{OutfileHandle} } '-1:0] = {                   hit_R18S[0]['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-3] }  ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      endcase // case ( subSample_RnnnnU )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      unique case ( subSample_RnnnnU )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b1000 ): y_ss_ind['; print { $self->{OutfileHandle} } $ss_l2; print { $self->{OutfileHandle} } '-1:0] =   zero['; print { $self->{OutfileHandle} } $ss_l2; print { $self->{OutfileHandle} } '-1:0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b0100 ): y_ss_ind['; print { $self->{OutfileHandle} } $ss_l2; print { $self->{OutfileHandle} } '-1:0] = { zero['; print { $self->{OutfileHandle} } $ss_l2; print { $self->{OutfileHandle} } '-1:1] , hit_R18S[1]['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-1] }  ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b0010 ): y_ss_ind['; print { $self->{OutfileHandle} } $ss_l2; print { $self->{OutfileHandle} } '-1:0] = { zero['; print { $self->{OutfileHandle} } $ss_l2; print { $self->{OutfileHandle} } '-1:1] , hit_R18S[1]['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-2] }  ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b0001 ): y_ss_ind['; print { $self->{OutfileHandle} } $ss_l2; print { $self->{OutfileHandle} } '-1:0] = {                   hit_R18S[1]['; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-1:'; print { $self->{OutfileHandle} } $radix; print { $self->{OutfileHandle} } '-3] }  ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      endcase // case ( subSample_RnnnnU )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      unique case ( subSample_RnnnnU )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b1000 ): ss_max = 1  ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b0100 ): ss_max = 2  ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b0010 ): ss_max = 4  ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b0001 ): ss_max = 8  ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      endcase // case ( subSample_RnnnnU )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      unique case ( subSample_RnnnnU )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b1000 ): ss_rate = 1  ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b0100 ): ss_rate = 4  ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b0010 ): ss_rate = 16 ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	(4\'b0001 ): ss_rate = 64 ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      endcase // case ( subSample_RnnnnU )';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   always @(posedge clk) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      #25;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 if( hit_valid_R18H && ~rst ) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    zbuff_rop(  x_ind ,   //Hit Loc. X';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			y_ind ,   //Hit Loc. Y';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			x_ss_ind ,  //'; print { $self->{OutfileHandle} } $ss; print { $self->{OutfileHandle} } ' Hit loc X';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			y_ss_ind ,  //'; print { $self->{OutfileHandle} } $ss; print { $self->{OutfileHandle} } ' Hit Loc Y';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			depth , //actually a uint';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			color[0] , //actually a ushort';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			color[1] , //actually a ushort';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			color[2]  //actually a ushort';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		) ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 end			   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '     ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   task init_buffers;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 $display("time=%10t ************** Initializing FB and ZB *****************", $time);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 #10;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 zbuff_init( x_max,    //Screen Width';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		     y_max,    //Screen Width';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		     ss_max  //Subsample Width';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		     ); ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 $display("time=%10t ************** Finished Init FB and ZB *****************", $time);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   endtask';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   task write_image;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 #10;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 $display("time=%10t ************** Writing Final Image to File *****************", $time);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 #10;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 write_ppm( );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 #10;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 $display("time=%10t ************** Finished Final Image to File *****************", $time);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 #10;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   endtask //write_image';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/j/ajdupree/assignment3/verif/zbuff.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
