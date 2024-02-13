`timescale 1ns/1ps // Define time units and resolution
`include "reg_file.sv" // Include all modules being used in this module

module reg_file_tb;
// address inputs
logic [3:0] RA1, RA2, WA; 
// data input
logic [7:0] ALUResult;
logic write_enable, CLK;
// outputs
logic [7:0] RD1,RD2,cpu_out;
reg_file dut (RA1,RA2,WA,ALUResult,write_enable,CLK,RD1,RD2,cpu_out); // Instantiate the module under test. dut (device
// under test) is the name we have chosen

initial begin // Single pass behaviour which starts at time 0 ns
$dumpfile("reg_file_tb.vcd"); // Dump variable changes in the vcd file
$dumpvars(0, reg_file_tb); // Specifies which variables to dump in the vcd file
//$display("this works");
$display("this is displayed here");

//write to registers 
for(int i = 1; i<16; i++)
    begin
        WA = i; CLK = 1; write_enable = 1; ALUResult = 4'd2; 
        #20; 
        CLK= 0; write_enable = 0; 
        #20;
    end 

// read from registers
RA1 = 1;
for(int i = 0; i<16; i++)
    begin 
        RA1 = i; RA2 = RA1;
        $display("time = %3d, RA1 = RA2 = %d, RD1 = RD2 = %d", $time, RA1, RD1);#20;
    end

end 

/*
// store data in reg 1 
CLK = 1; write_enable = 1;ALUResult = 00000001; WA = 0001; #20;
CLK = 0;  #20;
// store data in reg 2
CLK =1; write_enable = 1;ALUResult = 00000010; WA = 0010;
#20;
CLK = 0; 
#20;
// read data from reg 1 and 2 
CLK =1; write_enable = 0; RA1 = 0001; RA2 = 0010; 
#20;
CLK= 0; 
#20;
*/

endmodule

