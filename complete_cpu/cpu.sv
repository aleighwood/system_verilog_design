`include "../reg_file_alu/reg_file_alu.sv"
`include "../instruction_memory_pc/instruction_memory_pc.sv" 
`include "../cu/cu.sv" 

module cpu(input logic CLK,reset,
            output logic [7:0] ALUResult,
            output logic [7:0] cpu_out);

// control unit ports
logic [3:0] opcode;
logic Branch, ALUSrc, RegWrite;
logic [1:0] ALUControl;

// instantiate control unit
cu control_unit(.opcode(opcode),.Branch(Branch),.ALUSrc(ALUSrc),.RegWrite(RegWrite),.ALUControl(ALUControl));

//instruction memory ports
logic [7:0] immediate;
logic PCSrc;
logic [23:0] instr;

// intanitate inctruction memory pc
instruction_memory_pc memory(.immediate(immediate),.PCSrc(PCSrc),.CLK(CLK),.reset(reset),.instr(instr));

// register file ports
logic[3:0] RA1, RA2, WA;
logic write_enable, Zero;



// instantiate register file
reg_file_alu register(.RA1(RA1),.RA2(RA2),.WA(WA),.write_enable(write_enable),.CLK(CLK),.ALUSrc(ALUSrc),.ALUControl(ALUControl),.immediate(immediate),.Zero(Zero),.cpu_out(cpu_out),.ALUResult(ALUResult));  

//split up instr vector
assign opcode = instr[23:20];
assign WA = instr[19:16];
assign RA1 = instr[15:12];
assign RA2 = instr[11:8];
assign immediate = instr[7:0]; // Assign the correct range for immediate

// link outputs of control unit
assign write_enable = RegWrite;
//ALUSrc both have same name
//ALUcontrol both have same name



//outputs
// do i need to restate them?  

// PCSrc AND gate
always_comb
    begin 
        PCSrc = (Branch & Zero);
    end 



endmodule