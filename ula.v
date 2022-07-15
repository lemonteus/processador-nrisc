module ULA (a, b, c, result, zero, ULAOp);

clock C1 (c);
input [7:0] a, b;
input c;
reg [7:0] leftOp, rightOp;
input [1:0] ULAOp;
output reg [7:0] result;
output zero;

assign zero = (result==0);

initial begin

leftOp = a;
rightOp = b;

$monitor(" %0d %b %b %b ", $time, leftOp, rightOp, result);

end

always @(posedge c) begin

	case (ULAOp)
	
	2'b00: result = leftOp + rightOp;
	2'b01:	result = leftOp - rightOp;
	2'b10:	result = leftOp & rightOp;
	2'b11:	result = leftOp | rightOp;
	default: result = 0; //esse caso nao deve acontecer

	endcase

end

endmodule