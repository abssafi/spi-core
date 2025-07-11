package wb_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    
    `include "wb_packet.sv"
    `include "wb_master_monitor.sv"
    `include "wb_master_sequencer.sv"
    `include "wb_master_seqs.sv"
    `include "wb_master_driver.sv"
    `include "wb_master_agent.sv"
    `include "wb_master_env.sv"

endpackage : wb_pkg