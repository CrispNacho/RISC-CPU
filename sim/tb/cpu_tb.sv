// Testbench for ALU Module
`timescale 1ns/1ps

module cpu_tb;
    logic CLK;
    logic RST;

cpu uut (
    .clk(CLK),
    .rst(RST)
);

initial begin 
    CLK = 0;
    RST = 1;
    forever begin
        #10
        CLK = ~CLK;
    end
    #100
    $finish;
end


endmodule

