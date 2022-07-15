module nRisc(Clock, memInstr, MemData, dadoEscrito, readData, MemWrite, halt);
input [7:0] in1;

wire [7:0] BR_OutReg1, BR_OutReg2, BR_OutBool1, BR_OutBool2, memInstr, memData;
wire [7:0] MUX41_ULA, MUX31_ULA, DadoEscrito, pc, readData, DadoEscrito;
wire [7:0] E18B1_M41, E18B1_M31, E28_M31;
wire [7:0] UC_BR;

wire MemRead, MemWrite, Load, Beq, Slt, EscPC;
wire [1:0] ULASrc1, ULASrc2;
reg [7:0] pc;

pc PC (pc, EscPC, c);
somador S (pc, S_M21PC);

mux41 M41 (in1, 0, BR_OutReg1, E18B1_M41, ULASrc1, MUX41_ULA);
mux31 M31 (BR_OutReg2, E18B1_M31, E28_M31, ULASrc2, MUX31_ULA);
mux21 M21BR (ULAResult, memData, Load, DadoEscrito);
mux21 M21PC (BR_OutReg1, S_M21PC, AND_M21PC, pc);

AND A (ULAZero, Beq, AND_MS1PC);

ExtensorSinal1pra8 E18B1 (BR_OutBool1, E18B1_M41);
ExtensorSinal1pra8 E18B2 (BR_OutBool2, E18B1_M31);
ExtensorSinal2pra8 E28 (memInstr, E28_M31);

Registradores BR (memInstr, BR_OutReg1, BR_OutReg2, BR_OutBool1, BR_OutBool2, DadoEscrito, c, halt);

unidadedecontrole UC (halt, memInstr, MemRead, MemWrite, Load, Beq, ULASrc1, ULASrc2, ULAOp, Slt, EscPC)

ula ULA (MUX41_ULA, MUX31_ULA, c, ULAResult, ULAZero, ULAOp);

endmodule