`timescale 1ns/1ps // Define time units and resolution
`include "pc.sv" // Include all modules being used in this module

module pc_tb;

logic [7:0] immediate,PC;
logic CLK,reset,PCSrc;
pc dut(CLK, reset,PCSrc,immediate,PC); 

initial begin // Single pass behaviour which starts at time 0 ns
$dumpfile("pc_tb.vcd"); // Dump variable changes in the vcd file
$dumpvars(0, pc_tb); // Specifies which variables to dump in the vcd file

CLK =1; reset = 1; #20; 
CLK =0; reset = 0; #20; 

// count up to 10
for (int i = 0; i<10; i++)
    begin
    CLK =1; PCSrc =0; #20;
    CLK = 0; #20; 
    end

// introduce immediate 

CLK =1 ;PCSrc =1; immediate = 8'd50; #20;

// count another 10, starting at 50
CLK=0; #20;
for (int i = 0; i<10; i++)
    begin
    CLK =1; PCSrc =0; #20;
    CLK = 0; #20; 
    end

end 

initial begin // Single pass behaviour which starts at time 0 ns

$monitor("t = %3d, CLK = %b, reset = %b, PCSrc = %b, immediate = %d, PC = %d \n", $time,CLK,reset, PCSrc,immediate,PC);
end // Print variable
// values on screen
endmodule