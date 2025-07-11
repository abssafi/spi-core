class wb_master_driver extends uvm_driver #(wb_packet);
    `uvm_component_utils(wb_master_driver)

    function new(string name, uvm_component parent);
        super.new(name, parent);      
    endfunction : new

    virtual task run_phase(uvm_phase phase)
        forever begin
            seq_item_port.get_next_item(req);
            send_to_dut(req);
            seq_item_port.item_done();
        end
    endtask : run_phase

    virtual task send_to_dut(wb_packet packet);
        if(packet.op_e == WRITE) begin
            cyc_i = 1;
            stb_i = 1; 
            we_i  = 1;
        end

        else if(packet.op_e == READ) begin
            cyc_i = 1;
            stb_i = 1; 
            we_i  = 0;
        end

        else if(packet.op_e == IDLE) begin
            dat_i.rand_mode(0);
            adr_i.rand_mode(0);
            adr_i = 8'h01;
            dat_i = 8'h80;
        end

        `uvm_info(get_type_name(), $sformatf("Packet is \n%s", packet.sprint()), UVM_LOW)
        #10ns;
    endtask : send_to_dut

    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), "Running Simulation Driver!", UVM_HIGH)
    endfunction
endclass : wb_master_driver