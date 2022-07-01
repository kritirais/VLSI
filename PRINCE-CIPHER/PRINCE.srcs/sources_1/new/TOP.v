`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2022 11:10:59 AM
// Design Name: 
// Module Name: TOP
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


module TOP(
  input [63:0] data,
  input [127:0] key,
  input en_de,
  input clk,
  input rst,
  output [63:0] out);
  
  
  wire [63:0] outEn, outDe;
  
  Encrypt e1(.data(data), .key(key), .clk(clk), .rst(rst), .out(outEn));
  Decrypt d1(.data(data), .key(key), .clk(clk), .rst(rst), .out(outDe));
  
  assign out = en_de ? outEn : outDe;
  
endmodule
