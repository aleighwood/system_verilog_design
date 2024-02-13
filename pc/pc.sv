module pc(input logic CLK, reset, PCSrc,
          input logic [7:0] immediate,
          output logic [7:0] PC);
               

always_ff @ (posedge CLK) 
    begin
        if (reset) PC <= 8'b0;
        else PC <= (PCSrc)? immediate: PC + 1;
    end

endmodule