module multadd_dadda
(
    input  wire [10:0]    operand_a,
    input  wire [10:0]    operand_b,
    output wire [21:0]    result_a,
    output wire [21:0]    result_b,
    output wire [22:0]     result_final

);

    wire                  p_0_0;
    wire                  p_0_1;
    wire                  p_0_2;
    wire                  p_0_3;
    wire                  p_0_4;
    wire                  p_0_5;
    wire                  p_0_6;
    wire                  p_0_7;
    wire                  p_0_8;
    wire                  p_0_9;
    wire                  p_0_10;
    wire                  p_1_0;
    wire                  p_1_1;
    wire                  p_1_2;
    wire                  p_1_3;
    wire                  p_1_4;
    wire                  p_1_5;
    wire                  p_1_6;
    wire                  p_1_7;
    wire                  p_1_8;
    wire                  p_1_9;
    wire                  p_1_10;
    wire                  p_2_0;
    wire                  p_2_1;
    wire                  p_2_2;
    wire                  p_2_3;
    wire                  p_2_4;
    wire                  p_2_5;
    wire                  p_2_6;
    wire                  p_2_7;
    wire                  p_2_8;
    wire                  p_2_9;
    wire                  p_2_10;
    wire                  p_3_0;
    wire                  p_3_1;
    wire                  p_3_2;
    wire                  p_3_3;
    wire                  p_3_4;
    wire                  p_3_5;
    wire                  p_3_6;
    wire                  p_3_7;
    wire                  p_3_8;
    wire                  p_3_9;
    wire                  p_3_10;
    wire                  p_4_0;
    wire                  p_4_1;
    wire                  p_4_2;
    wire                  p_4_3;
    wire                  p_4_4;
    wire                  p_4_5;
    wire                  p_4_6;
    wire                  p_4_7;
    wire                  p_4_8;
    wire                  p_4_9;
    wire                  p_4_10;
    wire                  p_5_0;
    wire                  p_5_1;
    wire                  p_5_2;
    wire                  p_5_3;
    wire                  p_5_4;
    wire                  p_5_5;
    wire                  p_5_6;
    wire                  p_5_7;
    wire                  p_5_8;
    wire                  p_5_9;
    wire                  p_5_10;
    wire                  p_6_0;
    wire                  p_6_1;
    wire                  p_6_2;
    wire                  p_6_3;
    wire                  p_6_4;
    wire                  p_6_5;
    wire                  p_6_6;
    wire                  p_6_7;
    wire                  p_6_8;
    wire                  p_6_9;
    wire                  p_6_10;
    wire                  p_7_0;
    wire                  p_7_1;
    wire                  p_7_2;
    wire                  p_7_3;
    wire                  p_7_4;
    wire                  p_7_5;
    wire                  p_7_6;
    wire                  p_7_7;
    wire                  p_7_8;
    wire                  p_7_9;
    wire                  p_7_10;
    wire                  p_8_0;
    wire                  p_8_1;
    wire                  p_8_2;
    wire                  p_8_3;
    wire                  p_8_4;
    wire                  p_8_5;
    wire                  p_8_6;
    wire                  p_8_7;
    wire                  p_8_8;
    wire                  p_8_9;
    wire                  p_8_10;
    wire                  p_9_0;
    wire                  p_9_1;
    wire                  p_9_2;
    wire                  p_9_3;
    wire                  p_9_4;
    wire                  p_9_5;
    wire                  p_9_6;
    wire                  p_9_7;
    wire                  p_9_8;
    wire                  p_9_9;
    wire                  p_9_10;
    wire                  p_10_0;
    wire                  p_10_1;
    wire                  p_10_2;
    wire                  p_10_3;
    wire                  p_10_4;
    wire                  p_10_5;
    wire                  p_10_6;
    wire                  p_10_7;
    wire                  p_10_8;
    wire                  p_10_9;
    wire                  p_10_10;
    wire                  fadder_io_st0_col9_0_sout;
    wire                  fadder_io_st0_col9_0_carry;
    wire                  fadder_io_st0_col10_0_sout;
    wire                  fadder_io_st0_col10_0_carry;
    wire                  fadder_io_st0_col10_1_sout;
    wire                  fadder_io_st0_col10_1_carry;
    wire                  fadder_io_st0_col11_0_sout;
    wire                  fadder_io_st0_col11_0_carry;
    wire                  fadder_io_st0_col11_1_sout;
    wire                  fadder_io_st0_col11_1_carry;
    wire                  fadder_io_st0_col12_0_sout;
    wire                  fadder_io_st0_col12_0_carry;
    wire                  fadder_io_st1_col6_0_sout;
    wire                  fadder_io_st1_col6_0_carry;
    wire                  fadder_io_st1_col7_0_sout;
    wire                  fadder_io_st1_col7_0_carry;
    wire                  fadder_io_st1_col7_1_sout;
    wire                  fadder_io_st1_col7_1_carry;
    wire                  fadder_io_st1_col8_0_sout;
    wire                  fadder_io_st1_col8_0_carry;
    wire                  fadder_io_st1_col8_1_sout;
    wire                  fadder_io_st1_col8_1_carry;
    wire                  fadder_io_st1_col8_2_sout;
    wire                  fadder_io_st1_col8_2_carry;
    wire                  fadder_io_st1_col9_0_sout;
    wire                  fadder_io_st1_col9_0_carry;
    wire                  fadder_io_st1_col9_1_sout;
    wire                  fadder_io_st1_col9_1_carry;
    wire                  fadder_io_st0_col9_0_sout_inv;
    wire                  fadder_io_st1_col9_2_sout;
    wire                  fadder_io_st1_col9_2_carry;
    wire                  fadder_io_st1_col10_0_sout;
    wire                  fadder_io_st1_col10_0_carry;
    wire                  fadder_io_st1_col10_1_sout;
    wire                  fadder_io_st1_col10_1_carry;
    wire                  fadder_st1_col10_0_sout;
    wire                  fadder_st1_col10_0_carry;
    wire                  fadder_io_st1_col11_0_sout;
    wire                  fadder_io_st1_col11_0_carry;
    wire                  fadder_io_st0_col10_0_carry_inv;
    wire                  fadder_io_st1_col11_1_sout;
    wire                  fadder_io_st1_col11_1_carry;
    wire                  fadder_st1_col11_0_sout;
    wire                  fadder_st1_col11_0_carry;
    wire                  fadder_io_st1_col12_0_sout;
    wire                  fadder_io_st1_col12_0_carry;
    wire                  fadder_io_st1_col12_1_sout;
    wire                  fadder_io_st1_col12_1_carry;
    wire                  fadder_st1_col12_0_sout;
    wire                  fadder_st1_col12_0_carry;
    wire                  fadder_io_st1_col13_0_sout;
    wire                  fadder_io_st1_col13_0_carry;
    wire                  fadder_io_st1_col13_1_sout;
    wire                  fadder_io_st1_col13_1_carry;
    wire                  fadder_io_st0_col12_0_carry_inv;
    wire                  fadder_io_st1_col13_2_sout;
    wire                  fadder_io_st1_col13_2_carry;
    wire                  fadder_io_st1_col14_0_sout;
    wire                  fadder_io_st1_col14_0_carry;
    wire                  fadder_io_st1_col14_1_sout;
    wire                  fadder_io_st1_col14_1_carry;
    wire                  fadder_io_st1_col15_0_sout;
    wire                  fadder_io_st1_col15_0_carry;
    wire                  fadder_st2_col4_0_sout;
    wire                  fadder_st2_col4_0_carry;
    wire                  fadder_st2_col5_0_sout;
    wire                  fadder_st2_col5_0_carry;
    wire                  fadder_st2_col5_1_sout;
    wire                  fadder_st2_col5_1_carry;
    wire                  fadder_st2_col6_0_sout;
    wire                  fadder_st2_col6_0_carry;
    wire                  fadder_io_st1_col6_0_sout_inv;
    wire                  fadder_st2_col6_1_sout;
    wire                  fadder_st2_col6_1_carry;
    wire                  fadder_st2_col7_0_sout;
    wire                  fadder_st2_col7_0_carry;
    wire                  fadder_io_st2_col7_0_sout;
    wire                  fadder_io_st2_col7_0_carry;
    wire                  p_8_0_inv;
    wire                  fadder_io_st2_col8_0_sout;
    wire                  fadder_io_st2_col8_0_carry;
    wire                  fadder_io_st2_col8_1_sout;
    wire                  fadder_io_st2_col8_1_carry;
    wire                  fadder_io_st2_col9_0_sout;
    wire                  fadder_io_st2_col9_0_carry;
    wire                  fadder_io_st2_col9_1_sout;
    wire                  fadder_io_st2_col9_1_carry;
    wire                  fadder_io_st2_col10_0_sout;
    wire                  fadder_io_st2_col10_0_carry;
    wire                  fadder_io_st2_col10_1_sout;
    wire                  fadder_io_st2_col10_1_carry;
    wire                  fadder_io_st2_col11_0_sout;
    wire                  fadder_io_st2_col11_0_carry;
    wire                  fadder_io_st2_col11_1_sout;
    wire                  fadder_io_st2_col11_1_carry;
    wire                  fadder_io_st2_col12_0_sout;
    wire                  fadder_io_st2_col12_0_carry;
    wire                  fadder_io_st2_col12_1_sout;
    wire                  fadder_io_st2_col12_1_carry;
    wire                  fadder_io_st2_col13_0_sout;
    wire                  fadder_io_st2_col13_0_carry;
    wire                  fadder_io_st2_col13_1_sout;
    wire                  fadder_io_st2_col13_1_carry;
    wire                  p_10_4_inv;
    wire                  fadder_io_st2_col14_0_sout;
    wire                  fadder_io_st2_col14_0_carry;
    wire                  fadder_io_st2_col14_1_sout;
    wire                  fadder_io_st2_col14_1_carry;
    wire                  fadder_st2_col15_0_sout;
    wire                  fadder_st2_col15_0_carry;
    wire                  fadder_io_st2_col15_0_sout;
    wire                  fadder_io_st2_col15_0_carry;
    wire                  fadder_st2_col16_0_sout;
    wire                  fadder_st2_col16_0_carry;
    wire                  fadder_io_st1_col15_0_carry_inv;
    wire                  fadder_st2_col16_1_sout;
    wire                  fadder_st2_col16_1_carry;
    wire                  fadder_st2_col17_0_sout;
    wire                  fadder_st2_col17_0_carry;
    wire                  fadder_st3_col3_0_sout;
    wire                  fadder_st3_col3_0_carry;
    wire                  fadder_st3_col4_0_sout;
    wire                  fadder_st3_col4_0_carry;
    wire                  fadder_st3_col5_0_sout;
    wire                  fadder_st3_col5_0_carry;
    wire                  fadder_st3_col6_0_sout;
    wire                  fadder_st3_col6_0_carry;
    wire                  fadder_st3_col7_0_sout;
    wire                  fadder_st3_col7_0_carry;
    wire                  fadder_st3_col8_0_sout;
    wire                  fadder_st3_col8_0_carry;
    wire                  fadder_st3_col9_0_sout;
    wire                  fadder_st3_col9_0_carry;
    wire                  fadder_st3_col10_0_sout;
    wire                  fadder_st3_col10_0_carry;
    wire                  fadder_st3_col11_0_sout;
    wire                  fadder_st3_col11_0_carry;
    wire                  fadder_st3_col12_0_sout;
    wire                  fadder_st3_col12_0_carry;
    wire                  fadder_st3_col13_0_sout;
    wire                  fadder_st3_col13_0_carry;
    wire                  fadder_st3_col14_0_sout;
    wire                  fadder_st3_col14_0_carry;
    wire                  fadder_st3_col15_0_sout;
    wire                  fadder_st3_col15_0_carry;
    wire                  fadder_st3_col16_0_sout;
    wire                  fadder_st3_col16_0_carry;
    wire                  fadder_st3_col17_0_sout;
    wire                  fadder_st3_col17_0_carry;
    wire                  fadder_st3_col18_0_sout;
    wire                  fadder_st3_col18_0_carry;
    wire                  fadder_io_st4_col2_0_sout;
    wire                  fadder_io_st4_col2_0_carry;
    wire                  fadder_io_st4_col3_0_sout;
    wire                  fadder_io_st4_col3_0_carry;
    wire                  fadder_io_st4_col4_0_sout;
    wire                  fadder_io_st4_col4_0_carry;
    wire                  fadder_io_st4_col5_0_sout;
    wire                  fadder_io_st4_col5_0_carry;
    wire                  fadder_io_st4_col6_0_sout;
    wire                  fadder_io_st4_col6_0_carry;
    wire                  fadder_io_st4_col7_0_sout;
    wire                  fadder_io_st4_col7_0_carry;
    wire                  fadder_io_st4_col8_0_sout;
    wire                  fadder_io_st4_col8_0_carry;
    wire                  fadder_io_st4_col9_0_sout;
    wire                  fadder_io_st4_col9_0_carry;
    wire                  fadder_io_st4_col10_0_sout;
    wire                  fadder_io_st4_col10_0_carry;
    wire                  fadder_io_st4_col11_0_sout;
    wire                  fadder_io_st4_col11_0_carry;
    wire                  fadder_io_st4_col12_0_sout;
    wire                  fadder_io_st4_col12_0_carry;
    wire                  fadder_io_st4_col13_0_sout;
    wire                  fadder_io_st4_col13_0_carry;
    wire                  fadder_io_st4_col14_0_sout;
    wire                  fadder_io_st4_col14_0_carry;
    wire                  fadder_io_st4_col15_0_sout;
    wire                  fadder_io_st4_col15_0_carry;
    wire                  fadder_io_st4_col16_0_sout;
    wire                  fadder_io_st4_col16_0_carry;
    wire                  fadder_io_st4_col17_0_sout;
    wire                  fadder_io_st4_col17_0_carry;
    wire                  fadder_io_st4_col18_0_sout;
    wire                  fadder_io_st4_col18_0_carry;
    wire                  fadder_io_st4_col19_0_sout;
    wire                  fadder_io_st4_col19_0_carry;

    assign fadder_io_st0_col9_0_sout_inv = ~fadder_io_st0_col9_0_sout;
    assign fadder_io_st0_col10_0_carry_inv = ~fadder_io_st0_col10_0_carry;
    assign fadder_io_st0_col12_0_carry_inv = ~fadder_io_st0_col12_0_carry;
    assign fadder_io_st1_col6_0_sout_inv = ~fadder_io_st1_col6_0_sout;
    assign p_8_0_inv = ~p_8_0;
    assign p_10_4_inv = ~p_10_4;
    assign fadder_io_st1_col15_0_carry_inv = ~fadder_io_st1_col15_0_carry;
    assign p_0_0 = ~(operand_a[0] & operand_b[0]);
    assign p_0_1 = ~(operand_a[0] & operand_b[1]);
    assign p_0_2 = ~(operand_a[0] & operand_b[2]);
    assign p_0_3 = ~(operand_a[0] & operand_b[3]);
    assign p_0_4 = ~(operand_a[0] & operand_b[4]);
    assign p_0_5 = ~(operand_a[0] & operand_b[5]);
    assign p_0_6 = ~(operand_a[0] & operand_b[6]);
    assign p_0_7 = ~(operand_a[0] & operand_b[7]);
    assign p_0_8 = ~(operand_a[0] & operand_b[8]);
    assign p_0_9 = ~(operand_a[0] & operand_b[9]);
    assign p_0_10 = ~(operand_a[0] & operand_b[10]);
    assign p_1_0 = ~(operand_a[1] & operand_b[0]);
    assign p_1_1 = ~(operand_a[1] & operand_b[1]);
    assign p_1_2 = ~(operand_a[1] & operand_b[2]);
    assign p_1_3 = ~(operand_a[1] & operand_b[3]);
    assign p_1_4 = ~(operand_a[1] & operand_b[4]);
    assign p_1_5 = ~(operand_a[1] & operand_b[5]);
    assign p_1_6 = ~(operand_a[1] & operand_b[6]);
    assign p_1_7 = ~(operand_a[1] & operand_b[7]);
    assign p_1_8 = ~(operand_a[1] & operand_b[8]);
    assign p_1_9 = ~(operand_a[1] & operand_b[9]);
    assign p_1_10 = ~(operand_a[1] & operand_b[10]);
    assign p_2_0 = ~(operand_a[2] & operand_b[0]);
    assign p_2_1 = ~(operand_a[2] & operand_b[1]);
    assign p_2_2 = ~(operand_a[2] & operand_b[2]);
    assign p_2_3 = ~(operand_a[2] & operand_b[3]);
    assign p_2_4 = ~(operand_a[2] & operand_b[4]);
    assign p_2_5 = ~(operand_a[2] & operand_b[5]);
    assign p_2_6 = ~(operand_a[2] & operand_b[6]);
    assign p_2_7 = ~(operand_a[2] & operand_b[7]);
    assign p_2_8 = ~(operand_a[2] & operand_b[8]);
    assign p_2_9 = ~(operand_a[2] & operand_b[9]);
    assign p_2_10 = ~(operand_a[2] & operand_b[10]);
    assign p_3_0 = ~(operand_a[3] & operand_b[0]);
    assign p_3_1 = ~(operand_a[3] & operand_b[1]);
    assign p_3_2 = ~(operand_a[3] & operand_b[2]);
    assign p_3_3 = ~(operand_a[3] & operand_b[3]);
    assign p_3_4 = ~(operand_a[3] & operand_b[4]);
    assign p_3_5 = ~(operand_a[3] & operand_b[5]);
    assign p_3_6 = ~(operand_a[3] & operand_b[6]);
    assign p_3_7 = ~(operand_a[3] & operand_b[7]);
    assign p_3_8 = ~(operand_a[3] & operand_b[8]);
    assign p_3_9 = ~(operand_a[3] & operand_b[9]);
    assign p_3_10 = ~(operand_a[3] & operand_b[10]);
    assign p_4_0 = ~(operand_a[4] & operand_b[0]);
    assign p_4_1 = ~(operand_a[4] & operand_b[1]);
    assign p_4_2 = ~(operand_a[4] & operand_b[2]);
    assign p_4_3 = ~(operand_a[4] & operand_b[3]);
    assign p_4_4 = ~(operand_a[4] & operand_b[4]);
    assign p_4_5 = ~(operand_a[4] & operand_b[5]);
    assign p_4_6 = ~(operand_a[4] & operand_b[6]);
    assign p_4_7 = ~(operand_a[4] & operand_b[7]);
    assign p_4_8 = ~(operand_a[4] & operand_b[8]);
    assign p_4_9 = ~(operand_a[4] & operand_b[9]);
    assign p_4_10 = ~(operand_a[4] & operand_b[10]);
    assign p_5_0 = ~(operand_a[5] & operand_b[0]);
    assign p_5_1 = ~(operand_a[5] & operand_b[1]);
    assign p_5_2 = ~(operand_a[5] & operand_b[2]);
    assign p_5_3 = ~(operand_a[5] & operand_b[3]);
    assign p_5_4 = ~(operand_a[5] & operand_b[4]);
    assign p_5_5 = ~(operand_a[5] & operand_b[5]);
    assign p_5_6 = ~(operand_a[5] & operand_b[6]);
    assign p_5_7 = ~(operand_a[5] & operand_b[7]);
    assign p_5_8 = ~(operand_a[5] & operand_b[8]);
    assign p_5_9 = ~(operand_a[5] & operand_b[9]);
    assign p_5_10 = ~(operand_a[5] & operand_b[10]);
    assign p_6_0 = ~(operand_a[6] & operand_b[0]);
    assign p_6_1 = ~(operand_a[6] & operand_b[1]);
    assign p_6_2 = ~(operand_a[6] & operand_b[2]);
    assign p_6_3 = ~(operand_a[6] & operand_b[3]);
    assign p_6_4 = ~(operand_a[6] & operand_b[4]);
    assign p_6_5 = ~(operand_a[6] & operand_b[5]);
    assign p_6_6 = ~(operand_a[6] & operand_b[6]);
    assign p_6_7 = ~(operand_a[6] & operand_b[7]);
    assign p_6_8 = ~(operand_a[6] & operand_b[8]);
    assign p_6_9 = ~(operand_a[6] & operand_b[9]);
    assign p_6_10 = ~(operand_a[6] & operand_b[10]);
    assign p_7_0 = ~(operand_a[7] & operand_b[0]);
    assign p_7_1 = ~(operand_a[7] & operand_b[1]);
    assign p_7_2 = ~(operand_a[7] & operand_b[2]);
    assign p_7_3 = ~(operand_a[7] & operand_b[3]);
    assign p_7_4 = ~(operand_a[7] & operand_b[4]);
    assign p_7_5 = ~(operand_a[7] & operand_b[5]);
    assign p_7_6 = ~(operand_a[7] & operand_b[6]);
    assign p_7_7 = ~(operand_a[7] & operand_b[7]);
    assign p_7_8 = ~(operand_a[7] & operand_b[8]);
    assign p_7_9 = ~(operand_a[7] & operand_b[9]);
    assign p_7_10 = ~(operand_a[7] & operand_b[10]);
    assign p_8_0 = ~(operand_a[8] & operand_b[0]);
    assign p_8_1 = ~(operand_a[8] & operand_b[1]);
    assign p_8_2 = ~(operand_a[8] & operand_b[2]);
    assign p_8_3 = ~(operand_a[8] & operand_b[3]);
    assign p_8_4 = ~(operand_a[8] & operand_b[4]);
    assign p_8_5 = ~(operand_a[8] & operand_b[5]);
    assign p_8_6 = ~(operand_a[8] & operand_b[6]);
    assign p_8_7 = ~(operand_a[8] & operand_b[7]);
    assign p_8_8 = ~(operand_a[8] & operand_b[8]);
    assign p_8_9 = ~(operand_a[8] & operand_b[9]);
    assign p_8_10 = ~(operand_a[8] & operand_b[10]);
    assign p_9_0 = ~(operand_a[9] & operand_b[0]);
    assign p_9_1 = ~(operand_a[9] & operand_b[1]);
    assign p_9_2 = ~(operand_a[9] & operand_b[2]);
    assign p_9_3 = ~(operand_a[9] & operand_b[3]);
    assign p_9_4 = ~(operand_a[9] & operand_b[4]);
    assign p_9_5 = ~(operand_a[9] & operand_b[5]);
    assign p_9_6 = ~(operand_a[9] & operand_b[6]);
    assign p_9_7 = ~(operand_a[9] & operand_b[7]);
    assign p_9_8 = ~(operand_a[9] & operand_b[8]);
    assign p_9_9 = ~(operand_a[9] & operand_b[9]);
    assign p_9_10 = ~(operand_a[9] & operand_b[10]);
    assign p_10_0 = ~(operand_a[10] & operand_b[0]);
    assign p_10_1 = ~(operand_a[10] & operand_b[1]);
    assign p_10_2 = ~(operand_a[10] & operand_b[2]);
    assign p_10_3 = ~(operand_a[10] & operand_b[3]);
    assign p_10_4 = ~(operand_a[10] & operand_b[4]);
    assign p_10_5 = ~(operand_a[10] & operand_b[5]);
    assign p_10_6 = ~(operand_a[10] & operand_b[6]);
    assign p_10_7 = ~(operand_a[10] & operand_b[7]);
    assign p_10_8 = ~(operand_a[10] & operand_b[8]);
    assign p_10_9 = ~(operand_a[10] & operand_b[9]);
    assign p_10_10 = ~(operand_a[10] & operand_b[10]);

    full_adder fadder_st1_col10_0(.a(fadder_io_st0_col9_0_carry), .b(fadder_io_st0_col10_0_sout), .cin(fadder_io_st0_col10_1_sout), .sout(fadder_st1_col10_0_sout), .cout(fadder_st1_col10_0_carry));
    full_adder fadder_st1_col11_0(.a(fadder_io_st0_col10_1_carry), .b(fadder_io_st0_col11_0_sout), .cin(fadder_io_st0_col11_1_sout), .sout(fadder_st1_col11_0_sout), .cout(fadder_st1_col11_0_carry));
    full_adder fadder_st1_col12_0(.a(fadder_io_st0_col11_0_carry), .b(fadder_io_st0_col11_1_carry), .cin(fadder_io_st0_col12_0_sout), .sout(fadder_st1_col12_0_sout), .cout(fadder_st1_col12_0_carry));
    full_adder fadder_st2_col4_0(.a(p_0_4), .b(p_1_3), .cin(1'b1), .sout(fadder_st2_col4_0_sout), .cout(fadder_st2_col4_0_carry));
    full_adder fadder_st2_col5_0(.a(p_0_5), .b(p_1_4), .cin(p_2_3), .sout(fadder_st2_col5_0_sout), .cout(fadder_st2_col5_0_carry));
    full_adder fadder_st2_col5_1(.a(p_3_2), .b(p_4_1), .cin(1'b1), .sout(fadder_st2_col5_1_sout), .cout(fadder_st2_col5_1_carry));
    full_adder fadder_st2_col6_0(.a(p_2_4), .b(p_3_3), .cin(p_4_2), .sout(fadder_st2_col6_0_sout), .cout(fadder_st2_col6_0_carry));
    full_adder fadder_st2_col6_1(.a(p_5_1), .b(p_6_0), .cin(fadder_io_st1_col6_0_sout_inv), .sout(fadder_st2_col6_1_sout), .cout(fadder_st2_col6_1_carry));
    full_adder fadder_st2_col7_0(.a(p_5_2), .b(p_6_1), .cin(p_7_0), .sout(fadder_st2_col7_0_sout), .cout(fadder_st2_col7_0_carry));
    full_adder fadder_st2_col15_0(.a(p_8_7), .b(p_9_6), .cin(p_10_5), .sout(fadder_st2_col15_0_sout), .cout(fadder_st2_col15_0_carry));
    full_adder fadder_st2_col16_0(.a(p_6_10), .b(p_7_9), .cin(p_8_8), .sout(fadder_st2_col16_0_sout), .cout(fadder_st2_col16_0_carry));
    full_adder fadder_st2_col16_1(.a(p_9_7), .b(p_10_6), .cin(fadder_io_st1_col15_0_carry_inv), .sout(fadder_st2_col16_1_sout), .cout(fadder_st2_col16_1_carry));
    full_adder fadder_st2_col17_0(.a(p_7_10), .b(p_8_9), .cin(p_9_8), .sout(fadder_st2_col17_0_sout), .cout(fadder_st2_col17_0_carry));
    full_adder fadder_st3_col3_0(.a(p_0_3), .b(p_1_2), .cin(1'b1), .sout(fadder_st3_col3_0_sout), .cout(fadder_st3_col3_0_carry));
    full_adder fadder_st3_col4_0(.a(p_2_2), .b(p_3_1), .cin(p_4_0), .sout(fadder_st3_col4_0_sout), .cout(fadder_st3_col4_0_carry));
    full_adder fadder_st3_col5_0(.a(p_5_0), .b(fadder_st2_col4_0_carry), .cin(fadder_st2_col5_0_sout), .sout(fadder_st3_col5_0_sout), .cout(fadder_st3_col5_0_carry));
    full_adder fadder_st3_col6_0(.a(fadder_st2_col5_0_carry), .b(fadder_st2_col5_1_carry), .cin(fadder_st2_col6_0_sout), .sout(fadder_st3_col6_0_sout), .cout(fadder_st3_col6_0_carry));
    full_adder fadder_st3_col7_0(.a(fadder_st2_col6_0_carry), .b(fadder_st2_col7_0_sout), .cin(fadder_io_st2_col7_0_sout), .sout(fadder_st3_col7_0_sout), .cout(fadder_st3_col7_0_carry));
    full_adder fadder_st3_col8_0(.a(fadder_st2_col7_0_carry), .b(fadder_io_st2_col7_0_carry), .cin(fadder_io_st2_col8_0_sout), .sout(fadder_st3_col8_0_sout), .cout(fadder_st3_col8_0_carry));
    full_adder fadder_st3_col9_0(.a(fadder_io_st2_col8_0_carry), .b(fadder_io_st2_col8_1_carry), .cin(fadder_io_st2_col9_0_sout), .sout(fadder_st3_col9_0_sout), .cout(fadder_st3_col9_0_carry));
    full_adder fadder_st3_col10_0(.a(fadder_io_st2_col9_0_carry), .b(fadder_io_st2_col10_0_sout), .cin(fadder_io_st2_col9_1_carry), .sout(fadder_st3_col10_0_sout), .cout(fadder_st3_col10_0_carry));
    full_adder fadder_st3_col11_0(.a(fadder_io_st2_col10_0_carry), .b(fadder_io_st2_col11_0_sout), .cin(fadder_io_st2_col10_1_carry), .sout(fadder_st3_col11_0_sout), .cout(fadder_st3_col11_0_carry));
    full_adder fadder_st3_col12_0(.a(fadder_io_st2_col11_0_carry), .b(fadder_io_st2_col12_0_sout), .cin(fadder_io_st2_col11_1_carry), .sout(fadder_st3_col12_0_sout), .cout(fadder_st3_col12_0_carry));
    full_adder fadder_st3_col13_0(.a(fadder_io_st2_col12_0_carry), .b(fadder_io_st2_col13_0_sout), .cin(fadder_io_st2_col12_1_carry), .sout(fadder_st3_col13_0_sout), .cout(fadder_st3_col13_0_carry));
    full_adder fadder_st3_col14_0(.a(fadder_io_st2_col13_0_carry), .b(fadder_io_st2_col14_0_sout), .cin(fadder_io_st2_col13_1_carry), .sout(fadder_st3_col14_0_sout), .cout(fadder_st3_col14_0_carry));
    full_adder fadder_st3_col15_0(.a(fadder_st2_col15_0_sout), .b(fadder_io_st2_col14_0_carry), .cin(fadder_io_st2_col15_0_sout), .sout(fadder_st3_col15_0_sout), .cout(fadder_st3_col15_0_carry));
    full_adder fadder_st3_col16_0(.a(fadder_st2_col15_0_carry), .b(fadder_st2_col16_0_sout), .cin(fadder_io_st2_col15_0_carry), .sout(fadder_st3_col16_0_sout), .cout(fadder_st3_col16_0_carry));
    full_adder fadder_st3_col17_0(.a(p_10_7), .b(fadder_st2_col16_0_carry), .cin(fadder_st2_col17_0_sout), .sout(fadder_st3_col17_0_sout), .cout(fadder_st3_col17_0_carry));
    full_adder fadder_st3_col18_0(.a(p_8_10), .b(p_9_9), .cin(p_10_8), .sout(fadder_st3_col18_0_sout), .cout(fadder_st3_col18_0_carry));
    full_adder_io fadder_io_st0_col9_0(.a(p_0_9), .b(p_1_8), .cin(1'b1), .sout(fadder_io_st0_col9_0_sout), .cout(fadder_io_st0_col9_0_carry));
    full_adder_io fadder_io_st0_col10_0(.a(p_0_10), .b(p_1_9), .cin(p_2_8), .sout(fadder_io_st0_col10_0_sout), .cout(fadder_io_st0_col10_0_carry));
    full_adder_io fadder_io_st0_col10_1(.a(p_3_7), .b(p_4_6), .cin(1'b1), .sout(fadder_io_st0_col10_1_sout), .cout(fadder_io_st0_col10_1_carry));
    full_adder_io fadder_io_st0_col11_0(.a(p_1_10), .b(p_2_9), .cin(p_3_8), .sout(fadder_io_st0_col11_0_sout), .cout(fadder_io_st0_col11_0_carry));
    full_adder_io fadder_io_st0_col11_1(.a(p_4_7), .b(p_5_6), .cin(1'b1), .sout(fadder_io_st0_col11_1_sout), .cout(fadder_io_st0_col11_1_carry));
    full_adder_io fadder_io_st0_col12_0(.a(p_2_10), .b(p_3_9), .cin(p_4_8), .sout(fadder_io_st0_col12_0_sout), .cout(fadder_io_st0_col12_0_carry));
    full_adder_io fadder_io_st1_col6_0(.a(p_0_6), .b(p_1_5), .cin(1'b1), .sout(fadder_io_st1_col6_0_sout), .cout(fadder_io_st1_col6_0_carry));
    full_adder_io fadder_io_st1_col7_0(.a(p_0_7), .b(p_1_6), .cin(p_2_5), .sout(fadder_io_st1_col7_0_sout), .cout(fadder_io_st1_col7_0_carry));
    full_adder_io fadder_io_st1_col7_1(.a(p_3_4), .b(p_4_3), .cin(1'b1), .sout(fadder_io_st1_col7_1_sout), .cout(fadder_io_st1_col7_1_carry));
    full_adder_io fadder_io_st1_col8_0(.a(p_0_8), .b(p_1_7), .cin(p_2_6), .sout(fadder_io_st1_col8_0_sout), .cout(fadder_io_st1_col8_0_carry));
    full_adder_io fadder_io_st1_col8_1(.a(p_3_5), .b(p_4_4), .cin(p_5_3), .sout(fadder_io_st1_col8_1_sout), .cout(fadder_io_st1_col8_1_carry));
    full_adder_io fadder_io_st1_col8_2(.a(p_6_2), .b(p_7_1), .cin(1'b1), .sout(fadder_io_st1_col8_2_sout), .cout(fadder_io_st1_col8_2_carry));
    full_adder_io fadder_io_st1_col9_0(.a(p_2_7), .b(p_3_6), .cin(p_4_5), .sout(fadder_io_st1_col9_0_sout), .cout(fadder_io_st1_col9_0_carry));
    full_adder_io fadder_io_st1_col9_1(.a(p_5_4), .b(p_6_3), .cin(p_7_2), .sout(fadder_io_st1_col9_1_sout), .cout(fadder_io_st1_col9_1_carry));
    full_adder_io fadder_io_st1_col9_2(.a(p_8_1), .b(p_9_0), .cin(fadder_io_st0_col9_0_sout_inv), .sout(fadder_io_st1_col9_2_sout), .cout(fadder_io_st1_col9_2_carry));
    full_adder_io fadder_io_st1_col10_0(.a(p_5_5), .b(p_6_4), .cin(p_7_3), .sout(fadder_io_st1_col10_0_sout), .cout(fadder_io_st1_col10_0_carry));
    full_adder_io fadder_io_st1_col10_1(.a(p_8_2), .b(p_9_1), .cin(p_10_0), .sout(fadder_io_st1_col10_1_sout), .cout(fadder_io_st1_col10_1_carry));
    full_adder_io fadder_io_st1_col11_0(.a(p_6_5), .b(p_7_4), .cin(p_8_3), .sout(fadder_io_st1_col11_0_sout), .cout(fadder_io_st1_col11_0_carry));
    full_adder_io fadder_io_st1_col11_1(.a(p_9_2), .b(p_10_1), .cin(fadder_io_st0_col10_0_carry_inv), .sout(fadder_io_st1_col11_1_sout), .cout(fadder_io_st1_col11_1_carry));
    full_adder_io fadder_io_st1_col12_0(.a(p_5_7), .b(p_6_6), .cin(p_7_5), .sout(fadder_io_st1_col12_0_sout), .cout(fadder_io_st1_col12_0_carry));
    full_adder_io fadder_io_st1_col12_1(.a(p_8_4), .b(p_9_3), .cin(p_10_2), .sout(fadder_io_st1_col12_1_sout), .cout(fadder_io_st1_col12_1_carry));
    full_adder_io fadder_io_st1_col13_0(.a(p_3_10), .b(p_4_9), .cin(p_5_8), .sout(fadder_io_st1_col13_0_sout), .cout(fadder_io_st1_col13_0_carry));
    full_adder_io fadder_io_st1_col13_1(.a(p_6_7), .b(p_7_6), .cin(p_8_5), .sout(fadder_io_st1_col13_1_sout), .cout(fadder_io_st1_col13_1_carry));
    full_adder_io fadder_io_st1_col13_2(.a(p_9_4), .b(p_10_3), .cin(fadder_io_st0_col12_0_carry_inv), .sout(fadder_io_st1_col13_2_sout), .cout(fadder_io_st1_col13_2_carry));
    full_adder_io fadder_io_st1_col14_0(.a(p_4_10), .b(p_5_9), .cin(p_6_8), .sout(fadder_io_st1_col14_0_sout), .cout(fadder_io_st1_col14_0_carry));
    full_adder_io fadder_io_st1_col14_1(.a(p_7_7), .b(p_8_6), .cin(p_9_5), .sout(fadder_io_st1_col14_1_sout), .cout(fadder_io_st1_col14_1_carry));
    full_adder_io fadder_io_st1_col15_0(.a(p_5_10), .b(p_6_9), .cin(p_7_8), .sout(fadder_io_st1_col15_0_sout), .cout(fadder_io_st1_col15_0_carry));
    full_adder_io fadder_io_st2_col7_0(.a(fadder_io_st1_col6_0_carry), .b(fadder_io_st1_col7_0_sout), .cin(fadder_io_st1_col7_1_sout), .sout(fadder_io_st2_col7_0_sout), .cout(fadder_io_st2_col7_0_carry));
    full_adder_io fadder_io_st2_col8_0(.a(p_8_0_inv), .b(fadder_io_st1_col7_0_carry), .cin(fadder_io_st1_col7_1_carry), .sout(fadder_io_st2_col8_0_sout), .cout(fadder_io_st2_col8_0_carry));
    full_adder_io fadder_io_st2_col8_1(.a(fadder_io_st1_col8_0_sout), .b(fadder_io_st1_col8_1_sout), .cin(fadder_io_st1_col8_2_sout), .sout(fadder_io_st2_col8_1_sout), .cout(fadder_io_st2_col8_1_carry));
    full_adder_io fadder_io_st2_col9_0(.a(fadder_io_st1_col8_0_carry), .b(fadder_io_st1_col8_1_carry), .cin(fadder_io_st1_col8_2_carry), .sout(fadder_io_st2_col9_0_sout), .cout(fadder_io_st2_col9_0_carry));
    full_adder_io fadder_io_st2_col9_1(.a(fadder_io_st1_col9_0_sout), .b(fadder_io_st1_col9_1_sout), .cin(fadder_io_st1_col9_2_sout), .sout(fadder_io_st2_col9_1_sout), .cout(fadder_io_st2_col9_1_carry));
    full_adder_io fadder_io_st2_col10_0(.a(fadder_io_st1_col9_0_carry), .b(fadder_io_st1_col9_1_carry), .cin(fadder_io_st1_col10_0_sout), .sout(fadder_io_st2_col10_0_sout), .cout(fadder_io_st2_col10_0_carry));
    full_adder_io fadder_io_st2_col10_1(.a(fadder_io_st1_col10_1_sout), .b(fadder_st1_col10_0_sout), .cin(fadder_io_st1_col9_2_carry), .sout(fadder_io_st2_col10_1_sout), .cout(fadder_io_st2_col10_1_carry));
    full_adder_io fadder_io_st2_col11_0(.a(fadder_io_st1_col10_0_carry), .b(fadder_io_st1_col10_1_carry), .cin(fadder_io_st1_col11_0_sout), .sout(fadder_io_st2_col11_0_sout), .cout(fadder_io_st2_col11_0_carry));
    full_adder_io fadder_io_st2_col11_1(.a(fadder_st1_col10_0_carry), .b(fadder_st1_col11_0_sout), .cin(fadder_io_st1_col11_1_sout), .sout(fadder_io_st2_col11_1_sout), .cout(fadder_io_st2_col11_1_carry));
    full_adder_io fadder_io_st2_col12_0(.a(fadder_io_st1_col11_0_carry), .b(fadder_io_st1_col12_0_sout), .cin(fadder_io_st1_col12_1_sout), .sout(fadder_io_st2_col12_0_sout), .cout(fadder_io_st2_col12_0_carry));
    full_adder_io fadder_io_st2_col12_1(.a(fadder_st1_col11_0_carry), .b(fadder_st1_col12_0_sout), .cin(fadder_io_st1_col11_1_carry), .sout(fadder_io_st2_col12_1_sout), .cout(fadder_io_st2_col12_1_carry));
    full_adder_io fadder_io_st2_col13_0(.a(fadder_io_st1_col12_0_carry), .b(fadder_io_st1_col12_1_carry), .cin(fadder_io_st1_col13_0_sout), .sout(fadder_io_st2_col13_0_sout), .cout(fadder_io_st2_col13_0_carry));
    full_adder_io fadder_io_st2_col13_1(.a(fadder_io_st1_col13_1_sout), .b(fadder_st1_col12_0_carry), .cin(fadder_io_st1_col13_2_sout), .sout(fadder_io_st2_col13_1_sout), .cout(fadder_io_st2_col13_1_carry));
    full_adder_io fadder_io_st2_col14_0(.a(p_10_4_inv), .b(fadder_io_st1_col13_0_carry), .cin(fadder_io_st1_col13_1_carry), .sout(fadder_io_st2_col14_0_sout), .cout(fadder_io_st2_col14_0_carry));
    full_adder_io fadder_io_st2_col14_1(.a(fadder_io_st1_col14_0_sout), .b(fadder_io_st1_col14_1_sout), .cin(fadder_io_st1_col13_2_carry), .sout(fadder_io_st2_col14_1_sout), .cout(fadder_io_st2_col14_1_carry));
    full_adder_io fadder_io_st2_col15_0(.a(fadder_io_st1_col14_0_carry), .b(fadder_io_st1_col14_1_carry), .cin(fadder_io_st1_col15_0_sout), .sout(fadder_io_st2_col15_0_sout), .cout(fadder_io_st2_col15_0_carry));
    full_adder_io fadder_io_st4_col2_0(.a(p_0_2), .b(p_1_1), .cin(1'b1), .sout(fadder_io_st4_col2_0_sout), .cout(fadder_io_st4_col2_0_carry));
    full_adder_io fadder_io_st4_col3_0(.a(p_2_1), .b(p_3_0), .cin(fadder_st3_col3_0_sout), .sout(fadder_io_st4_col3_0_sout), .cout(fadder_io_st4_col3_0_carry));
    full_adder_io fadder_io_st4_col4_0(.a(fadder_st3_col3_0_carry), .b(fadder_st3_col4_0_sout), .cin(fadder_st2_col4_0_sout), .sout(fadder_io_st4_col4_0_sout), .cout(fadder_io_st4_col4_0_carry));
    full_adder_io fadder_io_st4_col5_0(.a(fadder_st3_col4_0_carry), .b(fadder_st2_col5_1_sout), .cin(fadder_st3_col5_0_sout), .sout(fadder_io_st4_col5_0_sout), .cout(fadder_io_st4_col5_0_carry));
    full_adder_io fadder_io_st4_col6_0(.a(fadder_st3_col5_0_carry), .b(fadder_st3_col6_0_sout), .cin(fadder_st2_col6_1_sout), .sout(fadder_io_st4_col6_0_sout), .cout(fadder_io_st4_col6_0_carry));
    full_adder_io fadder_io_st4_col7_0(.a(fadder_st3_col6_0_carry), .b(fadder_st3_col7_0_sout), .cin(fadder_st2_col6_1_carry), .sout(fadder_io_st4_col7_0_sout), .cout(fadder_io_st4_col7_0_carry));
    full_adder_io fadder_io_st4_col8_0(.a(fadder_io_st2_col8_1_sout), .b(fadder_st3_col7_0_carry), .cin(fadder_st3_col8_0_sout), .sout(fadder_io_st4_col8_0_sout), .cout(fadder_io_st4_col8_0_carry));
    full_adder_io fadder_io_st4_col9_0(.a(fadder_st3_col8_0_carry), .b(fadder_st3_col9_0_sout), .cin(fadder_io_st2_col9_1_sout), .sout(fadder_io_st4_col9_0_sout), .cout(fadder_io_st4_col9_0_carry));
    full_adder_io fadder_io_st4_col10_0(.a(fadder_st3_col9_0_carry), .b(fadder_io_st2_col10_1_sout), .cin(fadder_st3_col10_0_sout), .sout(fadder_io_st4_col10_0_sout), .cout(fadder_io_st4_col10_0_carry));
    full_adder_io fadder_io_st4_col11_0(.a(fadder_io_st2_col11_1_sout), .b(fadder_st3_col10_0_carry), .cin(fadder_st3_col11_0_sout), .sout(fadder_io_st4_col11_0_sout), .cout(fadder_io_st4_col11_0_carry));
    full_adder_io fadder_io_st4_col12_0(.a(fadder_io_st2_col12_1_sout), .b(fadder_st3_col11_0_carry), .cin(fadder_st3_col12_0_sout), .sout(fadder_io_st4_col12_0_sout), .cout(fadder_io_st4_col12_0_carry));
    full_adder_io fadder_io_st4_col13_0(.a(fadder_io_st2_col13_1_sout), .b(fadder_st3_col12_0_carry), .cin(fadder_st3_col13_0_sout), .sout(fadder_io_st4_col13_0_sout), .cout(fadder_io_st4_col13_0_carry));
    full_adder_io fadder_io_st4_col14_0(.a(fadder_io_st2_col14_1_sout), .b(fadder_st3_col13_0_carry), .cin(fadder_st3_col14_0_sout), .sout(fadder_io_st4_col14_0_sout), .cout(fadder_io_st4_col14_0_carry));
    full_adder_io fadder_io_st4_col15_0(.a(fadder_st3_col15_0_sout), .b(fadder_io_st2_col14_1_carry), .cin(fadder_st3_col14_0_carry), .sout(fadder_io_st4_col15_0_sout), .cout(fadder_io_st4_col15_0_carry));
    full_adder_io fadder_io_st4_col16_0(.a(fadder_st3_col15_0_carry), .b(fadder_st3_col16_0_sout), .cin(fadder_st2_col16_1_sout), .sout(fadder_io_st4_col16_0_sout), .cout(fadder_io_st4_col16_0_carry));
    full_adder_io fadder_io_st4_col17_0(.a(fadder_st3_col17_0_sout), .b(fadder_st3_col16_0_carry), .cin(fadder_st2_col16_1_carry), .sout(fadder_io_st4_col17_0_sout), .cout(fadder_io_st4_col17_0_carry));
    full_adder_io fadder_io_st4_col18_0(.a(fadder_st3_col18_0_sout), .b(fadder_st2_col17_0_carry), .cin(fadder_st3_col17_0_carry), .sout(fadder_io_st4_col18_0_sout), .cout(fadder_io_st4_col18_0_carry));
    full_adder_io fadder_io_st4_col19_0(.a(p_9_10), .b(p_10_9), .cin(fadder_st3_col18_0_carry), .sout(fadder_io_st4_col19_0_sout), .cout(fadder_io_st4_col19_0_carry));

    assign result_a[0] = ~p_0_0;
    assign result_a[1] = ~p_0_1;
    assign result_a[2] = ~p_2_0;
    assign result_a[3] = fadder_io_st4_col2_0_carry;
    assign result_a[4] = fadder_io_st4_col3_0_carry;
    assign result_a[5] = fadder_io_st4_col4_0_carry;
    assign result_a[6] = fadder_io_st4_col5_0_carry;
    assign result_a[7] = fadder_io_st4_col6_0_carry;
    assign result_a[8] = fadder_io_st4_col7_0_carry;
    assign result_a[9] = fadder_io_st4_col8_0_carry;
    assign result_a[10] = fadder_io_st4_col9_0_carry;
    assign result_a[11] = fadder_io_st4_col10_0_carry;
    assign result_a[12] = fadder_io_st4_col11_0_carry;
    assign result_a[13] = fadder_io_st4_col12_0_carry;
    assign result_a[14] = fadder_io_st4_col13_0_carry;
    assign result_a[15] = fadder_io_st4_col14_0_carry;
    assign result_a[16] = fadder_io_st4_col16_0_sout;
    assign result_a[17] = fadder_io_st4_col16_0_carry;
    assign result_a[18] = fadder_io_st4_col18_0_sout;
    assign result_a[19] = fadder_io_st4_col19_0_sout;
    assign result_a[20] = ~p_10_10;
    assign result_a[21] = 1'b0;

    assign result_b[0] = 1'b0;
    assign result_b[1] = ~p_1_0;
    assign result_b[2] = fadder_io_st4_col2_0_sout;
    assign result_b[3] = fadder_io_st4_col3_0_sout;
    assign result_b[4] = fadder_io_st4_col4_0_sout;
    assign result_b[5] = fadder_io_st4_col5_0_sout;
    assign result_b[6] = fadder_io_st4_col6_0_sout;
    assign result_b[7] = fadder_io_st4_col7_0_sout;
    assign result_b[8] = fadder_io_st4_col8_0_sout;
    assign result_b[9] = fadder_io_st4_col9_0_sout;
    assign result_b[10] = fadder_io_st4_col10_0_sout;
    assign result_b[11] = fadder_io_st4_col11_0_sout;
    assign result_b[12] = fadder_io_st4_col12_0_sout;
    assign result_b[13] = fadder_io_st4_col13_0_sout;
    assign result_b[14] = fadder_io_st4_col14_0_sout;
    assign result_b[15] = fadder_io_st4_col15_0_sout;
    assign result_b[16] = fadder_io_st4_col15_0_carry;
    assign result_b[17] = fadder_io_st4_col17_0_sout;
    assign result_b[18] = fadder_io_st4_col17_0_carry;
    assign result_b[19] = fadder_io_st4_col18_0_carry;
    assign result_b[20] = fadder_io_st4_col19_0_carry;
    assign result_b[21] = 1'b0;


    assign result_final =r esult_a +result_b ;

/* PATH LENGTHS:

    p_0_1                           0
    p_1_0                           0
    fadder_io_st4_col2_0_sout       1
    p_2_0                           0
    fadder_io_st4_col2_0_carry      1
    fadder_io_st4_col3_0_sout       2
    fadder_io_st4_col3_0_carry      2
    fadder_io_st4_col4_0_sout       2
    fadder_io_st4_col4_0_carry      2
    fadder_io_st4_col5_0_sout       3
    fadder_io_st4_col5_0_carry      3
    fadder_io_st4_col6_0_sout       4
    fadder_io_st4_col6_0_carry      4
    fadder_io_st4_col7_0_sout       4
    fadder_io_st4_col7_0_carry      4
    fadder_io_st4_col8_0_sout       4
    fadder_io_st4_col8_0_carry      4
    fadder_io_st4_col9_0_sout       5
    fadder_io_st4_col9_0_carry      5
    fadder_io_st4_col10_0_sout      6
    fadder_io_st4_col10_0_carry     6
    fadder_io_st4_col11_0_sout      6
    fadder_io_st4_col11_0_carry     6
    fadder_io_st4_col12_0_sout      6
    fadder_io_st4_col12_0_carry     6
    fadder_io_st4_col13_0_sout      6
    fadder_io_st4_col13_0_carry     6
    fadder_io_st4_col14_0_sout      6
    fadder_io_st4_col14_0_carry     6
    fadder_io_st4_col15_0_sout      6
    fadder_io_st4_col15_0_carry     6
    fadder_io_st4_col16_0_sout      4
    fadder_io_st4_col16_0_carry     4
    fadder_io_st4_col17_0_sout      4
    fadder_io_st4_col17_0_carry     4
    fadder_io_st4_col18_0_sout      3
    fadder_io_st4_col18_0_carry     3
    fadder_io_st4_col19_0_sout      2
    fadder_io_st4_col19_0_carry     2
    p_10_10                         0

*/

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


module full_adder_io(
    input  a,
    input  b,
    input  cin,
    output cout,
    output sout
);
    assign {cout, sout} = ~(a + b + cin);
endmodule