module pc #(parameter memoryOffset=8'b11001000)(PC, EscPC, clock, halt, overridePC);

input EscPC, clock, halt;
input [7:0] overridePC;
output reg [7:0] PC;

initial begin

assign PC = memoryOffset;

end

always begin @(posedge clock) //escrita

if (!halt) begin
	if (EscPC)
		PC = overridePC;
	else 
		PC = PC + 1'b1;
end

end

endmodule
