module uart_tx #(
    parameter integer CLOCK_HZ = 50000000,
    parameter integer BAUD_RATE = 9600
) (
    input wire clk,
    input wire reset_n,
    input wire baud_tick,
    input wire start,
    input wire [7:0] data_in,
    output reg tx,
    output wire busy
);
    localparam [1:0] IDLE = 2'd0, WAIT_START = 2'd1,
                     DATA = 2'd2, STOP = 2'd3;

    reg [1:0] state;
    reg [7:0] data_reg;
    reg [2:0] bit_index;

    assign busy = (state != IDLE);

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state <= IDLE;
            data_reg <= 8'd0;
            bit_index <= 3'd0;
            tx <= 1'b1;
        end else begin
            case (state)
                IDLE: begin
                    tx <= 1'b1;
                    if (start) begin
                        data_reg <= data_in;
                        state <= WAIT_START;
                    end
                end

                WAIT_START: begin
                    if (baud_tick) begin
                        tx <= 1'b0;
                        bit_index <= 3'd0;
                        state <= DATA;
                    end
                end

                DATA: begin
                    if (baud_tick) begin
                        tx <= data_reg[bit_index];
                        if (bit_index == 3'd7)
                            state <= STOP;
                        else
                            bit_index <= bit_index + 1'b1;
                    end
                end

                STOP: begin
                    if (baud_tick) begin
                        tx <= 1'b1;
                        state <= IDLE;
                    end
                end

                default: begin
                    tx <= 1'b1;
                    state <= IDLE;
                end
            endcase
        end
    end
endmodule
