module registers(
    input logic clk,
    input logic rst,
    input logic data,
    input logic [1:0] regInSel,
    input logic regInEn,
    input logic [1:0] regOut1Sel,
    input logic [1:0] regOut2Sel,
    output logic [15:0] regOut1 ,
    output logic [15:0] regOut2
);

logic r1 [15:0]
logic r2 [15:0]
logic r3 [15:0]
logic r4 [15:0]

always_comb begin
    case (regOut1Sel)
        2'd0: begin
            regOut1 = r1;
        end
        2'd1: begin
            regOut1 = r2;
        end
        2'd2: begin
            regOut1 = r3;
        end
        2'd3: begin
            regOut1 = r4;
        end
    endcase
    case (regOut2Sel)
        2'd0: begin
            regOut2 = r1;
        end
        2'd1 begin
            regOut2 = r2;
        end
        2'd2 begin
            regOut2 = r3;
        end
        2'd3 begin
            regOut2 = r4;
        end
    endcase
    
end

always_ff @(posedge clk or negedge rst) begin
        if (!rst) begin
            count <= 8'b0;
            r1 < = 1'b0;
            r2 < = 1'b0;
            r3 < = 1'b0;
            r4 < = 1'b0;
        end else
            if(regInEn) begin
                case (regInSel)
                    2'd0: begin
                        r1 <= data;
                    end
                    2'd1 begin
                        r2 <= data;
                    end
                    2'd2 begin
                        r3 <= data;
                    end
                    2'd3 begin
                        r4 <= data;
                    end
                    
                endcase
            end 

    end
endmodule