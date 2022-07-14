module somador(pc, out);

input [7:0] pc;
output reg [7:0] out;

initial begin

assign out = pc + 1;

end

endmodule