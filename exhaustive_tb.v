/*********************************************************************************
***
***  ECE 526L Experiment #8                           Hasin_Abrar, Sring 2025  ***         
***
**********************************************************************************
***   File name: exhaustive_tb.v                   Created by Hasin_Abrar 04/28/2025  ***
***                                                                            ***
*********************************************************************************/
`timescale 1ns/1ns
`define FORCE_ERROR  // will need to comment this out to disable the error

module exhaustive_tb;

parameter WIDTH = 4;
reg clk;
reg [WIDTH-1:0] d1, d2, d3, d4, c1, c2, c3, c4;
wire [2*WIDTH+1:0] out;

TopLevel #(WIDTH) uut (
    .clk(clk),
    .d1(d1), .d2(d2), .d3(d3), .d4(d4),
    .c1(c1), .c2(c2), .c3(c3), .c4(c4),
    .final_out(out)
);

// Clock generation
initial clk = 0;
always #5 clk = ~clk;

// Flat sum-of-products model
function [2*WIDTH+1:0] flat_sum_of_products;
    input [WIDTH-1:0] d1, d2, d3, d4;
    input [WIDTH-1:0] c1, c2, c3, c4;
    reg [2*WIDTH-1:0] p1, p2, p3, p4;
    reg [2*WIDTH:0] s1, s2;
    begin
        p1 = d1 * c1;
        p2 = d2 * c2;
        p3 = d3 * c3;
        p4 = d4 * c4;
        s1 = p1 + p2;
        s2 = p3 + p4;
        flat_sum_of_products = s1 + s2;
    end
endfunction

integer i, j, k, l, m, n, o, p;
integer count = 0;

initial begin
    $vcdpluson;
    $display("=== Exhaustive Testbench (WITH/WITHOUT Error) ===");

    $monitoron;

    for (i = 0; i < 4; i = i + 1)
        for (j = 0; j < 4; j = j + 1)
            for (k = 0; k < 4; k = k + 1)
                for (l = 0; l < 4; l = l + 1)
                    for (m = 0; m < 4; m = m + 1)
                        for (n = 0; n < 4; n = n + 1)
                            for (o = 0; o < 4; o = o + 1)
                                for (p = 0; p < 4; p = p + 1)
                                begin
                                    #10;
                                    d1 = i; d2 = j; d3 = k; d4 = l;
                                    c1 = m; c2 = n; c3 = o; c4 = p;
                                    count = count + 1;
                                    
                                    #10;

                                    if (count == 49152) begin
                                        `ifdef FORCE_ERROR
                                            force uut.final_out = out + 2;
                                        `endif
                                    end

                                    if (out !== flat_sum_of_products(i,j,k,l,m,n,o,p)) begin
                                        $display("ERROR @%0t: Inputs = %0d,%0d,%0d,%0d %0d,%0d,%0d,%0d | Expected = %0d | Got = %0d",
                                                 $time, i,j,k,l,m,n,o,p,
                                                 flat_sum_of_products(i,j,k,l,m,n,o,p), out);
                                    #1000;  // <-- Wait after error before stopping simulation
                                        $finish;
                                    end

                                    // Monitor control at start and end
                                    if (count == 13)
                                        $monitoroff;
                                    if (count == 49138) // 49152 - ~12
                                        $monitoron;
                                end

    $monitoroff;
    $display("All exhaustive tests passed successfully.");
    $finish;
end

endmodule

