module dff(clk,reset,d,out);
input clk;
input reset;
input d;
output out;
reg out;
always @ (posedge clk or negedge reset)
begin
if(~reset)
out<=0;
else
out <= d;
end
endmodule

//Testbench for the D Flip Flop 
module ddtestbench();
  reg clk,reset;
  reg d;
  wire out;
  dff dflipflop(clk,reset,d,out);
  initial
  begin
    clk=1'b0;
    forever #5 clk=~clk;
  end
  initial
  begin 
    reset=1'b0;
    #5
    reset=1'b1;
    #10
    d=1'b1;
    #20
    d=1'b0;
    #10
    d=1'b1;
    end
endmodule
