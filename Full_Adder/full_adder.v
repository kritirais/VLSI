module full_adder(
  input in_a,
  input in_b,
  input in_c,
  output out_s,
  output out_c
);
  assign out_s = (!in_a & !in_b & in_c) | (!in_a & in_b & !in_c) | (in_a & !in_b & !in_c) | (in_a & in_b & in_c);
  
  assign out_c = (!in_a & in_b & in_c) | (in_a & in_c) | (in_a & in_b & !in_c);
  
endmodule