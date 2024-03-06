# Code
```verilog
/*
Verilog code for a lift controller which has the following requirements :-
In lift controller there is two state of lift condition. One is “idle” and second is “running”. One
control signal is indicate whether lift is going in up direction or down direction. When the lift is in
“idle” condition for more than 5 cycle it will come to ground floor. When someone call the lift
from higher(lower) stories and in between someone call the lift from lower(higher) stories, lift will
stop to lower(higher) stories if it is not passed and after that it will start to go towards first call.
*/

//Solving the above problem using Mealy FSM:-

module liftcontrol(clk,rst,up_signal,down_signal,current_floor);
input clk,rst,up_signal,down_signal;
output reg [2:0] current_floor;
reg [2:0] state;
reg [2:0] count_idle;
always @(posedge clk or posedge rst) begin
if(rst) begin
state <= 3'b000;   
count_idle=3'b000;
current_floor <= 3'b000;
end

else 
begin 
case (state)
3'b000: begin
count_idle <= 3'b000;
current_floor <= 3'b000;
if(up_signal)begin
state <= 3'b001;
current_floor <= 3'b001;
end
else begin 
current_floor <= 3'b000;
end
end

3'b001:begin
if(up_signal)begin
state <= 3'b010;
current_floor <= 3'b010;
end
else if (down_signal)begin 
state <= 3'b000;
current_floor <= 3'b000;
end
else begin
count_idle <= count_idle + 3'b001;
if (count_idle == 3'b101) begin
state <= 3'b000;
end
end
end

3'b010: begin
if(up_signal)begin
state <= 3'b011;
current_floor <= 3'b011;
end
else if (down_signal) begin 
state <= 3'b001;
current_floor <= 3'b001;
end
else begin
count_idle <= count_idle + 3'b001;
if (count_idle == 3'b101) begin
state <= 3'b000;
end
end 
end

3'b011:begin
if(up_signal)begin
state <= 3'b100;
current_floor <= 3'b100;
end
else if (down_signal) begin 
state <= 3'b010;
current_floor <= 3'b010;
end
else begin
count_idle <= count_idle + 3'b001;
if (count_idle == 3'b101) begin
state <= 3'b000;
end
end
end

3'b100:begin
if (down_signal) begin 
state <= 3'b011;
current_floor <= 3'b011;
end
else begin
count_idle <= count_idle + 3'b001;
if (count_idle == 3'b101) begin
state <= 3'b000;
end
end 
end
default:begin
	state<=3'b000;
	current_floor <=3'b000;
	end
endcase
end
end
endmodule

//Testbench for the above code is given as follows :-

module LIFTCONTROLLERTESTBENCH();
reg clk,rst,up_signal,down_signal;
wire [2:0]current_floor;
liftcontrol elevator(clk,rst,up_signal,down_signal,current_floor);
initial 
begin
clk=1'b0;
forever #5 clk=~clk;
end

initial
begin
rst=1'b1;
#10
rst=1'b0;
up_signal = 1'b1;
down_signal = 1'b0;
#50;
down_signal = 1'b0;
up_signal = 1'b0;
#70
up_signal = 1'b1;
down_signal = 1'b0;
#30
up_signal = 1'b0;
down_signal = 1'b1;
#20
up_signal = 1'b0;
down_signal = 1'b0;
#40
up_signal = 1'b1;
down_signal = 1'b0;
#20 
up_signal = 1'b0;
down_signal = 1'b1;
#20 $finish; 
end
endmodule
```

# Output

![image](https://github.com/userofmeet27/Verilog/assets/154442221/ad3a70b4-7139-4707-af7a-cc6f9a543987)


