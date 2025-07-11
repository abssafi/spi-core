package spi_pkg;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    
    `include "spi_packet.sv"
    `include "spi_slave_monitor.sv"
    `include "spi_slave_sequencer.sv"
    `include "spi_slave_seqs.sv"
    `include "spi_slave_driver.sv"
    `include "spi_slave_agent.sv"
    `include "spi_slave_env.sv"

endpackage : spi_pkg