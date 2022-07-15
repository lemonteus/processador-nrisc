`timescale 1ns/1ns
module simulation();

wire[7:0] memInstr, memData, dadoEscrito, readData;
wire MemWrite;
reg halt;

integer i, j;

clock CLK (c);
nrisc NRISC (c, memInstr, memData, dadoEscrito, readData, MemWrite, halt);
memory MEM (pc, BR_OutBool1, c, halt, MemRead, MemWrite, readData, memInstr);

initial begin 

	//inicializando memoria com 0
	for (i=0; i<MEM.depth; i=i+1) begin
		for (j=0; j<MEM.width; j=j+1)
			MEM.Mem[i]=8'b00000000;		
	end

	i = 0;

	//lendo dados da memoria
	$readmemb("mem.dat", MEM.Mem, 0, MEM.depth);

	for (i=0; i<MEM.depth; i=i+1) begin
		$display("Mem[%0d] %b", i, MEM.Mem[i]);
        end 

	#1 $monitor(" %0d %b %b %b %b %b", $time, c, pc, memInstr, memData, MemRead);
end

always begin

	if (NRISC.memInstr == 8'b110zzz11) begin
		halt = 1'b1;
		#1 $stop;
	end
	
end

endmodule