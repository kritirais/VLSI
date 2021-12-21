`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2021 05:58:21 PM
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] srcA,
    input [31:0] srcB,
    input [2:0] ALUControl,
    output reg [31:0] ALUResult
    );
    
    always @(ALUControl, srcA, srcB) begin
        case (ALUControl)
            3'b001: ALUResult <= srcA | srcB;
            3'b010: ALUResult <= srcA + srcB;
            3'b110: ALUResult <= srcA - srcB;
            3'b011: ALUResult <= ~ srcA;
            3'b100: ALUResult <= srcA ^ srcB;
            3'b000: ALUResult <= srcA & srcB;
            3'b111: if (srcA < srcB) ALUResult <= 32'h00000001;
                    else ALUResult <= 32'h00000000;
            default: ALUResult <= 32'hXXXXXXXX;
        endcase
    end

endmodule
