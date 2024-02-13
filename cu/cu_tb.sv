`timescale 1ns/1ps // Define time units and resolution
`include "cu.sv" // Include all modules being used in this module

module cu_tb;

logic [3:0] opcode;
logic [1:0] ALUControl;
logic Branch,ALUSrc,RegWrite;
cu dut(opcode,Branch,ALUSrc,RegWrite,ALUControl); 

initial begin // Single pass behaviour which starts at time 0 ns
$dumpfile("cu_tb.vcd"); // Dump variable changes in the vcd file
$dumpvars(0, cu_tb); // Specifies which variables to dump in the vcd file


// count up to 10
for (int i = 0; i<8; i++)
    begin
    opcode = i; #20;
    end
end 

initial begin // Single pass behaviour which starts at time 0 ns

$monitor("t = %3d, opcode = %d, RegWrite = %b, ALUSrc = %b, ALUControl = %b, Branch = %b \n", $time, opcode,RegWrite,ALUSrc,ALUControl,Branch);
end // Print variable

endmodule