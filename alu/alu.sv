module alu (input logic [7:0] SrcA,SrcB,
            input logic [1:0] ALUControl,
            output logic [7:0] ALUResult,
            output logic Zero);

always_comb // combinational logic only 
begin 

case(ALUControl) // switch case statement
2'b00: ALUResult = (SrcA & SrcB); // bitwise AND
2'b01: ALUResult = (SrcA | SrcB); // bitwise OR
2'b10: ALUResult = (SrcA + SrcB); // numerical addition 
2'b11: ALUResult = (SrcA - SrcB); // numerical subtraction
default: ALUResult = 8'bx;
endcase

// set 0 output
if (ALUResult == 0) Zero = 1;
    else Zero = 0;

end

endmodule




