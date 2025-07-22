import math
import numpy as np
from jinja2 import Environment, FileSystemLoader
import datetime
import bisect






class DaddaGenerator:
    def __init__(self) -> None:
        self.num_bits = 8
        self.params = {
            "in_name_a":  "operand_a",
            "in_name_b":  "operand_b",
            "out_name_a": "result_a",
            "out_name_b": "result_b",
            "out_final": "result_final",
            "module_name": "mult_module",
            "N": 8,
            "timestamp": datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
            "wires": [],
            "h_adders": [],
            "f_adders": [],
            "f_adders_io": [],
            "stages_str": [],
            "inverted": set()
        }

    def create_partial_product(self, x_np, y_np):
        s_space = 0
        start_space = " "*len(y_np)*2
        partial_product_matrix_idx = [[] for x in range(len(y_np)*2)]
        for i, yb in enumerate(y_np[::-1]):
            pp_str = ' '.join(map(str, yb * x_np))

            for j, xb in enumerate(reversed(x_np)):
                # print(j, xb)
                idx = j + s_space // 2
                partial_product_matrix_idx[idx].append(("p", ("a", j), ("b", i)))
            print(start_space[s_space:], pp_str)
            s_space += 2

        return partial_product_matrix_idx

    @staticmethod
    def create_stage_string(stage, space=20):
        max_h = len(max(stage, key=lambda x: len(x)))
        stage_string = []
        for i in range(max_h):
            i_str = []
            for j in range(len(stage)- 1, -1, -1):
                print(j, i)
                print(len(stage[j]))
                if len(stage[j]) > i:
                   i_str.append(stage[j][i].ljust(space).rjust(space))
                else: 
                    i_str.append("-".ljust(space).rjust(space))

            stage_string.append("   |   ".join(i_str))

        return "\n".join(stage_string)  + "\n\n\n\n\n\n\n"


    
    @staticmethod
    def add_full_adder(col_i, col, partial_product_matrix_idx, params):
        f1 = col.pop(0)
        f2 = col.pop(0)
        f3 = col.pop(0)
        new_f_adder_name = f"full_adder_{len(params['f_adders'])}"
        so_name = f"{new_f_adder_name}_s_out"
        co_name = f"{new_f_adder_name}_c_out"

        params['f_adders'].append((f1, f2, f3))
        partial_product_matrix_idx[col_i].append(so_name)
        partial_product_matrix_idx[col_i + 1].append(co_name)

    @staticmethod
    def add_half_adder(col_i, col, partial_product_matrix_idx, params):
        f1 = col.pop(0)
        f2 = col.pop(0)
        new_h_adder_name = f"half_adder_{len(params['h_adders'])}"
        so_name = f"{new_h_adder_name}_s_out"
        co_name = f"{new_h_adder_name}_c_out"

        params['h_adders'].append((f1, f2))
        partial_product_matrix_idx[col_i].append(so_name)
        partial_product_matrix_idx[col_i + 1].append(co_name)


    @staticmethod
    def add_full_adder_const_io(col_i, col, partial_product_matrix_idx, params):
        f1 = col.pop(0)
        f2 = col.pop(0)
        f3 = "1'b1"

        new_f_adders_io = f"full_adder_io_{len(params['h_adders'])}"
        so_name = f"{new_f_adders_io}_s_out"
        co_name = f"{new_f_adders_io}_c_out"

        params['f_adders_io'].append((f1, f2, f3))
        partial_product_matrix_idx[col_i].append(so_name)
        partial_product_matrix_idx[col_i + 1].append(co_name)

    

    @staticmethod
    def create_reduction_height(max_pp_height, mul_a=1.5, max_reductions=10): 
        reduction_maximum_height = [2]
        for i in range(max_reductions):
            new_h = math.floor(reduction_maximum_height[-1]*mul_a)
            reduction_maximum_height.append(new_h)

            if new_h > max_pp_height:
                break

        return reduction_maximum_height
    
    def add_pp_to_v(self, partial_product_matrix_idx):
        params = self.params
        for i, col in enumerate(partial_product_matrix_idx):
            new_col = []
            for cell in col:
                pp_name= f"{cell[0]}_{cell[1][1]}_{cell[2][1]}"
                full_v_line = f"{pp_name} = ~({params['in_name_a']}[{cell[1][1]}] & {params['in_name_b']}[{cell[2][1]}])"

                params['inverted'].add(pp_name)
                new_col.append(pp_name)
                params['wires'].append(full_v_line)

            partial_product_matrix_idx[i] = new_col


    def run(self):
        params = self.params
        number_a_bits = "10101011"
        number_y_bits = "01111001"
        x_np = np.array(list(number_a_bits), dtype="int")
        y_np = np.array(list(number_y_bits), dtype="int")

        print(f"{x_np} X\n{y_np}")
        partial_product_matrix_idx = self.create_partial_product(x_np, y_np) 
        max_pp_height = len(max(partial_product_matrix_idx, key=lambda x: len(x)))
        reduction_maximum_height = self.create_reduction_height(max_pp_height)
        self.add_pp_to_v(partial_product_matrix_idx)
        max_pp_height = len(max(partial_product_matrix_idx, key=lambda x: len(x)))
        idx = bisect.bisect_left(reduction_maximum_height, max_pp_height)
        stage_height = reduction_maximum_height[idx - 1] if idx > 0 else None
        while stage_height != None and stage_height >= 2:
            params["stages_str"].append(self.create_stage_string(partial_product_matrix_idx))

            for i in range(len(partial_product_matrix_idx) - 1):
                col = partial_product_matrix_idx[i]
                col_height = len(col)

                if col_height <= stage_height:
                    # the column does not require reduction, move to column
                    print(i, "col_height <= dj")
                    continue
                elif col_height == stage_height + 1:
                    #add the top two elements in a half-adder, placing the result at the bottom of the column and the carry at the bottom of column
                    # self.add_half_adder(i, col, partial_product_matrix_idx, params)
                    self.add_full_adder_const_io(i, col, partial_product_matrix_idx, params)
                elif col_height == stage_height + 2:
                    self.add_full_adder(i, col, partial_product_matrix_idx, params)
                elif col_height == stage_height + 3:
                    self.add_full_adder(i, col, partial_product_matrix_idx, params)
                    self.add_half_adder(i, col, partial_product_matrix_idx, params)
                elif col_height == stage_height + 4:
                    [self.add_full_adder(i, col, partial_product_matrix_idx, params)  for _ in range(2)]
                else:
                    raise NotImplemented
                    
            max_pp_height = len(max(partial_product_matrix_idx, key=lambda x: len(x)))
            idx = bisect.bisect_left(reduction_maximum_height, max_pp_height)
            stage_height = reduction_maximum_height[idx - 1] if idx > 0 else None

            print(col_height)
        
        params["stages_str"].append(self.create_stage_string(partial_product_matrix_idx))

        h_adders_v = []
        for i, info in enumerate(params["h_adders"]):
            name = f"half_adder_{i}"
            name_s_out = f"{name}_s_out"
            name_c_out = f"{name}_c_out"
            params['wires'].append(f"{name}_s_out")
            params['wires'].append(f"{name}_c_out")

            line = f"half_adder {name}(.a({info[0]}), .b({info[1]}), .sout({name_s_out}), .cout({name_c_out}))"
            h_adders_v.append(line)
        params["h_adders"] = h_adders_v


        f_adders_v = []
        for i, info in enumerate(params["f_adders"]):
            name = f"full_adder_{i}"
            name_s_out = f"{name}_s_out"
            name_c_out = f"{name}_c_out"
            params['wires'].append(f"{name}_s_out")
            params['wires'].append(f"{name}_c_out")

            line = f"full_adder {name}(.a({info[0]}), .b({info[1]}), .cin({info[2]}), .sout({name_s_out}), .cout({name_c_out}))"
            f_adders_v.append(line)
        params["f_adders"] = f_adders_v



        f_adders_io_v = []
        for i, info in enumerate(params["f_adders_io"]):
            name = f"full_adder_io_{i}"
            name_s_out = f"{name}_s_out"
            name_c_out = f"{name}_c_out"
            params['wires'].append(f"{name}_s_out")
            params['wires'].append(f"{name}_c_out")

            line = f"full_adder_io {name}(.a({info[0]}), .b({info[1]}), .cin({info[2]}), .sout({name_s_out}), .cout({name_c_out}))"
            f_adders_io_v.append(line)
        params["f_adders_io"] = f_adders_io_v

        result_a = [x[0] if len(x) > 0 else "1'b0" for x in partial_product_matrix_idx]
        result_b = [x[1] if len(x) > 1 else "1'b0" for x in partial_product_matrix_idx]
        
        params['result_a_v'] = f"{'{'}{', '.join(reversed(result_a))}{'}'}"
        params['result_b_v'] = f"{'{'}{', '.join(reversed(result_b))}{'}'}"
        return params

        # print_stage(partial_product_matrix, partial_product_matrix_idx)

    


params = DaddaGenerator().run()

with open("./dadda_multiplier_8bit_stages_str.txt", "w") as f:
    f.writelines(params['stages_str']) 

env = Environment(loader=FileSystemLoader('/project/cadscripts/NeoLogicRoot/verilog_project/mul_project/templates'))  # '.' is current dir
template = env.get_template('mult_template.v.j2')
output_str = template.render(params)
with open("./mul_project/mul_8/dadda_multiplier_8bit.v", "w") as f:
    f.write(output_str)
