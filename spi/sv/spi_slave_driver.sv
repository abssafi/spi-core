class spi_slave_driver extends uvm_driver #(spi_packet);
    `uvm_component_utils(spi_slave_driver)

    function new(string name, uvm_component parent);
        super.new(name, parent);      
    endfunction : new

    virtual task run_phase(uvm_phase phase);
        forever begin
            seq_item_port.get_next_item(req);
            send_to_dut(req);
            seq_item_port.item_done();
        end
    endtask : run_phase

    virtual task send_to_dut(spi_packet packet);
        `uvm_info(get_type_name(), $sformatf("Packet is \n%s", packet.sprint()), UVM_LOW)
        #10ns;
    endtask : send_to_dut

    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), "Running Simulation Driver!", UVM_HIGH)
    endfunction : start_of_simulation_phase
endclass : spi_slave_driver