class spi_packet extends uvm_sequence_item;
    //Inputs
    bit [7:0] miso;
    bit [7:0] mosi;

    //Factory registration
    `uvm_object_utils_begin(spi_packet)
        `uvm_field_int(miso, UVM_ALL_ON)
        `uvm_field_int(mosi, UVM_ALL_ON)
    `uvm_object_utils_end

    //Constructor
    function new(string name = "spi_packet");
        super.new(name);
    endfunction : new

endclass : spi_packet