module reg_file (input logic [3:0] RA1, RA2, WA, 
                 input logic [7:0] ALUResult,
                 input logic write_enable,
                 input logic CLK,
                 output logic [7:0] RD1, RD2, cpu_out);

// define registers -> width of data -> number of addresses
reg [7:0] register [0:15];

// continous assignment of outputs
assign cpu_out = register[15];
assign RD1 = (RA1 != 4'd0)? register[RA1]: 8'd0;
assign RD2 = (RA2 != 4'd0)? register[RA2]: 8'd0;

// Clock run logic writing to register at given address WA
always_ff @ (posedge CLK)
begin
if(write_enable && (WA>0))      register[WA] <= ALUResult;
end

endmodule