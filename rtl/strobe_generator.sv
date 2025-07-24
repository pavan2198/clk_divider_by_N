module strobe_generator #(
    parameter N = 4
) (
    input  logic clk_in,
    input  logic rst,
    output logic tick_out
);
    
    reg [$clog2(N)-1:0] counter = 0;
    
    assign tick_out = (counter == N-1);

    always_ff @(posedge clk_in or posedge rst) begin
        if (rst) begin
            counter <= 0;
        end else if (tick_out) begin
            counter <= 0;
        end else begin
            counter <= counter + 1;
        end
    end
    
endmodule
