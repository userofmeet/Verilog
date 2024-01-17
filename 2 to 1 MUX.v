module mux(i0,i1,s,q);
input i0,i1,s;
output q;
wire w1,w2,w3;
not n1(w1,s);
and a1(w2,i0,w1);
and a2(w3,i1,s);
or o1(q,w2,w3);
endmodule
