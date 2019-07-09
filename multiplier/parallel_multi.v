`timescale 1ns / 1ps

module parallel_multiplier(input [3:0] A, B,
                           output [7:0] Y);
                  
    wire [3:0] PP0, PP1, PP2, PP3;
    wire [7:0] sum1, sum0;
    wire DONT_USE;
    
    AND      a0 (A, B[0], PP0);
    AND      a1 (A, B[1], PP1);
    AND      a2 (A, B[2], PP2);
    AND      a3 (A, B[3], PP3);
    
    CLA_8bit u0 ({4'b0, PP0},       {3'b0, PP1, 1'b0}, 1'b0, sum0, DONT_USE);
    CLA_8bit u1 ({2'b0, PP2, 2'b0}, {1'b0, PP3, 3'b0}, 1'b0, sum1, DONT_USE);
    CLA_8bit u2 (sum0, sum1, 1'b0, Y, DONT_USE);
    
endmodule