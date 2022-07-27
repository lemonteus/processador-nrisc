module testbench (in1, in2, in3, in4);

input [7:0] in1, in2, in3, in4;

reg [1:0] MUX41_sel, MUX31_sel, sinal_entrada2;
reg MUX21_sel, sinal_entrada1, input1, input2;
reg [7:0] pc;

wire [7:0] MUX41_out, MUX31_out, MUX21_out, S_out, sinal_estendido1, sinal_estendido2;

assign in1 = 8'b00000000;
assign in2 = 8'b00001111;
assign in3 = 8'b11110000;
assign in4 = 8'b11111111;

mux41 M41 (in1, in2, in3, in4, MUX41_sel, MUX41_out);
mux31 M31 (in1, in2, in3, MUX31_sel, MUX31_out);
mux21 M21 (in1, in2, MUX21_sel, MUX21_out);
somador S (pc, S_out);
AND A (input1, input2, AND_out);
ExtensorSinal1pra8 E18 (sinal_entrada1, sinal_estendido1);
ExtensorSinal2pra8 E28 (sinal_entrada2, sinal_estendido2);

initial begin

#1 $display("Mostrando saida do MUX41:\n");

#1 $monitor(" %0d %b %b ", $time, MUX41_sel, MUX41_out);

#1 MUX41_sel = 2'b00;
#1 MUX41_sel = 2'b01;
#1 MUX41_sel = 2'b10;
#1 MUX41_sel = 2'b11;

#1 $display("\nMostrando saida do MUX31:\n");

#1 $monitor(" %0d %b %b ", $time, MUX31_sel, MUX31_out);

#1 MUX31_sel = 2'b00;
#1 MUX31_sel = 2'b01;
#1 MUX31_sel = 2'b10;

#1 $display("\nMostrando saida do MUX21:\n");

#1 $monitor(" %0d %b %b ", $time, MUX21_sel, MUX21_out);

#1 MUX21_sel = 0;
#1 MUX21_sel = 1;

#1 $display("\nMostrando saida do somador:\n");

#1 $monitor(" %0d %b %b ", $time, pc, S_out);

#1 pc = 8'b11001100;
#1 pc = S_out;
#1 pc = S_out;
#1 pc = S_out;

#1 $display("\nMostrando saida do gate AND:\n");

#1 $monitor(" %0d %b %b %b", $time, input1, input2, AND_out);

#1 input1 = 0; input2 = 0;
#1 input1 = 0; input2 = 1;
#1 input1 = 1; input2 = 0;
#1 input1 = 1; input2 = 1;

#1 $display("\nMostrando saida do extensor de sinal 1 pra 8:\n");

#1 $monitor(" %0d %b %b ", $time, sinal_entrada1, sinal_estendido1);

#1 sinal_entrada1 = 1'b1;

#1 $display("\nMostrando saida do extensor de sinal 2 pra 8:\n");

#1 $monitor(" %0d %b %b ", $time, sinal_entrada2, sinal_estendido2);

#1 sinal_entrada2 = 2'b11;

#5 $stop;

end


endmodule