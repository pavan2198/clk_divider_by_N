`timescale 1ns/1ps

module tb_dividers;

    reg clk_in;
    reg rst;

    wire clk_div3_out;
    wire tick_div4_out;

  clk_divider_by_N #( .N(3) ) dut_div_by_3 (
        .clk_in   (clk_in),
        .rst      (rst),
        .clk_out  (clk_div3_out)
    );
    
    strobe_generator #( .N(4) ) dut_strobe_4 (
        .clk_in    (clk_in),
        .rst       (rst),
        .tick_out  (tick_div4_out)
    );

    initial begin
        clk_in = 0;
        forever #5 clk_in = ~clk_in;
    end
    
    initial begin
        $dumpfile("dividers_waveform.vcd");
        $dumpvars(0, tb_dividers);
        
        $display("Starting divider test...");
        rst = 1; #20;
        rst = 0; #200;
        
        $display("Simulation finished.");
        $finish;
    end
endmodule
