module top(
input [6:0] d_in,
input clk, rst,
output reg [2:0] count

);

wire [2:0] count_nxt;
wire s1,s2,s3,s4,Cout1,Cout2,Cout3,Cout4; 


always @(posedge clk or posedge rst)
begin
   if (rst)
    count <= 4'b0000;
   else
    count <= count_nxt;
end

full_adder adder1 (
                    .A(d_in[6]),
                    .B(d_in[5]),
                    .Cin(d_in[4]),
                    .S(s1),
                    .Cout(Cout1)
                    );
full_adder adder2 (
                    .A(d_in[3]),
                    .B(d_in[2]),
                    .Cin(d_in[1]),
                    .S(s2),
                    .Cout(Cout2)
                    );
full_adder adder3 (
                    .A(Cout1),
                    .B(Cout2),
                    .Cin(Cout4),
                    .S(s3),
                    .Cout(Cout3)
                    );
full_adder adder4 (
                    .A(s1),
                    .B(s2),
                    .Cin(d_in[0]),
                    .S(s4),
                    .Cout(Cout4)
                    );

assign  count_nxt = {Cout3,s3,s4};

endmodule
