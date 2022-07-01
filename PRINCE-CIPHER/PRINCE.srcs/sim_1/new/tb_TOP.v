`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2022 11:55:30 AM
// Design Name: 
// Module Name: tb_TOP
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


module tb_TOP(
    );
    
  reg [63:0] tb_data;
  reg [127:0] tb_key;
  reg tb_en_de;
  reg tb_clk;
  reg tb_rst;
  wire [63:0] tb_out;
  
  TOP t1(.clk(tb_clk), .rst(tb_rst), .data(tb_data), .key(tb_key), .en_de(tb_en_de), 
         .out(tb_out));
         
  initial begin
      tb_clk = 1'b0;
      
      //tb_data = 64'h0123456789abcdef;
      tb_data = 64'hae25ad3ca8fa9ccf;
      tb_key = 128'h0000000000000000fedcba9876543210;
      tb_en_de = 1'b0;
      
      tb_rst = 1'b1;
      #6 tb_rst = 1'b0;
      
      
      #130 $finish;
  end
  
  always #5 tb_clk = ~ tb_clk;
  
  
endmodule
