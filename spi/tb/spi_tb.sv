import uvm_pkg::*;
`include "uvm_macros.svh"
import wb_pkg::*;

class spi_tb extends uvm_env;
    `uvm_component_utils(wishbone_tb)

    wb_master_env env;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction : new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(get_type_name(), $sformatf("[ WISHBONE_TB ] Build Phase Executing!"), UVM_HIGH)
        env = wb_master_env::type_id::create("env", this);
    endfunction : build_phase

    function void start_of_simulation_phase(uvm_phase phase);
        super.start_of_simulation_phase(phase);
        `uvm_info(get_type_name(), "Running Simulation Testbench!", UVM_HIGH)
    endfunction : start_of_simulation_phase

endclass: wishbone_tb