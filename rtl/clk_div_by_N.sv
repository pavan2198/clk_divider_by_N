module clk_divider_by_N #(
    parameter N = 3
) (
    input  logic clk_in,
    input  logic rst,
    output logic clk_out
);
    
    reg [$clog2(N)-1:0] counter = 0;

    always_ff @(posedge clk_in or posedge rst) begin
        if (rst) begin
            counter <= 0;
            clk_out <= 0;
        end else if (counter == N-1) begin
            counter <= 0;
            clk_out <= ~clk_out;
        end else begin
            counter <= counter + 1;
        end
    end
    
endmodule
