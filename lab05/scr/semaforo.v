module semaforo(
    input wire clk,
    input wire rst,

    // carro 
    output reg car_red,
    output reg car_yellow,
    output reg car_green,

    // Peatonal
    output reg ped_red,
    output reg ped_green
);

    parameter GREEN   = 2'b00;
    parameter YELLOW1 = 2'b01;
    parameter RED     = 2'b10;
    parameter YELLOW2 = 2'b11;

    reg [1:0] state;
    reg [1:0] next_state;
    reg [3:0] counter;

    // Registro d
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= GREEN;
            counter <= 0;
        end
        else begin
            state <= next_state;

            if(state != next_state)
                counter <= 0;
            else
                counter <= counter + 1;
        end
    end

    // Transiciones
    always @(*) begin
        case(state)
//10  
            GREEN:
                if(counter >= 3)
                    next_state = YELLOW1;
                else
                    next_state = GREEN;
//3
            YELLOW1:
                if(counter >= 1)
                    next_state = RED;
                else
                    next_state = YELLOW1;

            RED:
                if(counter >= 3)
                    next_state = YELLOW2;
                else
                    next_state = RED;

            YELLOW2:
                if(counter >= 1)
                    next_state = GREEN;
                else
                    next_state = YELLOW2;

            default:
                next_state = GREEN;

        endcase
    end

    // Salidas Moore
    always @(*) begin

        // Vehicular
        car_red = 0;
        car_yellow = 0;
        car_green = 0;

        // Peatonal
        ped_red = 0;
        ped_green = 0;

        case(state)

            GREEN: begin
                car_green = 1;
                ped_red   = 1;
            end

            YELLOW1: begin
                car_yellow = 1;
                ped_red    = 1;
            end

            RED: begin
                car_red   = 1;
                ped_green = 1;
            end

            YELLOW2: begin
                car_yellow = 1;
                ped_red    = 1;
            end

        endcase

    end

endmodule