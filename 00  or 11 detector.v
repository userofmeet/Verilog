//Moore Machine for 00/11 sequence detector

module fsm( clk, rst, inp, outp);  
input clk, rst, inp; 
output outp;  
reg [1:0] state;  
reg outp;
always @( posedge clk, posedge rst )  begin 
if( rst ) 
state <= 2'b00;  
else 
begin 
case( state )  
2'b00: 
begin 
if( inp ) state <= 2'b01;  
else state <= 2'b10; 
end  
2'b01: 
begin 
if( inp ) state <= 2'b11;  
else state <= 2'b10; 
end  
2'b10: 
begin 
if( inp ) state <= 2'b01;  
else state <= 2'b11; 
end  
2'b11: 
begin 
if( inp ) state <= 2'b01;  
else state <= 2'b10; 
end  
endcase 
end  
end 
always @(posedge clk, posedge rst)  begin 
if( rst )  
outp <= 0; 
else if( state == 2'b11 )  
outp <= 1; 
else outp <= 0;  
end 
endmodule

//Mealy machine for 00/11 sequence detector 

module mealy( clk, rst, inp, outp);  
input clk, rst, inp; output outp;  
reg [1:0] state; 
reg outp; 
always @( posedge clk, posedge rst ) begin  
if( rst ) begin 
state <= 2'b00;  
outp <= 0; 
end 
else begin  
case( state )  
2'b00: begin 
if( inp ) begin  
state <= 2'b01;  
outp <= 0; 
end 
else begin 
state <= 2'b10;  
outp <= 0; 
end  
end 
2'b01: begin 
if( inp ) begin  
state <= 2'b00;  
outp <= 1; 
end 
else begin 
state <= 2'b10;  
outp <= 0; 
end  
end 
2'b10: begin 
if( inp ) begin
state <= 2'b01;  
outp <= 0; 
end 
else begin 
state <= 2'b00;  
outp <= 1; 
end  
end 
default: begin  
state <= 2'b00;  
outp <= 0; 
end  
endcase  
end 
end  
endmodule 
