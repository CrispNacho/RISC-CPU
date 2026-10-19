// Simple 8-bit Counter Module
module counter (
    input logic clk,
    input logic rst,
    input logic enable,
    output logic [7:0] count
);

logic [3:0] reg1;
logic [3:0] reg2;

alu ALU_unit (
    .rs1(reg1),
    .rs2(reg2),
    .result(addition)
);


always_ff @(posedge clk or negedge rst) begin
    if (!rst) begin
        count <= 8'b0;
        reg1 <= 1'd0;
        reg2 <= 1'd0;
    end else if (enable) begin
        count <= count + 1;
        reg1 <= 4'd2;
        reg2 <= 4'd3;
    end
end

endmodule
