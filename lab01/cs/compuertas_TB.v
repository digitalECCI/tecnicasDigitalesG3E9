`include "compuertas.v"
`timescale 1s/1s

module compuertas_TB(
);

reg A_TB;
reg B_TB;

wire Sand_TB;
wire Sor_TB;
wire Snot_TB;
wire Sxor_TB;
wire Sxnor_TB;

compuertas uut(
    .A(A_TB),
    .B(B_TB),
    .Sand(Sand_TB),
    .Sor(Sor_TB),
    .Snot(Snot_TB),
    .Sxor(Sxor_TB),
    .Sxnor(Sxnor_TB)
);

initial begin
    //caso 1
    A_TB = 1'b0;
    B_TB = 1'b0;
    #5;

    //caso 2
    A_TB = 1'b0;
    B_TB = 1'b1;
    #5;

    //caso 3
    A_TB = 1'b1;
    B_TB = 1'b0;
    #5;
    //caso 4
    A_TB = 1'b1;
    B_TB = 1'b1;
    #5;
end


initial begin: TEST_CASE
$dumpfile ("simulacion.vcd");
$dumpvars (-1,uut);
#30;

$finish;
end

endmodule