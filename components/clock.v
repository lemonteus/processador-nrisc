`timescale 1ns/1ns

//Especificacao do clock em Verilog -  retirado do Apendice C do livro do Patterson

module clock(c);

output reg c;

initial begin

//debug (monitorar o valor do clock)
$monitor ("%b", c);

c = 0;

end

always begin

#1 c = 1;
#1 c = 0;

end

endmodule