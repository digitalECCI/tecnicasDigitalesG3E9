`include "semaforo.v"
`include "clk_divider.v"

module top(
    
    input CLOCK_50,
    input KEY0,

    output LEDR0, // Carro rojo
    output LEDR1, // Carro amarillo
    output LEDR2, // Carro verde

    output LEDR3, // Peatón rojo
    output LEDR4  // Peatón verde
);

    wire clk_1hz;

    clk_divider divider(
        .clk(CLOCK_50),
        .rst(~KEY0),
        .clk_1hz(clk_1hz)
    );

    semaforo semaforo(
        .clk(clk_1hz),
        .rst(~KEY0),

        .car_red(LEDR0),
        .car_yellow(LEDR1),
        .car_green(LEDR2),

        .ped_red(LEDR3),
        .ped_green(LEDR4)
    );

endmodule