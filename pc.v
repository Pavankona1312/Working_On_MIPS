module update_pc(
    input clk, rst,
    input[31:0] pc0,
    output[31:0] pc1
);
    reg [31:0] pc1;
    always @(posedge clk) begin
        if (rst) pc1 <= 31b'0;
        else q <= pc0;  
    end
endmodule