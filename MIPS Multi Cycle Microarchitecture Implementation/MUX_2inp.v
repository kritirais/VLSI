`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2021 07:15:40 PM
// Design Name: 
// Module Name: MUX_2inp
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


module MUX_2inp(
    input [31:0] in0, 
    input [31:0] in1,
    input sel,
    output [31:0] out
    );
  
    assign out = sel? in1: in0;

endmodule
