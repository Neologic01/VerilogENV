module mult_module (
    input  [7:0] operand_a,
    input  [7:0] operand_b,
    output [15:0] result_a,
    output [15:0] result_b,
    output [16:0] result_final
);
// Generated at 2025-07-21 17:11:00


    wire p_0_0 = ~(operand_a[0] & operand_b[0]);
    wire p_1_0 = ~(operand_a[1] & operand_b[0]);
    wire p_0_1 = ~(operand_a[0] & operand_b[1]);
    wire p_2_0 = ~(operand_a[2] & operand_b[0]);
    wire p_1_1 = ~(operand_a[1] & operand_b[1]);
    wire p_0_2 = ~(operand_a[0] & operand_b[2]);
    wire p_3_0 = ~(operand_a[3] & operand_b[0]);
    wire p_2_1 = ~(operand_a[2] & operand_b[1]);
    wire p_1_2 = ~(operand_a[1] & operand_b[2]);
    wire p_0_3 = ~(operand_a[0] & operand_b[3]);
    wire p_4_0 = ~(operand_a[4] & operand_b[0]);
    wire p_3_1 = ~(operand_a[3] & operand_b[1]);
    wire p_2_2 = ~(operand_a[2] & operand_b[2]);
    wire p_1_3 = ~(operand_a[1] & operand_b[3]);
    wire p_0_4 = ~(operand_a[0] & operand_b[4]);
    wire p_5_0 = ~(operand_a[5] & operand_b[0]);
    wire p_4_1 = ~(operand_a[4] & operand_b[1]);
    wire p_3_2 = ~(operand_a[3] & operand_b[2]);
    wire p_2_3 = ~(operand_a[2] & operand_b[3]);
    wire p_1_4 = ~(operand_a[1] & operand_b[4]);
    wire p_0_5 = ~(operand_a[0] & operand_b[5]);
    wire p_6_0 = ~(operand_a[6] & operand_b[0]);
    wire p_5_1 = ~(operand_a[5] & operand_b[1]);
    wire p_4_2 = ~(operand_a[4] & operand_b[2]);
    wire p_3_3 = ~(operand_a[3] & operand_b[3]);
    wire p_2_4 = ~(operand_a[2] & operand_b[4]);
    wire p_1_5 = ~(operand_a[1] & operand_b[5]);
    wire p_0_6 = ~(operand_a[0] & operand_b[6]);
    wire p_7_0 = ~(operand_a[7] & operand_b[0]);
    wire p_6_1 = ~(operand_a[6] & operand_b[1]);
    wire p_5_2 = ~(operand_a[5] & operand_b[2]);
    wire p_4_3 = ~(operand_a[4] & operand_b[3]);
    wire p_3_4 = ~(operand_a[3] & operand_b[4]);
    wire p_2_5 = ~(operand_a[2] & operand_b[5]);
    wire p_1_6 = ~(operand_a[1] & operand_b[6]);
    wire p_0_7 = ~(operand_a[0] & operand_b[7]);
    wire p_7_1 = ~(operand_a[7] & operand_b[1]);
    wire p_6_2 = ~(operand_a[6] & operand_b[2]);
    wire p_5_3 = ~(operand_a[5] & operand_b[3]);
    wire p_4_4 = ~(operand_a[4] & operand_b[4]);
    wire p_3_5 = ~(operand_a[3] & operand_b[5]);
    wire p_2_6 = ~(operand_a[2] & operand_b[6]);
    wire p_1_7 = ~(operand_a[1] & operand_b[7]);
    wire p_7_2 = ~(operand_a[7] & operand_b[2]);
    wire p_6_3 = ~(operand_a[6] & operand_b[3]);
    wire p_5_4 = ~(operand_a[5] & operand_b[4]);
    wire p_4_5 = ~(operand_a[4] & operand_b[5]);
    wire p_3_6 = ~(operand_a[3] & operand_b[6]);
    wire p_2_7 = ~(operand_a[2] & operand_b[7]);
    wire p_7_3 = ~(operand_a[7] & operand_b[3]);
    wire p_6_4 = ~(operand_a[6] & operand_b[4]);
    wire p_5_5 = ~(operand_a[5] & operand_b[5]);
    wire p_4_6 = ~(operand_a[4] & operand_b[6]);
    wire p_3_7 = ~(operand_a[3] & operand_b[7]);
    wire p_7_4 = ~(operand_a[7] & operand_b[4]);
    wire p_6_5 = ~(operand_a[6] & operand_b[5]);
    wire p_5_6 = ~(operand_a[5] & operand_b[6]);
    wire p_4_7 = ~(operand_a[4] & operand_b[7]);
    wire p_7_5 = ~(operand_a[7] & operand_b[5]);
    wire p_6_6 = ~(operand_a[6] & operand_b[6]);
    wire p_5_7 = ~(operand_a[5] & operand_b[7]);
    wire p_7_6 = ~(operand_a[7] & operand_b[6]);
    wire p_6_7 = ~(operand_a[6] & operand_b[7]);
    wire p_7_7 = ~(operand_a[7] & operand_b[7]);
    wire full_adder_0_s_out;
    wire full_adder_0_c_out;
    wire full_adder_1_s_out;
    wire full_adder_1_c_out;
    wire full_adder_2_s_out;
    wire full_adder_2_c_out;
    wire full_adder_3_s_out;
    wire full_adder_3_c_out;
    wire full_adder_4_s_out;
    wire full_adder_4_c_out;
    wire full_adder_5_s_out;
    wire full_adder_5_c_out;
    wire full_adder_6_s_out;
    wire full_adder_6_c_out;
    wire full_adder_7_s_out;
    wire full_adder_7_c_out;
    wire full_adder_8_s_out;
    wire full_adder_8_c_out;
    wire full_adder_9_s_out;
    wire full_adder_9_c_out;
    wire full_adder_10_s_out;
    wire full_adder_10_c_out;
    wire full_adder_11_s_out;
    wire full_adder_11_c_out;
    wire full_adder_12_s_out;
    wire full_adder_12_c_out;
    wire full_adder_13_s_out;
    wire full_adder_13_c_out;
    wire full_adder_14_s_out;
    wire full_adder_14_c_out;
    wire full_adder_15_s_out;
    wire full_adder_15_c_out;
    wire full_adder_16_s_out;
    wire full_adder_16_c_out;
    wire full_adder_io_0_s_out;
    wire full_adder_io_0_c_out;
    wire full_adder_io_1_s_out;
    wire full_adder_io_1_c_out;
    wire full_adder_io_2_s_out;
    wire full_adder_io_2_c_out;
    wire full_adder_io_3_s_out;
    wire full_adder_io_3_c_out;
    wire full_adder_io_4_s_out;
    wire full_adder_io_4_c_out;
    wire full_adder_io_5_s_out;
    wire full_adder_io_5_c_out;
    wire full_adder_io_6_s_out;
    wire full_adder_io_6_c_out;
    wire full_adder_io_7_s_out;
    wire full_adder_io_7_c_out;
    wire full_adder_io_8_s_out;
    wire full_adder_io_8_c_out;
    wire full_adder_io_9_s_out;
    wire full_adder_io_9_c_out;
    wire full_adder_io_10_s_out;
    wire full_adder_io_10_c_out;
    wire full_adder_io_11_s_out;
    wire full_adder_io_11_c_out;
    wire full_adder_io_12_s_out;
    wire full_adder_io_12_c_out;
    wire full_adder_io_13_s_out;
    wire full_adder_io_13_c_out;
    wire full_adder_io_14_s_out;
    wire full_adder_io_14_c_out;
    wire full_adder_io_15_s_out;
    wire full_adder_io_15_c_out;
    wire full_adder_io_16_s_out;
    wire full_adder_io_16_c_out;
    wire full_adder_io_17_s_out;
    wire full_adder_io_17_c_out;
    wire full_adder_io_18_s_out;
    wire full_adder_io_18_c_out;
    wire full_adder_io_19_s_out;
    wire full_adder_io_19_c_out;
    wire full_adder_io_20_s_out;
    wire full_adder_io_20_c_out;
    wire full_adder_io_21_s_out;
    wire full_adder_io_21_c_out;
    wire full_adder_io_22_s_out;
    wire full_adder_io_22_c_out;
    wire full_adder_io_23_s_out;
    wire full_adder_io_23_c_out;
    wire full_adder_io_24_s_out;
    wire full_adder_io_24_c_out;




    full_adder_io full_adder_io_0(.a(p_6_0_True), .b(p_5_1_True), .cin(1'b1), .sout(full_adder_io_0_s_out), .cout(full_adder_io_0_c_out));
    full_adder_io full_adder_io_1(.a(p_7_0_True), .b(p_6_1_True), .cin(p_5_2_True), .sout(full_adder_io_1_s_out), .cout(full_adder_io_1_c_out));
    full_adder_io full_adder_io_2(.a(p_4_3_True), .b(p_3_4_True), .cin(1'b1), .sout(full_adder_io_2_s_out), .cout(full_adder_io_2_c_out));
    full_adder_io full_adder_io_3(.a(p_7_1_True), .b(p_6_2_True), .cin(p_5_3_True), .sout(full_adder_io_3_s_out), .cout(full_adder_io_3_c_out));
    full_adder_io full_adder_io_4(.a(p_4_4_True), .b(p_3_5_True), .cin(1'b1), .sout(full_adder_io_4_s_out), .cout(full_adder_io_4_c_out));
    full_adder_io full_adder_io_5(.a(p_7_2_True), .b(p_6_3_True), .cin(p_5_4_True), .sout(full_adder_io_5_s_out), .cout(full_adder_io_5_c_out));
    full_adder_io full_adder_io_6(.a(p_4_0_True), .b(p_3_1_True), .cin(1'b1), .sout(full_adder_io_6_s_out), .cout(full_adder_io_6_c_out));
    full_adder_io full_adder_io_7(.a(p_5_0_True), .b(p_4_1_True), .cin(p_3_2_True), .sout(full_adder_io_7_s_out), .cout(full_adder_io_7_c_out));
    full_adder_io full_adder_io_8(.a(p_2_3_True), .b(p_1_4_True), .cin(1'b1), .sout(full_adder_io_8_s_out), .cout(full_adder_io_8_c_out));
    full_adder_io full_adder_io_9(.a(p_4_2_True), .b(p_3_3_True), .cin(p_2_4_True), .sout(full_adder_io_9_s_out), .cout(full_adder_io_9_c_out));
    full_adder_io full_adder_io_10(.a(p_1_5_True), .b(p_0_6_True), .cin(full_adder_io_0_s_out_False_True), .sout(full_adder_io_10_s_out), .cout(full_adder_io_10_c_out));
    full_adder_io full_adder_io_11(.a(p_2_5_True), .b(p_1_6_True), .cin(p_0_7_True), .sout(full_adder_io_11_s_out), .cout(full_adder_io_11_c_out));
    full_adder_io full_adder_io_12(.a(p_2_6_True), .b(p_1_7_True), .cin(full_adder_io_1_c_out_False_True), .sout(full_adder_io_12_s_out), .cout(full_adder_io_12_c_out));
    full_adder_io full_adder_io_13(.a(p_4_5_True), .b(p_3_6_True), .cin(p_2_7_True), .sout(full_adder_io_13_s_out), .cout(full_adder_io_13_c_out));
    full_adder_io full_adder_io_14(.a(p_7_3_True), .b(p_6_4_True), .cin(p_5_5_True), .sout(full_adder_io_14_s_out), .cout(full_adder_io_14_c_out));
    full_adder_io full_adder_io_15(.a(p_4_6_True), .b(p_3_7_True), .cin(full_adder_io_5_c_out_False_True), .sout(full_adder_io_15_s_out), .cout(full_adder_io_15_c_out));
    full_adder_io full_adder_io_16(.a(p_7_4_True), .b(p_6_5_True), .cin(p_5_6_True), .sout(full_adder_io_16_s_out), .cout(full_adder_io_16_c_out));
    full_adder_io full_adder_io_17(.a(p_3_0_True), .b(p_2_1_True), .cin(1'b1), .sout(full_adder_io_17_s_out), .cout(full_adder_io_17_c_out));
    full_adder_io full_adder_io_18(.a(p_2_2_True), .b(p_1_3_True), .cin(p_0_4_True), .sout(full_adder_io_18_s_out), .cout(full_adder_io_18_c_out));
    full_adder_io full_adder_io_19(.a(p_0_5_True), .b(full_adder_io_6_c_out_False_True), .cin(full_adder_io_7_s_out_False_True), .sout(full_adder_io_19_s_out), .cout(full_adder_io_19_c_out));
    full_adder_io full_adder_io_20(.a(p_4_7_True), .b(full_adder_io_14_c_out_False_True), .cin(full_adder_io_15_c_out_False_True), .sout(full_adder_io_20_s_out), .cout(full_adder_io_20_c_out));
    full_adder_io full_adder_io_21(.a(p_7_5_True), .b(p_6_6_True), .cin(p_5_7_True), .sout(full_adder_io_21_s_out), .cout(full_adder_io_21_c_out));
    full_adder_io full_adder_io_22(.a(p_2_0_True), .b(p_1_1_True), .cin(1'b1), .sout(full_adder_io_22_s_out), .cout(full_adder_io_22_c_out));
    full_adder_io full_adder_io_23(.a(p_1_2_True), .b(p_0_3_True), .cin(full_adder_io_17_s_out_False_True), .sout(full_adder_io_23_s_out), .cout(full_adder_io_23_c_out));
    full_adder_io full_adder_io_24(.a(p_7_6_True), .b(p_6_7_True), .cin(full_adder_io_21_c_out_False_True), .sout(full_adder_io_24_s_out), .cout(full_adder_io_24_c_out));


    full_adder full_adder_0(.a(full_adder_io_0_c_out_False), .b(full_adder_io_1_s_out_False), .cin(full_adder_io_2_s_out_False), .sout(full_adder_0_s_out), .cout(full_adder_0_c_out));
    full_adder full_adder_1(.a(full_adder_io_2_c_out_False), .b(full_adder_io_3_s_out_False), .cin(full_adder_io_4_s_out_False), .sout(full_adder_1_s_out), .cout(full_adder_1_c_out));
    full_adder full_adder_2(.a(full_adder_io_3_c_out_False), .b(full_adder_io_4_c_out_False), .cin(full_adder_io_5_s_out_False), .sout(full_adder_2_s_out), .cout(full_adder_2_c_out));
    full_adder full_adder_3(.a(full_adder_io_7_c_out_False), .b(full_adder_io_8_c_out_False), .cin(full_adder_io_9_s_out_False), .sout(full_adder_3_s_out), .cout(full_adder_3_c_out));
    full_adder full_adder_4(.a(full_adder_io_9_c_out_False), .b(full_adder_io_10_c_out_False), .cin(full_adder_io_11_s_out_False), .sout(full_adder_4_s_out), .cout(full_adder_4_c_out));
    full_adder full_adder_5(.a(full_adder_io_11_c_out_False), .b(full_adder_0_c_out_False), .cin(full_adder_io_12_s_out_False), .sout(full_adder_5_s_out), .cout(full_adder_5_c_out));
    full_adder full_adder_6(.a(full_adder_io_12_c_out_False), .b(full_adder_1_c_out_False), .cin(full_adder_io_13_s_out_False), .sout(full_adder_6_s_out), .cout(full_adder_6_c_out));
    full_adder full_adder_7(.a(full_adder_io_13_c_out_False), .b(full_adder_2_c_out_False), .cin(full_adder_io_14_s_out_False), .sout(full_adder_7_s_out), .cout(full_adder_7_c_out));
    full_adder full_adder_8(.a(full_adder_io_6_s_out_False), .b(full_adder_io_17_c_out_False), .cin(full_adder_io_18_s_out_False), .sout(full_adder_8_s_out), .cout(full_adder_8_c_out));
    full_adder full_adder_9(.a(full_adder_io_8_s_out_False), .b(full_adder_io_18_c_out_False), .cin(full_adder_io_19_s_out_False), .sout(full_adder_9_s_out), .cout(full_adder_9_c_out));
    full_adder full_adder_10(.a(full_adder_io_10_s_out_False), .b(full_adder_io_19_c_out_False), .cin(full_adder_3_s_out_False), .sout(full_adder_10_s_out), .cout(full_adder_10_c_out));
    full_adder full_adder_11(.a(full_adder_0_s_out_False), .b(full_adder_3_c_out_False), .cin(full_adder_4_s_out_False), .sout(full_adder_11_s_out), .cout(full_adder_11_c_out));
    full_adder full_adder_12(.a(full_adder_1_s_out_False), .b(full_adder_4_c_out_False), .cin(full_adder_5_s_out_False), .sout(full_adder_12_s_out), .cout(full_adder_12_c_out));
    full_adder full_adder_13(.a(full_adder_2_s_out_False), .b(full_adder_5_c_out_False), .cin(full_adder_6_s_out_False), .sout(full_adder_13_s_out), .cout(full_adder_13_c_out));
    full_adder full_adder_14(.a(full_adder_io_15_s_out_False), .b(full_adder_6_c_out_False), .cin(full_adder_7_s_out_False), .sout(full_adder_14_s_out), .cout(full_adder_14_c_out));
    full_adder full_adder_15(.a(full_adder_io_16_s_out_False), .b(full_adder_7_c_out_False), .cin(full_adder_io_20_s_out_False), .sout(full_adder_15_s_out), .cout(full_adder_15_c_out));
    full_adder full_adder_16(.a(full_adder_io_16_c_out_False), .b(full_adder_io_20_c_out_False), .cin(full_adder_io_21_s_out_False), .sout(full_adder_16_s_out), .cout(full_adder_16_c_out));

    assign result_a = {1'b0, p_7_7_True, full_adder_16_c_out_False, full_adder_15_c_out_False, full_adder_14_c_out_False, full_adder_13_c_out_False, full_adder_12_c_out_False, full_adder_11_c_out_False, full_adder_10_c_out_False, full_adder_9_c_out_False, full_adder_8_c_out_False, full_adder_io_23_c_out_False, full_adder_io_22_c_out_False, p_0_2_True, p_1_0_True, p_0_0_True};
    assign result_b = {1'b0, full_adder_io_24_c_out_False, full_adder_io_24_s_out_False, full_adder_16_s_out_False, full_adder_15_s_out_False, full_adder_14_s_out_False, full_adder_13_s_out_False, full_adder_12_s_out_False, full_adder_11_s_out_False, full_adder_10_s_out_False, full_adder_9_s_out_False, full_adder_8_s_out_False, full_adder_io_23_s_out_False, full_adder_io_22_s_out_False, p_0_1_True, 1'b0};

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

module full_adder_io(
    input  a,
    input  b,
    input  cin,
    output cout,
    output sout
);
    assign {cout, sout} = ~(a + b + cin);
endmodule