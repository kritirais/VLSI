`timescale 1ns/1ns
class random_vect;
  randc bit [3 : 0] tb_a;
  randc bit [3 : 0] tb_b;
endclass

module tb_full_adder();
  
  reg [3:0] reg_a;
  reg [3:0] reg_b;
  reg reg_c;
  wire [3:0] wire_s;
  wire wire_c;
  
  rca_4bit rca1 (.in_a(reg_a), .in_b(reg_b), .in_c(reg_c), .out_s(wire_s), .out_c(wire_c));
  
  initial begin
    
    $dumpvars();
    $dumpfile("rca_4bit_adder.vcd");
    
    #50000;
    
  end
  
  initial begin
    
    random_vect obj = new();
    
    reg [4:0] exp_out;
    reg [4:0] act_out;
    reg tb_flag;
    
    assign tb_flag = 1'b0;
    
    repeat (50) begin
      
      obj.randomize();
      
      reg_a = obj.tb_a;
      reg_b = obj.tb_b;
      reg_c = 1'b0;
      
      #100;
      
      exp_out = reg_a + reg_b + reg_c;
      act_out = {wire_c, wire_s};
      
      #500;
      
      if (exp_out != act_out) begin
        
        $display("Incorrect output for combination %b %b. Expected output is %b but actual output is %b.", reg_a, reg_b, exp_out, act_out);
        
        assign tb_flag = 1'b1;
        
      end
      
      if (exp_out == act_out) begin
        
        $display("Correct output for combination %b %b. Expected output is %b and actual output is %b.", reg_a, reg_b, exp_out, act_out);
        
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