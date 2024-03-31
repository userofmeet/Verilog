### Code
```Verilog
//Verilog code for JK flipflop along with its testbench

module jk(clk,j,k,q);
input clk,j,k;
output q;
reg q;
always @ (posedge clk)
begin
if (j<=0 & k<=0)
q<=q;
else if (j<=0 & k<=1)
q<=0;
else if (j<=1 & k<=0)
q<=1;
else
q<=~q;
end
endmodule

//Testbench
module jktestbench();
  reg clk,j,k;
  wire q;
  jk jkff(clk,j,k,q);
  initial
  begin
    clk=1'b0;
    forever #10 clk=~clk;
  end
  initial
  begin 
    j=1'b0;
    k=1'b1;
    #20
    j=1'b1;
    k=1'b0;
    #20
    j=1'b0;
    k=1'b0;
    #20
    j=1'b1;
    k=1'b1;
    end
endmodule
```
### Output
![image](https://github.com/userofmeet27/Verilog/assets/154442221/8ae1a553-ab6a-4611-b32a-db81ababeb45)
