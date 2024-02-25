module cu (input logic [3:0] opcode,
           output logic Branch, ALUSrc,RegWrite,
           output logic [1:0] ALUControl);

always_comb 
begin 

case(opcode) // switch case statement
//and
4'd0: 
    begin 
        RegWrite = 1; ALUSrc = 0; ALUControl = 2'b00; Branch = 0; 
    end  
//or
4'd1: 
    begin   
        RegWrite = 1; ALUSrc = 0; ALUControl = 2'b01; Branch = 0; 
    end
//add
4'd2:
    begin  
        RegWrite = 1; ALUSrc = 0; ALUControl = 2'b10; Branch = 0; 
    end
//sub
4'd3:
    begin
        RegWrite = 1; ALUSrc = 0; ALUControl = 2'b11; Branch = 0;
    end 
//andi
4'd4: 
    begin 
        RegWrite = 1; ALUSrc = 1; ALUControl = 2'b00; Branch = 0;
    end
//ori 
4'd5: 
    begin  
        RegWrite = 1; ALUSrc = 1; ALUControl = 2'b01; Branch = 0; 
    end
//addi
4'd6: 
    begin 
        RegWrite = 1; ALUSrc = 1; ALUControl = 2'b10; Branch = 0; 
    end
//beq
4'd7:
    begin 
        RegWrite = 0; ALUSrc = 0; ALUControl = 2'b11; Branch = 1; 
    end

endcase
end
endmodule




