module mult_tb;
    reg  [7:0] operand_a, operand_b;
    wire [16:0] result_final;

    mult_module uut (
        .operand_a(operand_a),
        .operand_b(operand_b),
        .result_final(result_final)
        //,.result_a(), .result_b()
    );

    reg [1023:0] vcdfile;

    integer i, j;
    initial begin
        if (!$value$plusargs("vcd=%s", vcdfile)) begin
            vcdfile = "wave_default.vcd";  // fallback
        end

        $dumpfile(vcdfile);
        $dumpvars(0, mult_tb);
        $display("Writing VCD to %s", vcdfile);

        for (i = 0; i < 8; i = i + 1) begin
            for (j = 0; j < 8; j = j + 1) begin
                operand_a = i | 4'b10000000;
                operand_b = j | 4'b10000000;
                #1;
                // $display("a = %2d, b = %2d -> result = %4d", i, j, result_final);
                $display("a = %2d, b = %2d -> result = %3d", i, j, result_final & 8'b01111111);
                
            end
        end
        $finish;
    end
endmodule
