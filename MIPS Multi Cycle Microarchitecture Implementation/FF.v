`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/25/2021 04:41:24 PM
// Design Name: 
// Module Name: FF
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


module FF(
    input [31:0] in,
    input clk,
    output reg [31:0] out
    );
    
    always @(posedge clk) begin
        out <= in;
    end
endmodule
