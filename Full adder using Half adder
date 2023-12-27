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
