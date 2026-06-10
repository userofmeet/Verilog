## Verilog code 
``` verilog
module jk_flip_flop(j,k,clk,reset,q);
input j,k,reset,clk;
output reg q;
always @ (posedge clk or negedge reset)
begin 
if(~reset)
q <= 0;			//<= is a non blocking assignment for seq logics so update the output at end of the clock event
else begin 
case({j,k})
2'b00: q <= q; //no change
2'b01: q <= 1'b0;
2'b10: q <= 1'b1;
2'b11: q <= ~q;
endcase
end
end
endmodule
```

## Testbench
```verilog
module jk_flip_flop_testbench();
reg clk, reset, j,k;
wire q;
jk_flip_flop jk(j,k,clk,reset,q);
initial begin 
clk = 1'b0;
forever #5 clk = ~clk;
end 
initial begin
reset = 1'b0;
#5
reset = 1'b1;
j = 1;
k = 0;
#10
j = 1;
k = 1;
#10
j = 0;
k = 0;
#10
j = 0;
k = 1;
#10 
$finish;
end
endmodule
```

## Modelsim outputs
<img width="1067" height="144" alt="image" src="https://github.com/user-attachments/assets/1377eee6-9af3-4e38-ac54-5e3bebb7ff4d" />
