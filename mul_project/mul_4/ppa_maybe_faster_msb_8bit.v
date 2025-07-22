module mult_wallace
(
    input  wire [7:0]     operand_a,
    input  wire [7:0]     operand_b,
    output wire [16:0]    result_final
    
);

    wire p_0_0;
    wire p_0_1;
    wire p_0_2;
    wire p_0_3;
    wire p_0_4;
    wire p_0_5;
    wire p_0_6;
    wire p_0_7;
    wire p_1_0;
    wire p_1_1;
    wire p_1_2;
    wire p_1_3;
    wire p_1_4;
    wire p_1_5;
    wire p_1_6;
    wire p_1_7;
    wire p_2_0;
    wire p_2_1;
    wire p_2_2;
    wire p_2_3;
    wire p_2_4;
    wire p_2_5;
    wire p_2_6;
    wire p_2_7;
    wire p_3_0;
    wire p_3_1;
    wire p_3_2;
    wire p_3_3;
    wire p_3_4;
    wire p_3_5;
    wire p_3_6;
    wire p_3_7;
    wire p_4_0;
    wire p_4_1;
    wire p_4_2;
    wire p_4_3;
    wire p_4_4;
    wire p_4_5;
    wire p_4_6;
    wire p_4_7;
    wire p_5_0;
    wire p_5_1;
    wire p_5_2;
    wire p_5_3;
    wire p_5_4;
    wire p_5_5;
    wire p_5_6;
    wire p_5_7;
    wire p_6_0;
    wire p_6_1;
    wire p_6_2;
    wire p_6_3;
    wire p_6_4;
    wire p_6_5;
    wire p_6_6;
    wire p_6_7;
    wire p_7_0;
    wire p_7_1;
    wire p_7_2;
    wire p_7_3;
    wire p_7_4;
    wire p_7_5;
    wire p_7_6;
    wire p_7_7;







    wire                  hadder_w1_0_sout;
    wire                  hadder_w1_0_cout;
    wire                  hadder_w2_0_sout;
    wire                  hadder_w2_0_cout;
    wire                  hadder_w3_0_sout;
    wire                  hadder_w3_0_cout;
    wire                  hadder_w4_0_sout;
    wire                  hadder_w4_0_cout;
    wire                  hadder_w5_0_sout;
    wire                  hadder_w5_0_cout;
    wire                  hadder_w6_0_sout;
    wire                  hadder_w6_0_cout;
    wire                  hadder_w7_0_sout;
    wire                  hadder_w7_0_cout;
    wire                  hadder_w8_0_sout;
    wire                  hadder_w8_0_cout;



    wire fadder_w1_0_sout;
    wire fadder_w1_0_cout;
    wire fadder_w2_0_sout;
    wire fadder_w2_0_cout;
    wire fadder_w3_0_sout;
    wire fadder_w3_0_cout;
    wire fadder_w4_0_sout;
    wire fadder_w4_0_cout;
    wire fadder_w5_0_sout;
    wire fadder_w5_0_cout;
    wire fadder_w6_0_sout;
    wire fadder_w6_0_cout;
    wire fadder_w7_0_sout;
    wire fadder_w7_0_cout;
    wire fadder_w8_0_sout;
    wire fadder_w8_0_cout;
    wire fadder_w9_0_sout;
    wire fadder_w9_0_cout;
    wire fadder_w10_0_sout;
    wire fadder_w10_0_cout;
    wire fadder_w11_0_sout;
    wire fadder_w11_0_cout;
    wire fadder_w12_0_sout;
    wire fadder_w12_0_cout;
    wire fadder_w13_0_sout;
    wire fadder_w13_0_cout;
    wire fadder_w14_0_sout;
    wire fadder_w14_0_cout;
    wire fadder_w15_0_sout;
    wire fadder_w15_0_cout;
    wire fadder_w16_0_sout;
    wire fadder_w16_0_cout;
    wire fadder_w17_0_sout;
    wire fadder_w17_0_cout;
    wire fadder_w18_0_sout;
    wire fadder_w18_0_cout;
    wire fadder_w19_0_sout;
    wire fadder_w19_0_cout;
    wire fadder_w20_0_sout;
    wire fadder_w20_0_cout;
    wire fadder_w21_0_sout;
    wire fadder_w21_0_cout;
    wire fadder_w22_0_sout;
    wire fadder_w22_0_cout;
    wire fadder_w23_0_sout;
    wire fadder_w23_0_cout;
    wire fadder_w24_0_sout;
    wire fadder_w24_0_cout;
    wire fadder_w25_0_sout;
    wire fadder_w25_0_cout;
    wire fadder_w26_0_sout;
    wire fadder_w26_0_cout;
    wire fadder_w27_0_sout;
    wire fadder_w27_0_cout;
    wire fadder_w28_0_sout;
    wire fadder_w28_0_cout;
    wire fadder_w29_0_sout;
    wire fadder_w29_0_cout;
    wire fadder_w30_0_sout;
    wire fadder_w30_0_cout;
    wire fadder_w31_0_sout;
    wire fadder_w31_0_cout;
    wire fadder_w32_0_sout;
    wire fadder_w32_0_cout;
    wire fadder_w33_0_sout;
    wire fadder_w33_0_cout;
    wire fadder_w34_0_sout;
    wire fadder_w34_0_cout;
    wire fadder_w35_0_sout;
    wire fadder_w35_0_cout;
    wire fadder_w36_0_sout;
    wire fadder_w36_0_cout;
    wire fadder_w37_0_sout;
    wire fadder_w37_0_cout;
    wire fadder_w38_0_sout;
    wire fadder_w38_0_cout;
    wire fadder_w39_0_sout;
    wire fadder_w39_0_cout;
    wire fadder_w40_0_sout;
    wire fadder_w40_0_cout;
    wire fadder_w41_0_sout;
    wire fadder_w41_0_cout;
    wire fadder_w42_0_sout;
    wire fadder_w42_0_cout;
    wire fadder_w43_0_sout;
    wire fadder_w43_0_cout;
    wire fadder_w44_0_sout;
    wire fadder_w44_0_cout;
    wire fadder_w45_0_sout;
    wire fadder_w45_0_cout;
    wire fadder_w46_0_sout;
    wire fadder_w46_0_cout;
    wire fadder_w47_0_sout;
    wire fadder_w47_0_cout;
    wire fadder_w48_0_sout;
    wire fadder_w48_0_cout;




// Row for operand_a[0]
assign p_0_0 = operand_a[0] & operand_b[0];
assign p_0_1 = operand_a[0] & operand_b[1];
assign p_0_2 = operand_a[0] & operand_b[2];
assign p_0_3 = operand_a[0] & operand_b[3];
assign p_0_4 = operand_a[0] & operand_b[4];
assign p_0_5 = operand_a[0] & operand_b[5];
assign p_0_6 = operand_a[0] & operand_b[6];
assign p_0_7 = operand_a[0] ;

// Row for operand_a[1]
assign p_1_0 = operand_a[1] & operand_b[0];
assign p_1_1 = operand_a[1] & operand_b[1];
assign p_1_2 = operand_a[1] & operand_b[2];
assign p_1_3 = operand_a[1] & operand_b[3];
assign p_1_4 = operand_a[1] & operand_b[4];
assign p_1_5 = operand_a[1] & operand_b[5];
assign p_1_6 = operand_a[1] & operand_b[6];
assign p_1_7 = operand_a[1] ;

// Row for operand_a[2]
assign p_2_0 = operand_a[2] & operand_b[0];
assign p_2_1 = operand_a[2] & operand_b[1];
assign p_2_2 = operand_a[2] & operand_b[2];
assign p_2_3 = operand_a[2] & operand_b[3];
assign p_2_4 = operand_a[2] & operand_b[4];
assign p_2_5 = operand_a[2] & operand_b[5];
assign p_2_6 = operand_a[2] & operand_b[6];
assign p_2_7 = operand_a[2] ;

// Row for operand_a[3]
assign p_3_0 = operand_a[3] & operand_b[0];
assign p_3_1 = operand_a[3] & operand_b[1];
assign p_3_2 = operand_a[3] & operand_b[2];
assign p_3_3 = operand_a[3] & operand_b[3];
assign p_3_4 = operand_a[3] & operand_b[4];
assign p_3_5 = operand_a[3] & operand_b[5];
assign p_3_6 = operand_a[3] & operand_b[6];
assign p_3_7 = operand_a[3] ;

// Row for operand_a[4]
assign p_4_0 = operand_a[4] & operand_b[0];
assign p_4_1 = operand_a[4] & operand_b[1];
assign p_4_2 = operand_a[4] & operand_b[2];
assign p_4_3 = operand_a[4] & operand_b[3];
assign p_4_4 = operand_a[4] & operand_b[4];
assign p_4_5 = operand_a[4] & operand_b[5];
assign p_4_6 = operand_a[4] & operand_b[6];
assign p_4_7 = operand_a[4] ;

// Row for operand_a[5]
assign p_5_0 = operand_a[5] & operand_b[0];
assign p_5_1 = operand_a[5] & operand_b[1];
assign p_5_2 = operand_a[5] & operand_b[2];
assign p_5_3 = operand_a[5] & operand_b[3];
assign p_5_4 = operand_a[5] & operand_b[4];
assign p_5_5 = operand_a[5] & operand_b[5];
assign p_5_6 = operand_a[5] & operand_b[6];
assign p_5_7 = operand_a[5] ;

// Row for operand_a[6]
assign p_6_0 = operand_a[6] & operand_b[0];
assign p_6_1 = operand_a[6] & operand_b[1];
assign p_6_2 = operand_a[6] & operand_b[2];
assign p_6_3 = operand_a[6] & operand_b[3];
assign p_6_4 = operand_a[6] & operand_b[4];
assign p_6_5 = operand_a[6] & operand_b[5];
assign p_6_6 = operand_a[6] & operand_b[6];
assign p_6_7 = operand_a[6] ;

// Row for operand_a[7]
assign p_7_0 = operand_b[0];
assign p_7_1 = operand_b[1];
assign p_7_2 = operand_b[2];
assign p_7_3 = operand_b[3];
assign p_7_4 = operand_b[4];
assign p_7_5 = operand_b[5];
assign p_7_6 = operand_b[6];
assign p_7_7 = 1'b1;







    half_adder hadder_w1_0(.a(p_0_1), .b(p_1_0), .sout(hadder_w1_0_sout), .cout(hadder_w1_0_cout));
    full_adder fadder_w1_0(.a(p_0_2), .b(p_1_1), .cin(p_2_0), .sout(fadder_w1_0_sout), .cout(fadder_w1_0_cout));
    half_adder hadder_w2_0(.a(fadder_w1_0_sout), .b(hadder_w1_0_cout), .sout(hadder_w2_0_sout), .cout(hadder_w2_0_cout));
    full_adder fadder_w2_0(.a(p_0_3), .b(p_1_2), .cin(p_2_1), .sout(fadder_w2_0_sout), .cout(fadder_w2_0_cout));
    full_adder fadder_w3_0(.a(p_3_0), .b(fadder_w2_0_sout), .cin(fadder_w1_0_cout), .sout(fadder_w3_0_sout), .cout(fadder_w3_0_cout));
    half_adder hadder_w3_0(.a(fadder_w3_0_sout), .b(hadder_w2_0_cout), .sout(hadder_w3_0_sout), .cout(hadder_w3_0_cout));
    full_adder fadder_w4_0(.a(p_0_4), .b(p_1_3), .cin(p_2_2), .sout(fadder_w4_0_sout), .cout(fadder_w4_0_cout));
    full_adder fadder_w5_0(.a(p_3_1), .b(p_4_0), .cin(fadder_w4_0_sout), .sout(fadder_w5_0_sout), .cout(fadder_w5_0_cout)); 
    full_adder fadder_w6_0(.a(fadder_w5_0_sout), .b(fadder_w2_0_cout), .cin(fadder_w3_0_cout), .sout(fadder_w6_0_sout), .cout(fadder_w6_0_cout));
    half_adder hadder_w4_0(.a(fadder_w6_0_sout), .b(hadder_w3_0_cout), .sout(hadder_w4_0_sout), .cout(hadder_w4_0_cout));
    full_adder fadder_w7_0(.a(p_0_5), .b(p_1_4), .cin(p_2_3), .sout(fadder_w7_0_sout), .cout(fadder_w7_0_cout));
    full_adder fadder_w8_0(.a(p_3_2), .b(p_4_1), .cin(p_5_0), .sout(fadder_w8_0_sout), .cout(fadder_w8_0_cout));
    full_adder fadder_w9_0(.a(fadder_w7_0_sout), .b(fadder_w8_0_sout), .cin(fadder_w4_0_cout), .sout(fadder_w9_0_sout), .cout(fadder_w9_0_cout));
    full_adder fadder_w10_0(.a(fadder_w9_0_sout), .b(fadder_w5_0_cout), .cin(fadder_w6_0_cout), .sout(fadder_w10_0_sout), .cout(fadder_w10_0_cout));
    half_adder hadder_w5_0(.a(fadder_w10_0_sout), .b(hadder_w4_0_cout), .sout(hadder_w5_0_sout), .cout(hadder_w5_0_cout));
    full_adder fadder_w11_0(.a(p_0_6), .b(p_1_5), .cin(p_2_4), .sout(fadder_w11_0_sout), .cout(fadder_w11_0_cout));
    full_adder fadder_w12_0(.a(p_3_3), .b(p_4_2), .cin(p_5_1), .sout(fadder_w12_0_sout), .cout(fadder_w12_0_cout));
    full_adder fadder_w13_0(.a(p_6_0), .b(fadder_w12_0_sout), .cin(fadder_w11_0_sout), .sout(fadder_w13_0_sout), .cout(fadder_w13_0_cout));
    full_adder fadder_w14_0(.a(fadder_w13_0_sout), .b(fadder_w7_0_cout), .cin(fadder_w8_0_cout), .sout(fadder_w14_0_sout), .cout(fadder_w14_0_cout));
    full_adder fadder_w15_0(.a(fadder_w14_0_sout), .b(fadder_w9_0_cout), .cin(fadder_w10_0_cout), .sout(fadder_w15_0_sout), .cout(fadder_w15_0_cout));
    half_adder hadder_w6_0(.a(fadder_w15_0_sout), .b(hadder_w5_0_cout), .sout(hadder_w6_0_sout), .cout(hadder_w6_0_cout));
    full_adder fadder_w16_0(.a(p_0_7), .b(p_1_6), .cin(p_2_5), .sout(fadder_w16_0_sout), .cout(fadder_w16_0_cout));
    full_adder fadder_w17_0(.a(p_3_4), .b(p_4_3), .cin(p_5_2), .sout(fadder_w17_0_sout), .cout(fadder_w17_0_cout));
    full_adder fadder_w18_0(.a(p_6_1), .b(p_7_0), .cin(fadder_w16_0_sout), .sout(fadder_w18_0_sout), .cout(fadder_w18_0_cout));
    full_adder fadder_w19_0(.a(fadder_w17_0_sout), .b(fadder_w18_0_sout), .cin(fadder_w11_0_cout), .sout(fadder_w19_0_sout), .cout(fadder_w19_0_cout));
    full_adder fadder_w20_0(.a(fadder_w19_0_sout), .b(fadder_w12_0_cout), .cin(fadder_w13_0_cout), .sout(fadder_w20_0_sout), .cout(fadder_w20_0_cout));
    full_adder fadder_w21_0(.a(fadder_w20_0_sout), .b(fadder_w14_0_cout), .cin(fadder_w15_0_cout), .sout(fadder_w21_0_sout), .cout(fadder_w21_0_cout));
    half_adder hadder_w7_0(.a(fadder_w21_0_sout), .b(hadder_w6_0_cout), .sout(hadder_w7_0_sout), .cout(hadder_w7_0_cout));
    full_adder fadder_w22_0(.a(p_1_7), .b(p_2_6), .cin(p_3_5), .sout(fadder_w22_0_sout), .cout(fadder_w22_0_cout));
    full_adder fadder_w23_0(.a(p_4_4), .b(p_5_3), .cin(p_6_2), .sout(fadder_w23_0_sout), .cout(fadder_w23_0_cout));
    full_adder fadder_w24_0(.a(p_7_1), .b(fadder_w22_0_sout), .cin(fadder_w23_0_sout), .sout(fadder_w24_0_sout), .cout(fadder_w24_0_cout));
    full_adder fadder_w25_0(.a(fadder_w24_0_sout), .b(fadder_w16_0_cout), .cin(fadder_w17_0_cout), .sout(fadder_w25_0_sout), .cout(fadder_w25_0_cout));
    full_adder fadder_w26_0(.a(fadder_w25_0_sout), .b(fadder_w18_0_cout), .cin(fadder_w19_0_cout), .sout(fadder_w26_0_sout), .cout(fadder_w26_0_cout));
    full_adder fadder_w27_0(.a(fadder_w26_0_sout), .b(fadder_w20_0_cout), .cin(fadder_w21_0_cout), .sout(fadder_w27_0_sout), .cout(fadder_w27_0_cout));
    half_adder hadder_w8_0(.a(fadder_w27_0_sout), .b(hadder_w7_0_cout), .sout(hadder_w8_0_sout), .cout(hadder_w8_0_cout));
    full_adder fadder_w28_0(.a(p_2_7), .b(p_3_6), .cin(p_4_5), .sout(fadder_w28_0_sout), .cout(fadder_w28_0_cout));
    full_adder fadder_w29_0(.a(p_5_4), .b(p_6_3), .cin(p_7_2), .sout(fadder_w29_0_sout), .cout(fadder_w29_0_cout));
    full_adder fadder_w30_0(.a(fadder_w28_0_sout), .b(fadder_w29_0_sout), .cin(fadder_w22_0_cout), .sout(fadder_w30_0_sout), .cout(fadder_w30_0_cout));
    full_adder fadder_w31_0(.a(fadder_w30_0_sout), .b(fadder_w23_0_cout), .cin(fadder_w24_0_cout), .sout(fadder_w31_0_sout), .cout(fadder_w31_0_cout));
    full_adder fadder_w32_0(.a(fadder_w31_0_sout), .b(fadder_w25_0_cout), .cin(fadder_w26_0_cout), .sout(fadder_w32_0_sout), .cout(fadder_w32_0_cout));
    full_adder fadder_w33_0(.a(fadder_w32_0_sout), .b(fadder_w27_0_cout), .cin(hadder_w8_0_cout), .sout(fadder_w33_0_sout), .cout(fadder_w33_0_cout));
    full_adder fadder_w34_0(.a(p_3_7), .b(p_4_6), .cin(p_5_5), .sout(fadder_w34_0_sout), .cout(fadder_w34_0_cout));
    full_adder fadder_w35_0(.a(p_6_4), .b(p_7_3), .cin(fadder_w34_0_sout), .sout(fadder_w35_0_sout), .cout(fadder_w35_0_cout));
    full_adder fadder_w36_0(.a(fadder_w35_0_sout), .b(fadder_w28_0_cout), .cin(fadder_w29_0_cout), .sout(fadder_w36_0_sout), .cout(fadder_w36_0_cout));
    full_adder fadder_w37_0(.a(fadder_w36_0_sout), .b(fadder_w30_0_cout), .cin(fadder_w31_0_cout), .sout(fadder_w37_0_sout), .cout(fadder_w37_0_cout));
    full_adder fadder_w38_0(.a(fadder_w37_0_sout), .b(fadder_w32_0_cout), .cin(fadder_w33_0_cout), .sout(fadder_w38_0_sout), .cout(fadder_w38_0_cout));
    full_adder fadder_w39_0(.a(p_4_7), .b(p_5_6), .cin(p_6_5), .sout(fadder_w39_0_sout), .cout(fadder_w39_0_cout));
    full_adder fadder_w40_0(.a(p_7_4), .b(fadder_w39_0_sout), .cin(fadder_w34_0_cout), .sout(fadder_w40_0_sout), .cout(fadder_w40_0_cout));
    full_adder fadder_w41_0(.a(fadder_w40_0_sout), .b(fadder_w35_0_cout), .cin(fadder_w36_0_cout), .sout(fadder_w41_0_sout), .cout(fadder_w41_0_cout));
    full_adder fadder_w42_0(.a(fadder_w41_0_sout), .b(fadder_w37_0_cout), .cin(fadder_w38_0_cout), .sout(fadder_w42_0_sout), .cout(fadder_w42_0_cout));
    full_adder fadder_w43_0(.a(p_5_7), .b(p_6_6), .cin(p_7_5), .sout(fadder_w43_0_sout), .cout(fadder_w43_0_cout));
    full_adder fadder_w44_0(.a(fadder_w43_0_sout), .b(fadder_w39_0_cout), .cin(fadder_w40_0_cout), .sout(fadder_w44_0_sout), .cout(fadder_w44_0_cout));
    full_adder fadder_w45_0(.a(fadder_w44_0_sout), .b(fadder_w41_0_cout), .cin(fadder_w42_0_cout), .sout(fadder_w45_0_sout), .cout(fadder_w45_0_cout));
    full_adder fadder_w46_0(.a(p_6_7), .b(p_7_6), .cin(fadder_w43_0_cout), .sout(fadder_w46_0_sout), .cout(fadder_w46_0_cout));
    full_adder fadder_w47_0(.a(fadder_w46_0_sout), .b(fadder_w44_0_cout), .cin(fadder_w45_0_cout), .sout(fadder_w47_0_sout), .cout(fadder_w47_0_cout));
    full_adder fadder_w48_0(.a(p_7_7), .b(fadder_w46_0_cout), .cin(fadder_w47_0_cout), .sout(fadder_w48_0_sout), .cout(fadder_w48_0_cout));





    
    assign result_final[0] = p_0_0;

    assign result_final[1] = hadder_w1_0_sout;

    assign result_final[2] = hadder_w2_0_sout;

    assign result_final[3] = hadder_w3_0_sout;

    assign result_final[4] = hadder_w4_0_sout;

    assign result_final[5] = hadder_w5_0_sout;

    assign result_final[6] = hadder_w6_0_sout;

    assign result_final[7] = hadder_w7_0_sout;

    assign result_final[8] = hadder_w8_0_sout;



    assign result_final[9] = fadder_w33_0_sout;
    
    assign result_final[10] = fadder_w38_0_sout;

    assign result_final[11] = fadder_w42_0_sout;

    assign result_final[12] = fadder_w45_0_sout;

    assign result_final[13] = fadder_w47_0_sout;

    assign result_final[14] = fadder_w48_0_sout;

    assign result_final[15] = fadder_w48_0_cout;

    assign result_final[16] = 1'b0;
    
    
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













