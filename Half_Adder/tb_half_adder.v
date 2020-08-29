`timescale 1ns/1ns

module tb_half_adder();

    reg tb_a;
    reg tb_b;
    wire tb_s;
    wire tb_c;


    reg [1 : 0] exp_sum;
    reg [1 : 0] act_sum;
    reg tb_flag;

    half_adder ha1 (.in_a(tb_a), .in_b(tb_b), .out_s(tb_s), .out_c(tb_c));
 


    initial begin

	assign tb_flag = 1'b0;   

        repeat (10) begin

	    tb_a = $urandom() % 4;
	    tb_b = $urandom() % 4;

	    assign exp_sum = tb_a + tb_b;
	    assign act_sum = {tb_c, tb_s};

	    #50;

	    if (exp_sum != act_sum) begin

		$display("Incorrect output for input %b and input %b. Expected output is %b but actual output is %b.", tb_a, tb_b, exp_sum, act_sum);
		assign tb_flag = 1'b1;

	    end

	    else if (exp_sum == act_sum) begin

		$display("Correct output for input %b and input %b. Expected output is %b and actual output is %b.", tb_a, tb_b, exp_sum, act_sum);

	    end
	end

	if (tb_flag == 1'b1) begin

	    $display("Test Case Fail.");

	end

	if(tb_flag == 1'b0) begin

	    $display("Test Case Pass!!!");

	end
	    
    end
	
    initial begin
	    
	    $dumpfile("half_adder.vcd");
	    $dumpvars();
	    
	    #10000;
    end

endmodule
