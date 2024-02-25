`timescale 1ns/1ps // Define time units and resolution
`include "instruction_memory.sv" // Include all modules being used in this module

module instruction_memory_tb;
logic [7:0] PC;
logic [23:0] Instr;
instruction_memory dut (PC,Instr); // Instantiate the module under test

initial begin
$dumpfile("instruction_memory_tb.vcd"); // Dump variable changes in the vcd file
$dumpvars(0, instruction_memory_tb); // Specifies which variables to dump in the vcd file

// call from each PC in order
for(int i = 0; i<8; i++)
    begin
        PC= i*(8'd1); #20;
    end
end 

initial begin // Print instructions

$monitor("t = %3d, PC = %d, Instr = %h ", $time, PC,Instr);
end 

endmodule