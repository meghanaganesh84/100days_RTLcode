module tb_1011_mealy_seq_detector();
wire  seq_detected;
reg rst,clk,seq_in;

mealy_seq_detector_1011  dut ( .clk(clk),
                               .rst(rst),
                               .seq_in(seq_in),
                               .seq_detected(seq_detected) );
     
always #5 clk=~clk;
initial begin 
clk=0;rst=1;seq_in=0;
#10
rst=0;
 
#10 seq_in=1;
#10 seq_in=0;
#10 seq_in=1;
#10 seq_in=1;


#10 seq_in=1;
#10 seq_in=0;
#10 seq_in=1;
#10 seq_in=1;

#10 seq_in=1;
#10 seq_in=0;
#10 seq_in=1;
#10 seq_in=1;


#10 seq_in=1;
#10 seq_in=0;
#10 seq_in=1;
#10 seq_in=0;

#40 $stop();

end
endmodule
