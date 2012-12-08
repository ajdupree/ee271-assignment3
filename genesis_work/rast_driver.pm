package rast_driver;
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
	$self->SUPER::to_verilog('/afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/verif/rast_driver.vp');
# START USER CODE FROM /afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/verif/rast_driver.vp PARSED INTO PACKAGE >>>
# line 1 "/afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/verif/rast_driver.vp"
print { $self->{OutfileHandle} } '/*';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Module: rast_driver';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * =====================';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * This file contains the driver for the rasteriser.';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * In order for this driver to work properly, the testbench';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * must do follow the following operations:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * 1. Call the InitLines() task during simulation initialization';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * 2. Set the name of the test vectors files. Example:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' *    driver.testname = "my_test.dat";';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * 3. Call the RunTest() task to start the driver';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * 4. Wait on the TestFinish signal';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Made by:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * John Brunhaver  [jbrunhaver@gmail.com]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * Ofer Shacham    [shacham@stanford.edu]';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' * ';print { $self->{OutfileHandle} } "\n"; 
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
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'module '; print { $self->{OutfileHandle} } mname(); print { $self->{OutfileHandle} } ' ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ' (';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic halt_RnnnnL ,       // Input: Indicates No Work Should Be Done';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 input logic validPoly_R13H ,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic rst,                // Input: Reset';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   input logic clk,                // Input: Clock ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	poly_R10S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0] , // Output: 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic                         isQuad_R10H,                     // Output: Is Poly Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0] 	color_R10U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0],';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic                         validPoly_R10H,                  // Output: Valid Data for Operation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic signed ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]     screen_RnnnnS[1:0],              // Output: Screen Dimensions';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output logic        [3:0]            subSample_RnnnnU,                // Output: SubSample_Interval';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   output int                       ss_w_lg2_RnnnnS   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } ');';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic   signed   ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]  tmp_poly_R10S['; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '-1:0]['; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } '-1:0] ; // Output: 4 Sets X,Y Fixed Point Values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic   unsigned ['; print { $self->{OutfileHandle} } $sig_fig; print { $self->{OutfileHandle} } '-1:0]  tmp_color_R10U['; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } '-1:0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int signed     mini = -1024;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int signed     maxi =  1024;    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int            ss_w_lg2 ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int 	      i,j,k,l,m,n;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int            eachAxis, eachVerts, eachColor;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int            eachVertsA;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // for controlling the input file';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   string  	      testname;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   string             format_header;	      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int 	      fh; //test file handle';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int 	      count;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int 	      msaa;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int 	      line_num;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   int 	      num_vertices;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   logic 	      TestFinish ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   assign ss_w_lg2_RnnnnS = ss_w_lg2;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   // Initialization method';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   task InitLines;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 $display("time=%10t ************** Driver Is Initializing Input Signals *****************", $time);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 // initialize the lines with random data (valid is off)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 isQuad_R10H     = $random();;      // Is Quad?';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 for( eachAxis = 0 ; eachAxis < '; print { $self->{OutfileHandle} } $axis; print { $self->{OutfileHandle} } ' ; eachAxis++ ) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '               for( eachVerts = 0 ; eachVerts < '; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } ' ; eachVerts++) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '		  poly_R10S[eachVerts][eachAxis] = $random();';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 for( eachColor = 0 ; eachColor < '; print { $self->{OutfileHandle} } $colors; print { $self->{OutfileHandle} } ' ; eachColor++ ) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    color_R10U[eachColor] = $random();	    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 // Set the designs screen and MSAA';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 // Should be Parameterized for Sig Fig and Radix -TODO John';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 screen_RnnnnS[0] = {1\'b1,19\'d0} ;  //Set Screen to 512 Width';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 screen_RnnnnS[1] = {1\'b1,19\'d0} ;  //Set Screen to 512 Height';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 subSample_RnnnnU = 4\'b0100 ;       //MSAA=x4';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ss_w_lg2         = 1 ;             //MSAA=x4 ss_w=2 ss_w_lg2=1';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 validPoly_R10H  = 1\'b0;          // Not Valid';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 TestFinish = 1\'b0;		  // Simulation signal to tell bench when I\'m done';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   endtask // InitLines';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   task InitTest;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 $display("time=%10t ************** Driver Is Initializing Test from File *****************", $time);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 // open test file:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 fh = $fopen(testname,"r");';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 line_num = 1;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 assert (fh) else $fatal(2, "ERROR: Cannot open file %s", testname);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 assert (!$feof(fh)) else $fatal(2, "ERROR: File -->%s<--is empty",testname);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 // read the screen parameters';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 count = $fscanf(fh, "%s" , format_header );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 assert(format_header=="JB21") else $fatal(2, "Error: Incorrect File Type" );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 count = $fscanf(fh, "%6x %6x %d", screen_RnnnnS[0], screen_RnnnnS[1], msaa);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 line_num = line_num+1;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 assert (count==3) else $fatal(2, "ERROR: Cannot find screen params");';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 $display ("Setting screen params: w=%0d h=%0d msaa=%0d", screen_RnnnnS[0]>>10, screen_RnnnnS[1]>>10, msaa);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 case (msaa) ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   1: begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      subSample_RnnnnU = 4\'b1000;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      ss_w_lg2 = 0;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   4: begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      subSample_RnnnnU = 4\'b0100;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      ss_w_lg2 = 1;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   16: begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      subSample_RnnnnU = 4\'b0010;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      ss_w_lg2 = 2;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   64: begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      subSample_RnnnnU = 4\'b0001;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	      ss_w_lg2 = 3;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	   default:';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     assert (0) else $fatal(2, "ERROR: Illigal MSAA input %d", msaa);	    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 endcase // case(msaa)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	  	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   endtask';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //START TEST';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //  This test sets up some initial values';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //   and then iterates over the entire';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   //   screen and generating micropolygons';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   task RunTest;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 $display("time=%10t ************** Driver Is Runnning Test -->%s<-- *****************", $time, testname);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 // wait a couple of cycles for the design to learn the parameters';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 repeat (2) @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 // Now start driving the signals';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 while (!$feof(fh)) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	     // Wait until the design is ready (unhalted)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 		// Even if halted, executed if BB poly out is invalid (smashing!)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    while( ! ( halt_RnnnnL | !(validPoly_R13H) ) ) @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    // read a polygon from the file\\';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    // Need to fix conversion tool to include depth';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    // Data is strongly dependent on parameterization';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    // This is brittle code!!!';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    // Need some indirection to make this better';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    count = $fscanf(fh, "%1b %1d %6x %6x %6x %6x %6x %6x %6x %6x %6x %6x %6x %6x %6x %6x %6x", ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			    validPoly_R10H, num_vertices,';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			    tmp_poly_R10S[0][0], tmp_poly_R10S[0][1], tmp_poly_R10S[0][2], ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			    tmp_poly_R10S[1][0], tmp_poly_R10S[1][1], tmp_poly_R10S[1][2],';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			    tmp_poly_R10S[2][0], tmp_poly_R10S[2][1], tmp_poly_R10S[2][2],';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			    tmp_poly_R10S[3][0], tmp_poly_R10S[3][1], tmp_poly_R10S[3][2],';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '			    tmp_color_R10U[0],   tmp_color_R10U[1],   tmp_color_R10U[2] );';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    for( eachVertsA = 0 ; eachVertsA < '; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } ' ; eachVertsA++ ) begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       poly_R10S[eachVertsA][0] = tmp_poly_R10S[eachVertsA][0] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       poly_R10S[eachVertsA][1] = tmp_poly_R10S[eachVertsA][1] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       poly_R10S[eachVertsA][2] = tmp_poly_R10S[eachVertsA][2] ;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    color_R10U[0] = tmp_color_R10U[0];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    color_R10U[1] = tmp_color_R10U[1];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    color_R10U[2] = tmp_color_R10U[2];';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    // make sure we read a polygon with either 3 or 4 vertices';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    assert (num_vertices==3 || num_vertices==4)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       else $fatal(2, "ERROR: Wrong number of vertices for polygon at line %0d", line_num);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    assert ('; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '==3 && num_vertices==3 || '; print { $self->{OutfileHandle} } $verts; print { $self->{OutfileHandle} } '==4)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       else $fatal(2, "Error: Input contains triangle pairs, should only contain singles at line %0d", line_num);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    isQuad_R10H = (num_vertices==4) ? 1\'b1:1\'b0;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    // If we were able to read the line, continue, else finish this simulation';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    if (count!=-1)begin';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       assert (count==17) else $fatal(2, "ERROR: Cannot read polygon at line %0d", line_num);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       line_num = line_num+1;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	       @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	    end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 end // while (!$feof(fh))';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 $fclose(fh);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 // stop stressing the design';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 validPoly_R10H =  1\'b0;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 // Wait until the design is done processing (unhalted)';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 while( ! halt_RnnnnL ) @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 while( ! halt_RnnnnL ) @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 while( ! halt_RnnnnL ) @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 while( ! halt_RnnnnL ) @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 // Now let the pipe clean and finish';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 repeat(10) @(posedge clk);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 TestFinish = 1\'b1;';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '	 $display("time=%10t ************** Driver Is Done *****************", $time);';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      end';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '   endtask // RunTest    ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } '      ';print { $self->{OutfileHandle} } "\n"; 
print { $self->{OutfileHandle} } 'endmodule';print { $self->{OutfileHandle} } "\n"; 
# <<< END USER CODE FROM /afs/ir.stanford.edu/users/a/s/asampat/EE271/assignment3-andrew/ee271-assignment3/verif/rast_driver.vp PARSED INTO PACKAGE


      # START PRE-GENERATED TO_VERILOG SUFFIX CODE >>>
      print STDERR "$self->{BaseModuleName}->to_verilog: Done with user code\n" 
	  if $self->{Debug} & 8;

      #
      # clean up code comes here...
      #
      # <<< END PRE-GENERATED TO_VERILOG SUFFIX CODE
  }
