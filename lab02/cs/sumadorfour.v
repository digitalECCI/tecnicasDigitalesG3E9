//include "sumador.v"//

`include "sumador.v"
 module sumadorfour (

    input [3:0] A,
    input [3:0] B,
    input Ci,
    output [3:0] So,
    output Co


 );

 wire C0;
 wire C1;
 wire C2;

 sumador bit0(


    .A(A[0]),
    .B(B[0]),
    .Ci(1'b0),
    .So(So[0]),
    .Co(C0)
 );

 sumador bit1(
    .A(A[1]),
    .B(B[1]),
    .Ci(C0),
    .So(So[1]),
    .Co(C1)

 );

 sumador bit2(
    .A(A[2]),
    .B(B[2]),
    .Ci(C1),
    .So(So[2]),
    .Co(C2)
 
 );
sumador bit3( 
    .A(A[3]),
    .B(B[3]),
    .Ci(C2),
    .So(So[3]),
    .Co(Co)

);

 endmodule
