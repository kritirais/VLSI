`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2022 11:13:38 AM
// Design Name: 
// Module Name: Sbox
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


module Sbox(
  input [3:0] in,
  output reg [3:0] out
);
  
  always @(*) begin
    if(in == 4'h0) out = 4'hB;
    if(in == 4'h1) out = 4'hF;
    if(in == 4'h2) out = 4'h3;
    if(in == 4'h3) out = 4'h2;
    if(in == 4'h4) out = 4'hA;
    if(in == 4'h5) out = 4'hC;
    if(in == 4'h6) out = 4'h9;
    if(in == 4'h7) out = 4'h1;
    if(in == 4'h8) out = 4'h6;
    if(in == 4'h9) out = 4'h7;
    if(in == 4'hA) out = 4'h8;
    if(in == 4'hB) out = 4'h0;
    if(in == 4'hC) out = 4'hE;
    if(in == 4'hD) out = 4'h5;
    if(in == 4'hE) out = 4'hD;
    if(in == 4'hF) out = 4'h4;
  end
endmodule
