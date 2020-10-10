module D_FF(Q, Qn, Din, clk);
	input Din, clk;
	output Q, Qn;
	wire q1,q2;
	
	D_latch master(.Q_latch(q1), .Qn_latch(q2), .Din_latch(Din), .clk_d(~clk));
	D_latch slave(.Q_latch(Q), .Qn_latch(Qn), .Din_latch(q1), .clk_d(clk));
	

endmodule



