// 10 bit address and 32-bit data
module data_mem # (parameter N=10, M=32)
    (input [M-1:0] addr,
    input [M-1:0] dtin,
    output [M-1:0] dtout,
    input wr_en,
    input clk,
    input rd_en,
    input rst);

    reg [M-1:0] mem [0:2**N-1];
    integer i;
    always @ (posedge clk) begin
        if (rst) begin
            for (int i = 0; i < 2**N; i = i + 1) begin
                mem[i] <= 0;
            end
        end
        if (rd_en) begin
            dtout <= mem[addr];
        end
    end
    always @(negedge clk) begin
        if (wr_en) mem[addr] <= din;
    end
    
endmodule

module instruction_memory(input [31:0] pc, output [31:0] instr);

reg [31:0] mem [0:1023];

initial begin
    $readmemh("instructions.txt", mem);
end

assign instr = mem[pc];

endmodule