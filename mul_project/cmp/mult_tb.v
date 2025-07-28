`timescale 1ns / 1ps

module tb_mult_wallace;

  // Inputs
  reg A1, A2, A3, A4, A5, A6;
  // reg CI;

  // Outputs
  wire CO, S1, S2;

  // Instantiate the Device Under Test (DUT)
  mult_wallace dut (
    .A1(A1), .A2(A2), .A3(A3),
    .A4(A4), .A5(A5), .A6(A6),
    // .CI(CI),
    .CO(CO), .S1(S1), .S2(S2)
  );

  // Test logic
  initial begin
    // Optionally create a VCD
    $dumpfile("tb_mult_wallace.vcd");
    $dumpvars(0, tb_mult_wallace);

    // Test all 128 combinations (7 bits total)
    for (int i = 0; i < 64; i++) begin
      {A1, A2, A3, A4, A5, A6} = i[5:0];
      #10; // wait for 10 ns
      $display("Inputs: %b -> CO: %b, S2: %b, S1: %b", i[5:0],CO, S2, S1 );
    end

    $finish;
  end

endmodule