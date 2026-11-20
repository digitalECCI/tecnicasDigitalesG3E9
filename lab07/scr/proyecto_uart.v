`include "baud_gen.v"
`include "bin2dec.v"
`include "dec2bin.v"
`include "uart_tx.v"
`include "uart_rx.v"


module proyecto_uart #(
    parameter integer CLOCK_HZ = 50000000,
    parameter integer BAUD_RATE = 9600
) (
    input wire clk,
    input wire reset_n,
    input wire [9:0] SW,
    input wire KEY0,
    input wire UART_RX,
    output wire UART_TX,
    output wire [9:0] LEDR
);
    reg [9:0] sw_meta;
    reg [9:0] sw_sync;
    reg key_meta;
    reg key_sync;
    reg key_previous;

    reg [9:0] transmit_value;
    reg [2:0] digit_index;
    reg transmit_active;
    wire [7:0] digit0;
    wire [7:0] digit1;
    wire [7:0] digit2;
    wire [7:0] digit3;
    wire [2:0] digit_length;
    reg [7:0] tx_data;
    wire tx_busy;
    wire baud_tick;
    wire tx_start;
    wire [7:0] received_data;
    wire received_valid;
    wire framing_error;
    wire [9:0] received_value;
    wire received_value_valid;

    assign tx_start = transmit_active && !tx_busy;
    assign LEDR = received_value;

    baud_gen #(
        .CLOCK_HZ(CLOCK_HZ),
        .BAUD_RATE(BAUD_RATE)
    ) baud_generator (
        .clk(clk),
        .reset_n(reset_n),
        .baud_tick(baud_tick)
    );

    bin2dec decimal_converter (
        .value(transmit_value),
        .digit0(digit0),
        .digit1(digit1),
        .digit2(digit2),
        .digit3(digit3),
        .length(digit_length)
    );

    uart_tx #(
        .CLOCK_HZ(CLOCK_HZ),
        .BAUD_RATE(BAUD_RATE)
    ) transmitter (
        .clk(clk),
        .reset_n(reset_n),
        .baud_tick(baud_tick),
        .start(tx_start),
        .data_in(tx_data),
        .tx(UART_TX),
        .busy(tx_busy)
    );

    uart_rx #(
        .CLOCK_HZ(CLOCK_HZ),
        .BAUD_RATE(BAUD_RATE)
    ) receiver (
        .clk(clk),
        .reset_n(reset_n),
        .rx(UART_RX),
        .data_out(received_data),
        .data_valid(received_valid),
        .framing_error(framing_error)
    );

    dec2bin decimal_parser (
        .clk(clk),
        .reset_n(reset_n),
        .data_in(received_data),
        .data_valid(received_valid),
        .value(received_value),
        .value_valid(received_value_valid)
    );

    always @* begin
        if (digit_index < digit_length) begin
            case (digit_index)
                3'd0: tx_data = digit0;
                3'd1: tx_data = digit1;
                3'd2: tx_data = digit2;
                default: tx_data = digit3;
            endcase
        end else if (digit_index == digit_length) begin
            tx_data = 8'h0D;
        end else begin
            tx_data = 8'h0A;
        end
    end

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            sw_meta <= 10'd0;
            sw_sync <= 10'd0;
            key_meta <= 1'b1;
            key_sync <= 1'b1;
            key_previous <= 1'b1;
        end else begin
            sw_meta <= SW;
            sw_sync <= sw_meta;
            key_meta <= KEY0;
            key_sync <= key_meta;
            key_previous <= key_sync;
        end
    end

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            transmit_value <= 10'd0;
            digit_index <= 3'd0;
            transmit_active <= 1'b0;
        end else begin
            if (key_previous && !key_sync && !transmit_active && !tx_busy) begin
                transmit_value <= sw_sync;
                digit_index <= 3'd0;
                transmit_active <= 1'b1;
            end

            if (tx_start) begin
                if (digit_index == digit_length + 1'b1)
                    transmit_active <= 1'b0;
                else
                    digit_index <= digit_index + 1'b1;
            end
        end
    end
endmodule
