module bin2dec (
    input wire [9:0] value,
    output reg [7:0] digit0,
    output reg [7:0] digit1,
    output reg [7:0] digit2,
    output reg [7:0] digit3,
    output reg [2:0] length
);
    reg [9:0] remainder;
    reg [3:0] d0;
    reg [3:0] d1;
    reg [3:0] d2;
    reg [3:0] d3;

    always @* begin
        remainder = value;
        d3 = remainder % 10;
        remainder = remainder / 10;
        d2 = remainder % 10;
        remainder = remainder / 10;
        d1 = remainder % 10;
        remainder = remainder / 10;
        d0 = remainder[3:0];

        if (value >= 10'd1000) begin
            length = 3'd4;
            digit0 = 8'd48 + d0;
            digit1 = 8'd48 + d1;
            digit2 = 8'd48 + d2;
            digit3 = 8'd48 + d3;
        end else if (value >= 10'd100) begin
            length = 3'd3;
            digit0 = 8'd48 + d1;
            digit1 = 8'd48 + d2;
            digit2 = 8'd48 + d3;
            digit3 = 8'd48 + d3;
        end else if (value >= 10'd10) begin
            length = 3'd2;
            digit0 = 8'd48 + d2;
            digit1 = 8'd48 + d3;
            digit2 = 8'd48 + d3;
            digit3 = 8'd48 + d3;
        end else begin
            length = 3'd1;
            digit0 = 8'd48 + d3;
            digit1 = 8'd48 + d3;
            digit2 = 8'd48 + d3;
            digit3 = 8'd48 + d3;
        end
    end
endmodule
