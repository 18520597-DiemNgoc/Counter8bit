`timescale 1ns/1ns

module TestBench(); //OUT, DATA_IN, E, D, LOAD, CLK
  parameter n = 8;
  reg E_tb, D_tb, LOAD_tb, CLK_tb;
  reg [(n - 1):0] DATA_IN_tb;
  wire [(n - 1):0] OUT_tb;
  
  initial begin
    CLK_tb = 0; 
    LOAD_tb = 1'b0;
    E_tb = 1'b0;
    D_tb = 1'b0;
    
    #10 LOAD_tb = 1'b1; E_tb = 1'b1; DATA_IN_tb = 8'h5;
    #20 LOAD_tb = 1'b0;
    #70 D_tb = 1'b1;
    #70 D_tb = 1'b0; E_tb = 1'b0;
    #150 $finish;
  end
  
  initial begin
    $monitor("Time=%d, E=%b, D=%b, load=%b, DataIn=%h, Qout=%h", $time, E_tb, D_tb, LOAD_tb, DATA_IN_tb, OUT_tb);
  end
  
  always @(CLK_tb)
    #10 CLK_tb <= ~CLK_tb;
    
  Counter DUT(.OUT(OUT_tb), .DATA_IN(DATA_IN_tb), .E(E_tb), .D(D_tb), .LOAD(LOAD_tb), .CLK(CLK_tb));
  
endmodule

    
    
    