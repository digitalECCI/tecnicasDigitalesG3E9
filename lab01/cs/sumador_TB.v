`include "sumador.v"
`timescale 1s/1s

module sumador_TB(

);

reg A_TB;
reg B_TB;
reg Ci_TB;
wire Co_TB;
wire So_TB;


sumador uut(
    .A(A_TB),
    .B(B_TB),
    .Ci(Ci_TB),
    .Co(Co_TB),
    .So(So_TB)
);

initial begin
    //casi1
    A_TB = 1'b0;
    B_TB = 1'b0;
    Ci_TB = 1'b0;
    #5;
    //caso2
    A_TB = 1'b0;
    B_TB = 1'b0;
    Ci_TB = 1'b1;
    #5;
    //caso3
    A_TB = 1'b0;
    B_TB = 1'b1;
    Ci_TB = 1'b0;
    #5;
    //caso4
    A_TB = 1'b0;
    B_TB = 1'b1;
    Ci_TB = 1'b1;
    #5;
    //caso5
    A_TB = 1'b1;
    B_TB = 1'b0;
    Ci_TB = 1'b0;
    #5;
    //caso6
    A_TB = 1'b1;
    B_TB = 1'b0;
    Ci_TB = 1'b1;
    #5;
    //caso7
    A_TB = 1'b1;
    B_TB = 1'b1;
    Ci_TB = 1'b0;
    #5;
    //caso8
    A_TB = 1'b1;
    B_TB = 1'b1;
    Ci_TB = 1'b1;
    #5; 
    //caso9
    
  

end

initial begin: TEST_CASE
$dumpfile ("simulacion.vcd");
$dumpvars (-1,uut);
#40;
$finish;
end

endmodule

