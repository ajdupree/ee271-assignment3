# EE271 Project, Fall 2012
This project implements a Genesis baked framework for micro-polygon rasterizer,
including C++ gold model, verification and synthesis.

### Work Flow:

1. setup environment

        source /usr/class/ee271/setup_ee271.cshrc

2. To compile gold model:
    
        make comp_gold

3. To run gold model:

        ./rast_gold outputfile inputfile

 Example:
	
     ./rast_gold out.ppm $EE271_VECT/vec_271_01_sv.dat
     diff out.ppm $EE271_VECT/vec_271_01_sv_ref.ppm #for checking
 

4. To run verification

        make run RUN="any runtime arguments"

  Supported runtime arguments:
  
      +wave		    	    : Start wave capture
      +seed=seed_value	    : Init the random number generator with seed seed_value
      +timeout=timeout_value	: Kill simulation if not done within timeout_value
      +testname=test_name	    : Use testfile test_name

  Example 1 ( run with all default arguments ):
  
      make clean run	# defaultly, taking tests/sample_test.dat as testfile
      gimp sv_out.ppm 	# view the output image  	

  Example 2 ( run a vect from vect library, view image, test for difference):
  
      make clean run RUN="+testname=$EE271_VECT/vec_271_00_sv.dat"
      gimp sv_out.ppm 	# view the output image  	
      diff sv_out.ppm $EE271_VECT/vec_271_00_sv_ref.ppm


5. To run synthesis

        make run_dc

 Example (run synth with a different target clock cycle)

     make run_dc CLK_PERIOD=0.8


6. clean rules

        make clean 		# clean some files so you can run things again
        
  or 

      make cleanall 	# clean all generated files



### File Structure:

	- doc/			Tex source and resource files for document (not included in assignments)
    - gold/			Source files of CPP gold model and C DPI fnctions
    - rtl/			Genesis source files for rtl design
    - synth/		Synthesis folder - dc scripts and synth log and reports
    - tests/		Default test vectors
	- tools/		Some scripts for generating test vectors (not included in assignments)
    - verif/		Genesis source files for verification framework
    - empty.xml		an empty input config file for Genesis compile
    - Makefile		Make file for this flow
    - README.md		Readme file in Markdown format 