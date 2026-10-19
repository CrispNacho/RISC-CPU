`include "define_state.h"

cpu_state_type state;

module cpu(
    input logic clk,
    input logic rst
);

alu alu_unit(
    .rs1(aluIn1),
    .rs2(aluIn2),
    .op(aluOp),
    .result(aluRes)
);

decoder decoder_unit(
    .inst(instruction)
);

logic [7:0] address_a; 
logic [7:0] address_b;
logic [31:0] write_data_a;
logic [31:0] write_data_b;
logic write_enable_a;
logic write_enable_b;
logic [31:0] read_data_a;
logic [31:0] read_data_b;

dual_port_RAM_A RAM_inst0 (
	.address_a ( address_a ),
	.address_b ( address_b ),
	.clock ( CLOCK_50_I ),
	.data_a ( write_data_a ),
	.data_b ( write_data_b ),
	.wren_a ( write_enable_a ),
	.wren_b ( write_enable_b ),
	.q_a ( read_data_a ),
	.q_b ( read_data_b )
);



always_ff @(posedge clk or negedge rst) begin
    if (!rst) begin
        address_a <= 32'b0;
        address_b <= 32'b1;
        write_data_a <= 32'b0;
        write_data_a <= 32'b0;
        write_enable_a <= 1'b0;
        write_enable_b <= 1'b0; 

    end else begin
        case(state)

        S_IDLE: begin
            address_a <= 32'b0;
            address_b <= 32'b1;
            write_data_a <= 32'b0;
            write_data_a <= 32'b0;
            write_enable_a <= 1'b0;
            write_enable_b <= 1'b0; 
            state <= S_1;
        end
        S_1: begin
            state <= S_2;
        end
        S_2: begin

            state <= S_3;

        end
        S_3: begin

            state <= S_4;

        end
        S_4: begin

            state <= S_1;
        end

        endcase;


        

    end
end

endmodule;