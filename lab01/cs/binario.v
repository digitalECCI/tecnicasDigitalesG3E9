module binario (

input A,
input B,
input C,
output S

);

wire C1;
wire C2;
wire C3;


not (C1,A);
and (C2,C1,B);
and (C3,A,C); 
or (S,C2,C3);


endmodule