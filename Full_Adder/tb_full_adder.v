`timescale 1ns/1ns
class random_vect;
  randc bit [2 : 0] inp;
endclass

module tb_full_adder();
  
  reg reg_a;
  reg reg_b;
  reg reg_c;
  wire wire_s;
  wire wire_c;
  
  full_adder fa1 (.in_a(reg_a), .in_b(reg_b), .in_c(reg_c), .out_s(wire_s), .out_c(wire_c));
  
  initial begin
    
    $dumpvars();
    $dumpfile("full_adder.vcd");
    
    #50000;
    
  end
  
  initial begin
    
    random_vect obj = new();
    
    reg [1 : 0] exp_out;
    reg [1 : 0] act_out;
    reg tb_flag;
    
    assign tb_flag = 1'b0;
    
    repeat (10) begin
      
      obj.randomize();
      
      reg_a = obj.inp[0];
      reg_b = obj.inp[1];
      reg_c = obj.inp[2];
      
      #100;
      
      exp_out = reg_a + reg_b + reg_c;
      act_out = {wire_c, wire_s};
      
      #500;
      
      if (exp_out != act_out) begin
        
        $display("Incorrect output for combination %b %b %b. Expected output is %b but actual output is %b", reg_a, reg_b, reg_c, exp_out, act_out);
        
        assign tb_flag = 1'b1;
        
      end
      
      if (exp_out == act_out) begin
        
        $display("Correct output for combination %b %b %b. Expected output is %b and actual output is %b", reg_a, reg_b, reg_c, exp_out, act_out);
        
      end
      
    end
    
    if (tb_flag == 1'b1) begin
      
      $display("Test Failed");
      
    end
    
    else if (tb_flag == 1'b0) begin
      
      $display("Test Passed!!!");
      
    end
  
  end
  
endmodule