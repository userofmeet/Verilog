# Code
### Gate Level Modelling
```Verilog
module fa(x,y,z,s,c);
input x,y,z;
output s,c;
wire w1,w2,w3;
xor x1(w1,x,y);
xor x2(s,w1,z); 
and a1(w2,x,y);
and a2(w3,w1,z);
or o1(c,w3,w2);
endmodule 
```
### Data Flow Level Modelling
``` Verilog
module mk(a,b,cin,s,c);
input a,b,cin;
output s,c;
assign s = a ^ b ^ cin;
assign c = (a&b) | (c&(a^b));
endmodule 
```
# Testbench
``` Verilog
module tb1();
  reg x,y,z;
  wire c,s;
  fa f1(x,y,z,s,c);
  initial 
  begin
    x=1'b1;
    #20;
    x=1'b1;
    y=1'b0;
    #20;
    x=1'b1;
    y=1'b0;
    z=1'b0;
    #20
    x=1'b0;
    y=1'b1;
    z=1'b1;
  end 
endmodule
```
# Output
![image](https://github.com/userofmeet27/Verilog/assets/154442221/06202a09-7390-40b8-a81f-b8401da7dcb8)
