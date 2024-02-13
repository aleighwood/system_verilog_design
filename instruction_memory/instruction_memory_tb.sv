`timescale 1ns/1ps // Define time units and resolution
`include "instruction_memory.sv" // Include all modules being used in this module

module instruction_memory_tb;
logic [7:0] address;
logic [23:0] data_out;
instruction_memory dut (address,data_out); // Instantiate the module under test. dut (device
// under test) is the name we have chosen

initial begin // Single pass behaviour which starts at time 0 ns
$dumpfile("instruction_memory_tb.vcd"); // Dump variable changes in the vcd file
$dumpvars(0, instruction_memory_tb); // Specifies which variables to dump in the vcd file


for(int i = 0; i<8;i++)
    begin
        address= 8'h00 + i*(8'h01); #20;
    end

end 

initial begin // Single pass behaviour which starts at time 0 ns

$monitor("t = %3d, address = %h, data_out = %h \n", $time, address,data_out);
end // Print variable
// values on screen
endmodule