class spi_slave_env extends uvm_env;
    `uvm_component_utils(spi_slave_env)

    spi_slave_agent agent;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        agent = spi_slave_agent::type_id::create("agent", this);
    endfunction : build_phase

    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), "Running Simulation Environment!", UVM_HIGH)
    endfunction : start_of_simulation_phase

endclass : spi_slave_env