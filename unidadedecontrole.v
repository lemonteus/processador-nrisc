module unidadecontrole (halt, MemInstruc, MemRead, MemWrite, Load, Beq, ULAsrc1, ULAsrc2, ULAOp, Slt, EscPC);

   inout halt;
   input [7:0] MemInstruc;
   wire [2:0] MemInstruc1;
   wire [1:0] MemInstruc2;
   output reg [1:0] ULAOp;
   output reg MemRead, MemWrite, Load, Beq, Slt, EscPC;
   output reg [1:0] ULAsrc1, ULAsrc2;

   assign MemInstruc1 = MemInstruc[7:5];
   assign MemInstruc2 = MemInstruc[1:0];

	always @(MemInstruc)
		begin
			if((MemInstruc1 == 3'b000)) //add
				begin
					MemRead <= 1'b1;
					MemWrite <= 1'b1;
					Load <= 1'b0;
					Beq <= 1'b0;
					ULAsrc1 <= 2'b10;
					ULAsrc2 <= 2'b00;
					ULAOp <= 2'b00;
					Slt <= 1'b0;
					EscPC <= 1'b0;
				end

			else if((MemInstruc1 == 3'b001)) //addi
				begin
					MemRead <= 1'b1;
					MemWrite <= 1'b1;
					Load <= 1'b0;
					Beq <= 1'b0;
					ULAsrc1 <= 2'b10;
					ULAsrc2 <= 2'b10;
					ULAOp <= 2'b00;
					Slt <= 1'b0;
					EscPC <= 1'b0;
				end

			else if((MemInstruc1 == 3'b010)) //load
				begin
					MemRead <= 1'b1;
					MemWrite <= 1'b0;
					Load <= 1'b1;
					Beq <= 1'b0;
					ULAsrc1 <= 2'bzz; //XX
					ULAsrc2 <= 2'bzz; //XX
					ULAOp <= 2'bzz; 
					Slt <= 1'b0;
					EscPC <= 1'b0;
				end

			else if((MemInstruc1 == 3'b011)) //store
				begin
					MemRead <= 1'b1;
					MemWrite <= 1'b1;
					Load <= 1'b0;
					Beq <= 1'b0;
					ULAsrc1 <= 2'bzz; //XX
					ULAsrc2 <= 2'bzz; //XX
					ULAOp <= 2'bzz;
					Slt <= 1'b0;
					EscPC <= 1'b0;
				end

			else if((MemInstruc1 == 3'b10z)) //slt
				begin
					MemRead <= 1'b0;
					MemWrite <= 1'b1;
					Load <= 1'b0;
					Beq <= 1'b0;
					ULAsrc1 <= 2'b10;
					ULAsrc2 <= 2'b10;
					ULAOp <= 2'b01;
					Slt <= 1'b1;
					EscPC <= 1'b0;
				end

			else if((MemInstruc1 == 3'b110) && (MemInstruc2 == 2'b00)) //reset
				begin
					MemRead <= 1'b1;
					MemWrite <= 1'b1;
					Load <= 1'b0;
					Beq <= 1'b0;
					ULAsrc1 <= 2'b10;
					ULAsrc2 <= 2'bzz; //XX
					ULAOp <= 2'b00;
					Slt <= 1'b0;
					EscPC <= 1'b0;
				end

			else if((MemInstruc1 == 3'b110) && (MemInstruc2 == 2'b01)) //or
				begin 
					MemRead <= 1'b1;
					MemWrite <= 1'b0;
					Load <= 1'b0;
					Beq <= 1'b0;
					ULAsrc1 <= 2'b11;
					ULAsrc2 <= 2'b01;
					ULAOp <= 2'b11; //110X01
					Slt <= 1'b0;
					EscPC <= 1'b0;
				end

			else if((MemInstruc1 == 3'b110) && (MemInstruc2 == 2'b10)) //setbool
				begin
					MemRead <= 1'b1;
					MemWrite <= 1'b1;
					Load <= 1'b0;
					Beq <= 1'b0;
					ULAsrc1 <= 2'b11;
					ULAsrc2 <= 2'bzz; //XX
					ULAOp <= 6'b110z10; //110X10
					Slt <= 1'b0;
					EscPC <= 1'b0;
				end

			else if ((MemInstruc1 == 3'b110) && (MemInstruc2 == 2'b11)) //halt
				begin
					MemRead <= 1'b0;
					MemWrite <= 1'b0;
					Load <= 1'b0;
					Beq <= 1'b0;
					ULAsrc1 <= 2'bzz; //XX
					ULAsrc2 <= 2'bzz; //XX
					ULAOp <= 2'bzz; //110XXX11
					Slt <= 1'b0;
					EscPC <= 1'b1;
				end
				
			else if (MemInstruc1 == 3'b111) //beq
				begin
					MemRead <= 1'b1;
					MemWrite <= 1'b0;
					Load <= 1'b0;
					Beq <= 1'b1;
					ULAsrc1 <= 2'b11;
					ULAsrc2 <= 2'b01;
					ULAOp <= 2'b11;
					Slt <= 1'b0;
					EscPC <= 1'b1;
				end
		end
endmodule