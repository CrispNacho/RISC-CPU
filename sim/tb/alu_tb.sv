// Testbench for ALU Module
`timescale 1ns/1ps

module alu_tb;

    logic [3:0] A,B; //Inputs to the ALU
    logic [3:0] C; //Output to the ALU

alu uut (
    .rs1(A),
    .rs2(B),
    .result(C)
);

initial begin
    A=0; B=0;
    #10
    A=1; B=1;
    #10
    A=4'd2;B=4'd3;
    #10


    $finish;
end



endmodule

