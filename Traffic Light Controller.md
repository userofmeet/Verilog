### Code
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

module liftcontroller(car,clk,rst,f,h);
input car,clk,rst;
output reg[1:0]f;
output reg[1:0]h;
reg [1:0]state;
always @(posedge clk or posedge rst)begin
if(rst)begin
state <= 2'b00;
f <= 2'b00;
h <= 2'b11;
end

else begin
case(state)
2'b00:begin
if(car)begin
repeat(2) @(posedge clk);
state <= 2'b01;
f <= 2'b01;
h <= 2'b01;
end
else begin
state <= 2'b00;
f <= 2'b00;
h <= 2'b11;
end
end

2'b01:begin 
state <= 2'b10;
f <= 2'b11;
h <= 2'b00;
end

2'b10:begin
if(car)begin
state <= 2'b10;
f <= 2'b11;
h <= 2'b00;
end
else begin
repeat(1) @(posedge clk);
state <= 2'b11;
f <= 2'b01;
h <= 2'b01;
end
end

2'b11:begin
state <= 2'b00;
f <= 2'b00;
h <= 2'b11;
end
endcase
end
end
endmodule

//Testbench for the above code is given as follows:-

module light();
reg car,clk,rst;
wire [1:0]f;
wire [1:0]h;
liftcontroller c(car,clk,rst,f,h);
initial 
begin
clk = 1'b0;
forever #5 clk = ~clk;
end

initial
begin
rst = 1'b1;
#10;
rst = 1'b0;
car = 1'b1;
#10
car = 1'b0;
end
endmodule
```

### Output 
![image](https://github.com/userofmeet27/Verilog/assets/154442221/7d7f7f68-6804-4d16-891f-65e5f7532a3c)

