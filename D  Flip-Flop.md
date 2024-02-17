### Code
```Verilog
//Verilog program for D flipflop

module dff(clk,reset,d,out);
input clk;
input reset;
input d;
output out;
reg out;
always @ (posedge clk or negedge reset)
begin
if(~reset)
out<=0;
else
out <= d;
end
endmodule

//Testbench for the D Flip Flop 
module ddtestbench();
  reg clk,reset;
  reg d;
  wire out;
  dff dflipflop(clk,reset,d,out);
  initial
  begin
    clk=1'b0;
    forever #5 clk=~clk;
  end
  initial
  begin 
    reset=1'b0;
    #5
    reset=1'b1;
    #10
    d=1'b1;
    #20
    d=1'b0;
    #50
    d=1'b1;
    end
endmodule
```
### Output
#### RTL
![WhatsApp Image 2024-02-13 at 16 47 26_a506d818](https://github.com/userofmeet27/Verilog/assets/154442221/e8c59105-53fe-4ee9-857e-84aa5e1e473c)
#### Testbench
![image](https://github.com/userofmeet27/Verilog/assets/154442221/4e86079d-63af-4572-adea-0df46329b280)
