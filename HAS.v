module HAS(C_out, Q_out, D_Ctrl, E_Ctrl, Q_IN);	// Q_IN is D_HAS
	input D_Ctrl, E_Ctrl, Q_IN;
	output C_out, Q_out;
	wire t1,t2,t3,t4;
	
	and(t1, D_Ctrl, E_Ctrl, ~Q_IN),
		(t2,~D_Ctrl, E_Ctrl, Q_IN);
	or(t3, t1,t2);
	xor(t4, Q_IN, E_Ctrl);
	
	assign C_out = t3;
	assign Q_out = t4;
endmodule

