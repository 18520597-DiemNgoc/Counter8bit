module MUX(Y, A, B, Sel);
	input A, B, Sel;
	output Y;
	wire t1, t2;
	
	and(t1, A, ~Sel),
		(t2, B, Sel);
	or(Y, t1,t2);
endmodule
	
	
