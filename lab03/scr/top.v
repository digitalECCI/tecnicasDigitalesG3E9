`include "sumador3bits.v"
`include "sieteSeg.v"
module top(

    input  [5:0] sw,
    output [0:6] seg,
    output [3:0] an

);

wire [3:0] suma;


sumador3bits SUM(
    .A(sw[2:0]),
    .B(sw[5:3]),
    .Ci(1'b0),
    .So(suma),
    .Co()
);

sieteSeg DISP(
    .BCD(suma),
    .SSeg(seg),
    .an(an)
);

endmodule