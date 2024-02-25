`timescale 1ns/1ps // Define time units and resolution
`include "reg_file_alu.sv" // Include all modules being used in this module

module reg_file_alu_tb;
// address inputs
logic [3:0] RA1, RA2, WA; 
logic write_enable,CLK, ALUSrc;
logic [1:0] ALUControl;
logic [7:0] immediate;
logic Zero;
logic [7:0] cpu_out,ALUResult;

reg_file_alu dut (RA1,RA2,WA,write_enable,CLK,ALUSrc,ALUControl,immediate,Zero,cpu_out,ALUResult); // Instantiate the module under test.

initial begin // Single pass behaviour which starts at time 0 ns
$dumpfile("reg_file_alu_tb.vcd"); // Dump variable changes in the vcd file
$dumpvars(0, reg_file_alu_tb); // Specifies which variables to dump in the vcd file

//writes i*5 to all registers, ALU performs add, s
for(int i = 0; i<16; i++)
    begin
        CLK=0; write_enable = 1; WA = i;  RA1 = 4'd0;  immediate = i*(8'd5); ALUSrc = 1; ALUControl = 2'b10;
        #20; 
        CLK= 1;  
        #20;
    end 

// read from registers. ALUResult is RD1 AND RD2
for(int i = 0; i<16; i++)
    begin 
        write_enable = 0; RA1 = i; RA2 = i;  ALUSrc =0;  ALUControl = 2'b00; #20 
        $display("time = %3d, RA1 = RA2 = %d,cpu_out = %d, ALUResult = %d", $time, RA1,cpu_out, ALUResult);
        #20;
    end

end

endmodule

