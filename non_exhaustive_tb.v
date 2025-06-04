/*********************************************************************************
***
***  ECE 526L Experiment #8                           Hasin_Abrar, Sring 2025  ***         
***
**********************************************************************************
***   File name: non_exhaustive_tb.v                   Created by Hasin_Abrar 04/28/2025  ***
***                                                                            ***
*********************************************************************************/
// Non-Exhaustive Testbench
// ----------------------------

`timescale 1ns/1ps

module non_exhaustive_tb;

reg clk;
reg [3:0] d1, d2, d3, d4, c1, c2, c3, c4;
wire [9:0] final_out; // 2*WIDTH+1 = 9 bits for WIDTH=4

// Instantiate the TopLevel module
TopLevel uut (
    .clk(clk),
    .d1(d1), .d2(d2), .d3(d3), .d4(d4),
    .c1(c1), .c2(c2), .c3(c3), .c4(c4),
    .final_out(final_out)
);

// Clock generation
initial begin
  clk = 0;
  forever #5 clk = ~clk;
end

// Apply 8 robust test vectors
initial begin
  $vcdpluson;
  $monitor($time, " d1=%d c1=%d d2=%d c2=%d d3=%d c3=%d d4=%d c4=%d => final_out=%d", d1, c1, d2, c2, d3, c3, d4, c4, final_out);

  #10 d1=4; c1=2; d2=3; c2=5; d3=1; c3=7; d4=0; c4=9;
  #10 d1=0; c1=0; d2=0; c2=0; d3=0; c3=0; d4=0; c4=0;
  #10 d1=15; c1=15; d2=15; c2=15; d3=15; c3=15; d4=15; c4=15;
  #10 d1=1; c1=1; d2=1; c2=1; d3=1; c3=1; d4=1; c4=1;
  #10 d1=8; c1=7; d2=3; c2=6; d3=2; c3=5; d4=4; c4=3;
  #10 d1=5; c1=2; d2=6; c2=4; d3=7; c3=8; d4=9; c4=1;
  #10 d1=2; c1=3; d2=5; c2=7; d3=1; c3=2; d4=8; c4=6;
  #10 d1=9; c1=1; d2=10; c2=2; d3=11; c3=3; d4=12; c4=4;

  #20 $finish;
end

endmodule


