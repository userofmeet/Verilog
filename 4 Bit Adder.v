module adder(x,y,z,s,c);
  input [3:0] x, y;  
  input z;         
  output [3:0] s;   
  output c;        
  assign {c, s} = x + y + z;
endmodule

#Testbench for the above code is given below:-
 
module adder();
  reg [3:0] x,y,z;
  wire [3:0]s,c;
  FourBitAdder fba(
    .x(x),
    .y(y),
    .z(z),
    .s(s),
    .c(c)
  );
  initial 
  begin
    x = 4'b1010;
    y = 4'b0110;
    z = 0;
    #10; 
    x = 4'b1101;
    y = 4'b0011;
    z = 1;
    #20;
  end
endmodule
