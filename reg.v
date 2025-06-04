/*********************************************************************************
***
***  ECE 526L Experiment #8                           Hasin_Abrar, Sring 2025  ***         
***
**********************************************************************************
***   File name: reg.v                   Created by Hasin_Abrar 04/28/2025     ***
***                                                                            ***
*********************************************************************************/
`timescale 1ns/1ns
module Register #(parameter WIDTH = 4)(
    input clk,
    input [WIDTH-1:0] d,
    output reg [WIDTH-1:0] q
);
    always @(posedge clk)
        q <= d;
endmodule

