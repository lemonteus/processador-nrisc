module registradores (Instr, DadoEscrito, Dado1, Dado2, DadoBool1, DadoBool2, Clock, Halt);
	//input [2:0] RegLido1, RegLido2, RegEscrito;
	//input [1:0] BoolLido1, BoolLido2, BoolEscrito;
	input Clock, Halt;
	
	reg [3:0] RegLido1, RegEscrito;
	reg [2:0] RegLido2;
	reg [1:0] BoolLido1, BoolLido2;
	input [7:0] Instr, DadoEscrito;
	
	output reg [7:0] Dado1, Dado2;
	output DadoBool1, DadoBool2;
	
	reg [7:0]banco[7:0];
		
	assign RegLido1 = Instr[5:2];
	assign RegLido2 = Instr[1:0];
	assign RegEscrito = Instr[4:2];
	assign BoolLido1[0] = Instr[1];
	assign BoolLido1[1] = Instr[4];
	assign BoolLido2[0] = Instr[1];
	assign BoolLido2[1] = Instr[3];
	assign BoolEscrito = Instr[3];
	
	assign dado1 = banco[RegLido1];
	assign dado2 = banco[RegLido2];		
	
	always begin
		@(posedge Clock)
		if(RegLido1)
			banco[RegLido1] <= DadoEscrito;
		else if(RegLido2)
			banco[RegLido2] <= DadoEscrito;
		else if(RegEscrito)
			banco[RegEscrito] <= DadoEscrito;
		else if(BoolLido1)
			banco[BoolLido1] <= DadoEscrito;
		else if(RegLido2)
			banco[BoolLido2] <= DadoEscrito;
		else if(BoolEscrito)
			banco[BoolEscrito] <= DadoEscrito;
	end
	
	always begin
	@(negedge Clock)
		if(Dado1)
			banco[0] <= Dado1;
		else if(Dado2)
			banco[1] <= Dado2;
		else if(DadoBool1)
			banco[BoolEscrito] <= DadoBool1;
		else if(DadoBool2)
			banco[BoolEscrito] <= DadoBool2;
	end
	
endmodule