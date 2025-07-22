module mult_wallace
(
    input  wire [3:0]     operand_a,
    input  wire [3:0]     operand_b,
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
    wire                  hadder_w1_0_sout;
    wire                  hadder_w1_0_cout;
    wire                  hadder_w2_0_sout;
    wire                  hadder_w2_0_cout;
    wire                  hadder_w3_0_sout;
    wire                  hadder_w3_0_cout;
    wire                  hadder_w4_0_sout;
    wire                  hadder_w4_0_cout;

    wire                  fadder_w1_0_sout;
    wire                  fadder_w1_0_cout;
    wire                  fadder_w2_0_sout;
    wire                  fadder_w2_0_cout;
    wire                  fadder_w3_0_sout;
    wire                  fadder_w3_0_cout;
    wire                  fadder_w4_0_sout;
    wire                  fadder_w4_0_cout;
    wire                  fadder_w5_0_sout;
    wire                  fadder_w5_0_cout;
    wire                  fadder_w6_0_sout;
    wire                  fadder_w6_0_cout;
    wire                  fadder_w7_0_sout;
    wire                  fadder_w7_0_cout;
    wire                  fadder_w8_0_sout;
    wire                  fadder_w8_0_cout;



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


    half_adder hadder_w1_0(.a(p_0_1), .b(p_1_0), .sout(hadder_w1_0_sout), .cout(hadder_w1_0_cout));
    full_adder fadder_w1_0(.a(p_0_2), .b(p_1_1), .cin(hadder_w1_0_cout), .sout(fadder_w1_0_sout), .cout(fadder_w1_0_cout));
    half_adder hadder_w2_0(.a(p_2_0), .b(fadder_w1_0_sout), .sout(hadder_w2_0_sout), .cout(hadder_w2_0_cout));
    full_adder fadder_w2_0(.a(p_0_3), .b(p_1_2), .cin(fadder_w1_0_cout), .sout(fadder_w2_0_sout), .cout(fadder_w2_0_cout));
    full_adder fadder_w3_0(.a(p_2_1), .b(fadder_w2_0_sout), .cin(hadder_w2_0_cout), .sout(fadder_w3_0_sout), .cout(fadder_w3_0_cout));
    half_adder hadder_w3_0(.a(p_3_0), .b(fadder_w3_0_sout), .sout(hadder_w3_0_sout), .cout(hadder_w3_0_cout));
    full_adder fadder_w4_0(.a(p_1_3), .b(p_2_2), .cin(fadder_w2_0_cout), .sout(fadder_w4_0_sout), .cout(fadder_w4_0_cout));
    full_adder fadder_w5_0(.a(p_3_1), .b(fadder_w4_0_sout), .cin(fadder_w3_0_cout), .sout(fadder_w5_0_sout), .cout(fadder_w5_0_cout)); 
    half_adder hadder_w4_0(.a(fadder_w5_0_sout), .b(hadder_w3_0_cout), .sout(hadder_w4_0_sout), .cout(hadder_w4_0_cout));
    full_adder fadder_w6_0(.a(p_2_3), .b(p_3_2), .cin(fadder_w4_0_cout), .sout(fadder_w6_0_sout), .cout(fadder_w6_0_cout));
    full_adder fadder_w7_0(.a(fadder_w6_0_sout), .b(fadder_w5_0_cout), .cin(hadder_w4_0_cout), .sout(fadder_w7_0_sout), .cout(fadder_w7_0_cout));
    full_adder fadder_w8_0(.a(p_3_3), .b(fadder_w6_0_cout), .cin(fadder_w7_0_cout), .sout(fadder_w8_0_sout), .cout(fadder_w8_0_cout));





    assign result_final[0] = p_0_0;
    assign result_final[1] = hadder_w1_0_sout;
    assign result_final[2] = hadder_w2_0_sout;
    assign result_final[3] = hadder_w3_0_sout;
    assign result_final[4] = hadder_w4_0_sout;
    assign result_final[5] = fadder_w7_0_sout;
    assign result_final[6] = fadder_w8_0_sout;
    assign result_final[7] = fadder_w8_0_cout;
    assign result_final[8] = 1'b0 ;
    
    
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











