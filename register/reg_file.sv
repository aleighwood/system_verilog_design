module reg_file (input logic [3:0] RA1, RA2, WA, 
                 input logic [7:0] ALUResult,
                 input logic write_enable,
                 input logic CLK,
                 output logic [7:0] RD1, RD2, cpu_out);

// define registers -> width of data -> number of addresses
reg [7:0] register [0:15];

//assign register[0] = 0; // set x0 to 0 

// continous assignment 
assign RD1 = register[RA1];
assign RD2 = register[RA2];
assign cpu_out = register[15];
//assign register[0] = 0;

always_ff @ (posedge CLK)
begin

// write to register at address given by WA
if(write_enable && (WA>0)) register[WA] <= ALUResult;
register[0] <= 0;

end

endmodule