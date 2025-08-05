// 8x8 Baugh–Wooley two's-complement multiplier (combinational)
// operand_a,operand_b are signed 8-bit; result_final is signed 16-bit
module baugh_wooley_mul8 (
    input  wire [7:0]  operand_a,
    input  wire [7:0]  operand_b,
    output wire [15:0] result_final
);
    // Modified partial products (Baugh–Wooley)
    wire [7:0] mpp [7:0];

    genvar i, j;
    generate
        for (i = 0; i < 8; i = i + 1) begin : gen_rows
            for (j = 0; j < 8; j = j + 1) begin : gen_cols
                if (i == 7 && j == 7) begin
                    // Do NOT invert the corner bit
                    assign mpp[i][j] = operand_a[7] & operand_b[7];
                end else if (i == 7 || j == 7) begin
                    // Invert last row or last column bits
                    assign mpp[i][j] = ~(operand_a[i] & operand_b[j]);
                end else begin
                    // Regular partial products
                    assign mpp[i][j] =  (operand_a[i] & operand_b[j]);
                end
            end
        end
    endgenerate

    // Accumulate shifted partial products + compensation constant
    // Compensation constant for n=8: C = 2^(2n-1) - 2^n = 0x7F00
    reg [15:0] acc;
    integer r, c;
    always @* begin
        acc = 16'h7F00; // Baugh–Wooley compensation
        for (r = 0; r < 8; r = r + 1)
            for (c = 0; c < 8; c = c + 1)
                if (mpp[r][c])
                    acc = acc + (16'h0001 << (r + c));
    end

    assign result_final = acc;
endmodule