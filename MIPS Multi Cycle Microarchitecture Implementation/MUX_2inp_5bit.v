`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2021 03:23:14 PM
// Design Name: 
// Module Name: MUX_2inp_5bit
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


module MUX_2inp_5bit(
    input [4:0] in0,
    input [4:0] in1,
    input sel,
    output [4:0] out
    );
    
    assign out = sel? in1: in0;
endmodule
