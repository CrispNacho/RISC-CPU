module fsm (
    input logic clk,
    input logic din,
    input logic rst_n,
    input logic [3:0] pattern,
    output logic dout
);

logic [3:0] bits;
logic [2:0] cnt;

always_comb begin
    if (cnt == 3'd4) begin
        if (bits == pattern)
            dout = 1'b1;
        else
            dout = 1'b0;
    end else
        dout = 1'b0;
end

always_ff @(posedge clk or negedge rst_n) begin
    if(~rst_n) begin
        cnt <= 3'd0;
        bits <= 4'b0;
    end else begin
    
    if (cnt < 3'd4) begin
        cnt <= cnt + 1'b1;
    end
    
    bits <= {bits[2:0],din};

    end
 
end


endmodule