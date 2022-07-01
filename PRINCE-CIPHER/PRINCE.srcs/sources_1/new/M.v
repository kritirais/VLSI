`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2022 11:15:33 AM
// Design Name: 
// Module Name: M
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


module M(
  input [63:0] in,
  output [63:0] out
);
  wire [63:0] temp;
  assign out[63:60] = temp[63:60];
  assign out[59:56] = temp[43:40];
  assign out[55:52] = temp[23:20];
  assign out[51:48] = temp[3:0];
  assign out[47:44] = temp[47:44];
  assign out[43:40] = temp[27:24];
  assign out[39:36] = temp[7:4];
  assign out[35:32] = temp[51:48];
  assign out[31:28] = temp[31:28];
  assign out[27:24] = temp[11:8];
  assign out[23:20] = temp[55:52];
  assign out[19:16] = temp[35:32];
  assign out[15:12] = temp[15:12];
  assign out[11:8] = temp[59:56];
  assign out[7:4] = temp[39:36];
  assign out[3:0] = temp[19:16];
  
  MPrime mp1(.in(in), .out(temp));
  
endmodule
