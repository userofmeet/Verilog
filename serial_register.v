//2 bit serial register using Non Blocking assignment
module SerialRegister (clk,data_in,data_out);
  input clk,data_in;
  output [1:0] data_out;
  reg [1:0] data_out;
  always @(posedge clk) begin
    data_out[0] <= data_in;
    data_out[1] <= data_out[0];
  end
endmodule

//Using Blocking assignment
module SerialRegister (clk,data_in,data_out);
  input clk,data_in;
  output [1:0] data_out;
  reg [1:0] data_out;
  always @(posedge clk) begin
    data_out[0] = data_in;
    data_out[1] = data_out[0];
  end
endmodule
