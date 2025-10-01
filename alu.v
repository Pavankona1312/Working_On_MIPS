module full_adder(
    input a, b, cin,
    output s, cout
);
    assign {cout, s} = a + b + cin;
endmodule

module rca( // 32-bit ripple carry adder
    input  [31:0] a, b,
    input         cin,
    output [31:0] sum,
    output        cout
);
    wire [32:0] c;
    assign c[0] = cin;

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : rca_loop
            full_adder fa (.a (a[i]), .b (b[i]), .cin (c[i]), .s (sum[i]), .cout (c[i+1]));
        end
    endgenerate

    assign cout = c[32];
endmodule

module slt(
    input  signed [31:0] a, b,  
    output [31:0] r
);
    assign r = (a < b) ? 32'b1 : 32'b0;
endmodule

module alu(
    input  [31:0] a, b,
    input  [2:0]  F,
    output reg [31:0] y,
    output zero
);
    wire [31:0] add_res, slt_res;
    wire cout;
    wire [31:0] bb = F[2] ? ~b : b;  // invert b if F[2] = 1
    rca add_unit(.a(a), .b(bb), .cin(F[2]), .sum(add_res), .cout(cout));
    slt slt_unit(.a(a), .b(b), .r(slt_res));

    always @(*) begin
        case (F)
            3'b00: y = a & bb;         // AND
            3'b001: y = a | bb;         // OR
            3'b010: y = add_res;        // ADD / SUB (if F[2]=1 → subtraction)
            3'b110: y = add_res;        // SUB (already handled by F[2] inversion)
            3'b111: y = slt_res;        // SLT
            default: y = 32'b0;
        endcase
    end
    assign zero = (aluout == 0) ? 1 : 0;
endmodule
