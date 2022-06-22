module data_memory #(parameter width=8, parameter depth=256);

reg [width:0] Mem [depth:0]; //256 posicoes de memoria

integer i; //iterador

initial begin

	$readmemb("mem.dat", Mem, 1, 10);
	for (i=0; i<depth; i=i+1)
		$display("Mem[%0d] %b", i, Mem[i]);
	end 

endmodule