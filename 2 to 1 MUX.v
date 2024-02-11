//Using Data level modelling 

module mux(s0,i0,i1,y);
  input s0,i0,i1;
  output y;
  assign y = (s0?i1:i20);
  endmodule
 
//For gate level modelling of the above 2 to 1 mux

module mux(s0,i0,i1,y);
  input s0,i0,i1;
  output y;
  wire w1,w2,w3;
  not (w1,s0);
  and (w2,s0,i0);
  and (w3,w1,i1);
  or (y,w2,w3);
  endmodule 
  
//Using conditional operator 

module mux(i0,i1,s0,out);
output out;
input i0,i1,s0;
wire w1,w2,w3,w4;
assign w1=i0&(~s0);
assign w2=i1&(s0);
assign out = w1 | w2;
endmodule 
