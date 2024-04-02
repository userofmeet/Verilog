# Code
``` Verilog
module FourBitAdder(a,b,cin,sum,cout);
input [3:0]a;
input [3:0]b;
input cin;
output [3:0]sum;
output cout;
wire [4:0]w;
assign w=a+b+cin;
assign sum=w[3:0];
assign cout=w[4];
endmodule
```
# Testbench
``` Verilog
module fourbittb();
  reg [3:0]a;
  reg [3:0]b;
  reg cin;
  wire [3:0]sum;
  wire cout;
  FourBitAdder testing(a,b,cin,sum,cout);
  initial begin
    a=4'b1000;
    b=4'b1111;
    cin=1'b1;
    #20
    a=4'b0000;
    b=4'b1111;
    cin=1'b0;
  end
endmodule
```
# Output 
![image](https://github.com/userofmeet27/Verilog/assets/154442221/f9f952b4-e932-4b3b-a4c5-4b1a22810184)
