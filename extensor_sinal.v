module ExtensorSinal2pra8(sinal_entrada, sinal_estendido);
    input [1:0] sinal_entrada;
    output [7:0] sinal_estendido;
    assign sinal_estendido = 6'b000000 + sinal_entrada;
endmodule

module ExtensorSinal1pra8(sinal_entrada, sinal_estendido);
    input sinal_entrada;
    output [7:0] sinal_estendido;
    assign sinal_estendido = 7'b0000000 + sinal_entrada;
endmodule