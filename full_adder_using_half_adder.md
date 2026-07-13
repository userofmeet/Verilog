### Code
```Verilog
//Full adder using 2 half adders

module FA(x,y,z,s,c);
input x,y,z;
output s,c;
wire w1,w2,w3;
HA (x,y,w1,w2);
HA (w1,z,s,w3);
or (c,w2,w3);
endmodule

module HA(a,b,sum,carry);
input a,b;
output sum,carry;
xor (sum,a,b);
and (carry,a,b);
endmodule
```

### Output (RTL)
![WhatsApp Image 2024-02-13 at 16 10 13_c0898808](https://github.com/userofmeet27/Verilog/assets/154442221/6167a006-3031-402b-ad61-b5839c57b387)
