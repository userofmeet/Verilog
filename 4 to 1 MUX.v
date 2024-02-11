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
