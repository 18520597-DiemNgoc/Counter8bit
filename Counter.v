module Counter(OUT, DATA_IN, E, D, LOAD, CLK);
	parameter n = 8;
	input [(n - 1):0] DATA_IN;
	input E, D, LOAD, CLK;
	output [(n - 1):0] OUT;
	wire h0,h1,h2,h3,h4,h5,h6,h7,c1,c2,c3,c4,c5,c6; // output of HAS
	wire s0,s1,s2,s3,s4,s5,s6,s7;	// output of SELECTOR
	
	HAS HAS0(.C_out(c1), .Q_out(h0), .D_Ctrl(D), .E_Ctrl(E), .Q_IN(OUT[0]));
	HAS HAS1(.C_out(c2), .Q_out(h1), .D_Ctrl(D), .E_Ctrl(c1), .Q_IN(OUT[1]));
	HAS HAS2(.C_out(c3), .Q_out(h2), .D_Ctrl(D), .E_Ctrl(c2), .Q_IN(OUT[2]));
	HAS HAS3(.C_out(c4), .Q_out(h3), .D_Ctrl(D), .E_Ctrl(c3), .Q_IN(OUT[3]));
	HAS HAS4(.C_out(c5), .Q_out(h4), .D_Ctrl(D), .E_Ctrl(c4), .Q_IN(OUT[4]));
	HAS HAS5(.C_out(c6), .Q_out(h5), .D_Ctrl(D), .E_Ctrl(c5), .Q_IN(OUT[5]));
	HAS HAS6(.C_out(c7), .Q_out(h6), .D_Ctrl(D), .E_Ctrl(c6), .Q_IN(OUT[6]));
	HAS HAS7(.C_out(), .Q_out(h7), .D_Ctrl(D), .E_Ctrl(c7), .Q_IN(OUT[7]));
	
	MUX MUX0(.Y(s0), .A(h0), .B(DATA_IN[0]), .Sel(LOAD));
	MUX MUX1(.Y(s1), .A(h1), .B(DATA_IN[1]), .Sel(LOAD));
	MUX MUX2(.Y(s2), .A(h2), .B(DATA_IN[2]), .Sel(LOAD));
	MUX MUX3(.Y(s3), .A(h3), .B(DATA_IN[3]), .Sel(LOAD));
	MUX MUX4(.Y(s4), .A(h4), .B(DATA_IN[4]), .Sel(LOAD));
	MUX MUX5(.Y(s5), .A(h5), .B(DATA_IN[5]), .Sel(LOAD));
	MUX MUX6(.Y(s6), .A(h6), .B(DATA_IN[6]), .Sel(LOAD));
	MUX MUX7(.Y(s7), .A(h7), .B(DATA_IN[7]), .Sel(LOAD));
	
	D_FF D0(.Q(OUT[0]), .Qn(), .Din(s0), .clk(CLK));
	D_FF D1(.Q(OUT[1]), .Qn(), .Din(s1), .clk(CLK));
	D_FF D2(.Q(OUT[2]), .Qn(), .Din(s2), .clk(CLK));
	D_FF D3(.Q(OUT[3]), .Qn(), .Din(s3), .clk(CLK));
	D_FF D4(.Q(OUT[4]), .Qn(), .Din(s4), .clk(CLK));
	D_FF D5(.Q(OUT[5]), .Qn(), .Din(s5), .clk(CLK));
	D_FF D6(.Q(OUT[6]), .Qn(), .Din(s6), .clk(CLK));
	D_FF D7(.Q(OUT[7]), .Qn(), .Din(s7), .clk(CLK));
endmodule
