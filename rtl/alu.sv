module alu(
    input logic [15:0] rs1,
    input logic [15:0] rs2,
    input logic op,
    output logic [15:0] result
);

always_comb begin
    case (op)
        1'b0 : begin
            result = rs1 + rs2;            
        end
        1'b1 : begin
            result = rs1 - rs2;
        end
    endcase

    
end
endmodule