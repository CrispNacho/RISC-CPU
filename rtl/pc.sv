module cpu(
    input clk,
    input rst,
    output reg [3:0] pc
);



always_ff @(posedge clk or negedge rst) begin
        if (!rst)
            pc <= 4'b0;
        else 
            pc <= pc + 4'b4;
    end

endmodule