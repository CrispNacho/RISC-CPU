`timescale 1ns/1ps


module fsm_tb;
    logic CLK;
    logic DIN;
    logic RST;
    logic [3:0] PTRN;

fsm DUT (
    .clk(CLK),
    .din(DIN),
    .rst_n(RST),
    .pattern(PTRN)
);

logic [9:0] feed_data = 10'b1011010110; // The sequence to drip feed

always begin
    #10
    CLK = ~CLK;
end

initial begin
    CLK = 1'b0;
    DIN = 1'b0;
    RST = 1'b0; //change to starting at 1 and going to 0 and it will work
    PTRN = 4'b0110; 

    #20
    RST = 1'b1; 

    for (int i = 0; i < 10; i++) begin
            @(negedge CLK); 
            
            DIN = feed_data[i]; 
        end
    #100
    $stop;
    
end



endmodule