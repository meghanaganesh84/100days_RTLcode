module tb_moore_non_overlap_sequence_detector_1100;
reg clk,rst,in;
wire out;
moore_1100 dut (
.clk(clk),.rst(rst),.in(in),.out(out));
always #5 clk=~clk;
initial begin
clk=0;rst=0;in=0;
rst=1;
#10 rst=0;
#10 in=1;
#10 in=1;
#10 in=0;
#10 in=0;
#10 in=1;
#10 in=1;
#10 in=0;
#10 in=0;
#10 in=1;
#10 in=0;
#10 in=1;
#40 $stop();
end
endmodule
