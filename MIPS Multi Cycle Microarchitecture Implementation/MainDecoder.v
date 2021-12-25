`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2021 11:38:39 PM
// Design Name: 
// Module Name: MainEncoder
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


module MainDecoder(
    input [5:0] Opcode,
    input clk,
    input rst,
    output reg MemtoReg,
    output reg RegDst,
    output reg IorD,
    output reg PCSrc,
    output reg [1:0] ALUSrcB,
    output reg ALUSrcA,
    output reg IRWrite,
    output reg MemWrite,
    output reg MemRd,
    output reg PCWrite,
    output reg RegWrite,
    output reg [1:0] ALUOp
    );
    
    parameter FETCH = 4'b0000; 
    parameter DECODE = 4'b0001; 
    parameter MEMADR = 4'b0010; 
    parameter MEMREAD = 4'b0011;
    parameter MEMWRITEBACK = 4'b0100;
    parameter MEMWRITE = 4'b0101;
    parameter EXECUTE = 4'b0110;
    parameter ALUWRITEBACK = 4'b0111;
    parameter ADDIEXECUTE = 4'b1000;
    parameter ADDIWRITEBACK = 4'b1001;
    
    reg [3:0] state, nextstate;
    
    always @(state or Opcode) begin
        case (state)
            FETCH: nextstate <= DECODE;
            DECODE: case(Opcode)
                        6'b000000: nextstate <= EXECUTE;        //R-type
                        6'b100011: nextstate <= MEMADR;         //lw
                        6'b101011: nextstate <= MEMADR;         //sw
                        6'b001000: nextstate <= ADDIEXECUTE;    //addi
                    endcase
            MEMADR: case(Opcode)
                        6'b100011: nextstate <= MEMREAD;        //lw
                        6'b101011: nextstate <= MEMWRITE;       //sw
                    endcase
            MEMREAD: nextstate <= MEMWRITEBACK;                 //lw
            MEMWRITEBACK: nextstate <= FETCH;                   //lw
            MEMWRITE: nextstate <= FETCH;                       //sw
            EXECUTE: nextstate <= ALUWRITEBACK;                 //R-type
            ALUWRITEBACK: nextstate <= FETCH;                   //R-type
            ADDIEXECUTE: nextstate <= ADDIWRITEBACK;            //addi
            ADDIWRITEBACK: nextstate <= FETCH;                  //addi
        endcase
    end

    always @(state) begin
    
        IorD <= 1'b0; ALUSrcA <= 1'b0; ALUSrcB <= 2'b00; ALUOp <= 2'b00; PCSrc <= 1'b0; IRWrite <= 1'b0; PCWrite <= 1'b0; MemRd <= 1'b0;
        RegWrite <= 1'b0; RegDst <= 1'b0; MemtoReg <= 1'b0; MemWrite <= 1'b0;
        
        case (state)
            FETCH: begin IorD <= 1'b0; ALUSrcA <= 1'b0; ALUSrcB <= 2'b01; ALUOp <= 2'b00; PCSrc <= 1'b0; IRWrite <= 1'b1; PCWrite <= 1'b1; MemRd <= 1'b0; end
            DECODE: begin ALUSrcA <= 1'b0; ALUSrcB <= 2'b11; ALUOp <= 2'b00; end
            MEMADR: begin ALUSrcA <= 1'b1; ALUSrcB <= 2'b10; ALUOp <= 2'b00; end
            MEMREAD: begin IorD <= 1'b1; MemRd <= 1'b1; end
            MEMWRITEBACK: begin RegDst <= 1'b0; MemtoReg <= 1'b1; RegWrite <= 1'b1; end
            MEMWRITE: begin IorD <= 1'b1; MemWrite <= 1'b1; end
            EXECUTE: begin ALUSrcA <= 1'b1; ALUSrcB <= 2'b00; ALUOp <= 2'b10; end
            ALUWRITEBACK: begin RegDst <= 1'b1; MemtoReg <= 1'b0; RegWrite <= 1'b1; end
            ADDIEXECUTE: begin ALUSrcA <= 1'b1; ALUSrcB <= 2'b10; ALUOp <= 2'b00; end
            ADDIWRITEBACK: begin RegDst <= 1'b0; MemtoReg <= 1'b0; RegWrite <= 1'b1; end
        endcase
    end

    always @(posedge clk) begin
        if (rst) state <= FETCH;
        else state <= nextstate;
    end

endmodule
