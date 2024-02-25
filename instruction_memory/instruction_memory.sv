module instruction_memory(input logic [7:0] PC,
                          output logic [23:0] Instr);

// create variable to store instructions
logic [23:0] data_ROM [0:255];
initial
// copy instructions from text file 
$readmemh("program.txt", data_ROM);
// continuously assign instruction 
assign Instr = data_ROM[PC];
endmodule