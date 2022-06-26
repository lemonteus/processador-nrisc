module registadores (PC. RegLido1, RegLido2, RegEscrito, Sobrescrever, BoolLido1, BoolLido2, BoolEscrito, DadoEscrito, Dado1, Dado2, DadoBool1, DadoBool2, Clock, Halt);
	input PC,RegLido1, RegLido2, RegEscrito, Sobrescrever, BoolLido1, BoolLido2, BoolEscrito, DadoEscrito, Clock, Halt;
	output reg [7:0] Dado1, Dado2, DadoBool1, DadoBool2;
	
	reg [7:0] banco [7:0];

	assign Sobrescrever = PC;
	assign RegLido1 = banco[5:2];
	assign RegLido2 = banco[1:0];
	assign RegEscrito = banco[4:2];
	assign BoolLido1 = banco[0] || banco[4];
	assign BoolLido2 = banco[1] || banco[3];
	assign BoolEscrito = banco[3];
	
	always begin
		@(posedge clock)
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
	@(negedge clock)
		if(Dado1)
			banco[0] || banco[3] = Dado1;
		else if(Dado2)
			banco[1] || banco[4] = Dado2;
		else if(DadoBool1)
			banco[BoolEscrito] = DadoBool1;
		else if(DadoBool2)
			banco[BoolEscrito] = DadoBool2;
	end
	
endmodule
