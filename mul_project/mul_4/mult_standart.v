module mult_wallace
(
    input  wire [3:0]     operand_a,
    input  wire [3:0]     operand_b,
    output wire [7:0]     result_a,
    output wire [7:0]     result_b,
    output wire [8:0]     result_final
    
);

    wire                  p_0_0;
    wire                  p_0_1;
    wire                  p_0_2;
    wire                  p_0_3;
    wire                  p_1_0;
    wire                  p_1_1;
    wire                  p_1_2;
    wire                  p_1_3;
    wire                  p_2_0;
    wire                  p_2_1;
    wire                  p_2_2;
    wire                  p_2_3;
    wire                  p_3_0;
    wire                  p_3_1;
    wire                  p_3_2;
    wire                  p_3_3;
    wire                  hadder_w2_0_sout;
    wire                  hadder_w2_0_cout;
    wire                  fadder_w3_0_sout;
    wire                  fadder_w3_0_cout;
    wire                  hadder_w3_0_sout;
    wire                  hadder_w3_0_cout;
    wire                  fadder_w4_0_sout;
    wire                  fadder_w4_0_cout;
    wire                  hadder_w4_0_sout;
    wire                  hadder_w4_0_cout;
    wire                  fadder_w5_0_sout;
    wire                  fadder_w5_0_cout;

    assign p_0_0 = operand_a[0] & operand_b[0];
    assign p_0_1 = operand_a[0] & operand_b[1];
    assign p_0_2 = operand_a[0] & operand_b[2];
    assign p_0_3 = operand_a[0] & operand_b[3];
    assign p_1_0 = operand_a[1] & operand_b[0];
    assign p_1_1 = operand_a[1] & operand_b[1];
    assign p_1_2 = operand_a[1] & operand_b[2];
    assign p_1_3 = operand_a[1] & operand_b[3];
    assign p_2_0 = operand_a[2] & operand_b[0];
    assign p_2_1 = operand_a[2] & operand_b[1];
    assign p_2_2 = operand_a[2] & operand_b[2];
    assign p_2_3 = operand_a[2] & operand_b[3];
    assign p_3_0 = operand_a[3] & operand_b[0];
    assign p_3_1 = operand_a[3] & operand_b[1];
    assign p_3_2 = operand_a[3] & operand_b[2];
    assign p_3_3 = operand_a[3] & operand_b[3];

    half_adder hadder_w2_0(.a(p_0_2), .b(p_1_1), .sout(hadder_w2_0_sout), .cout(hadder_w2_0_cout));
    half_adder hadder_w3_0(.a(p_3_0), .b(hadder_w2_0_cout), .sout(hadder_w3_0_sout), .cout(hadder_w3_0_cout));
    half_adder hadder_w4_0(.a(fadder_w3_0_cout), .b(fadder_w4_0_sout), .sout(hadder_w4_0_sout), .cout(hadder_w4_0_cout));
    full_adder fadder_w3_0(.a(p_2_1), .b(p_1_2), .cin(p_0_3), .sout(fadder_w3_0_sout), .cout(fadder_w3_0_cout));
    full_adder fadder_w4_0(.a(p_3_1), .b(p_2_2), .cin(p_1_3), .sout(fadder_w4_0_sout), .cout(fadder_w4_0_cout));
    full_adder fadder_w5_0(.a(p_3_2), .b(p_2_3), .cin(fadder_w4_0_cout), .sout(fadder_w5_0_sout), .cout(fadder_w5_0_cout));

    assign result_a[0] = p_0_0;
    assign result_a[1] = p_0_1;
    assign result_a[2] = p_2_0;
    assign result_a[3] = fadder_w3_0_sout;
    assign result_a[4] = hadder_w3_0_cout;
    assign result_a[5] = hadder_w4_0_cout;
    assign result_a[6] = p_3_3;
    assign result_a[7] = 1'b0;

    assign result_b[0] = 1'b0;
    assign result_b[1] = p_1_0;
    assign result_b[2] = hadder_w2_0_sout;
    assign result_b[3] = hadder_w3_0_sout;
    assign result_b[4] = hadder_w4_0_sout;
    assign result_b[5] = fadder_w5_0_sout;
    assign result_b[6] = fadder_w5_0_cout;
    assign result_b[7] = 1'b0;

/* PATH LENGTHS:

    p_0_1                           0
    p_1_0                           0
    p_2_0                           0
    hadder_w2_0_sout                1
    fadder_w3_0_sout                1
    hadder_w3_0_sout                2
    hadder_w3_0_cout                2
    hadder_w4_0_sout                2
    hadder_w4_0_cout                2
    fadder_w5_0_sout                2
    p_3_3                           0
    fadder_w5_0_cout                2

*/

/* PATH LENGTHS:

    p_0_1                           0
    p_1_0                           0
    p_2_0                           0
    hadder_w2_0_sout                1
    fadder_w3_0_sout                1
    hadder_w3_0_sout                2
    fadder_w4_1_sout                2
    hadder_w4_0_sout                3
    hadder_w4_0_cout                3
    hadder_w5_0_sout                3
    fadder_w6_3_sout                3
    hadder_w6_0_sout                4
    hadder_w6_0_cout                4
    hadder_w7_0_sout                4
    fadder_w8_5_sout                4
    hadder_w8_0_sout                5
    hadder_w8_0_cout                5
    hadder_w9_0_sout                5
    hadder_w9_0_cout                5
    hadder_w10_0_sout               5
    fadder_w11_7_sout               5
    hadder_w11_0_sout               6
    hadder_w11_0_cout               6
    fadder_w12_7_sout               6
    fadder_w12_7_cout               6
    fadder_w13_6_sout               5
    fadder_w13_6_cout               5
    fadder_w14_5_sout               5
    fadder_w14_5_cout               5
    fadder_w15_4_sout               5
    fadder_w15_4_cout               5
    fadder_w16_3_sout               4
    fadder_w16_3_cout               4
    fadder_w17_2_sout               4
    fadder_w17_2_cout               4
    fadder_w18_1_sout               3
    fadder_w18_1_cout               3
    fadder_w19_0_sout               2
    p_10_10                         0
    fadder_w19_0_cout               2

*/

assign result_final =result_a +result_b ;

endmodule

module full_adder(
    input  a,
    input  b,
    input  cin,
    output cout,
    output sout
);
    assign {cout, sout} = a + b + cin;
endmodule



module half_adder(
    input  a,
    input  b,
    output cout,
    output sout
);
    assign {cout, sout} = a + b;
endmodule