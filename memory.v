module memory #(parameter width=8, parameter depth=256)(address, inputData, clock, halt, MemRead, MemWrite, readData, instr);

reg [width:0] Mem [depth:0]; //256 posicoes de memoria

integer i; //debug

input [7:0] inputData, address;
input clock, halt, MemRead, MemWrite;

output reg [7:0] readData, instr;

always begin @(posedge clock) //escritas 

if (halt == 1'b0) begin
	if (MemWrite == 1'b1)
		Mem[address] = inputData;
end

end

always begin @(negedge clock) //leituras

if (halt == 1'b0) begin
	if (address >= 8'b10001100) 
		readData = Mem[address];
	else if (MemRead == 1'b1)
		instr = Mem[address];
end

end

endmodule

