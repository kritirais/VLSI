`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2021 12:00:08 AM
// Design Name: 
// Module Name: tb_top
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

module tb_top();
    
    reg tb_clk, tb_rst;
    
    top t1 (.clk(tb_clk), .rst(tb_rst));
    
    initial begin
        tb_clk <= 1'b0;
    end
    
    always #10 tb_clk = !tb_clk;
    
    initial begin
        tb_rst <= 1'b1;
        #11 tb_rst <= 1'b0;
        #700 $finish;
    end
endmodule
