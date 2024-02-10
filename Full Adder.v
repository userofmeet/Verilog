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

#Testbench for the above full adder code to verify the RTL circuitry is attached below:-

module tb1();
  reg x,y,z;
  wire c,s;
  fa f1(x,y,z,s,c);
  initial 
  begin
    x=1'b1;
    #20;
    x=1'b1;
    y=0'b1;
    #20;
    x=1'b1;
    y=1'b1;
    z=1'b1;
  end 
endmodule