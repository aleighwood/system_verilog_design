module pc(input logic CLK, reset, PCSrc,
          input logic [7:0] immediate,
          output logic [7:0] PC);
               
// Clock run
always_ff @ (posedge CLK) 
    begin
        //increment PC by 1 unless reset
        if (reset) PC <= 8'b0;
        else PC <= (PCSrc)? immediate: PC + 1;
    end

endmodule