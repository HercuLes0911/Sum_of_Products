/*********************************************************************************
***
***  ECE 526L Experiment #8                           Hasin_Abrar, Sring 2025  ***         
***
**********************************************************************************
***   File name: top.v                   Created by Hasin_Abrar 04/28/2025  ***
***                                                                            ***
*********************************************************************************/
`timescale 1ns/1ns

module TopLevel #(parameter WIDTH = 4)(
    input clk,
    input [WIDTH-1:0] d1, d2, d3, d4,
    input [WIDTH-1:0] c1, c2, c3, c4,
    output [2*WIDTH+1:0] final_out
);

wire [2*WIDTH:0] mid1, mid2;

Level2 #(WIDTH) l2a(clk, d1, d2, c1, c2, mid1);
Level2 #(WIDTH) l2b(clk, d3, d4, c3, c4, mid2);

Adder #(2*WIDTH+1) final_add (
    .a(mid1),
    .b(mid2),
    .sum(final_out)
);

endmodule
