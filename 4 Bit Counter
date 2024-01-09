module counter(rst,count,clk);
input clk,rst;
output reg [2:0] count;
always @(posedge clk)
begin
if(rst)
count<=0;
else
count<=count+1;
end
endmodule

#Testbench to verify the 4 bit counter:-

module upcounter_testbench();
  reg clk, reset;
  wire [3:0] counter;
  verification dut(clk, reset, counter);
  initial
  begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end
  initial
  begin
    reset = 1'b1;
    #20;
    reset = 1'b0;
    #500;
    $finish;
  end
endmodule
