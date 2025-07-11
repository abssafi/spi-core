class wb_master_env extends uvm_env;
    `uvm_component_utils(wb_master_env)

    wb_master_agent agent;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = wb_master_agent::type_id::create("agent", this);
    endfunction : build_phase

    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), "Running Simulation Environment!", UVM_HIGH)
    endfunction : start_of_simulation_phase

endclass : wb_master_env