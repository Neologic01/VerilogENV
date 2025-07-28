module mult_wallace
(

    input  wire      A1,
    input  wire      A2,
    input  wire      A3,
    input  wire      A4,
    input  wire      A5,
    input  wire      A6,


    output wire      CO,
    output wire      S1,
    output wire      S2

   
);
    wire                  S_1;
    wire                  CO_1;

    wire                  S_2;
    wire                  CO_2;
 
    wire                  S_3;
    wire                  CO_3;

    wire                  S_4;
    wire                  CO_4;
 

    full_adder fadder_w1_0(.a(A1), .b(A2), .cin(A3), .sout(S_1), .cout(CO_1));
    full_adder fadder_w2_0(.a(A4), .b(A5), .cin(A6), .sout(S_2), .cout(CO_2));
    full_adder fadder_w3_0(.a(1'b0), .b(S_1), .cin(S_2), .sout(S_3), .cout(CO_3));
    full_adder fadder_w4_0(.a(CO_1), .b(CO_2), .cin(CO_3), .sout(S_4), .cout(CO_4));


    assign S1 = S_3;
    assign S2 = S_4;
    assign CO = CO_4;

   
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











