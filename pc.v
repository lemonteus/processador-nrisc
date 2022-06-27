`timescale 1ns/1ns

module pc #(parameter memoryOffset=8'b11001000)(PC, overridePC, c);

//input EscPC, clock, halt;

clock C1 (c);
input c;
reg EscPC, halt;
input [7:0] overridePC;
output reg [7:0] PC;

initial begin

 //apenas para fins de simulacao
assign EscPC=1'b0;
assign halt=1'b0;

$display ("Valor inicial PC: %b", PC);
$monitor(" %0d %b %b %b ", $time, PC, halt, c);

PC = memoryOffset;

#20 $stop; //simulacao ira rodar por apenas 20 ciclos

end

always @(posedge c)

if (!halt) begin
	if (EscPC)
		PC = overridePC;
	else 
		PC = PC + 1'b1;
end

endmodule


