module sumador (

input A,
input B,
input Ci,
output Co,
output So

);

wire c1;
wire c2;
wire c3;

xor (c1,A,B);

and (c2,A,B);
xor (So,c1,Ci);
and (c3,c1,Ci);
or (Co,c2,c3);



endmodule