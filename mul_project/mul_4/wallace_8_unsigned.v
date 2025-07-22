module mult_wallace
(
    input  wire [7:0]     operand_a,
    input  wire [7:0]     operand_b,
    output wire [15:0]    result_a,
    output wire [15:0]    result_b,
    output wire [16:0]     result_final

);

    wire                  p_0_0;
    wire                  p_0_1;
    wire                  p_0_2;
    wire                  p_0_3;
    wire                  p_0_4;
    wire                  p_0_5;
    wire                  p_0_6;
    wire                  p_0_7;
    wire                  p_1_0;
    wire                  p_1_1;
    wire                  p_1_2;
    wire                  p_1_3;
    wire                  p_1_4;
    wire                  p_1_5;
    wire                  p_1_6;
    wire                  p_1_7;
    wire                  p_2_0;
    wire                  p_2_1;
    wire                  p_2_2;
    wire                  p_2_3;
    wire                  p_2_4;
    wire                  p_2_5;
    wire                  p_2_6;
    wire                  p_2_7;
    wire                  p_3_0;
    wire                  p_3_1;
    wire                  p_3_2;
    wire                  p_3_3;
    wire                  p_3_4;
    wire                  p_3_5;
    wire                  p_3_6;
    wire                  p_3_7;
    wire                  p_4_0;
    wire                  p_4_1;
    wire                  p_4_2;
    wire                  p_4_3;
    wire                  p_4_4;
    wire                  p_4_5;
    wire                  p_4_6;
    wire                  p_4_7;
    wire                  p_5_0;
    wire                  p_5_1;
    wire                  p_5_2;
    wire                  p_5_3;
    wire                  p_5_4;
    wire                  p_5_5;
    wire                  p_5_6;
    wire                  p_5_7;
    wire                  p_6_0;
    wire                  p_6_1;
    wire                  p_6_2;
    wire                  p_6_3;
    wire                  p_6_4;
    wire                  p_6_5;
    wire                  p_6_6;
    wire                  p_6_7;
    wire                  p_7_0;
    wire                  p_7_1;
    wire                  p_7_2;
    wire                  p_7_3;
    wire                  p_7_4;
    wire                  p_7_5;
    wire                  p_7_6;
    wire                  p_7_7;
    wire                  hadder_w2_0_sout;
    wire                  hadder_w2_0_cout;
    wire                  fadder_w3_0_sout;
    wire                  fadder_w3_0_cout;
    wire                  hadder_w3_0_sout;
    wire                  hadder_w3_0_cout;
    wire                  fadder_w4_0_sout;
    wire                  fadder_w4_0_cout;
    wire                  fadder_w4_1_sout;
    wire                  fadder_w4_1_cout;
    wire                  hadder_w4_0_sout;
    wire                  hadder_w4_0_cout;
    wire                  fadder_w5_0_sout;
    wire                  fadder_w5_0_cout;
    wire                  fadder_w5_1_sout;
    wire                  fadder_w5_1_cout;
    wire                  fadder_w5_2_sout;
    wire                  fadder_w5_2_cout;
    wire                  hadder_w5_0_sout;
    wire                  hadder_w5_0_cout;
    wire                  fadder_w6_0_sout;
    wire                  fadder_w6_0_cout;
    wire                  fadder_w6_1_sout;
    wire                  fadder_w6_1_cout;
    wire                  fadder_w6_2_sout;
    wire                  fadder_w6_2_cout;
    wire                  fadder_w6_3_sout;
    wire                  fadder_w6_3_cout;
    wire                  hadder_w6_0_sout;
    wire                  hadder_w6_0_cout;
    wire                  fadder_w7_0_sout;
    wire                  fadder_w7_0_cout;
    wire                  fadder_w7_1_sout;
    wire                  fadder_w7_1_cout;
    wire                  fadder_w7_2_sout;
    wire                  fadder_w7_2_cout;
    wire                  fadder_w7_3_sout;
    wire                  fadder_w7_3_cout;
    wire                  fadder_w7_4_sout;
    wire                  fadder_w7_4_cout;
    wire                  hadder_w7_0_sout;
    wire                  hadder_w7_0_cout;
    wire                  fadder_w8_0_sout;
    wire                  fadder_w8_0_cout;
    wire                  fadder_w8_1_sout;
    wire                  fadder_w8_1_cout;
    wire                  fadder_w8_2_sout;
    wire                  fadder_w8_2_cout;
    wire                  fadder_w8_3_sout;
    wire                  fadder_w8_3_cout;
    wire                  fadder_w8_4_sout;
    wire                  fadder_w8_4_cout;
    wire                  hadder_w8_0_sout;
    wire                  hadder_w8_0_cout;
    wire                  fadder_w9_0_sout;
    wire                  fadder_w9_0_cout;
    wire                  fadder_w9_1_sout;
    wire                  fadder_w9_1_cout;
    wire                  fadder_w9_2_sout;
    wire                  fadder_w9_2_cout;
    wire                  fadder_w9_3_sout;
    wire                  fadder_w9_3_cout;
    wire                  fadder_w9_4_sout;
    wire                  fadder_w9_4_cout;
    wire                  fadder_w10_0_sout;
    wire                  fadder_w10_0_cout;
    wire                  fadder_w10_1_sout;
    wire                  fadder_w10_1_cout;
    wire                  fadder_w10_2_sout;
    wire                  fadder_w10_2_cout;
    wire                  fadder_w10_3_sout;
    wire                  fadder_w10_3_cout;
    wire                  fadder_w11_0_sout;
    wire                  fadder_w11_0_cout;
    wire                  fadder_w11_1_sout;
    wire                  fadder_w11_1_cout;
    wire                  fadder_w11_2_sout;
    wire                  fadder_w11_2_cout;
    wire                  fadder_w12_0_sout;
    wire                  fadder_w12_0_cout;
    wire                  fadder_w12_1_sout;
    wire                  fadder_w12_1_cout;
    wire                  fadder_w13_0_sout;
    wire                  fadder_w13_0_cout;

    assign p_0_0 = operand_a[0] & operand_b[0];
    assign p_0_1 = operand_a[0] & operand_b[1];
    assign p_0_2 = operand_a[0] & operand_b[2];
    assign p_0_3 = operand_a[0] & operand_b[3];
    assign p_0_4 = operand_a[0] & operand_b[4];
    assign p_0_5 = operand_a[0] & operand_b[5];
    assign p_0_6 = operand_a[0] & operand_b[6];
    assign p_0_7 = operand_a[0] & operand_b[7];
    assign p_1_0 = operand_a[1] & operand_b[0];
    assign p_1_1 = operand_a[1] & operand_b[1];
    assign p_1_2 = operand_a[1] & operand_b[2];
    assign p_1_3 = operand_a[1] & operand_b[3];
    assign p_1_4 = operand_a[1] & operand_b[4];
    assign p_1_5 = operand_a[1] & operand_b[5];
    assign p_1_6 = operand_a[1] & operand_b[6];
    assign p_1_7 = operand_a[1] & operand_b[7];
    assign p_2_0 = operand_a[2] & operand_b[0];
    assign p_2_1 = operand_a[2] & operand_b[1];
    assign p_2_2 = operand_a[2] & operand_b[2];
    assign p_2_3 = operand_a[2] & operand_b[3];
    assign p_2_4 = operand_a[2] & operand_b[4];
    assign p_2_5 = operand_a[2] & operand_b[5];
    assign p_2_6 = operand_a[2] & operand_b[6];
    assign p_2_7 = operand_a[2] & operand_b[7];
    assign p_3_0 = operand_a[3] & operand_b[0];
    assign p_3_1 = operand_a[3] & operand_b[1];
    assign p_3_2 = operand_a[3] & operand_b[2];
    assign p_3_3 = operand_a[3] & operand_b[3];
    assign p_3_4 = operand_a[3] & operand_b[4];
    assign p_3_5 = operand_a[3] & operand_b[5];
    assign p_3_6 = operand_a[3] & operand_b[6];
    assign p_3_7 = operand_a[3] & operand_b[7];
    assign p_4_0 = operand_a[4] & operand_b[0];
    assign p_4_1 = operand_a[4] & operand_b[1];
    assign p_4_2 = operand_a[4] & operand_b[2];
    assign p_4_3 = operand_a[4] & operand_b[3];
    assign p_4_4 = operand_a[4] & operand_b[4];
    assign p_4_5 = operand_a[4] & operand_b[5];
    assign p_4_6 = operand_a[4] & operand_b[6];
    assign p_4_7 = operand_a[4] & operand_b[7];
    assign p_5_0 = operand_a[5] & operand_b[0];
    assign p_5_1 = operand_a[5] & operand_b[1];
    assign p_5_2 = operand_a[5] & operand_b[2];
    assign p_5_3 = operand_a[5] & operand_b[3];
    assign p_5_4 = operand_a[5] & operand_b[4];
    assign p_5_5 = operand_a[5] & operand_b[5];
    assign p_5_6 = operand_a[5] & operand_b[6];
    assign p_5_7 = operand_a[5] & operand_b[7];
    assign p_6_0 = operand_a[6] & operand_b[0];
    assign p_6_1 = operand_a[6] & operand_b[1];
    assign p_6_2 = operand_a[6] & operand_b[2];
    assign p_6_3 = operand_a[6] & operand_b[3];
    assign p_6_4 = operand_a[6] & operand_b[4];
    assign p_6_5 = operand_a[6] & operand_b[5];
    assign p_6_6 = operand_a[6] & operand_b[6];
    assign p_6_7 = operand_a[6] & operand_b[7];
    assign p_7_0 = operand_a[7] & operand_b[0];
    assign p_7_1 = operand_a[7] & operand_b[1];
    assign p_7_2 = operand_a[7] & operand_b[2];
    assign p_7_3 = operand_a[7] & operand_b[3];
    assign p_7_4 = operand_a[7] & operand_b[4];
    assign p_7_5 = operand_a[7] & operand_b[5];
    assign p_7_6 = operand_a[7] & operand_b[6];
    assign p_7_7 = operand_a[7] & operand_b[7];

    half_adder hadder_w2_0(.a(p_0_2), .b(p_1_1), .sout(hadder_w2_0_sout), .cout(hadder_w2_0_cout));
    half_adder hadder_w3_0(.a(p_3_0), .b(hadder_w2_0_cout), .sout(hadder_w3_0_sout), .cout(hadder_w3_0_cout));
    half_adder hadder_w4_0(.a(fadder_w4_0_sout), .b(hadder_w3_0_cout), .sout(hadder_w4_0_sout), .cout(hadder_w4_0_cout));
    half_adder hadder_w5_0(.a(fadder_w4_1_cout), .b(fadder_w5_2_sout), .sout(hadder_w5_0_sout), .cout(hadder_w5_0_cout));
    half_adder hadder_w6_0(.a(fadder_w6_2_sout), .b(hadder_w5_0_cout), .sout(hadder_w6_0_sout), .cout(hadder_w6_0_cout));
    half_adder hadder_w7_0(.a(fadder_w6_3_cout), .b(fadder_w7_4_sout), .sout(hadder_w7_0_sout), .cout(hadder_w7_0_cout));
    half_adder hadder_w8_0(.a(fadder_w8_3_sout), .b(hadder_w7_0_cout), .sout(hadder_w8_0_sout), .cout(hadder_w8_0_cout));
    full_adder fadder_w3_0(.a(p_2_1), .b(p_1_2), .cin(p_0_3), .sout(fadder_w3_0_sout), .cout(fadder_w3_0_cout));
    full_adder fadder_w4_0(.a(p_2_2), .b(p_1_3), .cin(p_0_4), .sout(fadder_w4_0_sout), .cout(fadder_w4_0_cout));
    full_adder fadder_w4_1(.a(p_4_0), .b(p_3_1), .cin(fadder_w3_0_cout), .sout(fadder_w4_1_sout), .cout(fadder_w4_1_cout));
    full_adder fadder_w5_0(.a(p_2_3), .b(p_1_4), .cin(p_0_5), .sout(fadder_w5_0_sout), .cout(fadder_w5_0_cout));
    full_adder fadder_w5_1(.a(p_5_0), .b(p_4_1), .cin(p_3_2), .sout(fadder_w5_1_sout), .cout(fadder_w5_1_cout));
    full_adder fadder_w5_2(.a(fadder_w5_1_sout), .b(fadder_w5_0_sout), .cin(fadder_w4_0_cout), .sout(fadder_w5_2_sout), .cout(fadder_w5_2_cout));
    full_adder fadder_w6_0(.a(p_2_4), .b(p_1_5), .cin(p_0_6), .sout(fadder_w6_0_sout), .cout(fadder_w6_0_cout));
    full_adder fadder_w6_1(.a(p_5_1), .b(p_4_2), .cin(p_3_3), .sout(fadder_w6_1_sout), .cout(fadder_w6_1_cout));
    full_adder fadder_w6_2(.a(p_6_0), .b(fadder_w5_1_cout), .cin(fadder_w5_0_cout), .sout(fadder_w6_2_sout), .cout(fadder_w6_2_cout));
    full_adder fadder_w6_3(.a(fadder_w6_1_sout), .b(fadder_w6_0_sout), .cin(fadder_w5_2_cout), .sout(fadder_w6_3_sout), .cout(fadder_w6_3_cout));
    full_adder fadder_w7_0(.a(p_2_5), .b(p_1_6), .cin(p_0_7), .sout(fadder_w7_0_sout), .cout(fadder_w7_0_cout));
    full_adder fadder_w7_1(.a(p_5_2), .b(p_4_3), .cin(p_3_4), .sout(fadder_w7_1_sout), .cout(fadder_w7_1_cout));
    full_adder fadder_w7_2(.a(p_7_0), .b(p_6_1), .cin(fadder_w6_0_cout), .sout(fadder_w7_2_sout), .cout(fadder_w7_2_cout));
    full_adder fadder_w7_3(.a(fadder_w7_1_sout), .b(fadder_w7_0_sout), .cin(fadder_w6_1_cout), .sout(fadder_w7_3_sout), .cout(fadder_w7_3_cout));
    full_adder fadder_w7_4(.a(fadder_w7_3_sout), .b(fadder_w7_2_sout), .cin(fadder_w6_2_cout), .sout(fadder_w7_4_sout), .cout(fadder_w7_4_cout));
    full_adder fadder_w8_0(.a(p_3_5), .b(p_2_6), .cin(p_1_7), .sout(fadder_w8_0_sout), .cout(fadder_w8_0_cout));
    full_adder fadder_w8_1(.a(p_6_2), .b(p_5_3), .cin(p_4_4), .sout(fadder_w8_1_sout), .cout(fadder_w8_1_cout));
    full_adder fadder_w8_2(.a(p_7_1), .b(fadder_w7_1_cout), .cin(fadder_w7_0_cout), .sout(fadder_w8_2_sout), .cout(fadder_w8_2_cout));
    full_adder fadder_w8_3(.a(fadder_w8_1_sout), .b(fadder_w8_0_sout), .cin(fadder_w7_2_cout), .sout(fadder_w8_3_sout), .cout(fadder_w8_3_cout));
    full_adder fadder_w8_4(.a(fadder_w8_2_sout), .b(fadder_w7_4_cout), .cin(fadder_w7_3_cout), .sout(fadder_w8_4_sout), .cout(fadder_w8_4_cout));
    full_adder fadder_w9_0(.a(p_4_5), .b(p_3_6), .cin(p_2_7), .sout(fadder_w9_0_sout), .cout(fadder_w9_0_cout));
    full_adder fadder_w9_1(.a(p_7_2), .b(p_6_3), .cin(p_5_4), .sout(fadder_w9_1_sout), .cout(fadder_w9_1_cout));
    full_adder fadder_w9_2(.a(fadder_w9_0_sout), .b(fadder_w8_1_cout), .cin(fadder_w8_0_cout), .sout(fadder_w9_2_sout), .cout(fadder_w9_2_cout));
    full_adder fadder_w9_3(.a(fadder_w9_2_sout), .b(fadder_w9_1_sout), .cin(fadder_w8_2_cout), .sout(fadder_w9_3_sout), .cout(fadder_w9_3_cout));
    full_adder fadder_w9_4(.a(fadder_w9_3_sout), .b(fadder_w8_4_cout), .cin(fadder_w8_3_cout), .sout(fadder_w9_4_sout), .cout(fadder_w9_4_cout));
    full_adder fadder_w10_0(.a(p_5_5), .b(p_4_6), .cin(p_3_7), .sout(fadder_w10_0_sout), .cout(fadder_w10_0_cout));
    full_adder fadder_w10_1(.a(p_7_3), .b(p_6_4), .cin(fadder_w9_0_cout), .sout(fadder_w10_1_sout), .cout(fadder_w10_1_cout));
    full_adder fadder_w10_2(.a(fadder_w10_0_sout), .b(fadder_w9_2_cout), .cin(fadder_w9_1_cout), .sout(fadder_w10_2_sout), .cout(fadder_w10_2_cout));
    full_adder fadder_w10_3(.a(fadder_w10_2_sout), .b(fadder_w10_1_sout), .cin(fadder_w9_3_cout), .sout(fadder_w10_3_sout), .cout(fadder_w10_3_cout));
    full_adder fadder_w11_0(.a(p_6_5), .b(p_5_6), .cin(p_4_7), .sout(fadder_w11_0_sout), .cout(fadder_w11_0_cout));
    full_adder fadder_w11_1(.a(fadder_w11_0_sout), .b(p_7_4), .cin(fadder_w10_0_cout), .sout(fadder_w11_1_sout), .cout(fadder_w11_1_cout));
    full_adder fadder_w11_2(.a(fadder_w11_1_sout), .b(fadder_w10_2_cout), .cin(fadder_w10_1_cout), .sout(fadder_w11_2_sout), .cout(fadder_w11_2_cout));
    full_adder fadder_w12_0(.a(p_7_5), .b(p_6_6), .cin(p_5_7), .sout(fadder_w12_0_sout), .cout(fadder_w12_0_cout));
    full_adder fadder_w12_1(.a(fadder_w12_0_sout), .b(fadder_w11_1_cout), .cin(fadder_w11_0_cout), .sout(fadder_w12_1_sout), .cout(fadder_w12_1_cout));
    full_adder fadder_w13_0(.a(p_7_6), .b(p_6_7), .cin(fadder_w12_0_cout), .sout(fadder_w13_0_sout), .cout(fadder_w13_0_cout));

    assign result_a[0] = p_0_0;
    assign result_a[1] = p_0_1;
    assign result_a[2] = p_2_0;
    assign result_a[3] = fadder_w3_0_sout;
    assign result_a[4] = fadder_w4_1_sout;
    assign result_a[5] = hadder_w4_0_cout;
    assign result_a[6] = fadder_w6_3_sout;
    assign result_a[7] = hadder_w6_0_cout;
    assign result_a[8] = fadder_w8_4_sout;
    assign result_a[9] = hadder_w8_0_cout;
    assign result_a[10] = fadder_w10_3_sout;
    assign result_a[11] = fadder_w10_3_cout;
    assign result_a[12] = fadder_w12_1_sout;
    assign result_a[13] = fadder_w13_0_sout;
    assign result_a[14] = p_7_7;
    assign result_a[15] = 1'b0;

    assign result_b[0] = 1'b0;
    assign result_b[1] = p_1_0;
    assign result_b[2] = hadder_w2_0_sout;
    assign result_b[3] = hadder_w3_0_sout;
    assign result_b[4] = hadder_w4_0_sout;
    assign result_b[5] = hadder_w5_0_sout;
    assign result_b[6] = hadder_w6_0_sout;
    assign result_b[7] = hadder_w7_0_sout;
    assign result_b[8] = hadder_w8_0_sout;
    assign result_b[9] = fadder_w9_4_sout;
    assign result_b[10] = fadder_w9_4_cout;
    assign result_b[11] = fadder_w11_2_sout;
    assign result_b[12] = fadder_w11_2_cout;
    assign result_b[13] = fadder_w12_1_cout;
    assign result_b[14] = fadder_w13_0_cout;
    assign result_b[15] = 1'b0;

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
    fadder_w8_4_sout                4
    hadder_w8_0_sout                5
    hadder_w8_0_cout                5
    fadder_w9_4_sout                5
    fadder_w9_4_cout                5
    fadder_w10_3_sout               4
    fadder_w10_3_cout               4
    fadder_w11_2_sout               4
    fadder_w11_2_cout               4
    fadder_w12_1_sout               3
    fadder_w12_1_cout               3
    fadder_w13_0_sout               2
    p_7_7                           0
    fadder_w13_0_cout               2

*/
    assign result_final = result_a + result_b;

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