module circuit(ms,ts,ct,o1,o2,o3);

   input [3:0]ms;
   input [3:0]ts;
   input [3:0]ct;
   output o1,o2,o3;
   wire [3:0]s1;
   wire c1out;

   adder_four_bit A1(s1,c1out,ts,ct);

   comparator C1(ms,s1,o2,o3,o1);

endmodule



module adder_four_bit(output [3:0]sum, output cout , input [3:0]a,input [3:0]b);

wire c1,c2,c3,c4;

full_3 ad0( .a(a[0]), .b(b[0]),.cin(1'b0), .s(sum[0]), .cout(c1));
full_3 ad1( .a(a[1]), .b(b[1]),.cin(c1), .s(sum[1]), .cout(c2));
full_3 ad2( .a(a[2]), .b(b[2]),.cin(c2), .s(sum[2]), .cout(c3));
full_3 ad3( .a(a[3]), .b(b[3]),.cin(c3), .s(sum[3]), .cout(c4));
assign cout= c4;
endmodule

module full_3(a,b,cin,s,cout);
input a,b,cin;
output s, cout;
assign s=a^b^cin;
assign cout = (a&b) | (b&cin) | (cin&a);
endmodule

module comparator(A,B,E,G,S);
input[3:0]A;
input [3:0]B;
output E,G,S;
assign E=!(A[3]^B[3])&!(A[2]^B[2])&!(A[1]^B[1])&!(A[0]^B[0]);
assign G=(A[3]&(!(B[3])))|(!(A[3]^B[3])&(A[2]&(!(B[2]))))|((!(A[3]^B[3])&!(A[2]^B[2]))&(A[1]&(!(B[1]))))|((!(A[3]^B[3])&!(A[2]^B[2])&!(A[1]^B[1]))&(A[0]&(!(B[0]))));
assign S=(B[3]&(!(A[3])))|(!(A[3]^B[3])&(B[2]&(!(A[2]))))|((!(A[3]^B[3])&!(A[2]^B[2]))&(B[1]&(!(A[1]))))|((!(A[3]^B[3])&!(A[2]^B[2])&!(A[1]^B[1]))&(B[0]&(!(A[0]))));

endmodule



