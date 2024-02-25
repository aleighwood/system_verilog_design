// Define time units and resolution
`timescale 1ns/1ps 
// Include all modules being used in this module
`include "reg_file.sv" 

module reg_file_tb;
// defining variables
logic [3:0] RA1, RA2, WA; 
logic [7:0] ALUResult;
logic write_enable, CLK;
logic [7:0] RD1,RD2,cpu_out;

reg_file dut (RA1,RA2,WA,ALUResult,write_enable,CLK,RD1,RD2,cpu_out); // Instantiate the module under test

initial begin // Single pass behaviour which starts at time 0 ns
$dumpfile("reg_file_tb.vcd"); // Dump variable changes in the vcd file
$dumpvars(0, reg_file_tb); // Specifies which variables to dump in the vcd file

// write 5*i to registers 
for(int i = 0; i<16; i++)
    begin
        WA = i; CLK = 1; write_enable = 1; ALUResult = i*(8'd5); 
        #20; 
        CLK= 0; write_enable = 0; 
        #20;
    end 

// read from registers
for(int i = 0; i<16; i++)
    begin 
        RA1 = i; RA2 = RA1;#20
        $display("time = %3d, RA1 = RA2 = %d, RD1 = RD2 = %d", $time, RA1, RD1);#20;
    end

end 
endmodule

