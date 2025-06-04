/*********************************************************************************
***
***  ECE 526L Experiment #8                           Hasin_Abrar, Sring 2025  ***         
***
**********************************************************************************
***   File name: mult.v                   Created by Hasin_Abrar 04/28/2025    ***
***                                                                            ***
*********************************************************************************/
`timescale 1ns/1ns
module Multiplier #(parameter WIDTH = 4)(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    output [2*WIDTH-1:0] out
);
    assign out = a * b;
endmodule

