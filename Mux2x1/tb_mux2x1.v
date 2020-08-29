`timescale 1ns/1ns

class random_vect;
  randc bit [2 : 0] inp;
endclass

module tb_mux2x1();
  reg tb_in1;
  reg tb_in2;
  reg tb_sel1;
  wire tb_y;
  
  mux2x1 mux1 (.in1(tb_in1), .in2(tb_in2), .sel1(tb_sel1), .y(tb_y));
  
  initial begin
    
    $dumpvars();
    $dumpfile("mux2x1.vcd");
    
    #50000;
    
  end
  
  initial begin
    
    random_vect obj = new();
    
    reg exp_out;
    reg act_out;
    reg tb_flag;
    
    assign tb_flag = 1'b0;
    
    repeat (10) begin
      
      obj.randomize();
      
      tb_in1 = obj.inp[0];
      tb_in2 = obj.inp[1];
      tb_sel1 = obj.inp[2];
      
      #100;
      
      exp_out = (tb_sel1 & tb_in2) | (!tb_sel1 & tb_in1);
      act_out = tb_y;
      
      if (exp_out != act_out) begin
        
        $display("Incorrect output for combination %b %b %b. Expected output is %b but actual output is %b", tb_in1, tb_in2, tb_sel1, exp_out, act_out);
        
        assign tb_flag = 1'b1;
        
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
