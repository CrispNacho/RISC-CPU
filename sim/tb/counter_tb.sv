// Testbench for Counter Module
`timescale 1ns/1ps

module counter_tb;

    logic clk;
    logic rst;
    logic enable;
    logic [7:0] count;

    // Instantiate the module under test
    counter dut (
        .clk(clk),
        .rst(rst),
        .enable(enable),
        .count(count)
    );

    // Clock generation - 10ns period (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize
        rst = 0;
        enable = 0;
        #20;

        // Release reset
        rst = 1;
        #20;

        // Enable counter and let it count
        enable = 1;
        #300;

        // Disable counter
        enable = 0;
        #50;

        // Re-enable
        enable = 1;
        #100;

        // Reset counter
        rst = 0;
        #20;
        rst = 1;
        #50;

        // End simulation
        $finish;
    end

    // Optional: Monitor output
    initial begin
        $monitor("Time=%0t | rst=%b | enable=%b | count=%d", $time, rst, enable, count);
    end

endmodule
