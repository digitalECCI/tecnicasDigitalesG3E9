module clk_divider(
    input clk,
    input rst,
    output reg clk_1hz
);

    reg [25:0] counter;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            counter <= 0;
            clk_1hz <= 0;
        end
        else begin
            if(counter == 4) begin
                counter <= 0;
                clk_1hz <= ~clk_1hz;
            end
            else
                counter <= counter + 1;
        end
    end

endmodule

//24999999