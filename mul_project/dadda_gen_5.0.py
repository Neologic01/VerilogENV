#!/usr/bin/env python3

import argparse
import math

parser = argparse.ArgumentParser(
                    prog='dadda_gen_5.0.py',
                    description='This program generates Dadda multiplier RTL using inverted logic')
                    
parser.add_argument('--insize', default=8, type=int, help='Input vector bitwidth; max 64')
parser.add_argument('--add_cin', default='n', nargs='?', choices=['n', 'y'], help='Add add_in input (n/y)')
parser.add_argument('--output', default="", help='Output file name')

args = parser.parse_args()

M = args.insize

if(args.add_cin == 'y'):
    ADD_C_IN = 1
else:
    ADD_C_IN = 0


EXT = 2*(M)

if(M > 64):
    print("ERROR: insize should be <= 64 - exiting...")
    exit()

#if(EXT < 2*M):
#    print("ERROR: outsize should be >= (2*insize) - exiting...")
#    exit()

N = M

max_weight = EXT

hadder_sout_path = 1
hadder_cout_path = 1

fadder_sout_path = 1
fadder_cout_path = 1

def get_path_length(wire_in):
    return wire_in[2]
    
def is_inverted(wire_in):
    return wire_in[3]
    
def build_cell_type_array(nstages_in, ncells_in, start_index_in):
    cell_types_out = []
    for i in range(0, nstages_in):
        cell_types_out.append((i + start_index_in) % ncells_in)
    return cell_types_out


def build_polarity_scheme_array(cell_types_in, set_inv_outs_in):
    polarity_scheme_out = []
    polarity_scheme_out.append(1)
    for ct in cell_types_in:
        if(set_inv_outs_in[ct] == 1):
            polarity_scheme_out.append(1 - polarity_scheme_out[-1])
        else:
            polarity_scheme_out.append(polarity_scheme_out[-1])
    return polarity_scheme_out

############################################################################


wires = []
final_adder_inputs = []

for i in range(0, M):
    for j in range(0, N):
        line = "p_%d_%d" % (i, j)
        weight = i + j
        path_length = 0
        inverted = 1
        wires.append([line, weight, path_length, inverted, ""])

if(ADD_C_IN == 1):
    for i in range(0, EXT):
        line = "add_%d" % i
        weight = i
        path_length = 0
        inverted = 1
        wires.append([line, weight, path_length, inverted, ""])
    
half_adders = []
full_adders = []

half_adders.append([])
half_adders.append([])
half_adders.append([])

full_adders.append([])
full_adders.append([])
full_adders.append([])


curr_stage_columns = []
stage_sizes = []

for current_weight in range(0, max_weight):
    stage_sizes.append(0)
    
for current_weight in range(0, max_weight):
    curr_weight_wires = []
    for curr_wire in wires:
        if curr_wire[1] == current_weight:
            curr_weight_wires.append(curr_wire)
            stage_sizes[current_weight] = stage_sizes[current_weight] + 1
    curr_stage_columns.append(curr_weight_wires)

max_stage_size = max(stage_sizes)

stages_heights = []

m = 2

while(m < max_stage_size):
    stages_heights.insert(0, m)
    m = math.floor(m*1.5)

nstages = len(stages_heights)


# Describe cell properties

suffixes = ["", "_io"]
set_inv_outs = [0, 1]
cell_swaps = [1, 0]

#######################################################

cell_types = build_cell_type_array(nstages, len(set_inv_outs), 0)
polarity_scheme = build_polarity_scheme_array(cell_types, set_inv_outs)

if(polarity_scheme[-1] == 1):
    cell_types = build_cell_type_array(nstages, len(set_inv_outs), 1)
    polarity_scheme = build_polarity_scheme_array(cell_types, set_inv_outs)

if(polarity_scheme[-1] == 1):
    cell_types[-1] = 1 - cell_types[-1]
    polarity_scheme = build_polarity_scheme_array(cell_types, set_inv_outs)


stage_out_polarity = polarity_scheme[1:]


#######################################################
for current_stage in range (0, nstages):

    next_stage_columns = []
    
    for current_weight in range(0, max_weight):
        next_stage_columns.append([])
    
    for column_index in range(0, max_weight):
        half_adder_nums = [0, 0, 0]
        full_adder_nums = [0, 0, 0]
        n_to_reduce = 1              # dummy assign just to simplify while loop
        while(n_to_reduce):
            nsignals = len(curr_stage_columns[column_index]) + len(next_stage_columns[column_index])
            if(nsignals <= stages_heights[current_stage]):
                n_to_reduce = 0
                for curr_signal in curr_stage_columns[column_index]:
                    next_stage_columns[column_index].append(curr_signal)
            else:
                n_to_reduce = nsignals - stages_heights[current_stage]
                if(len(curr_stage_columns[column_index]) < 2):
                    print("error")
                    exit()
            curr_stage_columns[column_index].sort(key=get_path_length, reverse=False)
            cell_type = cell_types[current_stage]
            expected_input_polarity = polarity_scheme[current_stage]
            if(n_to_reduce == 1):
                if(is_inverted(curr_stage_columns[column_index][0]) != expected_input_polarity and is_inverted(curr_stage_columns[column_index][1]) != expected_input_polarity):
#                    print("swapping hadder cell type for input signals %s and %s" % (curr_stage_columns[column_index][0][0], curr_stage_columns[column_index][1][0]))
                    cell_type = cell_swaps[cell_type]
                    expected_input_polarity = 1 - expected_input_polarity
                suffix = suffixes[cell_type]
                full_adder_name = "fadder%s_st%d_col%d_%d" % (suffix, current_stage, column_index, full_adder_nums[cell_type])
                s_out_name = "fadder%s_st%d_col%d_%d_sout" % (suffix, current_stage, column_index, full_adder_nums[cell_type])
                carry_name = "fadder%s_st%d_col%d_%d_carry" % (suffix, current_stage, column_index, full_adder_nums[cell_type])
                ain_name = curr_stage_columns[column_index][0][0]
                bin_name = curr_stage_columns[column_index][1][0]
                ain_path_length = curr_stage_columns[column_index][0][2]
                bin_path_length = curr_stage_columns[column_index][1][2]
                inv_sig_a = ""
                inv_sig_b = ""
                inv_sig_c = ""
                if(is_inverted(curr_stage_columns[column_index][0]) != expected_input_polarity):
#                    print("bad input a (%s) on %s - adding inverter..." % (curr_stage_columns[column_index][0][0], full_adder_name))
                    wires.append([curr_stage_columns[column_index][0][0]+"_inv", curr_stage_columns[column_index][0][1], curr_stage_columns[column_index][0][2]+1, curr_stage_columns[column_index][0][3], curr_stage_columns[column_index][0][0]])
                    ain_name = curr_stage_columns[column_index][0][0]+"_inv"
                    ain_path_length = ain_path_length + 1
                    inv_sig_a = curr_stage_columns[column_index][0][0]
                if(is_inverted(curr_stage_columns[column_index][1]) != expected_input_polarity):
#                    print("bad input b (%s) on %s - adding inverter..." % (curr_stage_columns[column_index][1][0], full_adder_name))
                    wires.append([curr_stage_columns[column_index][1][0]+"_inv", curr_stage_columns[column_index][1][1], curr_stage_columns[column_index][1][2]+1, curr_stage_columns[column_index][1][3], curr_stage_columns[column_index][1][0]])
                    bin_name = curr_stage_columns[column_index][1][0]+"_inv"
                    bin_path_length = bin_path_length + 1
                    inv_sig_b = curr_stage_columns[column_index][1][0]
                if(expected_input_polarity == 0):
                    cin_name = "1'b0"
                else:
                    cin_name = "1'b1"
                full_adders[cell_type].append([full_adder_name, ain_name, bin_name, cin_name, s_out_name, carry_name, current_stage, column_index, full_adder_nums[cell_type], inv_sig_a, inv_sig_b, inv_sig_c])
                path_length = max(ain_path_length, bin_path_length) + 1
                del curr_stage_columns[column_index][0]
                del curr_stage_columns[column_index][0]
                next_stage_columns[column_index].append([s_out_name, column_index, path_length, stage_out_polarity[current_stage], ""])
                next_stage_columns[column_index+1].append([carry_name, column_index+1, path_length, stage_out_polarity[current_stage], ""])
                wires.append([s_out_name, column_index, path_length, stage_out_polarity[current_stage], ""])
                wires.append([carry_name, column_index+1, path_length, stage_out_polarity[current_stage], ""])
                full_adder_nums[cell_type] = full_adder_nums[cell_type] + 1
            if(n_to_reduce > 1):
                nbads = 0
                mark_bad = [0, 0, 0]
                for i in range(0, 3):
                    if(is_inverted(curr_stage_columns[column_index][i]) != expected_input_polarity):
                        mark_bad[i] = 1
                        nbads = nbads + 1
                if(nbads > 1):
#                    print("swapping fadder cell type for input signals %s, %s and %s" % (curr_stage_columns[column_index][0][0], curr_stage_columns[column_index][1][0], curr_stage_columns[column_index][2][0]))
                    cell_type = cell_swaps[cell_type]
                    expected_input_polarity = 1 - expected_input_polarity
                    for i in range(0, 3):
                        mark_bad[i] = 1 - mark_bad[i]
                suffix = suffixes[cell_type]
                full_adder_name = "fadder%s_st%d_col%d_%d" % (suffix, current_stage, column_index, full_adder_nums[cell_type])
                s_out_name = "fadder%s_st%d_col%d_%d_sout" % (suffix, current_stage, column_index, full_adder_nums[cell_type])
                carry_name = "fadder%s_st%d_col%d_%d_carry" % (suffix, current_stage, column_index, full_adder_nums[cell_type])
                ain_name = curr_stage_columns[column_index][0][0]
                bin_name = curr_stage_columns[column_index][1][0]
                cin_name = curr_stage_columns[column_index][2][0]
                ain_path_length = curr_stage_columns[column_index][0][2]
                bin_path_length = curr_stage_columns[column_index][1][2]
                cin_path_length = curr_stage_columns[column_index][2][2]
                inv_sig_a = ""
                inv_sig_b = ""
                inv_sig_c = ""
                if(mark_bad[0] == 1):
#                    print("bad input a (%s) on %s - adding inverter..." % (curr_stage_columns[column_index][0][0], full_adder_name))
                    wires.append([curr_stage_columns[column_index][0][0]+"_inv", curr_stage_columns[column_index][0][1], curr_stage_columns[column_index][0][2]+1, curr_stage_columns[column_index][0][3], curr_stage_columns[column_index][0][0]])
                    ain_name = curr_stage_columns[column_index][0][0]+"_inv"
                    ain_path_length = ain_path_length + 1
                    inv_sig_a = curr_stage_columns[column_index][0][0]
                if(mark_bad[1] == 1):
#                    print("bad input b (%s) on %s - adding inverter..." % (curr_stage_columns[column_index][1][0], full_adder_name))
                    wires.append([curr_stage_columns[column_index][1][0]+"_inv", curr_stage_columns[column_index][1][1], curr_stage_columns[column_index][1][2]+1, curr_stage_columns[column_index][1][3], curr_stage_columns[column_index][1][0]])
                    bin_name = curr_stage_columns[column_index][1][0]+"_inv"
                    bin_path_length = bin_path_length + 1
                    inv_sig_b = curr_stage_columns[column_index][1][0]
                if(mark_bad[2] == 1):
#                    print("bad input c (%s) on %s - adding inverter..." % (curr_stage_columns[column_index][2][0], full_adder_name))
                    wires.append([curr_stage_columns[column_index][2][0]+"_inv", curr_stage_columns[column_index][2][1], curr_stage_columns[column_index][2][2]+1, curr_stage_columns[column_index][2][3], curr_stage_columns[column_index][2][0]])
                    cin_name = curr_stage_columns[column_index][2][0]+"_inv"
                    cin_path_length = cin_path_length + 1
                    inv_sig_c = curr_stage_columns[column_index][2][0]
                full_adders[cell_type].append([full_adder_name, ain_name, bin_name, cin_name, s_out_name, carry_name, current_stage, column_index, full_adder_nums[cell_type], inv_sig_a, inv_sig_b, inv_sig_c])
                path_length = max(ain_path_length, bin_path_length, cin_path_length) + 1
                del curr_stage_columns[column_index][0]
                del curr_stage_columns[column_index][0]
                del curr_stage_columns[column_index][0]
                next_stage_columns[column_index].append([s_out_name, column_index, path_length, stage_out_polarity[current_stage], ""])
                next_stage_columns[column_index+1].append([carry_name, column_index+1, path_length, stage_out_polarity[current_stage], ""])
                wires.append([s_out_name, column_index, path_length, stage_out_polarity[current_stage], ""])
                wires.append([carry_name, column_index+1, path_length, stage_out_polarity[current_stage], ""])
                full_adder_nums[cell_type] = full_adder_nums[cell_type] + 1
    
    curr_stage_columns = next_stage_columns
    
final_adder_inputs = []

for column_index in range(0, max_weight):
    if(len(curr_stage_columns[column_index]) > 2):
        print("error")
        exit()
    for curr_wire in curr_stage_columns[column_index]:
        final_adder_inputs.append(curr_wire)

args.output = f"mul_{args.insize}_dadda.v"
fout = open(args.output, "w")

fout.write("module multadd_dadda\n")
fout.write("(\n")
fout.write("{: <25} {: <0}".format("    input  wire [%d:0]" % (M-1), "operand_a,\n"))
fout.write("{: <25} {: <0}".format("    input  wire [%d:0]" % (N-1), "operand_b,\n"))
if(ADD_C_IN == 1):
    fout.write("{: <25} {: <0}".format("    input  wire [%d:0]" % (EXT-1), "add_in,\n"))
fout.write("{: <25} {: <0}".format("    output wire [%d:0]" % (EXT-1), "result_a,\n"))
fout.write("{: <25} {: <0}".format("    output wire [%d:0]" % (EXT-1), "result_b\n"))
fout.write(");\n")
fout.write("\n")

for current_wire in wires:
    fout.write("{: <25} {: <0}".format("    wire", "%s;\n" % current_wire[0]))
fout.write("\n")

for current_wire in wires:
    if(current_wire[4] != ""):
        fout.write("    assign %s = ~%s;\n" % (current_wire[0], current_wire[4]))

for i in range(0, M):
    for j in range(0, N):
        line = "p_%d_%d" % (i, j)
        fout.write("    assign %s = ~(operand_a[%d] & operand_b[%d]);\n" % (line, i, j))

fout.write("\n")

if(ADD_C_IN == 1):
    for i in range(0, EXT):
        line = "add_%d" % i
        fout.write("    assign add_%d = ~add_in[%d];\n" % (i, i))
    fout.write("\n")

ind = 0
for ind in range(len(half_adders)):
    for current_adder in half_adders[ind]:
        fout.write("    half_adder%s %s(.a(%s), .b(%s), .sout(%s), .cout(%s));\n" % (suffixes[ind], current_adder[0], current_adder[1], current_adder[2], current_adder[3], current_adder[4]))

ind = 0
for ind in range(len(full_adders)):
    for current_adder in full_adders[ind]:
        fout.write("    full_adder%s %s(.a(%s), .b(%s), .cin(%s), .sout(%s), .cout(%s));\n" % (suffixes[ind], current_adder[0], current_adder[1], current_adder[2], current_adder[3], current_adder[4], current_adder[5]))
        
fout.write("\n")

for current_weight in range(0, max_weight):
    curr_weight_wires = []
    for curr_wire in final_adder_inputs:
        if curr_wire[1] == current_weight:
            curr_weight_wires.append(curr_wire)
    curr_weight_wires.sort(key=get_path_length)
    if(len(curr_weight_wires) > 0):
        if(is_inverted(curr_weight_wires[0]) == 1):
            fout.write("    assign result_a[%d] = ~%s;\n" % (current_weight, curr_weight_wires[0][0]))
        else:
            fout.write("    assign result_a[%d] = %s;\n" % (current_weight, curr_weight_wires[0][0]))
    else:
        fout.write("    assign result_a[%d] = 1'b0;\n" % (current_weight))
        
fout.write("\n")

for current_weight in range(0, max_weight):
    curr_weight_wires = []
    for curr_wire in final_adder_inputs:
        if curr_wire[1] == current_weight:
            curr_weight_wires.append(curr_wire)
    curr_weight_wires.sort(key=get_path_length)
    if(len(curr_weight_wires) > 1):
        if(is_inverted(curr_weight_wires[1]) == 1):
            fout.write("    assign result_b[%d] = ~%s;\n" % (current_weight, curr_weight_wires[1][0]))
        else:
            fout.write("    assign result_b[%d] = %s;\n" % (current_weight, curr_weight_wires[1][0]))
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
