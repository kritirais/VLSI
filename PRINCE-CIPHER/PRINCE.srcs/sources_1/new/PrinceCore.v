`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2022 11:12:06 AM
// Design Name: 
// Module Name: PrinceCore
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


module PrinceCore(
  input clk,
  input rst,
  input [63:0] in,
  input [63:0] key,
  output reg [63:0] out
);
  
  wire [63:0] RC [12:0];
  wire [63:0] sb_out, M_out, MPr_out, isb_out, isbPr_out, im_out;
  reg [3:0] round;
  reg [63:0] temp, temp_next, isb_out_pre;
  
  assign RC[0] = 64'h0000000000000000;
  assign RC[1] = 64'h13198a2e03707344;
  assign RC[2] = 64'ha4093822299f31d0;
  assign RC[3] = 64'h082efa98ec4e6c89;
  assign RC[4] = 64'h452821e638d01377;
  assign RC[5] = 64'hbe5466cf34e90c6c;
  assign RC[6] = 64'hFFFFFFFFFFFFFFFF;
  assign RC[7] = 64'h7ef84f78fd955cb1;
  assign RC[8] = 64'h85840851f1ac43aa;
  assign RC[9] = 64'hc882d32f25323c54;
  assign RC[10] = 64'h64a51195e0e3610d;
  assign RC[11] = 64'hd3b5a399ca0c2399;
  assign RC[12] = 64'hc0ac29b7c97c50dd;
  
  Sbox s1(.in(temp_next[3:0]), .out(sb_out[3:0]));
  Sbox s2(.in(temp_next[7:4]), .out(sb_out[7:4]));
  Sbox s3(.in(temp_next[11:8]), .out(sb_out[11:8]));
  Sbox s4(.in(temp_next[15:12]), .out(sb_out[15:12]));
  Sbox s5(.in(temp_next[19:16]), .out(sb_out[19:16]));
  Sbox s6(.in(temp_next[23:20]), .out(sb_out[23:20]));
  Sbox s7(.in(temp_next[27:24]), .out(sb_out[27:24]));
  Sbox s8(.in(temp_next[31:28]), .out(sb_out[31:28]));
  Sbox s9(.in(temp_next[35:32]), .out(sb_out[35:32]));
  Sbox s10(.in(temp_next[39:36]), .out(sb_out[39:36]));
  Sbox s11(.in(temp_next[43:40]), .out(sb_out[43:40]));
  Sbox s12(.in(temp_next[47:44]), .out(sb_out[47:44]));
  Sbox s13(.in(temp_next[51:48]), .out(sb_out[51:48]));
  Sbox s14(.in(temp_next[55:52]), .out(sb_out[55:52]));
  Sbox s15(.in(temp_next[59:56]), .out(sb_out[59:56]));
  Sbox s16(.in(temp_next[63:60]), .out(sb_out[63:60]));
  
  M m1(.in(sb_out), .out(M_out));

  //For round 6
  MPrime mp1(.in(sb_out), .out(MPr_out));
  InvSbox is1(.in(MPr_out[3:0]), .out(isbPr_out[3:0]));
  InvSbox is2(.in(MPr_out[7:4]), .out(isbPr_out[7:4]));
  InvSbox is3(.in(MPr_out[11:8]), .out(isbPr_out[11:8]));
  InvSbox is4(.in(MPr_out[15:12]), .out(isbPr_out[15:12]));
  InvSbox is5(.in(MPr_out[19:16]), .out(isbPr_out[19:16]));
  InvSbox is6(.in(MPr_out[23:20]), .out(isbPr_out[23:20]));
  InvSbox is7(.in(MPr_out[27:24]), .out(isbPr_out[27:24]));
  InvSbox is8(.in(MPr_out[31:28]), .out(isbPr_out[31:28]));
  InvSbox is9(.in(MPr_out[35:32]), .out(isbPr_out[35:32]));
  InvSbox is10(.in(MPr_out[39:36]), .out(isbPr_out[39:36]));
  InvSbox is11(.in(MPr_out[43:40]), .out(isbPr_out[43:40]));
  InvSbox is12(.in(MPr_out[47:44]), .out(isbPr_out[47:44]));
  InvSbox is13(.in(MPr_out[51:48]), .out(isbPr_out[51:48]));
  InvSbox is14(.in(MPr_out[55:52]), .out(isbPr_out[55:52]));
  InvSbox is15(.in(MPr_out[59:56]), .out(isbPr_out[59:56]));
  InvSbox is16(.in(MPr_out[63:60]), .out(isbPr_out[63:60]));
  
  
  //for round >=7
  Minv mi1(.in(temp), .out(im_out));
  
  InvSbox is17(.in(im_out[3:0]), .out(isb_out[3:0]));
  InvSbox is18(.in(im_out[7:4]), .out(isb_out[7:4]));
  InvSbox is19(.in(im_out[11:8]), .out(isb_out[11:8]));
  InvSbox is20(.in(im_out[15:12]), .out(isb_out[15:12]));
  InvSbox is21(.in(im_out[19:16]), .out(isb_out[19:16]));
  InvSbox is22(.in(im_out[23:20]), .out(isb_out[23:20]));
  InvSbox is23(.in(im_out[27:24]), .out(isb_out[27:24]));
  InvSbox is24(.in(im_out[31:28]), .out(isb_out[31:28]));
  InvSbox is25(.in(im_out[35:32]), .out(isb_out[35:32]));
  InvSbox is26(.in(im_out[39:36]), .out(isb_out[39:36]));
  InvSbox is27(.in(im_out[43:40]), .out(isb_out[43:40]));
  InvSbox is28(.in(im_out[47:44]), .out(isb_out[47:44]));
  InvSbox is30(.in(im_out[51:48]), .out(isb_out[51:48]));
  InvSbox is31(.in(im_out[55:52]), .out(isb_out[55:52]));
  InvSbox is32(.in(im_out[59:56]), .out(isb_out[59:56]));
  InvSbox is33(.in(im_out[63:60]), .out(isb_out[63:60]));
  
  always @(*) begin
    if (round == 4'd0) temp = in ^ key ^ RC[0];
    else if (round <= 4'd5) temp = M_out ^ RC[round] ^ key;
    else if (round == 4'd6) temp = isbPr_out;
    else if (round == 4'd7) temp = temp_next ^ key ^ RC[round];
    else if (round > 4'd7) temp = isb_out_pre ^ key ^ RC[round];

  end
  
  always @(posedge clk) begin
      if(rst) round = 'd0;
      else if(round == 4'd11) round = 4'd0;
      else round = round + 1'b1;
  end
  
  always @(posedge clk) begin
      temp_next <= temp;
      isb_out_pre <= isb_out;
  end
  
  always @(*) begin
      if(round == 4'd11) out = RC[12] ^ key ^ isb_out;
  end
  
endmodule
      
