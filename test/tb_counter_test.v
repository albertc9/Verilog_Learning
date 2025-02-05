`timescale 1ns/1ps

module tb_counter_test;
    reg clk;
    reg rst_n;
    wire [3:0] count;

    counter u_counter (
        .clk (clk),
        .rst_n (rst_n),
        .count (count)
    );

initial begin
    clk = 1'b0;
    forever #10 clk = ~clk;
end

initial begin
    rst_n = 1;
    #5;

    rst_n = 0;
    #20;

    rst_n = 1;

    #200;

    rst_n = 0;
    #20;
    rst_n = 1;

    #200;
    
    $finish;
end

initial begin
    $monitor($time, " ns -- rst_n=%b, count=%d", rst_n, count);
end

initial begin
    $dumpfile("tb_counter_test.vcd");
    $dumpvars(0, tb_counter_test);
end

endmodule