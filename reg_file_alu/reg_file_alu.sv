module reg_file_alu (input logic [3:0] RA1, RA2, WA, 
                    input logic write_enable,CLK, ALUSrc, 
                    input logic [1:0] ALUControl,
                    input logic [7:0] immediate,
                    output logic Zero,
                    output logic [7:0] cpu_out,ALUResult);

// define registers -> width of data -> number of addresses
reg [7:0] register [0:15];
// define read datas
logic [7:0] RD1;  
logic [7:0] RD2;
// define SrcB
logic [7:0] SrcB; 

// assignments, RDX output 0 if register 0 is called
assign RD1 = (RA1 != 4'd0)? register[RA1]: 8'd0;
assign RD2 = (RA2 != 4'd0)? register[RA2]: 8'd0;
assign SrcB = (ALUSrc)? immediate : RD2; 
assign cpu_out = register[15];

// Clock run logic writing to register at given address WA
always_ff @ (posedge CLK)
begin
if(write_enable && (WA>0))      register[WA] <= ALUResult;
end

// ALU is combinational 
always_comb 
    begin 
        // select ALU action
        case(ALUControl)
        // bitwise AND
        2'b00: ALUResult = (RD1 & SrcB); 
        // bitwise OR
        2'b01: ALUResult = (RD1 | SrcB); 
        // numerical addition 
        2'b10: ALUResult = (RD1 + SrcB); 
        // numerical subtraction
        2'b11: ALUResult = (RD1 - SrcB); 
        default: ALUResult = 8'bx;
        endcase
        
        // Zero output
        if (ALUResult == 0) Zero = 1;
            else Zero = 0;
    end

endmodule