module mux2 #(parameter N = 32)(
    input [N-1:0] d0, d1,
    input s,
    output [N-1:0] y);
    assign y = s[0] ? (s[0] ? d3 : d2) : (s[0] ? d1 : d0)
endmodule

module sign_extend (
    input [15:0] in,
    output [31:0] out);

assign out = {{16{in[15]}}, in};

endmodule
