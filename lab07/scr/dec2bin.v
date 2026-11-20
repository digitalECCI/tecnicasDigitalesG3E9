module dec2bin (
    input wire clk,
    input wire reset_n,
    input wire [7:0] data_in,
    input wire data_valid,
    output reg [9:0] value,
    output reg value_valid
);
    reg [9:0] accumulator;
    reg [2:0] digit_count;
    reg line_invalid;
    reg skip_lf;
    wire [13:0] next_value;

    assign next_value = {4'd0, accumulator} * 14'd10 +
                        {6'd0, (data_in - 8'h30)};

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            accumulator <= 10'd0;
            digit_count <= 3'd0;
            line_invalid <= 1'b0;
            skip_lf <= 1'b0;
            value <= 10'd0;
            value_valid <= 1'b0;
        end else begin
            value_valid <= 1'b0;

            if (data_valid) begin
                if (data_in == 8'h0D) begin
                    if (!line_invalid && digit_count != 0) begin
                        value <= accumulator;
                        value_valid <= 1'b1;
                    end
                    accumulator <= 10'd0;
                    digit_count <= 3'd0;
                    line_invalid <= 1'b0;
                    skip_lf <= 1'b1;
                end else if (data_in == 8'h0A) begin
                    if (skip_lf) begin
                        skip_lf <= 1'b0;
                    end else begin
                        if (!line_invalid && digit_count != 0) begin
                            value <= accumulator;
                            value_valid <= 1'b1;
                        end
                        accumulator <= 10'd0;
                        digit_count <= 3'd0;
                        line_invalid <= 1'b0;
                    end
                end else begin
                    skip_lf <= 1'b0;
                    if (data_in >= 8'h30 && data_in <= 8'h39) begin
                        if (!line_invalid) begin
                            if (digit_count == 3'd4 || next_value > 10'd1023) begin
                                line_invalid <= 1'b1;
                            end else begin
                                accumulator <= next_value[9:0];
                                digit_count <= digit_count + 1'b1;
                            end
                        end
                    end else begin
                        line_invalid <= 1'b1;
                    end
                end
            end
        end
    end
endmodule
