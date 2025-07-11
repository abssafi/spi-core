typedef enum bit [2:0] { READ, WRITE, IDLE } op_type_e;

class wb_packet extends uvm_sequence_item;
    //Inputs
    bit cyc_i;
    bit stb_i; 
    bit we_i;

    rand bit [7:0] dat_i;
    rand bit [1:0] adr_i;

    //User defined Signal
    rand op_type_e op_e;

    //Outputs
    bit [7:0] dat_o;
    bit inta_o;
    bit ack_o;

    //Factory registration
    `uvm_object_utils_begin(wb_packet)
        `uvm_field_int(cyc_i, UVM_ALL_ON)
        `uvm_field_int(stb_i, UVM_ALL_ON)
        `uvm_field_int(we_i, UVM_ALL_ON)
        `uvm_field_int(dat_i, UVM_ALL_ON)
        `uvm_field_int(adr_i, UVM_ALL_ON)
        `uvm_field_enum(op_type_e, op_e, UVM_ALL_ON)
        `uvm_field_int(dat_o, UVM_ALL_ON)
        `uvm_field_int(inta_o, UVM_ALL_ON)
        `uvm_field_int(ack_o, UVM_ALL_ON)
    `uvm_object_utils_end

    //Constructor
    function new(string name = "wb_packet");
        super.new(name);
    endfunction : new

endclass : wb_packet