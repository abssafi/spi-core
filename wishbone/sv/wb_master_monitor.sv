class wb_master_monitor extends uvm_monitor;
    `uvm_component_utils(wb_master_monitor)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        `uvm_info(get_type_name(), $sformatf("Executing Monitor Run Phase!"), UVM_LOW)
    endtask : run_phase

    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), "Running Simulation Monitor!", UVM_HIGH)
    endfunction : start_of_simulation_phase

endclass : wb_master_monitor