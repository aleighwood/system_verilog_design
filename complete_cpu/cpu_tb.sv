`timescale 1ns/1ps // Define time units and resolution
`include "cpu.sv" // Include all modules being used in this module

module cpu_tb;
logic CLK, reset;
logic [7:0] ALUResult,cpu_out;


cpu dut(CLK,reset,ALUResult,cpu_out); // Instantiate the module under test

initial begin 
$dumpfile("cpu_tb.vcd"); 
$dumpvars(0, cpu_tb); 

//reset
CLK =1;
reset =1; #20; reset = 0; #20;

//run clock until cpu_out ==5
for(int i = 0; i< 22;i++)
    begin 
        CLK = 0; #20;
        CLK = 1; #20;
    end
end

initial begin
$monitor("t = %3d,CLK = %b, reset = %b, ALUResult = %d, cpu_out = %d", $time, CLK, reset, ALUResult,cpu_out);
end 

endmodule