//Especificacao do mux 3 para 1 em Verilog -  retirado do Apendice C do livro do Patterson
//(modificado para arquitetura 8 bits)

module mux31 (in1, in2, in3, sel, out);

input [7:0] in1, in2, in3; //3 inputs de 8 bits
input [1:0] sel; //sinal de controle do mux
output reg [7:0] out;// saida de 8 bits

always @(in1, in2, in3, sel)

case (sel)
	0: out <= in1;
	1: out <= in2;
	2: out <= in3;
	default: $stop; //caso impossivel de acontecer
endcase

endmodule