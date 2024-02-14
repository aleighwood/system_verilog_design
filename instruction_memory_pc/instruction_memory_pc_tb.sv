`timescale 1ns/1ps // Define time units and resolution
`include "instruction_memory_pc.sv" // Include all modules being used in this module

module instruction_memory_pc_tb;
logic [7:0] immediate;
logic PCSrc,CLK,reset;
logic [23:0] instr;
instruction_memory_pc dut(immediate,PCSrc,CLK,reset,instr); // Instantiate the module under test

initial begin // Single pass behaviour which starts at time 0 ns
$dumpfile("instruction_memory_pc_tb.vcd"); // Dump variable changes in the vcd file
$dumpvars(0, instruction_memory_pc_tb); // Specifies which variables to dump in the vcd file
$display("this works");

CLK =1; reset =1; immediate = 0; PCSrc = 0; #20; 

reset = 0; #20;

for(int i = 0; i<8;i++)
    begin
      // $display("instr = %h", instr);  
        CLK = 0; #20;
        CLK = 1; #20;

    end

end


initial begin
$monitor("t = %3d,CLK = %b, reset = %b, PCSrc = %b, immediate = %b, instr = %h \n", $time, CLK, reset, PCSrc, immediate, instr);
end // Print variable
// values on screen

endmodule