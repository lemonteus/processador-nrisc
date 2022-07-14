//Especificacao do mux 2 para 1 em Verilog -  retirado do Apendice C do livro do Patterson
//(modificado para arquitetura 8 bits)

module mux21 (in1, in2, sel, out);

input [7:0] in1, in2; //2 inputs de 8 bits
input sel; //sinal de controle do mux
output reg [7:0] out;// saida de 8 bits

always @(in1, in2, sel)

case (sel)
	0: out <= in1;
	1: out <= in2;
	default: $stop; //caso impossivel de acontecer
endcase

endmodule