//Especificacao do mux 4 para 1 em Verilog -  retirado do Apendice C do livro do Patterson
//(modificado para arquitetura 8 bits)

module mux41 (in1, in2, in3, in4, sel, out);

input [7:0] in1, in2, in3, in4; //4 inputs de 8 bits
input [1:0] sel; //sinal de controle do mux
output reg [7:0] out;// saida de 8 bits

initial begin //apenas para simulacao

end

always @(in1, in2, in3, in4, sel)

case (sel)
	0: out <= in1;
	1: out <= in2;
	2: out <= in3;
	3: out <= in4;
	default: $stop; //caso impossivel de acontecer
endcase

endmodule