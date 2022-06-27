module registadores (RegLido1, RegLido2, RegEscrito, BoolLido1, BoolLido2, BoolEscrito, DadoEscrito, Dado1, Dado2, DadoBool1, DadoBool2, Clock, Halt);
	input [2:0] RegLido1, RegLido2, RegEscrito;
	input [1:0] BoolLido1, BoolLido2, BoolEscrito;
	input DadoEscrito, Clock, Halt;
	output reg [7:0] Dado1, Dado2;
	output DadoBool1, DadoBool2;
	
	reg [7:0]banco[7:0];

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
