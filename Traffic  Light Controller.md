## Code
```Verilog
/*
Traffic lights are installed on an intersection of a busy highway and a local farm road. Detectors are
installed on the intersection that cause signal Car to be asserted high in the presence of a car on the
farm road approaching the intersection with the highway. In the initial state, the highway lights must
be Green (HG) and the farm road light must be Red (FR). This state must remain for at least three clock
cycles before any change of lights can occurs. When a car is detected on the farm road approaching the
intersection, the highway lights should cycle from Green (HG) through Yellow (HY) to Red (HR), and the
farm road light should subsequently turn Green (FG). Cycling through Yellow (HY) lights should take one
clock cycle. The farm road lights are to remain Green (FG) only while the detector's signal Car remains
high, but no longer than for two clock cycles. The farm road lights are then to cycle through Yellow (FY)
to Red (FR), at which point the highway lights should turn Green (HG). Cycling through farm road yellow (FY)
also takes one clock cycle. Upon return to the initial state (HG, FR) the highway lights are not to be
interrupted again for at least three clock cycles.
*/

module trafficlightcontroller(clk,car,f,h,rst);
input clk,car,reset;
output reg[1:0]f;
output reg[1:0]h;
reg [2:0]state;
always @(posedge clk or posedge reset)begin
if (reset) begin
state <= 3'b000;
f <= 2'b00;
h <= 2'b11;
end

else begin
case (state)
3'b000:begin
if(car)begin
state <= 3'b001;
f <= 2'b00;
h <= 2'b11;
end
else begin 
state <= 3'b000;
f <= 2'b00;
h <= 2'b11;
end
end

3'b001 : begin
state <= 3'b010;
f <= 2'b00;
h <= 2'b11;
end

3'b010 : begin
state <= 3'b011;
f <= 2'b01;
h <= 2'b01;
end

3'b011 : begin
state <= 3'b100;
f <= 2'b11;
h <= 2'b00;
end

3'b100 : begin
if (car) begin
state <= 3'b100;
f <= 2'b11;
h <= 2'b00;
end
else begin
state <= 3'b101;
f <= 2'b11;
h <= 2'b00;
end
end

3'b101 : begin
state <= 3'b110;
f <= 2'b01;
h <= 2'b01;
end

3'b110 : begin
state <= 3'b000;
f <= 2'b00;
h <= 2'b11;
end
endcase
end
end
endmodule

//Testbench for the above code is given as follows:-

module tb();
reg car,clk,reset;
wire [1:0]f;
wire [1:0]h;
trafficlightcontroller testbench(clk,car,f,h,rst);
initial 
begin
clk = 1'b0;
forever #5 clk = ~clk;
end

initial
begin
reset = 1'b1;
#10;
reset = 1'b0;
car = 1'b1;
#10
car = 1'b0;
end
endmodule
```

## Output
#### FSM
![image](https://github.com/userofmeet27/Verilog/assets/154442221/22b2108f-5988-4305-8e4f-af9d69c8a4df)
#### Timing Simulation
![image](https://github.com/userofmeet27/Verilog/assets/154442221/82d0fb28-7bad-4fa8-ac6e-16a274855862)
#### Modelsim Simulation with Testbench
![image](https://github.com/userofmeet27/Verilog/assets/154442221/025f1dc2-f196-4e2c-a026-84cff0b5b14b)
