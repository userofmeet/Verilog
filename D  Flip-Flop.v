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
