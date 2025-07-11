
module top;
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    import wb_pkg::*;

    `include "wishbone_tb.sv"
    `include "wishbone_test_libs.sv"

    wb_packet pkt1, pkt2, pkt3;
    int ok;

    initial begin
        $display("Generating 5 random packets");
        for(int i=0; i < 5; i++) begin
            pkt1 = new($sformatf("Packet-%0d", i));
            ok = pkt1.randomize();
            pkt1.print();
        end

        run_test();

    end

endmodule : top