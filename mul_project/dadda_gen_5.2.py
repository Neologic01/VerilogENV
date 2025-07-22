#!/usr/bin/env python3

import argparse
import math
import cairo

parser = argparse.ArgumentParser(
                    prog='dadda_gen_5.0.py',
                    description='This program generates Dadda multiplier RTL using inverted logic')
                    
parser.add_argument('--insize', default=8, type=int, help='Input vector bitwidth; max 64')
parser.add_argument('--add_cin', default='n', nargs='?', choices=['n', 'y'], help='Add add_in input (n/y)')
parser.add_argument('--output', default="/project/cadscripts/NeoLogicRoot/verilog_project/mul_8_dadda.v", help='Output file name')

args = parser.parse_args()

M = args.insize

if(args.add_cin == 'y'):
    ADD_C_IN = 1
else:
    ADD_C_IN = 0


# EXT = 2*(M+1)
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


############################################################################################################################


def draw_rect_frame(width, height):
    ctx.set_source_rgb(0, 0, 0)
    ctx.set_line_width(1)
    ctx.move_to(0, 0)
    ctx.line_to(width, 0)
    ctx.line_to(width, height)
    ctx.line_to(0, height)
    ctx.line_to(0, 0)
    ctx.stroke()
    
    
def draw_rect_frame_with_text(width, height, text):
    ctx.set_source_rgb(0, 0, 0)
    ctx.set_line_width(1)
    ctx.move_to(0, 0)
    ctx.line_to(width, 0)
    ctx.line_to(width, height)
    ctx.line_to(0, height)
    ctx.line_to(0, 0)
    ctx.stroke()
    ctx.set_font_size(15)
    txt_size = ctx.text_extents(text)
    ts_x = (width - txt_size.width) / 2
    ts_y = height/2 + txt_size.height/4
    ctx.move_to(ts_x, ts_y)
    ctx.show_text(text)
    ctx.set_font_size(10)
    ctx.stroke()

def draw_ha_ii(width, height, name_ina, name_inb, name_sout, name_cout):
    draw_rect_frame_with_text(width, height, "HA_II")
    circle_radius = width / 10
    ctx.arc(width/4, -circle_radius, circle_radius, 0, 2 * math.pi)
    ctx.stroke()
    ctx.arc(3*width/4, -circle_radius, circle_radius, 0, 2 * math.pi)
    ctx.stroke()
    ctx.move_to(width/4, -2*circle_radius)
    ctx.line_to(width/4, -2*circle_radius - 0.2*width)
    ctx.stroke()
    ctx.move_to(3*width/4, -2*circle_radius)
    ctx.line_to(3*width/4, -2*circle_radius - 0.2*width)
    ctx.stroke()
    ctx.move_to(0.5*width, height)
    ctx.line_to(0.5*width, height + 0.2*width)
    ctx.stroke()
    ctx.move_to(0, height)
    ctx.line_to(-0.2*width, height + 0.2*width)
    ctx.stroke()
    if(name_ina != ""):
        txt_size = ctx.text_extents(name_ina)
        ctx.move_to(width/4 - txt_size.height/4, -2*circle_radius - 0.2*width - txt_size.width - 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_ina)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_inb != ""):
        txt_size = ctx.text_extents(name_inb)
        ctx.move_to(3*width/4 - txt_size.height/4, -2*circle_radius - 0.2*width - txt_size.width - 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_inb)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_cout != ""):
        txt_size = ctx.text_extents(name_cout)
        ctx.move_to(-0.2*width - txt_size.height/4, height + 0.2*width + 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_cout)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_sout != ""):
        txt_size = ctx.text_extents(name_sout)
        ctx.move_to(0.5*width - txt_size.height/4, height + 0.2*width + 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_sout)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)

def draw_fa(width, height, name_ina, name_inb, name_cin, name_sout, name_cout):
    draw_rect_frame_with_text(width, height, "FA")
    ctx.move_to(width/4, 0)
    ctx.line_to(width/4, -0.2*width)
    ctx.stroke()
    ctx.move_to(3*width/4, 0)
    ctx.line_to(3*width/4, -0.2*width)
    ctx.stroke()
    ctx.move_to(width, 0)
    ctx.line_to(1.2*width , -0.2*width)
    ctx.stroke()

    ctx.move_to(0.5*width, height)
    ctx.line_to(0.5*width, height + 0.2*width)
    ctx.stroke()
    ctx.move_to(0, height)
    ctx.line_to(-0.2*width, height + 0.2*width)
    ctx.stroke()
    if(name_ina != ""):
        txt_size = ctx.text_extents(name_ina)
        ctx.move_to(width/4 - txt_size.height/4, -0.2*width - txt_size.width - 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_ina)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_inb != ""):
        txt_size = ctx.text_extents(name_inb)
        ctx.move_to(3*width/4 - txt_size.height/4, -0.2*width - txt_size.width - 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_inb)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_cin != ""):
        txt_size = ctx.text_extents(name_cin)
        ctx.move_to(1.2*width - txt_size.height/4, -0.2*width - txt_size.width - 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_cin)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_cout != ""):
        txt_size = ctx.text_extents(name_cout)
        ctx.move_to(-0.2*width - txt_size.height/4, height + 0.2*width + 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_cout)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_sout != ""):
        txt_size = ctx.text_extents(name_sout)
        ctx.move_to(0.5*width - txt_size.height/4, height + 0.2*width + 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_sout)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)

def draw_fa_ii(width, height, name_ina, name_inb, name_cin, name_sout, name_cout):
    draw_rect_frame_with_text(width, height, "FA_II")
    circle_radius = width / 10
    ctx.arc(width/4, -circle_radius, circle_radius, 0, 2 * math.pi)
    ctx.stroke()
    ctx.arc(3*width/4, -circle_radius, circle_radius, 0, 2 * math.pi)
    ctx.stroke()
    ctx.arc(width + circle_radius/1.4, -circle_radius/1.4, circle_radius, 0, 2 * math.pi)
    ctx.stroke()
    ctx.move_to(width/4, -2*circle_radius)
    ctx.line_to(width/4, -2*circle_radius - 0.2*width)
    ctx.stroke()
    ctx.move_to(3*width/4, -2*circle_radius)
    ctx.line_to(3*width/4, -2*circle_radius - 0.2*width)
    ctx.stroke()
    ctx.move_to(width + 2*circle_radius/1.4, -2*circle_radius/1.4)
    ctx.line_to(1.2*width + 2*circle_radius/1.4, -2*circle_radius/1.4 - 0.2*width)
    ctx.stroke()

    ctx.move_to(0.5*width, height)
    ctx.line_to(0.5*width, height + 0.2*width)
    ctx.stroke()
    ctx.move_to(0, height)
    ctx.line_to(-0.2*width, height + 0.2*width)
    ctx.stroke()
    if(name_ina != ""):
        txt_size = ctx.text_extents(name_ina)
        ctx.move_to(width/4 - txt_size.height/4, -2*circle_radius - 0.2*width - txt_size.width - 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_ina)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_inb != ""):
        txt_size = ctx.text_extents(name_inb)
        ctx.move_to(3*width/4 - txt_size.height/4, -2*circle_radius - 0.2*width - txt_size.width - 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_inb)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_cin != ""):
        txt_size = ctx.text_extents(name_cin)
        ctx.move_to(1.2*width + 2*circle_radius/1.4 - txt_size.height/4, -2*circle_radius/1.4 - 0.2*width - txt_size.width - 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_cin)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_cout != ""):
        txt_size = ctx.text_extents(name_cout)
        ctx.move_to(-0.2*width - txt_size.height/4, height + 0.2*width + 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_cout)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_sout != ""):
        txt_size = ctx.text_extents(name_sout)
        ctx.move_to(0.5*width - txt_size.height/4, height + 0.2*width + 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_sout)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)

def draw_ha_io(width, height, name_ina, name_inb, name_sout, name_cout):
    draw_rect_frame_with_text(width, height, "HA_IO")
    circle_radius = width / 10
    ctx.arc(-circle_radius/1.4, height + circle_radius/1.4, circle_radius, 0, 2 * math.pi)
    ctx.stroke()
    ctx.arc(width/2, height + circle_radius, circle_radius, 0, 2 * math.pi)
    ctx.stroke()
    ctx.move_to(-2*circle_radius/1.4, height + 2*circle_radius/1.4)
    ctx.line_to(-2*circle_radius/1.4 - 0.2*width, height + 2*circle_radius/1.4 + 0.2*width)
    ctx.stroke()
    ctx.move_to(width/4, 0)
    ctx.line_to(width/4, -0.2*width)
    ctx.stroke()
    ctx.move_to(3*width/4, 0)
    ctx.line_to(3*width/4, -0.2*width)
    ctx.stroke()
    ctx.move_to(0.5*width, height + 2*circle_radius)
    ctx.line_to(0.5*width, height + 2*circle_radius + 0.2*width)
    ctx.stroke()
    if(name_ina != ""):
        txt_size = ctx.text_extents(name_ina)
        ctx.move_to(width/4 - txt_size.height/4, - 0.2*width - txt_size.width - 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_ina)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_inb != ""):
        txt_size = ctx.text_extents(name_inb)
        ctx.move_to(3*width/4 - txt_size.height/4, - 0.2*width - txt_size.width - 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_inb)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_cout != ""):
        txt_size = ctx.text_extents(name_cout)
        ctx.move_to(-0.2*width - txt_size.height/4 - 2*circle_radius, height + 0.2*width + 1.4*circle_radius + 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_cout)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_sout != ""):
        txt_size = ctx.text_extents(name_sout)
        ctx.move_to(0.5*width - txt_size.height/4, height + 0.2*width + 1.4*circle_radius + 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_sout)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)

def draw_fa_io(width, height, name_ina, name_inb, name_cin, name_sout, name_cout):
    draw_rect_frame_with_text(width, height, "FA_IO")
    circle_radius = width / 10
    ctx.arc(-circle_radius/1.4, height + circle_radius/1.4, circle_radius, 0, 2 * math.pi)
    ctx.stroke()
    ctx.arc(width/2, height + circle_radius, circle_radius, 0, 2 * math.pi)
    ctx.stroke()
    ctx.move_to(-2*circle_radius/1.4, height + 2*circle_radius/1.4)
    ctx.line_to(-2*circle_radius/1.4 - 0.2*width, height + 2*circle_radius/1.4 + 0.2*width)
    ctx.stroke()
    ctx.move_to(width/4, 0)
    ctx.line_to(width/4, -0.2*width)
    ctx.stroke()
    ctx.move_to(3*width/4, 0)
    ctx.line_to(3*width/4, -0.2*width)
    ctx.stroke()
    ctx.move_to(width, 0)
    ctx.line_to(1.2*width, -0.2*width)
    ctx.stroke()
    ctx.move_to(0.5*width, height + 2*circle_radius)
    ctx.line_to(0.5*width, height + 2*circle_radius + 0.2*width)
    ctx.stroke()
    if(name_ina != ""):
        txt_size = ctx.text_extents(name_ina)
        ctx.move_to(width/4 - txt_size.height/4, - 0.2*width - txt_size.width - 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_ina)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_inb != ""):
        txt_size = ctx.text_extents(name_inb)
        ctx.move_to(3*width/4 - txt_size.height/4, - 0.2*width - txt_size.width - 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_inb)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_cin != ""):
        txt_size = ctx.text_extents(name_cin)
        ctx.move_to(1.2*width - txt_size.height/4, -0.2*width - txt_size.width - 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_cin)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_cout != ""):
        txt_size = ctx.text_extents(name_cout)
        ctx.move_to(-0.2*width - txt_size.height/4 - 2*circle_radius, height + 0.2*width + 1.4*circle_radius + 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_cout)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)
    if(name_sout != ""):
        txt_size = ctx.text_extents(name_sout)
        ctx.move_to(0.5*width - txt_size.height/4, height + 0.2*width + 1.4*circle_radius + 5)
        ctx.rotate(math.pi/2)
        ctx.show_text(name_sout)
        ctx.stroke()
        ctx.rotate(3*math.pi/2)


    
def draw_inverter(width, height, name_in, name_out):
    ctx.set_source_rgb(0, 0, 0)
    ctx.set_line_width(1)
    ctx.move_to(0, 0)
    ctx.line_to(width, height/2)
    ctx.line_to(0, height)
    ctx.line_to(0, 0)
    ctx.stroke()
    circle_radius = width / 10
    ctx.arc(width + circle_radius, height/2, circle_radius, 0, 2 * math.pi)
    ctx.stroke()
    ctx.move_to(0, height/2)
    ctx.line_to(-width / 5, height/2)
    ctx.stroke()
    ctx.move_to(width + 2*circle_radius, height/2)
    ctx.line_to(1.2*width + 2*circle_radius, height/2)
    ctx.stroke()
    if(name_in != ""):
        txt_size = ctx.text_extents(name_in)
        ctx.move_to(-width/5 - txt_size.width - 5, height/2 + txt_size.height/4)
        ctx.show_text(name_in)
        ctx.stroke()
    if(name_out != ""):
        txt_size = ctx.text_extents(name_out)
        ctx.move_to(1.2*width + 2*circle_radius + 5, height/2 + txt_size.height/4)
        ctx.show_text(name_out)
        ctx.stroke()
        
    

def draw_nand2(width, height, name_ina, name_inb, name_out):
    ctx.set_source_rgb(0, 0, 0)
    ctx.set_line_width(1)
    arc_radius = height / 2
    ctx.move_to(width - arc_radius, height)
    ctx.line_to(0, height)
    ctx.line_to(0, 0)
    ctx.line_to(width - arc_radius, 0)
    ctx.stroke()
    ctx.arc(width - arc_radius, arc_radius, arc_radius, 1.5 * math.pi, 2.5 * math.pi)
    ctx.stroke()
    circle_radius = width / 10
    ctx.arc(width + circle_radius, height/2, circle_radius, 0, 2 * math.pi)
    ctx.stroke()
    ctx.move_to(0, height/4)
    ctx.line_to(-width / 5, height/4)
    ctx.stroke()
    ctx.move_to(0, 3*height/4)
    ctx.line_to(-width / 5, 3*height/4)
    ctx.stroke()
    ctx.move_to(width + 2*circle_radius, height/2)
    ctx.line_to(1.2*width + 2*circle_radius, height/2)
    ctx.stroke()
    if(name_ina != ""):
        txt_size = ctx.text_extents(name_ina)
        ctx.move_to(-width/5 - txt_size.width - 5, height/4 + txt_size.height/4)
        ctx.show_text(name_ina)
        ctx.stroke()
    if(name_inb != ""):
        txt_size = ctx.text_extents(name_inb)
        ctx.move_to(-width/5 - txt_size.width - 5, 3*height/4 + txt_size.height/4)
        ctx.show_text(name_inb)
        ctx.stroke()
    if(name_out != ""):
        txt_size = ctx.text_extents(name_out)
        ctx.move_to(1.2*width + 2*circle_radius + 5, height/2 + txt_size.height/4)
        ctx.show_text(name_out)
        ctx.stroke()

def draw_and2(width, height, name_ina, name_inb, name_out):
    ctx.set_source_rgb(0, 0, 0)
    ctx.set_line_width(1)
    arc_radius = height / 2
    ctx.move_to(width - arc_radius, height)
    ctx.line_to(0, height)
    ctx.line_to(0, 0)
    ctx.line_to(width - arc_radius, 0)
    ctx.stroke()
    ctx.arc(width - arc_radius, arc_radius, arc_radius, 1.5 * math.pi, 2.5 * math.pi)
    ctx.stroke()
    circle_radius = width / 10
    ctx.stroke()
    ctx.move_to(0, height/4)
    ctx.line_to(-width / 5, height/4)
    ctx.stroke()
    ctx.move_to(0, 3*height/4)
    ctx.line_to(-width / 5, 3*height/4)
    ctx.stroke()
    ctx.move_to(width, height/2)
    ctx.line_to(1.2*width + 2*circle_radius, height/2)
    ctx.stroke()
    if(name_ina != ""):
        txt_size = ctx.text_extents(name_ina)
        ctx.move_to(-width/5 - txt_size.width - 5, height/4 + txt_size.height/4)
        ctx.show_text(name_ina)
        ctx.stroke()
    if(name_inb != ""):
        txt_size = ctx.text_extents(name_inb)
        ctx.move_to(-width/5 - txt_size.width - 5, 3*height/4 + txt_size.height/4)
        ctx.show_text(name_inb)
        ctx.stroke()
    if(name_out != ""):
        txt_size = ctx.text_extents(name_out)
        ctx.move_to(1.2*width + 2*circle_radius + 5, height/2 + txt_size.height/4)
        ctx.show_text(name_out)
        ctx.stroke()


def add_inv_to_io(width, height, portnum, in_name):
    if(portnum == 1):
        translate_x = width/4 + height/6
        translate_y = -width/3 -width/15 - width/15 - height/5
    if(portnum == 2):
        translate_x = 3*width/4 + height/6
        translate_y = -width/3 -width/15 - width/15 - height/5
    if(portnum == 3):
        translate_x = 1.2*width + height/6
        translate_y = -width/3 -width/15 - width/15 - height/5
    ctx.translate(translate_x, translate_y)
    ctx.rotate(math.pi/2)
    draw_inverter(width/3, height/3, in_name, "")
    ctx.rotate(3*math.pi/2)
    ctx.translate(-translate_x, -translate_y)

def add_inv_to_ii(width, height, portnum, in_name):
    if(portnum == 1):
        translate_x = width/4 + height/6
        translate_y = -width/3 -width/15 - width/15 - 2*height/5
    if(portnum == 2):
        translate_x = 3*width/4 + height/6
        translate_y = -width/3 -width/15 - width/15 - 2*height/5
    if(portnum == 3):
        translate_x = 1.2*width + height/6 + 2*(width/10)/1.4
        translate_y = -width/3 -width/15 - width/15 -2*(width/10)/1.4 - 0.2*width
    ctx.translate(translate_x, translate_y)
    ctx.rotate(math.pi/2)
    draw_inverter(width/3, height/3, in_name, "")
    ctx.rotate(3*math.pi/2)
    ctx.translate(-translate_x, -translate_y)

def draw_out_port(width, height, name_in, name_out):
    ctx.set_source_rgb(0, 0, 0)
    ctx.set_line_width(2)
    ctx.move_to(0, 0)
    ctx.line_to(width/2, 0)
    ctx.line_to(width, height/2)
    ctx.line_to(width/2, height)
    ctx.line_to(0, height)
    ctx.line_to(0, 0)
    ctx.stroke()
    ctx.set_line_width(1)
    ctx.move_to(0, height/2)
    ctx.line_to(-width / 5, height/2)
    ctx.stroke()
    if(name_in != ""):
        txt_size = ctx.text_extents(name_in)
        ctx.move_to(-width/5 - txt_size.width - 5, height/2 + txt_size.height/4)
        ctx.show_text(name_in)
        ctx.stroke()
    if(name_out != ""):
        txt_size = ctx.text_extents(name_out)
        ctx.move_to(1.2*width + 5, height/2 + txt_size.height/4)
        ctx.show_text(name_out)
        ctx.stroke()


def add_inv_to_port(width, height, in_name):
    translate_x = -width - width/5 - width/5 - width/5
    translate_y = -height/4
    ctx.translate(translate_x, translate_y)
    draw_inverter(width, height, in_name, "")
    ctx.translate(-translate_x, -translate_y)



PRODUCT_STEP_HORIZONTAL = 80
ADDER_STEP_HORIZONTAL = 120
STAGE_STEP_VERTICAL = 450
STAGE_LINE_ADJ_VERTICAL = -210

WIDTH = max_stage_size * PRODUCT_STEP_HORIZONTAL + 200

HEIGHT = (nstages + 2) * STAGE_STEP_VERTICAL

#surface = cairo.ImageSurface(cairo.FORMAT_ARGB32, WIDTH, HEIGHT)

if(ADD_C_IN == 1):
    cin_str = "cin"
else:
    cin_str = ""

pdfname = "mult_dadda_%dx%d_%s_visualization.pdf" % (M, M, cin_str)
#pdfname = "out.pdf" 
pdf = cairo.PDFSurface(pdfname, WIDTH, HEIGHT)


#ctx = cairo.Context(surface)
ctx = cairo.Context(pdf)

ctx.scale(1, 1)



for current_weight in range (0, max_weight):

    ctx.rectangle(0, 0, WIDTH, HEIGHT)  # Rectangle(x0, y0, x1, y1)
    ctx.set_source_rgb(1, 1, 1)
    ctx.fill()
    
    
    added_x = 0
    #current_weight = 7
    
    ctx.translate(0, 0)
    
    ctx.set_source_rgb(0, 0, 0)
    ctx.set_line_width(1)
    ctx.set_font_size(20)
    ctx.move_to(5, 25)
    ctx.show_text("Column %d" % current_weight)
    ctx.stroke()
    
    stage_label = "Partial products"
    txt_size = ctx.text_extents(stage_label)
    ctx.move_to(WIDTH-30, (STAGE_STEP_VERTICAL + txt_size.width) / 2)
    ctx.rotate(3*math.pi/2)
    ctx.show_text(stage_label)
    ctx.stroke()
    ctx.rotate(math.pi/2)
    ctx.set_font_size(10)
    
    
    
    ctx.translate(150, 150)
    
    
    for i in range(0, M):
        for j in range(0, N):
            if(i+j == current_weight):
                line = "p_%d_%d" % (i, j)
                in_a = "operand_a[%d]" % i;
                in_b = "operand_b[%d]" % j;
                ctx.rotate(math.pi/2)
                draw_nand2(60, 60, in_a, in_b, line)
                ctx.rotate(3*math.pi/2)
                added_x = added_x + PRODUCT_STEP_HORIZONTAL
                ctx.translate(PRODUCT_STEP_HORIZONTAL, 0)
    
    
    if(ADD_C_IN == 1):
        for i in range(0, EXT):
            if(i == current_weight):
                line = "add_%d" % i
                in_a = "add_in[%d]" % i;
                ctx.rotate(math.pi/2)
                draw_inverter(60, 60, in_a, line)
                ctx.rotate(3*math.pi/2)
                added_x = added_x + PRODUCT_STEP_HORIZONTAL
                ctx.translate(PRODUCT_STEP_HORIZONTAL, 0)



    for current_stage in range(0, nstages):
        ctx.translate(-added_x, STAGE_STEP_VERTICAL)
        ctx.move_to(-120, STAGE_LINE_ADJ_VERTICAL)
        ctx.line_to(WIDTH, STAGE_LINE_ADJ_VERTICAL)
        ctx.stroke()
        added_x = 0
        ctx.set_font_size(20)
        stage_label = "Stage %d" % current_stage
        txt_size = ctx.text_extents(stage_label)
        ctx.move_to(WIDTH - 180, (STAGE_STEP_VERTICAL + txt_size.width) / 2 + STAGE_LINE_ADJ_VERTICAL)
        ctx.rotate(3*math.pi/2)
        ctx.show_text(stage_label)
        ctx.rotate(math.pi/2)
        ctx.set_font_size(10)
    
        for curr_hadder in half_adders[0]:
            if(curr_hadder[5] == current_stage and curr_hadder[6] == current_weight):
                if(curr_hadder[8] == ""):
                    ina_name = curr_hadder[1]
                else:
                    ina_name = ""
                    
                if(curr_hadder[9] == ""):
                    inb_name = curr_hadder[2]
                else:
                    inb_name = ""
    
                draw_ha_ii(60, 60, ina_name, inb_name, curr_hadder[3], curr_hadder[4])
                if(ina_name == ""):
                    add_inv_to_ii(60, 60, 1, curr_hadder[8])
                if(inb_name == ""):
                    add_inv_to_ii(60, 60, 2, curr_hadder[9])
    
                added_x = added_x + ADDER_STEP_HORIZONTAL
                ctx.translate(ADDER_STEP_HORIZONTAL, 0)
    
        for curr_hadder in half_adders[1]:
            if(curr_hadder[5] == current_stage and curr_hadder[6] == current_weight):
                if(curr_hadder[8] == ""):
                    ina_name = curr_hadder[1]
                else:
                    ina_name = ""
                    
                if(curr_hadder[9] == ""):
                    inb_name = curr_hadder[2]
                else:
                    inb_name = ""
    
                draw_ha_io(60, 60, ina_name, inb_name, curr_hadder[3], curr_hadder[4])
                
                if(ina_name == ""):
                    add_inv_to_io(60, 60, 1, curr_hadder[8])
                if(inb_name == ""):
                    add_inv_to_io(60, 60, 2, curr_hadder[9])
    
                added_x = added_x + ADDER_STEP_HORIZONTAL
                ctx.translate(ADDER_STEP_HORIZONTAL, 0)
    
        for curr_fadder in full_adders[0]:
            if(curr_fadder[6] == current_stage and curr_fadder[7] == current_weight):
            
                if(curr_fadder[9] == ""):
                    ina_name = curr_fadder[1]
                else:
                    ina_name = ""
                    
                if(curr_fadder[10] == ""):
                    inb_name = curr_fadder[2]
                else:
                    inb_name = ""
    
                if(curr_fadder[11] == ""):
                    inc_name = curr_fadder[3]
                else:
                    inc_name = ""
                    
                draw_fa(60, 60, ina_name, inb_name, inc_name, curr_fadder[4], curr_fadder[5])
                
                if(ina_name == ""):
                    add_inv_to_io(60, 60, 1, curr_fadder[9])
                if(inb_name == ""):
                    add_inv_to_io(60, 60, 2, curr_fadder[10])
                if(inc_name == ""):
                    add_inv_to_io(60, 60, 3, curr_fadder[11])
                
                
                added_x = added_x + ADDER_STEP_HORIZONTAL
                ctx.translate(ADDER_STEP_HORIZONTAL, 0)
    
        for curr_fadder in full_adders[1]:
            if(curr_fadder[6] == current_stage and curr_fadder[7] == current_weight):
                if(curr_fadder[9] == ""):
                    ina_name = curr_fadder[1]
                else:
                    ina_name = ""
                    
                if(curr_fadder[10] == ""):
                    inb_name = curr_fadder[2]
                else:
                    inb_name = ""
    
                if(curr_fadder[11] == ""):
                    inc_name = curr_fadder[3]
                else:
                    inc_name = ""
    
                draw_fa_io(60, 60, ina_name, inb_name, inc_name, curr_fadder[4], curr_fadder[5])
                
                if(ina_name == ""):
                    add_inv_to_io(60, 60, 1, curr_fadder[9])
                if(inb_name == ""):
                    add_inv_to_io(60, 60, 2, curr_fadder[10])
                if(inc_name == ""):
                    add_inv_to_io(60, 60, 3, curr_fadder[11])
    
                added_x = added_x + ADDER_STEP_HORIZONTAL
                ctx.translate(ADDER_STEP_HORIZONTAL, 0)
    
    ctx.translate(-added_x, STAGE_STEP_VERTICAL)
    ctx.set_line_width(1)
    ctx.move_to(-120, STAGE_LINE_ADJ_VERTICAL)
    ctx.line_to(WIDTH, STAGE_LINE_ADJ_VERTICAL)
    ctx.stroke()
    added_x = 0
    
    ctx.set_font_size(20)
    stage_label = "Outputs"
    txt_size = ctx.text_extents(stage_label)
    ctx.move_to(WIDTH - 180, (STAGE_STEP_VERTICAL + txt_size.width) / 2 + STAGE_LINE_ADJ_VERTICAL)
    ctx.rotate(3*math.pi/2)
    ctx.show_text(stage_label)
    ctx.rotate(math.pi/2)
    ctx.set_font_size(10)
    
    
    ctx.translate(0, 80)
    
    
    
    ctx.rotate(math.pi/2)
    
    curr_weight_wires = []
    for curr_wire in final_adder_inputs:
        if curr_wire[1] == current_weight:
            curr_weight_wires.append(curr_wire)
    curr_weight_wires.sort(key=get_path_length)
    p_name = "result_a[%d]" % current_weight
    if(len(curr_weight_wires) > 0):
        if(is_inverted(curr_weight_wires[0]) == 1):
            draw_out_port(40, 20, "", p_name)
            add_inv_to_port(40, 40, curr_weight_wires[0][0])
        else:
            draw_out_port(40, 20, curr_weight_wires[0][0], p_name)
    else:
        draw_out_port(40, 20, "1'b0", p_name)
        
    ctx.rotate(3*math.pi/2)
    
    added_x = added_x + 80
    ctx.translate(80, 0)
    
    
    ctx.rotate(math.pi/2)
    
    curr_weight_wires = []
    for curr_wire in final_adder_inputs:
        if curr_wire[1] == current_weight:
            curr_weight_wires.append(curr_wire)
    curr_weight_wires.sort(key=get_path_length)
    p_name = "result_b[%d]" % current_weight
    if(len(curr_weight_wires) > 1):
        if(is_inverted(curr_weight_wires[1]) == 1):
            draw_out_port(40, 20, "", p_name)
            add_inv_to_port(40, 40, curr_weight_wires[1][0])
        else:
            draw_out_port(40, 20, curr_weight_wires[1][0], p_name)
    else:
        draw_out_port(40, 20, "1'b0", p_name)
    
    ctx.rotate(3*math.pi/2)
    
    ctx.show_page()
    
    ctx.identity_matrix()

ctx.rectangle(0, 0, WIDTH, HEIGHT)  # Rectangle(x0, y0, x1, y1)
ctx.set_source_rgb(1, 1, 1)
ctx.fill()


added_x = 0

ctx.translate(0, 0)

ctx.set_source_rgb(0, 0, 0)
ctx.set_line_width(1)
ctx.set_font_size(20)
ctx.move_to(5, 25)
ctx.show_text("Notations")
ctx.stroke()
ctx.set_font_size(10)

ctx.translate(150, 150)

ctx.set_font_size(20)
ctx.move_to(5, 25)
ctx.show_text("Full adder (full_adder):")
ctx.stroke()
ctx.set_font_size(10)
ctx.translate(0, 80)
draw_fa(60, 60, "a", "b", "cin", "sout", "cout")

ctx.translate(0, 150)

ctx.set_font_size(20)
ctx.move_to(5, 25)
ctx.show_text("Full adder with inverted outputs (full_adder_io):")
ctx.stroke()
ctx.set_font_size(10)
ctx.translate(0, 80)
draw_fa_io(60, 60, "a", "b", "cin", "sout", "cout")
