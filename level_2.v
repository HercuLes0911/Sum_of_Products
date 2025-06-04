/*********************************************************************************
***
***  ECE 526L Experiment #8                           Hasin_Abrar, Sring 2025  ***         
***
**********************************************************************************
***   File name: Level_2.v                   Created by Hasin_Abrar 04/28/2025  ***
***                                                                            ***
*********************************************************************************/
`timescale 1ns/1ns
module Level2 #(parameter WIDTH = 4)(
    input clk,
    input [WIDTH-1:0] data1, data2,
    input [WIDTH-1:0] coef1, coef2,
    output [2*WIDTH:0] out
);
    wire [WIDTH-1:0] q1, q2;
    wire [2*WIDTH-1:0] m1, m2;
    wire [2*WIDTH:0] sum;

    Register #(WIDTH) r1(clk, data1, q1);
    Register #(WIDTH) r2(clk, data2, q2);
    Multiplier #(WIDTH) mul1(q1, coef1, m1);
    Multiplier #(WIDTH) mul2(q2, coef2, m2);
    Adder #(2*WIDTH) add1(m1, m2, sum);

    assign out = sum;
endmodule

