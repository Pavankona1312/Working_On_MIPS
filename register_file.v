module reg_file(
    input[4:0] radr1, radr2, radrw,
    input[31:0] din,
    input clk,
    input wr_en,
    output[31:0] dout1, dout2
);
    reg [31:0] regfile [0:31];
    always @(posedge clk) begin
        reg1_val <= regfile[reg1];
        reg2_val <= regfile[reg2];
    end

    always @(negedge clk) begin
        if (reg_wr) begin
            regfile[wr_reg] <= wr_data;
        end
    end
endmodule

