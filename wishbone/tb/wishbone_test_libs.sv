class base_test extends uvm_test;
    `uvm_component_utils(base_test)

    wishbone_tb tb;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);   
        uvm_config_int::set( this, "*", "recording_detail", 1); 
        
        `uvm_info(get_type_name(), $sformatf ("[BASE TEST] BUILD PHASE EXECUTING!"), UVM_HIGH)   
        
        uvm_config_wrapper::set(this, "tb.env.agent.sequencer.run_phase",
                                 "default_sequence",
                                 wb_5_packets::get_type());
           
        super.build_phase(phase);

        tb = wishbone_tb::type_id::create("tb", this);
    endfunction : build_phase

    function void end_of_elaboration_phase(uvm_phase phase);
        uvm_top.print_topology();
    endfunction : end_of_elaboration_phase

    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), "Running Simulation Base Test!", UVM_HIGH)
    endfunction : start_of_simulation_phase

    function void check_phase(uvm_phase phase);
        check_config_usage();
    endfunction : check_phase
    
endclass : base_test