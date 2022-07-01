`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2022 11:56:35 PM
// Design Name: 
// Module Name: Decrypt
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Decrypt(
    input [63:0] data,
    input [127:0] key,
    input clk,
    input rst,
    output [63:0] out
    );
    
    wire [63:0] k0, k1, k0p;
    wire [63:0] corein, coreout;
    wire [63:0] alpha;
    
    assign alpha = 64'hc0ac29b7c97c50dd;
  
    assign k0p = key[127:64];
    assign k1 = key[63:0] ^ alpha;
    assign k0 = {k0p[0], k0p[63 : 2], (k0p[1] ^ k0p[63])};
  
    assign corein = data ^ k0;
  
    PrinceCore pc1(.clk(clk), .rst(rst), .in(corein), .key(k1), .out(coreout));
  
    assign out = coreout ^ k0p;
endmodule
