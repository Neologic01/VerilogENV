module mult_module
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
    wire                  fadder_io_st0_col6_0_sout;
    wire                  fadder_io_st0_col6_0_carry;
    wire                  fadder_io_st0_col7_0_sout;
    wire                  fadder_io_st0_col7_0_carry;
    wire                  fadder_io_st0_col7_1_sout;
    wire                  fadder_io_st0_col7_1_carry;
    wire                  fadder_io_st0_col8_0_sout;
    wire                  fadder_io_st0_col8_0_carry;
    wire                  fadder_io_st0_col8_1_sout;
    wire                  fadder_io_st0_col8_1_carry;
    wire                  fadder_io_st0_col9_0_sout;
    wire                  fadder_io_st0_col9_0_carry;
    wire                  fadder_io_st1_col4_0_sout;
    wire                  fadder_io_st1_col4_0_carry;
    wire                  fadder_io_st1_col5_0_sout;
    wire                  fadder_io_st1_col5_0_carry;
    wire                  fadder_io_st1_col5_1_sout;
    wire                  fadder_io_st1_col5_1_carry;
    wire                  fadder_io_st1_col6_0_sout;
    wire                  fadder_io_st1_col6_0_carry;
    wire                  fadder_io_st0_col6_0_sout_inv;
    wire                  fadder_io_st1_col6_1_sout;
    wire                  fadder_io_st1_col6_1_carry;
    wire                  fadder_io_st1_col7_0_sout;
    wire                  fadder_io_st1_col7_0_carry;
    wire                  fadder_st1_col7_0_sout;
    wire                  fadder_st1_col7_0_carry;
    wire                  fadder_io_st0_col7_0_carry_inv;
    wire                  fadder_io_st1_col8_0_sout;
    wire                  fadder_io_st1_col8_0_carry;
    wire                  fadder_st1_col8_0_sout;
    wire                  fadder_st1_col8_0_carry;
    wire                  fadder_io_st1_col9_0_sout;
    wire                  fadder_io_st1_col9_0_carry;
    wire                  fadder_st1_col9_0_sout;
    wire                  fadder_st1_col9_0_carry;
    wire                  fadder_io_st1_col10_0_sout;
    wire                  fadder_io_st1_col10_0_carry;
    wire                  fadder_io_st0_col9_0_carry_inv;
    wire                  fadder_io_st1_col10_1_sout;
    wire                  fadder_io_st1_col10_1_carry;
    wire                  fadder_io_st1_col11_0_sout;
    wire                  fadder_io_st1_col11_0_carry;
    wire                  fadder_st2_col3_0_sout;
    wire                  fadder_st2_col3_0_carry;
    wire                  fadder_st2_col4_0_sout;
    wire                  fadder_st2_col4_0_carry;
    wire                  p_5_0_inv;
    wire                  fadder_io_st2_col5_0_sout;
    wire                  fadder_io_st2_col5_0_carry;
    wire                  fadder_io_st2_col6_0_sout;
    wire                  fadder_io_st2_col6_0_carry;
    wire                  fadder_io_st2_col7_0_sout;
    wire                  fadder_io_st2_col7_0_carry;
    wire                  fadder_io_st2_col8_0_sout;
    wire                  fadder_io_st2_col8_0_carry;
    wire                  fadder_io_st2_col9_0_sout;
    wire                  fadder_io_st2_col9_0_carry;
    wire                  fadder_io_st2_col10_0_sout;
    wire                  fadder_io_st2_col10_0_carry;
    wire                  p_7_4_inv;
    wire                  fadder_io_st2_col11_0_sout;
    wire                  fadder_io_st2_col11_0_carry;
    wire                  fadder_st2_col12_0_sout;
    wire                  fadder_st2_col12_0_carry;
    wire                  fadder_io_st3_col2_0_sout;
    wire                  fadder_io_st3_col2_0_carry;
    wire                  fadder_io_st3_col3_0_sout;
    wire                  fadder_io_st3_col3_0_carry;
    wire                  fadder_io_st1_col4_0_sout_inv;
    wire                  fadder_io_st3_col4_0_sout;
    wire                  fadder_io_st3_col4_0_carry;
    wire                  fadder_io_st1_col5_1_sout_inv;
    wire                  fadder_io_st3_col5_0_sout;
    wire                  fadder_io_st3_col5_0_carry;
    wire                  fadder_io_st1_col6_1_sout_inv;
    wire                  fadder_io_st3_col6_0_sout;
    wire                  fadder_io_st3_col6_0_carry;
    wire                  fadder_io_st1_col6_1_carry_inv;
    wire                  fadder_io_st3_col7_0_sout;
    wire                  fadder_io_st3_col7_0_carry;
    wire                  fadder_io_st1_col8_0_sout_inv;
    wire                  fadder_io_st3_col8_0_sout;
    wire                  fadder_io_st3_col8_0_carry;
    wire                  fadder_io_st1_col8_0_carry_inv;
    wire                  fadder_io_st3_col9_0_sout;
    wire                  fadder_io_st3_col9_0_carry;
    wire                  fadder_io_st1_col10_1_sout_inv;
    wire                  fadder_io_st3_col10_0_sout;
    wire                  fadder_io_st3_col10_0_carry;
    wire                  fadder_io_st1_col10_1_carry_inv;
    wire                  fadder_io_st3_col11_0_sout;
    wire                  fadder_io_st3_col11_0_carry;
    wire                  fadder_io_st1_col11_0_carry_inv;
    wire                  fadder_io_st3_col12_0_sout;
    wire                  fadder_io_st3_col12_0_carry;
    wire                  fadder_io_st3_col13_0_sout;
    wire                  fadder_io_st3_col13_0_carry;

    assign fadder_io_st0_col6_0_sout_inv = ~fadder_io_st0_col6_0_sout;
    assign fadder_io_st0_col7_0_carry_inv = ~fadder_io_st0_col7_0_carry;
    assign fadder_io_st0_col9_0_carry_inv = ~fadder_io_st0_col9_0_carry;
    assign p_5_0_inv = ~p_5_0;
    assign p_7_4_inv = ~p_7_4;
    assign fadder_io_st1_col4_0_sout_inv = ~fadder_io_st1_col4_0_sout;
    assign fadder_io_st1_col5_1_sout_inv = ~fadder_io_st1_col5_1_sout;
    assign fadder_io_st1_col6_1_sout_inv = ~fadder_io_st1_col6_1_sout;
    assign fadder_io_st1_col6_1_carry_inv = ~fadder_io_st1_col6_1_carry;
    assign fadder_io_st1_col8_0_sout_inv = ~fadder_io_st1_col8_0_sout;
    assign fadder_io_st1_col8_0_carry_inv = ~fadder_io_st1_col8_0_carry;
    assign fadder_io_st1_col10_1_sout_inv = ~fadder_io_st1_col10_1_sout;
    assign fadder_io_st1_col10_1_carry_inv = ~fadder_io_st1_col10_1_carry;
    assign fadder_io_st1_col11_0_carry_inv = ~fadder_io_st1_col11_0_carry;
    assign p_0_0 = ~(operand_a[0] & operand_b[0]);
    assign p_0_1 = ~(operand_a[0] & operand_b[1]);
    assign p_0_2 = ~(operand_a[0] & operand_b[2]);
    assign p_0_3 = ~(operand_a[0] & operand_b[3]);
    assign p_0_4 = ~(operand_a[0] & operand_b[4]);
    assign p_0_5 = ~(operand_a[0] & operand_b[5]);
    assign p_0_6 = ~(operand_a[0] & operand_b[6]);
    assign p_0_7 = ~(operand_a[0] & operand_b[7]);
    assign p_1_0 = ~(operand_a[1] & operand_b[0]);
    assign p_1_1 = ~(operand_a[1] & operand_b[1]);
    assign p_1_2 = ~(operand_a[1] & operand_b[2]);
    assign p_1_3 = ~(operand_a[1] & operand_b[3]);
    assign p_1_4 = ~(operand_a[1] & operand_b[4]);
    assign p_1_5 = ~(operand_a[1] & operand_b[5]);
    assign p_1_6 = ~(operand_a[1] & operand_b[6]);
    assign p_1_7 = ~(operand_a[1] & operand_b[7]);
    assign p_2_0 = ~(operand_a[2] & operand_b[0]);
    assign p_2_1 = ~(operand_a[2] & operand_b[1]);
    assign p_2_2 = ~(operand_a[2] & operand_b[2]);
    assign p_2_3 = ~(operand_a[2] & operand_b[3]);
    assign p_2_4 = ~(operand_a[2] & operand_b[4]);
    assign p_2_5 = ~(operand_a[2] & operand_b[5]);
    assign p_2_6 = ~(operand_a[2] & operand_b[6]);
    assign p_2_7 = ~(operand_a[2] & operand_b[7]);
    assign p_3_0 = ~(operand_a[3] & operand_b[0]);
    assign p_3_1 = ~(operand_a[3] & operand_b[1]);
    assign p_3_2 = ~(operand_a[3] & operand_b[2]);
    assign p_3_3 = ~(operand_a[3] & operand_b[3]);
    assign p_3_4 = ~(operand_a[3] & operand_b[4]);
    assign p_3_5 = ~(operand_a[3] & operand_b[5]);
    assign p_3_6 = ~(operand_a[3] & operand_b[6]);
    assign p_3_7 = ~(operand_a[3] & operand_b[7]);
    assign p_4_0 = ~(operand_a[4] & operand_b[0]);
    assign p_4_1 = ~(operand_a[4] & operand_b[1]);
    assign p_4_2 = ~(operand_a[4] & operand_b[2]);
    assign p_4_3 = ~(operand_a[4] & operand_b[3]);
    assign p_4_4 = ~(operand_a[4] & operand_b[4]);
    assign p_4_5 = ~(operand_a[4] & operand_b[5]);
    assign p_4_6 = ~(operand_a[4] & operand_b[6]);
    assign p_4_7 = ~(operand_a[4] & operand_b[7]);
    assign p_5_0 = ~(operand_a[5] & operand_b[0]);
    assign p_5_1 = ~(operand_a[5] & operand_b[1]);
    assign p_5_2 = ~(operand_a[5] & operand_b[2]);
    assign p_5_3 = ~(operand_a[5] & operand_b[3]);
    assign p_5_4 = ~(operand_a[5] & operand_b[4]);
    assign p_5_5 = ~(operand_a[5] & operand_b[5]);
    assign p_5_6 = ~(operand_a[5] & operand_b[6]);
    assign p_5_7 = ~(operand_a[5] & operand_b[7]);
    assign p_6_0 = ~(operand_a[6] & operand_b[0]);
    assign p_6_1 = ~(operand_a[6] & operand_b[1]);
    assign p_6_2 = ~(operand_a[6] & operand_b[2]);
    assign p_6_3 = ~(operand_a[6] & operand_b[3]);
    assign p_6_4 = ~(operand_a[6] & operand_b[4]);
    assign p_6_5 = ~(operand_a[6] & operand_b[5]);
    assign p_6_6 = ~(operand_a[6] & operand_b[6]);
    assign p_6_7 = ~(operand_a[6] & operand_b[7]);
    assign p_7_0 = ~(operand_a[7] & operand_b[0]);
    assign p_7_1 = ~(operand_a[7] & operand_b[1]);
    assign p_7_2 = ~(operand_a[7] & operand_b[2]);
    assign p_7_3 = ~(operand_a[7] & operand_b[3]);
    assign p_7_4 = ~(operand_a[7] & operand_b[4]);
    assign p_7_5 = ~(operand_a[7] & operand_b[5]);
    assign p_7_6 = ~(operand_a[7] & operand_b[6]);
    assign p_7_7 = ~(operand_a[7] & operand_b[7]);

    full_adder fadder_st1_col7_0(.a(fadder_io_st0_col6_0_carry), .b(fadder_io_st0_col7_0_sout), .cin(fadder_io_st0_col7_1_sout), .sout(fadder_st1_col7_0_sout), .cout(fadder_st1_col7_0_carry));
    full_adder fadder_st1_col8_0(.a(fadder_io_st0_col7_1_carry), .b(fadder_io_st0_col8_0_sout), .cin(fadder_io_st0_col8_1_sout), .sout(fadder_st1_col8_0_sout), .cout(fadder_st1_col8_0_carry));
    full_adder fadder_st1_col9_0(.a(fadder_io_st0_col8_0_carry), .b(fadder_io_st0_col8_1_carry), .cin(fadder_io_st0_col9_0_sout), .sout(fadder_st1_col9_0_sout), .cout(fadder_st1_col9_0_carry));
    full_adder fadder_st2_col3_0(.a(p_0_3), .b(p_1_2), .cin(1'b1), .sout(fadder_st2_col3_0_sout), .cout(fadder_st2_col3_0_carry));
    full_adder fadder_st2_col4_0(.a(p_2_2), .b(p_3_1), .cin(p_4_0), .sout(fadder_st2_col4_0_sout), .cout(fadder_st2_col4_0_carry));
    full_adder fadder_st2_col12_0(.a(p_5_7), .b(p_6_6), .cin(p_7_5), .sout(fadder_st2_col12_0_sout), .cout(fadder_st2_col12_0_carry));
    full_adder_io fadder_io_st0_col6_0(.a(p_0_6), .b(p_1_5), .cin(1'b1), .sout(fadder_io_st0_col6_0_sout), .cout(fadder_io_st0_col6_0_carry));
    full_adder_io fadder_io_st0_col7_0(.a(p_0_7), .b(p_1_6), .cin(p_2_5), .sout(fadder_io_st0_col7_0_sout), .cout(fadder_io_st0_col7_0_carry));
    full_adder_io fadder_io_st0_col7_1(.a(p_3_4), .b(p_4_3), .cin(1'b1), .sout(fadder_io_st0_col7_1_sout), .cout(fadder_io_st0_col7_1_carry));
    full_adder_io fadder_io_st0_col8_0(.a(p_1_7), .b(p_2_6), .cin(p_3_5), .sout(fadder_io_st0_col8_0_sout), .cout(fadder_io_st0_col8_0_carry));
    full_adder_io fadder_io_st0_col8_1(.a(p_4_4), .b(p_5_3), .cin(1'b1), .sout(fadder_io_st0_col8_1_sout), .cout(fadder_io_st0_col8_1_carry));
    full_adder_io fadder_io_st0_col9_0(.a(p_2_7), .b(p_3_6), .cin(p_4_5), .sout(fadder_io_st0_col9_0_sout), .cout(fadder_io_st0_col9_0_carry));
    full_adder_io fadder_io_st1_col4_0(.a(p_0_4), .b(p_1_3), .cin(1'b1), .sout(fadder_io_st1_col4_0_sout), .cout(fadder_io_st1_col4_0_carry));
    full_adder_io fadder_io_st1_col5_0(.a(p_0_5), .b(p_1_4), .cin(p_2_3), .sout(fadder_io_st1_col5_0_sout), .cout(fadder_io_st1_col5_0_carry));
    full_adder_io fadder_io_st1_col5_1(.a(p_3_2), .b(p_4_1), .cin(1'b1), .sout(fadder_io_st1_col5_1_sout), .cout(fadder_io_st1_col5_1_carry));
    full_adder_io fadder_io_st1_col6_0(.a(p_2_4), .b(p_3_3), .cin(p_4_2), .sout(fadder_io_st1_col6_0_sout), .cout(fadder_io_st1_col6_0_carry));
    full_adder_io fadder_io_st1_col6_1(.a(p_5_1), .b(p_6_0), .cin(fadder_io_st0_col6_0_sout_inv), .sout(fadder_io_st1_col6_1_sout), .cout(fadder_io_st1_col6_1_carry));
    full_adder_io fadder_io_st1_col7_0(.a(p_5_2), .b(p_6_1), .cin(p_7_0), .sout(fadder_io_st1_col7_0_sout), .cout(fadder_io_st1_col7_0_carry));
    full_adder_io fadder_io_st1_col8_0(.a(p_6_2), .b(p_7_1), .cin(fadder_io_st0_col7_0_carry_inv), .sout(fadder_io_st1_col8_0_sout), .cout(fadder_io_st1_col8_0_carry));
    full_adder_io fadder_io_st1_col9_0(.a(p_5_4), .b(p_6_3), .cin(p_7_2), .sout(fadder_io_st1_col9_0_sout), .cout(fadder_io_st1_col9_0_carry));
    full_adder_io fadder_io_st1_col10_0(.a(p_3_7), .b(p_4_6), .cin(p_5_5), .sout(fadder_io_st1_col10_0_sout), .cout(fadder_io_st1_col10_0_carry));
    full_adder_io fadder_io_st1_col10_1(.a(p_6_4), .b(p_7_3), .cin(fadder_io_st0_col9_0_carry_inv), .sout(fadder_io_st1_col10_1_sout), .cout(fadder_io_st1_col10_1_carry));
    full_adder_io fadder_io_st1_col11_0(.a(p_4_7), .b(p_5_6), .cin(p_6_5), .sout(fadder_io_st1_col11_0_sout), .cout(fadder_io_st1_col11_0_carry));
    full_adder_io fadder_io_st2_col5_0(.a(p_5_0_inv), .b(fadder_io_st1_col4_0_carry), .cin(fadder_io_st1_col5_0_sout), .sout(fadder_io_st2_col5_0_sout), .cout(fadder_io_st2_col5_0_carry));
    full_adder_io fadder_io_st2_col6_0(.a(fadder_io_st1_col5_0_carry), .b(fadder_io_st1_col5_1_carry), .cin(fadder_io_st1_col6_0_sout), .sout(fadder_io_st2_col6_0_sout), .cout(fadder_io_st2_col6_0_carry));
    full_adder_io fadder_io_st2_col7_0(.a(fadder_io_st1_col6_0_carry), .b(fadder_io_st1_col7_0_sout), .cin(fadder_st1_col7_0_sout), .sout(fadder_io_st2_col7_0_sout), .cout(fadder_io_st2_col7_0_carry));
    full_adder_io fadder_io_st2_col8_0(.a(fadder_io_st1_col7_0_carry), .b(fadder_st1_col7_0_carry), .cin(fadder_st1_col8_0_sout), .sout(fadder_io_st2_col8_0_sout), .cout(fadder_io_st2_col8_0_carry));
    full_adder_io fadder_io_st2_col9_0(.a(fadder_io_st1_col9_0_sout), .b(fadder_st1_col8_0_carry), .cin(fadder_st1_col9_0_sout), .sout(fadder_io_st2_col9_0_sout), .cout(fadder_io_st2_col9_0_carry));
    full_adder_io fadder_io_st2_col10_0(.a(fadder_io_st1_col9_0_carry), .b(fadder_io_st1_col10_0_sout), .cin(fadder_st1_col9_0_carry), .sout(fadder_io_st2_col10_0_sout), .cout(fadder_io_st2_col10_0_carry));
    full_adder_io fadder_io_st2_col11_0(.a(p_7_4_inv), .b(fadder_io_st1_col10_0_carry), .cin(fadder_io_st1_col11_0_sout), .sout(fadder_io_st2_col11_0_sout), .cout(fadder_io_st2_col11_0_carry));
    full_adder_io fadder_io_st3_col2_0(.a(p_0_2), .b(p_1_1), .cin(1'b1), .sout(fadder_io_st3_col2_0_sout), .cout(fadder_io_st3_col2_0_carry));
    full_adder_io fadder_io_st3_col3_0(.a(p_2_1), .b(p_3_0), .cin(fadder_st2_col3_0_sout), .sout(fadder_io_st3_col3_0_sout), .cout(fadder_io_st3_col3_0_carry));
    full_adder_io fadder_io_st3_col4_0(.a(fadder_st2_col3_0_carry), .b(fadder_st2_col4_0_sout), .cin(fadder_io_st1_col4_0_sout_inv), .sout(fadder_io_st3_col4_0_sout), .cout(fadder_io_st3_col4_0_carry));
    full_adder_io fadder_io_st3_col5_0(.a(fadder_st2_col4_0_carry), .b(fadder_io_st1_col5_1_sout_inv), .cin(fadder_io_st2_col5_0_sout), .sout(fadder_io_st3_col5_0_sout), .cout(fadder_io_st3_col5_0_carry));
    full_adder_io fadder_io_st3_col6_0(.a(fadder_io_st2_col5_0_carry), .b(fadder_io_st2_col6_0_sout), .cin(fadder_io_st1_col6_1_sout_inv), .sout(fadder_io_st3_col6_0_sout), .cout(fadder_io_st3_col6_0_carry));
    full_adder_io fadder_io_st3_col7_0(.a(fadder_io_st2_col6_0_carry), .b(fadder_io_st2_col7_0_sout), .cin(fadder_io_st1_col6_1_carry_inv), .sout(fadder_io_st3_col7_0_sout), .cout(fadder_io_st3_col7_0_carry));
    full_adder_io fadder_io_st3_col8_0(.a(fadder_io_st2_col7_0_carry), .b(fadder_io_st2_col8_0_sout), .cin(fadder_io_st1_col8_0_sout_inv), .sout(fadder_io_st3_col8_0_sout), .cout(fadder_io_st3_col8_0_carry));
    full_adder_io fadder_io_st3_col9_0(.a(fadder_io_st2_col8_0_carry), .b(fadder_io_st2_col9_0_sout), .cin(fadder_io_st1_col8_0_carry_inv), .sout(fadder_io_st3_col9_0_sout), .cout(fadder_io_st3_col9_0_carry));
    full_adder_io fadder_io_st3_col10_0(.a(fadder_io_st2_col9_0_carry), .b(fadder_io_st2_col10_0_sout), .cin(fadder_io_st1_col10_1_sout_inv), .sout(fadder_io_st3_col10_0_sout), .cout(fadder_io_st3_col10_0_carry));
    full_adder_io fadder_io_st3_col11_0(.a(fadder_io_st2_col11_0_sout), .b(fadder_io_st2_col10_0_carry), .cin(fadder_io_st1_col10_1_carry_inv), .sout(fadder_io_st3_col11_0_sout), .cout(fadder_io_st3_col11_0_carry));
    full_adder_io fadder_io_st3_col12_0(.a(fadder_st2_col12_0_sout), .b(fadder_io_st1_col11_0_carry_inv), .cin(fadder_io_st2_col11_0_carry), .sout(fadder_io_st3_col12_0_sout), .cout(fadder_io_st3_col12_0_carry));
    full_adder_io fadder_io_st3_col13_0(.a(p_6_7), .b(p_7_6), .cin(fadder_st2_col12_0_carry), .sout(fadder_io_st3_col13_0_sout), .cout(fadder_io_st3_col13_0_carry));

    assign result_a[0] = ~p_0_0;
    assign result_a[1] = ~p_0_1;
    assign result_a[2] = ~p_2_0;
    assign result_a[3] = fadder_io_st3_col2_0_carry;
    assign result_a[4] = fadder_io_st3_col3_0_carry;
    assign result_a[5] = fadder_io_st3_col4_0_carry;
    assign result_a[6] = fadder_io_st3_col5_0_carry;
    assign result_a[7] = fadder_io_st3_col6_0_carry;
    assign result_a[8] = fadder_io_st3_col7_0_carry;
    assign result_a[9] = fadder_io_st3_col8_0_carry;
    assign result_a[10] = fadder_io_st3_col9_0_carry;
    assign result_a[11] = fadder_io_st3_col10_0_carry;
    assign result_a[12] = fadder_io_st3_col12_0_sout;
    assign result_a[13] = fadder_io_st3_col13_0_sout;
    assign result_a[14] = ~p_7_7;
    assign result_a[15] = 1'b0;

    assign result_b[0] = 1'b0;
    assign result_b[1] = ~p_1_0;
    assign result_b[2] = fadder_io_st3_col2_0_sout;
    assign result_b[3] = fadder_io_st3_col3_0_sout;
    assign result_b[4] = fadder_io_st3_col4_0_sout;
    assign result_b[5] = fadder_io_st3_col5_0_sout;
    assign result_b[6] = fadder_io_st3_col6_0_sout;
    assign result_b[7] = fadder_io_st3_col7_0_sout;
    assign result_b[8] = fadder_io_st3_col8_0_sout;
    assign result_b[9] = fadder_io_st3_col9_0_sout;
    assign result_b[10] = fadder_io_st3_col10_0_sout;
    assign result_b[11] = fadder_io_st3_col11_0_sout;
    assign result_b[12] = fadder_io_st3_col11_0_carry;
    assign result_b[13] = fadder_io_st3_col12_0_carry;
    assign result_b[14] = fadder_io_st3_col13_0_carry;
    assign result_b[15] = 1'b0;

/* PATH LENGTHS:

    p_0_1                           0
    p_1_0                           0
    fadder_io_st3_col2_0_sout       1
    p_2_0                           0
    fadder_io_st3_col2_0_carry      1
    fadder_io_st3_col3_0_sout       2
    fadder_io_st3_col3_0_carry      2
    fadder_io_st3_col4_0_sout       3
    fadder_io_st3_col4_0_carry      3
    fadder_io_st3_col5_0_sout       3
    fadder_io_st3_col5_0_carry      3
    fadder_io_st3_col6_0_sout       5
    fadder_io_st3_col6_0_carry      5
    fadder_io_st3_col7_0_sout       5
    fadder_io_st3_col7_0_carry      5
    fadder_io_st3_col8_0_sout       5
    fadder_io_st3_col8_0_carry      5
    fadder_io_st3_col9_0_sout       5
    fadder_io_st3_col9_0_carry      5
    fadder_io_st3_col10_0_sout      5
    fadder_io_st3_col10_0_carry     5
    fadder_io_st3_col11_0_sout      5
    fadder_io_st3_col11_0_carry     5
    fadder_io_st3_col12_0_sout      3
    fadder_io_st3_col12_0_carry     3
    fadder_io_st3_col13_0_sout      2
    fadder_io_st3_col13_0_carry     2
    p_7_7                           0

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


module full_adder_io(
    input  a,
    input  b,
    input  cin,
    output cout,
    output sout
);
    assign {cout, sout} = ~(a + b + cin);
endmodule