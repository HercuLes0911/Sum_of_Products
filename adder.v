/*********************************************************************************
***
***  ECE 526L Experiment #8                           Hasin_Abrar, Sring 2025  ***         
***
**********************************************************************************
***   File name: adder.v                   Created by Hasin_Abrar 04/28/2025   ***
***                                                                            ***
*********************************************************************************/
`timescale 1ns/1ns
module Adder #(parameter WIDTH = 8)(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    output [WIDTH:0] sum // One bit wider
);
    assign sum = a + b;
endmodule

