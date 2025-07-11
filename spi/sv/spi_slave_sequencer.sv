class spi_slave_sequencer extends uvm_sequencer #(spi_packet);
    `uvm_component_utils(spi_slave_sequencer)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), "Running Simulation Sequencer!", UVM_HIGH)
    endfunction
    
endclass : spi_slave_sequencer