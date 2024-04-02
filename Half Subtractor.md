# Code
``` Verilog
module hs(a,bin,d,b);
input a,bin;
output d,b;
wire w1;
not n1(w1,a);
xor x1(d,a,bin);
and a1(b,w1,bin);
endmodule
```
# Testbench
``` Verilog
module halfsubtb();
  reg a,bin;
  wire d,b;
  hs hstest(a,bin,d,b);
  initial begin
    a = 1'b0;
    bin = 1'b0;
    #20
    a = 1'b0;
    bin = 1'b1;
    #20
    a = 1'b1;
    bin = 1'b0;
    #20
    a = 1'b1;
    bin = 1'b1;
  end
endmodule
```
# Testbench
![image](https://github.com/userofmeet27/Verilog/assets/154442221/7fee78ab-d3d2-491b-9b3b-59de147d3cad)
