`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2021 04:34:44 PM
// Design Name: 
// Module Name: ALUDecoder
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


module ALUDecoder(
    input [5:0] Funct,
    input [1:0] ALUOp,
    output reg [2:0] ALUControl
    );
    
    wire [7:0] FunctALUOp;
    assign FunctALUOp = {Funct, ALUOp};
    
    always @(FunctALUOp) begin
        casex(FunctALUOp)
            8'b10000010: ALUControl <= 3'b010;
            8'b10001010: ALUControl <= 3'b110;
            8'b10010010: ALUControl <= 3'b000;
            8'b10010110: ALUControl <= 3'b001;
            8'b10101010: ALUControl <= 3'b111;
            8'bxxxxxx00: ALUControl <= 3'b010;
            8'bxxxxxxx1: ALUControl <= 3'b110;
            default: ALUControl <= 3'bXXX;
        endcase
    end
endmodule
