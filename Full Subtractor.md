# Code
``` Verilog
module fs(a,bin,c,d,b);
input a,bin,c;
output d,b;
wire w1,w2,w3,w4;
not(w4,a);
xor(w1,bin,c);
and(w2,bin,c);
and(w3,w1,w4);
xor(d,a,w1);
or(b,w3,w2);
endmodule
```
# Testbench
``` Verilog
module fstb();
  reg a,bin,c;
  wire d,b;
  fs lol(a,bin,c,d,b);
  initial begin
    a=1'b0;
    bin=1'b0;
    c=1'b0;
    #20
    a=1'b0;
    bin=1'b0;
    c=1'b1;
    #20
    a=1'b0;
    bin=1'b1;
    c=1'b0;
    #20
    a=1'b0;
    bin=1'b1;
    c=1'b1;
    #20
    a=1'b1;
    bin=1'b0;
    c=1'b0;
    #20
    a=1'b1;
    bin=1'b0;
    c=1'b1;
    #20
    a=1'b1;
    bin=1'b1;
    c=1'b0;
    #20
    a=1'b1;
    bin=1'b1;
    c=1'b1;
```
# Output
![image](https://github.com/userofmeet27/Verilog/assets/154442221/032888f4-cefc-49da-b9af-68f87605abef)

