# mythcore_synth
The Synthesis of MYTH core given by KunalGhosh VSDCorp.(https://github.com/kunalg123/rvmyth)

Steps for pre synthesis simulation:

    git clone https://github.com/deepsita/mythcore_synth/
    cd mythcore_synth/presynthesis/
    iverilog mythcore_test.v tb_mythcore_test.v
    ./a.out
    gtkwave tb_mythcore_test.vcd
    
Steps for Synthesis using Openlane: 
The "mythcore" folder should be placed in the Designs folder i.e., 


    /openlane_build_script/openlane_working_dir/openlane/designs/
           
Now, the tool is invoked and synthesis is to be done.


    export PDK_ROOT=/openlane_build_script/openlane_working_dir/pdks/
    export IMAGE_NAME=efabless/openlane:v0.21
    docker run -it -v $(pwd):/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT -u $(id -u $USER):$(id -g $USER) $IMAGE_NAME
    ./flow.tcl -interactive
    package require openlane 0.9
    prep -design mythcore
    run_synthesis
    
Now, the synthesis is run and the reports are placed in the respective reports folders of /designs/mythcore/runs/reports.

The synthesised netlist is available in /designs/mythcore/runs/results/synthesis/.

Steps for Post Synthesis simulation :

The synthesized netlist(mythcore.synth.v) is to be copied in the folder /mythcore_synth/post synth Simulation/. Then the following commands are to be given for observing post synth simulation.



        cd mythcore_synth/post synth Simulation/
        iverilog gls.v mythcore.synth.v primitives.v sky130_fd_sc_hd.v
        ./a.out
        gtkwave gls.vcd


