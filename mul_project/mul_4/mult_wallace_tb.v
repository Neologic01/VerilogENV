function real decode_4bit_fp;
    input [3:0] val;
    reg sign;
    reg [1:0] exp;
    reg mant;
    integer bias;
    real exponent, base, result;
    begin
        bias = 1;
        sign = val[3];
        exp  = val[2:1];
        mant = val[0];
        exponent = exp - bias;
        base = 2.0;
        result = (sign ? -1.0 : 1.0) * (1.0 + mant * 0.5) * (base ** exponent);
        decode_4bit_fp = result;
    end
endfunction


module mult_wallace_tb;
    reg  [7:0] operand_a, operand_b;
    wire [16:0] result_final;

    mult_wallace uut (
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
        $dumpvars(0, mult_wallace_tb);
        $display("Writing VCD to %s", vcdfile);

        for (i = 0; i < 8; i = i + 1) begin
            for (j = 0; j < 8; j = j + 1) begin
                operand_a = i | 4'b10000000;
                operand_b = j | 4'b10000000;
                #1;
                // $display("a = %2d, b = %2d -> result = %4d", i, j, result_final);
                $display("a = %2d, b = %2d -> result = %3d", i, j, result_final & 4'b0111);
                
            end
        end
        $finish;
    end
endmodule
