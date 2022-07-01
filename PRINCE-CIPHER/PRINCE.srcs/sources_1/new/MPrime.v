`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2022 11:16:53 AM
// Design Name: 
// Module Name: MPrime
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


module MPrime(
  input [63:0] in,
  output [63:0] out
);
  
		assign out[63] = in[59] ^ in[55] ^ in[51];
        assign out[62] = in[62] ^ in[54] ^ in[50];
        assign out[61] = in[61] ^ in[57] ^ in[49];
        assign out[60] = in[60] ^ in[56] ^ in[52];
        assign out[59] = in[63] ^ in[59] ^ in[55];
        assign out[58] = in[58] ^ in[54] ^ in[50];
        assign out[57] = in[61] ^ in[53] ^ in[49];
        assign out[56] = in[60] ^ in[56] ^ in[48];
        assign out[55] = in[63] ^ in[59] ^ in[51];
        assign out[54] = in[62] ^ in[58] ^ in[54];
        assign out[53] = in[57] ^ in[53] ^ in[49];
        assign out[52] = in[60] ^ in[52] ^ in[48];
        assign out[51] = in[63] ^ in[55] ^ in[51];
        assign out[50] = in[62] ^ in[58] ^ in[50];
        assign out[49] = in[61] ^ in[57] ^ in[53];
        assign out[48] = in[56] ^ in[52] ^ in[48];

        assign out[47] = in[47] ^ in[43] ^ in[39];
        assign out[46] = in[42] ^ in[38] ^ in[34];
        assign out[45] = in[45] ^ in[37] ^ in[33];
        assign out[44] = in[44] ^ in[40] ^ in[32];
        assign out[43] = in[47] ^ in[43] ^ in[35];
        assign out[42] = in[46] ^ in[42] ^ in[38];
        assign out[41] = in[41] ^ in[37] ^ in[33];
        assign out[40] = in[44] ^ in[36] ^ in[32];
        assign out[39] = in[47] ^ in[39] ^ in[35];
        assign out[38] = in[46] ^ in[42] ^ in[34];
        assign out[37] = in[45] ^ in[41] ^ in[37];
        assign out[36] = in[40] ^ in[36] ^ in[32];
        assign out[35] = in[43] ^ in[39] ^ in[35];
        assign out[34] = in[46] ^ in[38] ^ in[34];
        assign out[33] = in[45] ^ in[41] ^ in[33];
        assign out[32] = in[44] ^ in[40] ^ in[36];

        assign out[31] = in[31] ^ in[27] ^ in[23];
        assign out[30] = in[26] ^ in[22] ^ in[18];
        assign out[29] = in[29] ^ in[21] ^ in[17];
        assign out[28] = in[28] ^ in[24] ^ in[16];
        assign out[27] = in[31] ^ in[27] ^ in[19];
        assign out[26] = in[30] ^ in[26] ^ in[22];
        assign out[25] = in[25] ^ in[21] ^ in[17];
        assign out[24] = in[28] ^ in[20] ^ in[16];
        assign out[23] = in[31] ^ in[23] ^ in[19];
        assign out[22] = in[30] ^ in[26] ^ in[18];
        assign out[21] = in[29] ^ in[25] ^ in[21];
        assign out[20] = in[24] ^ in[20] ^ in[16];
        assign out[19] = in[27] ^ in[23] ^ in[19];
        assign out[18] = in[30] ^ in[22] ^ in[18];
        assign out[17] = in[29] ^ in[25] ^ in[17];
        assign out[16] = in[28] ^ in[24] ^ in[20];

        assign out[15] = in[11] ^ in[7]  ^ in[3];
        assign out[14] = in[14] ^ in[6]  ^ in[2];
        assign out[13] = in[13] ^ in[9]  ^ in[1];
        assign out[12] = in[12] ^ in[8]  ^ in[4];
        assign out[11] = in[15] ^ in[11] ^ in[7];
        assign out[10] = in[10] ^ in[6]  ^ in[2];
        assign out[9]  = in[13] ^ in[5]  ^ in[1];
        assign out[8]  = in[12] ^ in[8]  ^ in[0];
        assign out[7]  = in[15] ^ in[11] ^ in[3];
        assign out[6]  = in[14] ^ in[10] ^ in[6];
        assign out[5]  = in[9]  ^ in[5]  ^ in[1];
        assign out[4]  = in[12] ^ in[4]  ^ in[0];
        assign out[3]  = in[15] ^ in[7]  ^ in[3];
        assign out[2]  = in[14] ^ in[10] ^ in[2];
        assign out[1]  = in[13] ^ in[9]  ^ in[5];
        assign out[0]  = in[8]  ^ in[4]  ^ in[0];
  
endmodule
