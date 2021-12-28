`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2021 02:40:39 PM
// Design Name: 
// Module Name: SignExtender
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


module SignExtender(
    input [31:0] Instr,
    output [31:0] SignImm
    );
    
    assign SignImm =  Instr[15] ? {16'hFFFF, Instr[15:0]}: {4'b0000, Instr[15:0]}; 
     
endmodule
