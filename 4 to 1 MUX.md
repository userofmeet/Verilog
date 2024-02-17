### Code

```Verilog
//Using Data level modelling 

module mux(s1,s0,i0,i1,i2,i3,y);
  input s1,s0,i0,i1,i2,i3;
  output y;
  assign y = s1?(s0?i3:i2):(s0?i1:i0);
  endmodule
 
//For gate level modelling of the above 4 to 1 mux

module mux(s1,s0,i0,i1,i2,i3,y);
  input s1,s0,i0,i1,i2,i3;
  output y;
  wire w1,w2,w3,w4,w5,w6;
  not (w1,s1);
  not (w2,s0);
  and (w3,w1,w2,i0);
  and (w4,w1,s0,i1);
  and (w5,w2,s1,i2);
  and (w6,s0,s1,i3);
  or (y,w3,w4,w5,w6);
  endmodule 
  
//Using conditional operator 

module mux(i0,i1,i2,i3,s1,s0,out);
output out;
input i0,i1,i2,i3,s1,s0;
wire w1,w2,w3,w4;
assign w1=i0&(~s0)&(~s1);
assign w2=i1&(~s0)&(s1);
assign w3=i2&(s0)&(~s1);
assign w4=i3&(s0)&(s1);
assign out=w1 | w2 | w3 |w4;
endmodule 

//4to1 MUX using Behavioural modelling 
module mux(i0,i1,i2,i3,s0,s1,q);
input i0,i1,i2,i3,s0,s1;
output reg q;
always @(i0 or i1 or i2 or i3)
case ({s1,s0})	
2'b00: q<=i0;
2'b01: q<=i1;
2'b10: q<=i2;
2'b11: q<=i3;
endcase
endmodule

//Testbench
module muxtest();
reg i0,i1,i2,i3,s0,s1;
wire q;
mux test(i0,i1,i2,i3,s0,s1,q);
initial
begin
    i0=1'b0;
    forever #5 i0=~i0;
end
initial
begin
    i1=1'b0;
    forever #10 i1=~i1;
end
initial 
begin
    i2=1'b0;
    forever #15 i2=~i2;
end
initial 
begin
    i3=1'b0;
    forever #20 i3=~i3;
end
initial
begin
    s0=1'b1;
    forever #5 s0=~s0;
end
initial
begin
    s1=1'b1;
    forever #10 s1=~s1;
end
endmodule 
```

### Output
![image](https://github.com/userofmeet27/Verilog/assets/154442221/7c2ff9b7-47cd-4e47-b77a-e33059c1f57f)
