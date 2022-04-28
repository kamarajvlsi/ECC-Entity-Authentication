module Shiftregister_PISO(Clk, Parallel_In,load, Serial_Out);
input Clk,load;
input [255:0]Parallel_In;
output reg Serial_Out;
reg [255:0]tmp;
always @(posedge Clk)
begin
if(load)
tmp<=Parallel_In;
else if(tmp)
begin
Serial_Out<=tmp[255];
tmp<={tmp[254:0],1'b0};
end
end
endmodule