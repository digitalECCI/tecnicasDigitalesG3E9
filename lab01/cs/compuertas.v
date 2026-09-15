module compuertas (

    input wire A,
    input wire B,
    output wire Sand,
    output wire Sor,
    output wire Snot,
    output wire Sxor,
    output wire Sxnor

);

and(Sand,A,B);
or(Sor,A,B);
not(Snot,A);
xor(Sxor,A,B);
xnor(Sxnor,A,B);


endmodule