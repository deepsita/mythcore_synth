# mythcore_synth
The Synthesis of MYTH core from https://github.com/kunalg123/rvmyth.

Steps for pre synthesis simulation:

    git clone https://github.com/deepsita/mythcore_synth/
    cd rmythcore_synth/src/
    iverilog mythcore_test.v tb_mythcore_test.v
    ./a.out
    gtkwave tb_mythcore_test.vcd
    
Steps for Synthesis using Openlane: 
The cloned folder should be placed in the Designs folder 


    /openlane_build_script/openlane_working_dir/openlane/designs/
           
Now, the tool is invoked and synthesis is to be done.


    export PDK_ROOT=/openlane_build_script/openlane_working_dir/pdks/
    export IMAGE_NAME=efabless/openlane:v0.21
    docker run -it -v $(pwd):/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT -u $(id -u $USER):$(id -g $USER) $IMAGE_NAME
    ./flow.tcl -interactive
    package require openlane 0.9
    prep -design mythcore_synth
    run_synthesis
    
Now, the synthesis is run and the reports are placed in the respective reports folders of /designs/mythcore_synth/runs/reports.

Steps for Post Synthesis simulation :

The synthesised netlist is available in /designs/mythcore_synth/runs/results/.


