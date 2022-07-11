module unidadecontrole (halt, MemInstruc, MemRead, MemWrite, Load, Beq, ULAsrc1, ULAsrc2, ULAOp, Slt, EscPC);

   input halt;
	input [2:0] MemInstruc;
   output reg[2:0] ULAOp;
   output reg MemRead, MemWrite, Load, Beq, ULAsrc1, ULAsrc2, Slt, EscPC;
	
	always @(MemInstruc)
		begin
			if((MemInstruc == 3'b000)) //add
				begin
					MemRead <= 1'b1;
					MemWrite <= 1'b1;
					Load <= 1'b0;
					Beq <= 1'b0;
					ULAsrc1 <= 2'b10;
					ULAsrc2 <= 2'b00;
					ULAOp <= 3'b000;
					Slt <= 1'b0;
					EscPC <= 1'b0;
				end

			else if((MemInstruc == 3'b001)) //addi
				begin
					MemRead <= 1'b1;
					MemWrite <= 1'b1;
					Load <= 1'b0;
					Beq <= 1'b0;
					ULAsrc1 <= 2'b10;
					ULAsrc2 <= 2'b10;
					ULAOp <= 3'b001;
					Slt <= 1'b0;
					EscPC <= 1'b0;
				end

			else if((MemInstruc == 3'b010)) //load
				begin
					MemRead <= 1'b1;
					MemWrite <= 1'b0;
					Load <= 1'b1;
					Beq <= 1'b0;
					ULAsrc1 <= 2'bzz; //XX
					ULAsrc2 <= 2'bzz; //XX
					ULAOp <= 3'b010;
					Slt <= 1'b0;
					EscPC <= 1'b0;
				end

			else if((MemInstruc == 3'b011)) //store
				begin
					MemRead <= 1'b1;
					MemWrite <= 1'b1;
					Load <= 1'b0;
					Beq <= 1'b0;
					ULAsrc1 <= 2'bzz; //XX
					ULAsrc2 <= 2'bzz; //XX
					ULAOp <= 3'b011;
					Slt <= 1'b0;
					EscPC <= 1'b0;
				end

			else if((MemInstruc == 2'b10)) //slt
				begin
					MemRead <= 1'b0;
					MemWrite <= 1'b1;
					Load <= 1'b0;
					Beq <= 1'b0;
					ULAsrc1 <= 2'b10;
					ULAsrc2 <= 2'b10;
					ULAOp <= 2'b10;
					Slt <= 1'b1;
					EscPC <= 1'b0;
				end

			else if((MemInstruc == 5'b10000)) //reset
				begin
					MemRead <= 1'b1;
					MemWrite <= 1'b1;
					Load <= 1'b0;
					Beq <= 1'b0;
					ULAsrc1 <= 2'b10;
					ULAsrc2 <= 2'bzz; //XX
					ULAOp <= 5'b10000;
					Slt <= 1'b0;
					EscPC <= 1'b0;
				end

			else if((MemInstruc == 2'bzz)) //or
				begin 
					MemRead <= 1'b1;
					MemWrite <= 1'b0;
					Load <= 1'b0;
					Beq <= 1'b0;
					ULAsrc1 <= 2'b11;
					ULAsrc2 <= 2'b01;
					ULAOp <= 2'bzz; //110X01
					Slt <= 1'b0;
					EscPC <= 1'b0;
				end

			else if((MemInstruc == 6'b110z10)) //setbool
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

			else if (MemInstruc == 8'b110zzz11) //halt
				begin
					MemRead <= 1'b0;
					MemWrite <= 1'b0;
					Load <= 1'b0;
					Beq <= 1'b0;
					ULAsrc1 <= 2'bzz; //XX
					ULAsrc2 <= 2'bzz; //XX
					ULAOp <= 8'b110zzz11; //110XXX11
					Slt <= 1'b0;
					EscPC <= 1'b1;
				end
				
			else if (MemInstruc == 3'b111) //beq
				begin
					MemRead <= 1'b1;
					MemWrite <= 1'b0;
					Load <= 1'b0;
					Beq <= 1'b1;
					ULAsrc1 <= 2'b11;
					ULAsrc2 <= 2'b01;
					ULAOp <= 3'b111;
					Slt <= 1'b0;
					EscPC <= 1'b1;
				end
		end
endmodule
