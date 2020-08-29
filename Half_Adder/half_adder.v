`timescale 1ns/1ns

module half_adder (
    input in_a,
    input in_b,
    output out_s,
    output out_c
);

    assign out_s = in_a ^ in_b;
    assign out_c = in_a & in_b;

endmodule
