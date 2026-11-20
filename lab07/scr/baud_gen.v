module baud_gen #(
    parameter integer CLOCK_HZ = 50000000,
    parameter integer BAUD_RATE = 9600
) (
    input wire clk,
    input wire reset_n,
    output reg baud_tick
);
    localparam integer DIVISOR =
        (CLOCK_HZ / BAUD_RATE < 1) ? 1 : CLOCK_HZ / BAUD_RATE;
    localparam integer COUNT_WIDTH = (DIVISOR <= 1) ? 1 : $clog2(DIVISOR);

    reg [COUNT_WIDTH-1:0] count;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            count <= {COUNT_WIDTH{1'b0}};
            baud_tick <= 1'b0;
        end else if (count == DIVISOR - 1) begin
            count <= {COUNT_WIDTH{1'b0}};
            baud_tick <= 1'b1;
        end else begin
            count <= count + 1'b1;
            baud_tick <= 1'b0;
        end
    end
endmodule
