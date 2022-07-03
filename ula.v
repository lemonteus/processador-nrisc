module ULA (a, b, c, result, zero, ULAOp)

clock C1 (c);
input reg a, b, c;
unsigned reg leftOp, rightOp;
input reg [1:0] ULAOp;
output reg result;
output zero;

initial begin

leftOp = a;
rightOp = b;

end

always @(posedge c) begin

	case (ULAOp)
	
	2'b00: result = a + b;
	2'b01:	result = a - b;
	2'b10:	result = a . b;
	2'b11:	result = a & b;

	endcase

end

endmodule