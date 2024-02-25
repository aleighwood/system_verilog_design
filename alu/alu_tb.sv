`timescale 1ns/1ps // Define time units and resolution
`include "alu.sv" // Include all modules being used in this module

module alu_tb;
logic [7:0] t_SrcA, t_SrcB; // Declare the variables being used by the testbench
logic [1:0] t_ALUControl;
logic [7:0] t_ALUResult;
logic Zero;
integer file;
alu dut (t_SrcA,t_SrcB,t_ALUControl,t_ALUResult,Zero); // Instantiate the module under test

initial begin // Single pass behaviour which starts at time 0 ns
$dumpfile("alu_tb.vcd"); // Dump variable changes in the vcd file
$dumpvars(0, alu_tb); // Specifies which variables to dump in the vcd file

// test bitwise AND, result should be 00000001
t_ALUControl = 00; t_SrcA = 8'b00000011; t_SrcB = 8'b10000001; #20;

// test bitwise OR, result should be 11111111
t_ALUControl = 01; t_SrcA = 8'b10101010; t_SrcB = 8'b01010101; #20;

// test arithmetic addition, result should be 01101110
t_ALUControl = 10; t_SrcA = 8'd10; t_SrcB = 8'd100; #20;

//  test arithmetic subraction, result should be 00011000
t_ALUControl = 11; t_SrcA = 8'd100; t_SrcB = 8'd76; #20;
$fclose(file);
end 

initial begin // Single pass behaviour which starts at time 0 ns

$display("this works");
$monitor("t = %3d, control = %d t_SrcA = %b, t_SrcB = %b, y = %b , zero = %b\n", $time, t_ALUControl,  t_SrcA, t_SrcB, t_ALUResult, Zero);
end // Print variable
// values on screen
endmodule