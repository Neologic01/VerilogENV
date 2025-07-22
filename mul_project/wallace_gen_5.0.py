#!/usr/bin/env python3

import argparse

parser = argparse.ArgumentParser(
                    prog='wallace_gen_5.0.py',
                    description='This program generates Wallace multiplier RTL')
                    
parser.add_argument('--insize', default=8, type=int, help='Input vector bitwidth; max 64')
parser.add_argument('--outsize', default=16, type=int, help='Output vector bitwidth; should be >= (2*insize)')
parser.add_argument('--type', default='unsigned', nargs='?', choices=['signed', 'unsigned'], help='Multiplier type (signed/unsigned)')
parser.add_argument('--usecmp', default='n', nargs='?', choices=['n', 'y'], help='Use 4:2 compressors (n/y)')
parser.add_argument('--output', default="/project/cadscripts/NeoLogic-TeamScripts/verilog/logs/wallace_8_unsigned.txt", help='Output file name')

args = parser.parse_args()

args.output = f"mul_{args.insize}_wallace.v"

M = args.insize

if(args.type == 'signed'):
    IS_SIGNED = 1
else:
    IS_SIGNED = 0

EXT = args.outsize

if(args.usecmp == 'y'):
    USE_COMPS = 1
else:
    USE_COMPS = 0

if(M > 64):
    print("ERROR: insize should be <= 64 - exiting...")
    exit()

if(EXT < 2*M):
    print("ERROR: outsize should be >= (2*insize) - exiting...")
    exit()

N = M

max_weight = M+N

hadder_sout_path = 1
hadder_cout_path = 1

fadder_sout_path = 1
fadder_cout_path = 1

def get_path_length(wire_in):
    return wire_in[2]

def get_path_delay(wire_in):
    return wire_in[3]

def get_is_cout(wire_in):
    return wire_in[4]

def get_is_ccout(wire_in):
    return wire_in[5]

wires = []
final_adder_inputs = []

for i in range(0, M):
    for j in range(0, N):
        line = "p_%d_%d" % (i, j)
        weight = i + j
        path_length = 0
        path_delay = 0
        is_cout = 0
        is_ccout = 0
        wires.append([line, weight, path_length, path_delay, is_cout, is_ccout])

if(IS_SIGNED == 1):
    line ="X%dY%d_sum_s" % ((N-1), (N-1))
    wires.append([line, N-1, 0, 0, 0, 0])
    line ="X%dY%d_sum_c" % ((N-1), (N-1))
    wires.append([line, N, 0, 0, 0, 0])
    line ="X%d_nsign" % (N-1)
    wires.append([line, 2*N-2, 0, 0, 0, 0])
    line ="Y%d_nsign" % (N-1)
    wires.append([line, 2*N-2, 0, 0, 0, 0])

if(USE_COMPS == 1):
    zero_wire = ["logic_0", 0, 0, 0]
    wires.append(zero_wire)


half_adders = []
full_adders = []
compressors_4_2 = []

if(IS_SIGNED == 1):
    in_a = "operand_a[%d]" % (N-1)
    in_b = "operand_b[%d]" % (N-1)
    s_out_name = "X%dY%d_sum_s" % ((N-1), (N-1))
    carry_name = "X%dY%d_sum_c" % ((N-1), (N-1))
    half_adders.append(["hadder_signadd", in_a, in_b, s_out_name, carry_name])


for current_weight in range(0, max_weight):
    curr_weight_wires = []
    half_adder_num = 0
    full_adder_num = 0
    compressor_4_2_num = 0
    for curr_wire in wires:
        if curr_wire[1] == current_weight:
            curr_weight_wires.append(curr_wire)
    while len(curr_weight_wires) > 2:
        curr_weight_wires.sort(key=get_path_delay)
        if len(curr_weight_wires) == 3:
            half_adder_name = "hadder_w%d_%d" % (current_weight, half_adder_num)
            s_out_name = "hadder_w%d_%d_sout" % (current_weight, half_adder_num)
            c_out_name = "hadder_w%d_%d_cout" % (current_weight, half_adder_num)
            half_adders.append([half_adder_name, curr_weight_wires[0][0], curr_weight_wires[1][0], s_out_name, c_out_name])
            path_length = max(curr_weight_wires[0][2], curr_weight_wires[1][2])
            path_delay = max(curr_weight_wires[0][3], curr_weight_wires[1][3])
            wires.append([s_out_name, current_weight, path_length + 1, path_delay + hadder_sout_path, 0, 0])
            wires.append([c_out_name, current_weight+1, path_length + 1, path_delay + hadder_cout_path, 1, 0])
            del curr_weight_wires[0]
            del curr_weight_wires[0]
            curr_weight_wires.append([s_out_name, current_weight, path_length + 1, path_delay + hadder_sout_path, 0, 0])
            half_adder_num = half_adder_num + 1
        if (len(curr_weight_wires) > 3 and USE_COMPS == 0) or (len(curr_weight_wires) == 4 and USE_COMPS == 1):
            full_adder_name = "fadder_w%d_%d" % (current_weight, full_adder_num)
            s_out_name = "fadder_w%d_%d_sout" % (current_weight, full_adder_num)
            c_out_name = "fadder_w%d_%d_cout" % (current_weight, full_adder_num)
            curr_inputs = []
            curr_inputs.append(curr_weight_wires[0])
            curr_inputs.append(curr_weight_wires[1])
            curr_inputs.append(curr_weight_wires[2])
            curr_inputs.sort(key=get_is_cout, reverse=True)
            full_adders.append([full_adder_name, curr_inputs[2][0], curr_inputs[1][0], curr_inputs[0][0], s_out_name, c_out_name])
            path_length = max(curr_weight_wires[0][2], curr_weight_wires[1][2], curr_weight_wires[2][2])
            path_delay = max(curr_weight_wires[0][3], curr_weight_wires[1][3], curr_weight_wires[2][3])
            wires.append([s_out_name, current_weight, path_length + 1, path_delay + fadder_sout_path, 0, 0])
            wires.append([c_out_name, current_weight+1, path_length + 1, path_delay + fadder_cout_path, 1, 0])
            del curr_weight_wires[0]
            del curr_weight_wires[0]
            del curr_weight_wires[0]
            curr_weight_wires.append([s_out_name, current_weight, path_length + 1, path_delay + fadder_sout_path, 0, 0])
            full_adder_num = full_adder_num + 1
        if (len(curr_weight_wires) == 5 and USE_COMPS == 1):
            compressor_4_2_name = "comp_4_2_w%d_%d" % (current_weight, compressor_4_2_num)
            s_out_name = "comp_4_2_w%d_%d_sout" % (current_weight, compressor_4_2_num)
            c_out_name = "comp_4_2_w%d_%d_carry" % (current_weight, compressor_4_2_num)
            cc_out_name = "comp_4_2_w%d_%d_cout" % (current_weight, compressor_4_2_num)
            curr_inputs = []
            curr_inputs.append(curr_weight_wires[0])
            curr_inputs.append(curr_weight_wires[1])
            curr_inputs.append(curr_weight_wires[2])
            curr_inputs.append(curr_weight_wires[3])
            del curr_weight_wires[0]
            del curr_weight_wires[0]
            del curr_weight_wires[0]
            del curr_weight_wires[0]
            curr_inputs.sort(key=get_is_ccout, reverse=True)
            if(get_is_ccout(curr_inputs[0])):
                compressors_4_2.append([compressor_4_2_name, zero_wire[0], curr_inputs[3][0], curr_inputs[2][0], curr_inputs[1][0], curr_inputs[0][0], s_out_name, c_out_name, cc_out_name])
                path_delay_ccout = max(curr_inputs[3][3], curr_inputs[2][3]) + 1
                path_delay_sout = max(path_delay_ccout, curr_inputs[1][3], curr_inputs[0][3]) + 1
                path_delay_cout = path_delay_sout
                path_length_ccout = max(curr_inputs[3][2], curr_inputs[2][2]) + 1
                path_length_sout = max(curr_inputs[3][2], curr_inputs[2][2], curr_inputs[1][2], curr_inputs[0][2]) + 1
                path_length_cout = path_length_sout
            else:
                compressors_4_2.append([compressor_4_2_name, curr_inputs[3][0], curr_inputs[2][0], curr_inputs[1][0], curr_inputs[0][0], zero_wire[0], s_out_name, c_out_name, cc_out_name])
                path_delay_ccout = max(curr_inputs[3][3], curr_inputs[2][3], curr_inputs[1][3]) + 1
                path_delay_sout = max(path_delay_ccout, curr_inputs[0][3]) + 1
                path_delay_cout = path_delay_sout
                path_length_ccout = max(curr_inputs[3][2], curr_inputs[2][2], curr_inputs[1][2]) + 1
                path_length_sout = max(curr_inputs[3][2], curr_inputs[2][2], curr_inputs[1][2], curr_inputs[0][2]) + 1
                path_length_cout = path_length_sout
            wires.append([s_out_name, current_weight, path_length_sout, path_delay_sout, 0, 0])
            wires.append([c_out_name, current_weight+1, path_length_cout, path_delay_cout, 1, 0])
            wires.append([cc_out_name, current_weight+1, path_length_ccout, path_delay_ccout, 0, 1])
            curr_weight_wires.append([s_out_name, current_weight, path_length_sout, path_delay_sout, 0, 0])
            compressor_4_2_num = compressor_4_2_num + 1
        if (len(curr_weight_wires) > 5 and USE_COMPS == 1):
            compressor_4_2_name = "comp_4_2_w%d_%d" % (current_weight, compressor_4_2_num)
            s_out_name = "comp_4_2_w%d_%d_sout" % (current_weight, compressor_4_2_num)
            c_out_name = "comp_4_2_w%d_%d_carry" % (current_weight, compressor_4_2_num)
            cc_out_name = "comp_4_2_w%d_%d_cout" % (current_weight, compressor_4_2_num)
            curr_inputs = []
            curr_inputs.append(curr_weight_wires[0])
            curr_inputs.append(curr_weight_wires[1])
            curr_inputs.append(curr_weight_wires[2])
            curr_inputs.append(curr_weight_wires[3])
            curr_inputs.append(curr_weight_wires[4])
            del curr_weight_wires[0]
            del curr_weight_wires[0]
            del curr_weight_wires[0]
            del curr_weight_wires[0]
            del curr_weight_wires[0]
            curr_inputs.sort(key=get_is_ccout, reverse=True)
            compressors_4_2.append([compressor_4_2_name, curr_inputs[4][0], curr_inputs[3][0], curr_inputs[2][0], curr_inputs[1][0], curr_inputs[0][0], s_out_name, c_out_name, cc_out_name])
            path_delay_ccout = max(curr_inputs[4][3], curr_inputs[3][3], curr_inputs[2][3]) + 1
            path_delay_sout = max(path_delay_ccout, curr_inputs[1][3], curr_inputs[0][3]) + 1
            path_delay_cout = path_delay_sout
            path_length_ccout = max(curr_inputs[4][2], curr_inputs[3][2], curr_inputs[2][2]) + 1
            path_length_sout = max(curr_inputs[4][2], curr_inputs[3][2], curr_inputs[2][2], curr_inputs[1][2], curr_inputs[0][2]) + 1
            path_length_cout = path_length_sout
            wires.append([s_out_name, current_weight, path_length_sout, path_delay_sout, 0, 0])
            wires.append([c_out_name, current_weight+1, path_length_cout, path_delay_cout, 1, 0])
            wires.append([cc_out_name, current_weight+1, path_length_ccout, path_delay_ccout, 0, 1])
            curr_weight_wires.append([s_out_name, current_weight, path_length_sout, path_delay_sout, 0, 0])
            compressor_4_2_num = compressor_4_2_num + 1
                
        
    for curr_wire in curr_weight_wires:
        final_adder_inputs.append(curr_wire)

fout = open(args.output, "w")

fout.write("module mult_wallace\n")
fout.write("(\n")
fout.write("{: <25} {: <0}".format("    input  wire [%d:0]" % (M-1), "operand_a,\n"))
fout.write("{: <25} {: <0}".format("    input  wire [%d:0]" % (N-1), "operand_b,\n"))
fout.write("{: <25} {: <0}".format("    output wire [%d:0]" % (EXT-1), "result_a,\n"))
fout.write("{: <25} {: <0}".format("    output wire [%d:0]" % (EXT-1), "result_b\n"))
fout.write(");\n")
fout.write("\n")

for current_wire in wires:
    fout.write("{: <25} {: <0}".format("    wire", "%s;\n" % current_wire[0]))
fout.write("\n")

if(IS_SIGNED == 1):
    for i in range(0, M):
        for j in range(0, N):
            line = "p_%d_%d" % (i, j)
            if(j == (N-1) and i != (N-1)):
                op_a = "~operand_a"
            else:
                op_a = "operand_a"
            if(i == (N-1) and j != (N-1)):
                op_b = "~operand_b"
            else:
                op_b = "operand_b"
            fout.write("    assign %s = %s[%d] & %s[%d];\n" % (line, op_a, i, op_b, j))
    fout.write("    assign X%d_nsign = ~operand_a[%d];\n" % (N-1, N-1))
    fout.write("    assign Y%d_nsign = ~operand_b[%d];\n" % (N-1, N-1))
else:
    for i in range(0, M):
        for j in range(0, N):
            line = "p_%d_%d" % (i, j)
            fout.write("    assign %s = operand_a[%d] & operand_b[%d];\n" % (line, i, j))

fout.write("\n")

for current_adder in half_adders:
    fout.write("    half_adder %s(.a(%s), .b(%s), .sout(%s), .cout(%s));\n" % (current_adder[0], current_adder[1], current_adder[2], current_adder[3], current_adder[4]))

for current_adder in full_adders:
    fout.write("    full_adder %s(.a(%s), .b(%s), .cin(%s), .sout(%s), .cout(%s));\n" % (current_adder[0], current_adder[1], current_adder[2], current_adder[3], current_adder[4], current_adder[5]))

if(USE_COMPS == 1):
    for current_comp in compressors_4_2:
        fout.write("    comp_4_2 %s(.a(%s), .b(%s), .c(%s), .d(%s), .cin(%s), .sout(%s), .carry(%s), .cout(%s));\n" % (current_comp[0], current_comp[1], current_comp[2], current_comp[3], current_comp[4], current_comp[5], current_comp[6], current_comp[7], current_comp[8]))
    fout.write("\n")
    fout.write("    assign logic_0 = 1'b0;\n")

fout.write("\n")
    
fout.write("    assign result_a[0] = p_0_0;\n")


for current_weight in range(1, max_weight):
    curr_weight_wires = []
    for curr_wire in final_adder_inputs:
        if curr_wire[1] == current_weight:
            curr_weight_wires.append(curr_wire)
    curr_weight_wires.sort(key=get_path_length)
    if(len(curr_weight_wires) > 0):
        fout.write("    assign result_a[%d] = %s;\n" % (current_weight, curr_weight_wires[0][0]))
    else:
        fout.write("    assign result_a[%d] = 1'b0;\n" % (current_weight))
        
for current_weight in range(max_weight, EXT):
    fout.write("    assign result_a[%d] = 1'b0;\n" % (current_weight))

fout.write("\n")

fout.write("    assign result_b[0] = 1'b0;\n")
for current_weight in range(1, max_weight):
    curr_weight_wires = []
    for curr_wire in final_adder_inputs:
        if curr_wire[1] == current_weight:
            curr_weight_wires.append(curr_wire)
    curr_weight_wires.sort(key=get_path_length)
    if(len(curr_weight_wires) > 1):
        fout.write("    assign result_b[%d] = %s;\n" % (current_weight, curr_weight_wires[1][0]))
    else:
        if(IS_SIGNED == 1):
            fout.write("    assign result_b[%d] = 1'b1;\n" % (current_weight))
        else:
            fout.write("    assign result_b[%d] = 1'b0;\n" % (current_weight))

for current_weight in range(max_weight, EXT):
    if(IS_SIGNED == 1):
        fout.write("    assign result_b[%d] = 1'b1;\n" % (current_weight))
    else:
        fout.write("    assign result_b[%d] = 1'b0;\n" % (current_weight))


fout.write("\n")
fout.write("/* PATH LENGTHS:\n")
fout.write("\n")

for current_weight in range(1, max_weight):
    for curr_wire in final_adder_inputs:
        if curr_wire[1] == current_weight:
            fout.write("{: <35} {: <0}".format("    %s" % curr_wire[0], "%d\n" % curr_wire[2]))
fout.write("\n")
fout.write("*/\n")
fout.write("\n")

fout.write("endmodule\n")

fout.close()

print("RTL generated successfully!")
