`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2022 11:17:54 AM
// Design Name: 
// Module Name: Minv
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


module Minv(
  input [63:0] in,
  output [63:0] out
);
  
  wire [63:0] temp;
  
  assign temp[63 : 60] = in[63 : 60];
  assign temp[59 : 56] = in[11 : 8];
  assign temp[55 : 52] = in[23 : 20];
  assign temp[51 : 48] = in[35 : 32];
  assign temp[47 : 44] = in[47 : 44];
  assign temp[43 : 40] = in[59 : 56];
  assign temp[39 : 36] = in[7 : 4];
  assign temp[35 : 32] = in[19 : 16];
  assign temp[31 : 28] = in[31 : 28];
  assign temp[27 : 24] = in[43 : 40];
  assign temp[23 : 20] = in[55 : 52];
  assign temp[19 : 16] = in[3 : 0];
  assign temp[15 : 12] = in[15 : 12];
  assign temp[11 : 8]  = in[27 : 24];
  assign temp[7 : 4]   = in[39 : 36];
  assign temp[3 : 0]   = in[51 : 48];
  
  MPrime mp1(.in(temp), .out(out));
  
endmodule
