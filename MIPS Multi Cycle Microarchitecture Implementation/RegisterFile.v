`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2021 07:34:59 PM
// Design Name: 
// Module Name: RegisterFile
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


module RegisterFile(
    input [4:0] A1,
    input [4:0] A2,
    input [4:0] A3,
    input [31:0] WD3,
    input clk,
    input rst,
    input WE3,
    output [31:0] RD1,
    output [31:0] RD2
    );
    
    reg [31:0] RegFile [31:0];
    integer i;
    always @(posedge clk) begin
        if (rst) begin
            for (i = 0; i <= 31; i = i + 1) begin
                RegFile[i] <= i;
            end
        end
        else if(WE3) RegFile[A3] <= WD3;
    end
    assign RD1 = RegFile[A1];
    assign RD2 = RegFile[A2];
endmodule
