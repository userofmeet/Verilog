//Write a program to implement function f1= a | b and f2= f1 & c, with the initial value a=1, b=0, c=1 and f1=1
module xyz(clk,rst_n,a,b,c,f1,f2);
  input clk,rst_n;            
  output reg a,b,c,f1,f2;
  initial begin
    a = 1;
    b = 0;
    c = 1;
    f1 = 1;
  end
  always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      a <= 1;
      b <= 0;
      c <= 1;
      f1 <= 1;
      f2 <= 0;
    end else begin
      f1 <= a | b;
      f2 <= f1 & c;
    end
  end
endmodule
