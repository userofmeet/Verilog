module counter(rst,count,clk);
input clk,rst;
  output reg [3:0] count;
always @(posedge clk)
begin
if(rst)
count<=0;
else
count<=count+1;
end
endmodule

//Testbench to verify the 4 bit counter:-

module upcounter_testbench();
  reg clk, reset;
  wire [3:0] counter;
  counter dut(clk, rst, count);
  initial
  begin
    clk = 1'b0;
    forever #5 clk = ~clk;
  end
  initial
  begin
    rst = 1'b1;
    #20;
    rst = 1'b0;
  end
endmodule
