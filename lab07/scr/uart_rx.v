module uart_rx #(
    parameter integer CLOCK_HZ = 50000000,
    parameter integer BAUD_RATE = 9600
) (
    input wire clk,
    input wire reset_n,
    input wire rx,
    output reg [7:0] data_out,
    output reg data_valid,
    output reg framing_error
);
    localparam integer CLKS_PER_BIT =
        (CLOCK_HZ / BAUD_RATE < 4) ? 4 : CLOCK_HZ / BAUD_RATE;
    localparam integer COUNT_WIDTH =
        (CLKS_PER_BIT <= 2) ? 1 : $clog2(CLKS_PER_BIT);
    localparam [1:0] IDLE = 2'd0, START = 2'd1,
                     DATA = 2'd2, STOP = 2'd3;

    reg rx_meta;
    reg rx_sync;
    reg [1:0] state;
    reg [COUNT_WIDTH-1:0] count;
    reg [2:0] bit_index;
    reg [7:0] data_reg;

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            rx_meta <= 1'b1;
            rx_sync <= 1'b1;
        end else begin
            rx_meta <= rx;
            rx_sync <= rx_meta;
        end
    end

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            state <= IDLE;
            count <= {COUNT_WIDTH{1'b0}};
            bit_index <= 3'd0;
            data_reg <= 8'd0;
            data_out <= 8'd0;
            data_valid <= 1'b0;
            framing_error <= 1'b0;
        end else begin
            data_valid <= 1'b0;
            framing_error <= 1'b0;

            case (state)
                IDLE: begin
                    if (!rx_sync) begin
                        count <= CLKS_PER_BIT / 2 - 1;
                        state <= START;
                    end
                end

                START: begin
                    if (count == 0) begin
                        if (!rx_sync) begin
                            count <= CLKS_PER_BIT - 1;
                            bit_index <= 3'd0;
                            state <= DATA;
                        end else begin
                            state <= IDLE;
                        end
                    end else begin
                        count <= count - 1'b1;
                    end
                end

                DATA: begin
                    if (count == 0) begin
                        data_reg[bit_index] <= rx_sync;
                        count <= CLKS_PER_BIT - 1;
                        if (bit_index == 3'd7)
                            state <= STOP;
                        else
                            bit_index <= bit_index + 1'b1;
                    end else begin
                        count <= count - 1'b1;
                    end
                end

                STOP: begin
                    if (count == 0) begin
                        if (rx_sync) begin
                            data_out <= data_reg;
                            data_valid <= 1'b1;
                        end else begin
                            framing_error <= 1'b1;
                        end
                        state <= IDLE;
                    end else begin
                        count <= count - 1'b1;
                    end
                end

                default: state <= IDLE;
            endcase
        end
    end
endmodule
