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
	
	3'b000: result = a + b;
	3'b001:	result = a - b;
	3'b010:	result = a . b;
	3'b011:	result = a & b;
	3'b100: 
	3'b101:
	3'b110:
	3'b111:

	endcase

end

endmodule