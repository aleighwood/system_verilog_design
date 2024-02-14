 module instruction_memory_pc(input logic [7:0] immediate,
                              input logic PCSrc,CLK,reset,
                              output logic [23:0] instr);


logic [23:0] data_ROM [0:255];
logic [7:0] PC;
initial $readmemh("program.txt", data_ROM);
assign instr = data_ROM[PC];




always_ff @ (posedge CLK) 
    begin
        if (reset) PC <= 8'd0;
        else PC <= (PCSrc)? immediate: PC + 8'd1;
    end




endmodule