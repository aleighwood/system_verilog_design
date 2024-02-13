`timescale 1ns/1ps // Define time units and resolution
`include "cpu.sv" // Include all modules being used in this module

module cpu_tb;
logic CLK, reset;
logic [7:0] ALUResult,cpu_out;

cpu dut(CLK,reset,ALUResult,cpu_out); // Instantiate the module under test

initial begin // Single pass behaviour which starts at time 0 ns
$dumpfile("cpu_tb.vcd"); // Dump variable changes in the vcd file
$dumpvars(0, cpu_tb); // Specifies which variables to dump in the vcd file
$display("this works");

reset =1;  CLK = 0; #20; 
CLK=1; #20;
reset = 0; #20;

for(int i = 0; i<8;i++)
    begin 
        CLK = 0; #20;
        CLK = 1; #20;

    end

end


initial begin
$monitor("t = %3d,CLK = %b, reset = %b,ALUResult = %d, cpu_out = %d \n", $time, CLK, reset, ALUResult,cpu_out);
end // Print variable
// values on screen

endmodule