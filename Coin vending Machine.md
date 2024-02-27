### Code

```verilog 
/*
Verilog code and its test bench for a coin vending machine which accepts Rs1 , Rs 2 or Rs 5 coins. One coin at a
time. Only after a total of Rs. 5 is reached the machine will release the cold-drink bottle and then return back
to wait for next transaction.
*/

module fsm( clk, rst, inp, outp); 
input clk, rst;
input [2:0]inp; 
output outp; 
reg [2:0] state; 
reg outp; 
always @( posedge clk, posedge rst ) begin 
if( rst ) begin 
	state <= 3'b000; 
	outp <= 0; 
end 
else begin 
	case( state ) 
	3'b000: begin 
		if( inp <= 3'b001 ) begin 
			state <= 3'b001; 
			outp <= 0; 
		end 
		else if (inp <= 3'b101) begin 
			state <= 3'b000; 
			outp <= 1; 
		end 
		else if (inp <= 3'b010) begin 
			state <= 3'b000; 
			outp <= 0; 
		end 
	end 
	
	3'b001: begin 
		if( inp <= 3'b001 ) begin 
			state <= 3'b010; 
			outp <= 0; 
		end 
		else if (inp <= 3'b101) begin 
			state <= 3'b001; 
			outp <= 1; 
		end 
		else if (inp <= 3'b010) begin 
			state <= 3'b011; 
			outp <= 0; 
		end 
	end
	
	3'b010: begin 
		if( inp <= 3'b001 ) begin 
			state <= 3'b011; 
			outp <= 0; 
		end 
		else if (inp <= 3'b101) begin 
			state <= 3'b010; 
			outp <= 1; 
		end 
		else if (inp <= 3'b010) begin 
			state <= 3'b100; 
			outp <= 0; 
		end 
	end
	
	3'b011: begin 
		if( inp <= 3'b001 ) begin 
			state <= 3'b100; 
			outp <= 0; 
		end 
		else if (inp <= 3'b101) begin 
			state <= 3'b011; 
			outp <= 1; 
		end 
		else if (inp <= 3'b010) begin 
			state <= 3'b000; 
			outp <= 1; 
		end 
	end
	
	3'b100: begin 
		if( inp <= 3'b001 ) begin 
			state <= 3'b000; 
			outp <= 1; 
		end 
		else if (inp <= 3'b101) begin 
			state <= 3'b100; 
			outp <= 1; 
		end 
		else if (inp <= 3'b010) begin 
			state <= 3'b001; 
			outp <= 1; 
		end 
	end
	
	default: begin 
		state <= 3'b000; 
		outp <= 0; 
		end 
	endcase 
	end 
end
endmodule

//Tesbench for the above code
module fsmbench();
  reg clk,rst;
  reg [2:0]inp;
  wire outp;
  fsm testing( clk, rst, inp, outp);
  initial
  begin
    clk=1'b0;
    forever #10 clk=~clk;
  end
  initial
  begin 
    rst=1'b0;
    #5
    rst=1'b1;
    #10
    rst=1'b0;
    inp=3'b101;
    #20
    inp=3'b001;
    #100 
    inp=3'b101;
    #10 $stop;
  end
endmodule
```
### Output
#### Timing simulation
![image](https://github.com/userofmeet27/Verilog/assets/154442221/5427101f-4c31-4fb2-a908-8488625ad732)
#### Testbench simulation
![image](https://github.com/userofmeet27/Verilog/assets/154442221/b14287cc-7e2a-499d-94d2-2e9ed4d13d76)

