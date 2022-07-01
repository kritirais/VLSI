`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2022 11:54:40 PM
// Design Name: 
// Module Name: Encrypt
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


module Encrypt(
    input [63:0] data,
    input [127:0] key,
    input clk,
    input rst,
    output [63:0] out
    );
    
    
    wire [63:0] k0, k1, k0p;
    wire [63:0] corein, coreout;
  
    assign k0 = key[127:64];
    assign k1 = key[63:0];
    assign k0p = {k0[0], k0[63 : 2], (k0[1] ^ k0[63])};
  
    assign corein = data ^ k0;
  
    PrinceCore pc1(.clk(clk), .rst(rst), .in(corein), .key(k1), .out(coreout));
  
    assign out = coreout ^ k0p;
endmodule
