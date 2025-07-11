class spi_base_seq extends uvm_sequence #(spi_packet);
    `uvm_object_utils(wb_base_seq)

    function new(string name="spi_base_seq");
        super.new(name);
    endfunction : new

    task pre_body();
        uvm_phase phase;
        `ifdef UVM_VERSION_1_2
            phase = get_starting_phase();
        `else
            phase = starting_phase;
        `endif

        if(phase != null) begin
            phase.raise_objection(this, get_type_name());
            `uvm_info(get_type_name(), "raise objection", UVM_MEDIUM)
        end
    endtask : pre_body

    task post_body();
        uvm_phase phase;
        `ifdef UVM_VERSION_1_2
            phase = get_starting_phase();
        `else
            phase = starting_phase;
        `endif

        if(phase != null) begin
            phase.drop_objection(this, get_type_name());
            `uvm_info(get_type_name(), "drop objection", UVM_MEDIUM)
        end
    endtask

endclass : spi_base_seq 

class spi_5_packets extends spi_base_seq;

  `uvm_object_utils(spi_5_packets)

  function new(string name="spi_5_packets");
    super.new(name);
  endfunction

  virtual task body();
    `uvm_info(get_type_name(), "Executing wspi_5_packets sequence", UVM_LOW)
     repeat(5)
      `uvm_do(req)
  endtask : body
  
endclass : spi_5_packets