`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2021 11:02:20 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk,
    input rst
    );
    
    reg [31:0] PC;
    wire [31:0] Adr, ReadData, Instr, Data, WriteData, PCDash, RD1, RD2, SignImm, A, B, SrcA, SrcB, ALUResult, ALUOut;
    wire MemtoReg, RegDst, ALUSrcA, MemRead, IorD, IRWrite, PCWrite, MemWrite, RegWrite;
    wire [1:0] ALUOp, ALUSrcB;
    wire [2:0] ALUControl;
    wire [4:0] WriteAdr;
    
    always @(posedge clk) begin
        if(rst) PC <= 32'h4;
        else if(PC == 32'h24) PC <= 32'h4;
        else if(PCWrite) PC <= PCDash;
    end
    
    MUX_2inp m1 (.in0(PC), .in1(ALUOut), .sel(IorD), .out(Adr));
    MUX_2inp_5bit m2 (.in0(Instr[20:16]), .in1(Instr[15:11]), .sel(RegDst), .out(WriteAdr));
    MUX_2inp m3 (.in0(ALUOut), .in1(Data), .sel(MemtoReg), .out(WriteData));
    MUX_2inp m4 (.in0(PC), .in1(A), .sel(ALUSrcA), .out(SrcA));
    MUX_4inp m5 (.in0(B), .in1(32'b100), .in2(SignImm), .in3(32'hXX), .sel(ALUSrcB), .out(SrcB));
    
    InstrDataMem id1 (.A(Adr), .WD(B), .clk(clk), .WE(MemWrite), .RE(MemRead), .RD(ReadData));
                      
    FlipFlop ff1 (.in(ReadData), .clk(clk), .en(IRWrite), .out(Instr));
    FF ff2 (.in(ReadData), .clk(clk), .out(Data));
    FF ff3 (.in(RD1), .clk(clk), .out(A));
    FF ff4 (.in(RD2), .clk(clk), .out(B));
    FF ff5 (.in(ALUResult), .clk(clk), .out(ALUOut));
    
    MainDecoder md1 (.Opcode(Instr[31:26]), .clk(clk), .rst(rst), .MemtoReg(MemtoReg), .RegDst(RegDst), .IorD(IorD), .ALUSrcB(ALUSrcB), .ALUSrcA(ALUSrcA), 
                     .IRWrite(IRWrite), .MemWrite(MemWrite), .MemRd(MemRead), .PCWrite(PCWrite), .RegWrite(RegWrite), .ALUOp(ALUOp));
                     
    ALUDecoder ad1 (.Funct(Instr[5:0]), .ALUOp(ALUOp), .ALUControl(ALUControl));
    
    RegisterFile rf1 (.A1(Instr[25:21]), .A2(Instr[20:16]), .A3(WriteAdr), .WD3(WriteData), .clk(clk), .rst(rst), .WE3(RegWrite), .RD1(RD1), .RD2(RD2));
                      
    SignExtender se1 (.Instr(Instr), .SignImm(SignImm));
    
    ALU a1 (.srcA(SrcA), .srcB(SrcB), .ALUControl(ALUControl), .ALUResult(ALUResult));
    
    assign PCDash = ALUResult;
    
endmodule
