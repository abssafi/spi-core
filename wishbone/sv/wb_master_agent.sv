class wb_master_agent extends uvm_agent;
    `uvm_component_utils_begin(wb_master_agent)
        `uvm_field_enum(uvm_active_passive_enum, is_active, UVM_ALL_ON)
    `uvm_component_utils_end

    wb_master_monitor monitor;
    wb_master_driver driver;
    wb_master_sequencer sequencer;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        monitor = new("monitor", this);
        if (is_active == UVM_ACTIVE) begin
            driver = new("driver", this);
            sequencer = new("sequencer", this);
        end   
    endfunction : build_phase

    virtual function void connect_phase(uvm_phase phase);
        if (is_active == UVM_ACTIVE) begin
            driver.seq_item_port.connect(sequencer.seq_item_export);
        end
    endfunction : connect_phase

    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), "Running Simulation Agent!", UVM_HIGH)
    endfunction : start_of_simulation_phase


endclass : wb_master_agent