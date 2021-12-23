`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2021 01:07:50 AM
// Design Name: 
// Module Name: InstrDataMem
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


module InstrDataMem(
    input [31:0] A,
    input [31:0] WD,
    input clk,
    input WE,
    input RE,
    output reg [31:0] RD
    );
    
    reg [31:0] InstrMem[0:32]; 
    reg [31:0] DataMem[0:31];
    
    initial begin
        $readmemh("DataMem.mem", DataMem);
        $readmemh("InstrMem.mem", InstrMem);
    end
    
    always @(posedge clk) begin
        if (WE) DataMem[A] <= WD;
    end
    
    always @(*) begin
        if (RE) RD <=  DataMem[A];        //Reading the Data Memory
        else if(!RE) RD <= InstrMem[A];   //Reading the Instruction Memory
    end
endmodule
