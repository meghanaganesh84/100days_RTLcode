module moore_1100 (
input clk,rst,in,
output reg out );
parameter A=3'b000,
          B=3'b001,
          C=3'b010,
          D=3'b011,
          E=3'b100;
reg [2:0] cs,ns;
always @(posedge clk or  posedge  rst ) begin
if (rst) begin
cs<=A;
out<=0;
end
else begin
cs<=ns;
end
end
always @(* ) begin
case (cs) 
A: begin 
ns=(in) ?B:A;
out=0;
end
B: begin 
ns=(in) ?C:A;
out=0;
end
C: begin 
ns=(in) ?C:D;
out=0;
end
D: begin 
ns=(in) ?B:E;
out=0;
end
E: begin 
ns=(in) ?A:A;
out=1;
end
default : begin
cs=A;
out=0;
end
endcase
end
endmodule
