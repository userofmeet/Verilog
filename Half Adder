module ha(x,y,s,c);
input x,y;
output s,c;
xor x1(s,x,y);
and a1(c,x,y);
endmodule  


#the testbench of half adder circuit for the above half adder verilog code is attached below:-

module tb1();
  reg x,y;
  wire c,s;
  ha h1(x,y,s,c);
  initial 
  begin 
    x=1'b1;
    #20;
    x=1'b0;
    y=1'b1;
    #30;
    x=1'b1;
    y=1'b1;
  end
endmodule
