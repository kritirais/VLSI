module mux2x1(
  input in1,
  input in2,
  input sel1,
  output y
);
  assign y = sel1 ? in2 : in1;
endmodule
