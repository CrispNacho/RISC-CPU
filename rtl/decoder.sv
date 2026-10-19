module decoder(
    input logic [15:0] inst,
    output logic [15:0] result
);

always_comb begin
    case (inst[15:14])
        2'b00 : begin
            
        end
        2'b01 : begin
            
        end

        2'b10 : begin
            
        end

        2'b11 : begin
            
        end

    endcase
end


endmodule