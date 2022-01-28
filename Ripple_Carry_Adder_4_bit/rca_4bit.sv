`include "full_adder.sv"
module rca_4bit(
  input [3:0] in_a,
  input [3:0] in_b,
  input in_c,
  output [3:0] out_s,
  output out_c
);
  
  reg c1, c2, c3; 
  
  full_adder fa1 (.in_a(in_a[0]), .in_b(in_b[0]), .in_c(1'b0),
                  .out_s(out_s[0]), .out_c(c1));
  
  full_adder fa2 (.in_a(in_a[1]), .in_b(in_b[1]), .in_c(c1),
                  .out_s(out_s[1]), .out_c(c2));
  
  full_adder fa3 (.in_a(in_a[2]), .in_b(in_b[2]), .in_c(c2),
                  .out_s(out_s[2]), .out_c(c3));
  
  full_adder fa4 (.in_a(in_a[3]), .in_b(in_b[3]), .in_c(c3),
                  .out_s(out_s[3]), .out_c(out_c));
  
endmodule