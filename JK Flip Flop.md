### Code
```Verilog
module jk(j,k,clk,rst,q,qbar);
  input j,k,clk,rst;
  output reg q,qbar;
  always @(posedge clk,posedge rst)begin
    if(rst)begin
      q<=0;
      qbar<=~q;
    end
    else begin
    if (j<=0 & k<=0)begin
      q<=q;
      qbar<=~q;
    end
  else if(j<=0 & k<=1)begin
    q<=0;
    qbar<=1;
  end
else if (j<=1 & k<=0)begin
  q<=1;
  qbar<=0;
end
else begin
q<=~q;
qbar<=q;
end
end
end
endmodule

```
### Testbench
``` Verilog
module jktb();
  reg j,k,clk,rst;
  wire q,qbar;
  jk kj(j,k,clk,rst,q,qbar);
  initial begin
    clk=1'b0;
    forever #5 clk=~clk;
  end
  initial begin
    rst<=1;
    #10
    rst<=0;
    j<=0;
    k<=0;
    #10
    j<=0;
    k<=1;
    #10
    j<=1;
    k<=0;
    #10
    j<=1;
    k<=1;
  end
endmodule

```
### Output
![image](https://github.com/userofmeet27/Verilog/assets/154442221/6a58e1e4-a0f6-4b66-a22a-c9b2ad880d89)
