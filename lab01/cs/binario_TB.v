`include "binario.V"
`timescale 1s/1s

module binario_TB (

);
reg A_TB;
reg B_TB;
reg C_TB;
wire S_TB;
wire C1_TB;
wire C2_TB;
wire C3_TB;
    

binario  uut(
    .A(A_TB),
    .B(B_TB),
    .C(C_TB),
    .S(S_TB)
    

);

initial begin 
    //caso1
    A_TB = 1'b0;
    B_TB = 1'b0;
    C_TB = 1'b0;
    #5;
    //caso2
    A_TB = 1'b0;
    B_TB = 1'b0;
    C_TB = 1'b1;
    #5;
    //caso3
    A_TB = 1'b0;
    B_TB = 1'b1;
    C_TB = 1'b0;
    #5;
    //caso4
    A_TB = 1'b0;
    B_TB = 1'b1;
    C_TB = 1'b1;
    #5;
    //caso5
    A_TB = 1'b1;
    B_TB = 1'b0;
    C_TB = 1'b0;
    #5;
    //caso6
    A_TB = 1'b1;
    B_TB = 1'b0;
    C_TB = 1'b1;
    #5;
    //caso7
    A_TB = 1'b1;
    B_TB = 1'b1;
    C_TB = 1'b0;
    #5;
    //caso8
    A_TB = 1'b1;
    B_TB = 1'b1;
    C_TB = 1'b1;
    #5;


end


initial begin: TEST_CASE
$dumpfile ("simulacion.vcd");
$dumpvars (-1,uut);
#40;
$finish;
end


endmodule 

