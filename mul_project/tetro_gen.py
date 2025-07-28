from dataclasses import dataclass
import numpy as np
import math
import bisect


def create_name(parts):
    inv_name = "" if not parts[-1] else "_inv"
    return "_".join(map(str, parts[:-1])) + inv_name


@dataclass
class HalfAdder:
    a: str 
    b: str

    inverted: bool = False

    _count: int = 0  # not included in dataclass fields

    def __post_init__(self):
        type(self)._count += 1

        self.in_count: int = 2
        self.out_count: int = 2

        self.id = type(self)._count
        self.name = f"{HalfAdder.__name__}_{self.in_count}x{self.out_count}_{self.id}"

        self.s_out = (f"{self.name}_sout", self.inverted)
        self.c_out = (f"{self.name}_cout", self.inverted)

@dataclass
class FullAdder:
    a: str 
    b: str
    cin: str

    inverted: bool = False

    _count: int = 0  # not included in dataclass fields

    def __post_init__(self):
        type(self)._count += 1

        self.in_count: int = 3
        self.out_count: int = 2

        self.id = type(self)._count
        self.name = f"{FullAdder.__name__}_{self.in_count}x{self.out_count}_{self.id}"

        self.s_out = (f"{self.name}_sout", self.inverted)
        self.c_out = (f"{self.name}_cout", self.inverted)


def round_down(sorted_list, target):
    idx = bisect.bisect_right(sorted_list, target)
    if idx == 0:
        return None  # All elements are greater than target
    return sorted_list[idx - 1]

@dataclass
class Compressor:
    in_count: int = 7
    out_count: int = 3
    inverted: bool = False

    _count: int = 0  # not included in dataclass fields

    def __post_init__(self):
        type(self)._count += 1
        self.id = type(self)._count
        self.name = f"{Compressor.__name__}_{self.id}"






class TetroGenerator:
    def __init__(self) -> None:
        self.num_bits = 8
        self.adders = {}

    @staticmethod
    def create_reduction_height(mul_a=1.5, max_reductions=10): 
        reduction_maximum_height = [2]
        for i in range(max_reductions):
            new_h = math.floor(reduction_maximum_height[-1]*mul_a)
            reduction_maximum_height.append(new_h)

        return reduction_maximum_height

    def create_partial_product(self, inverted=False):
        s_space = 0
        partial_product_matrix = [[] for x in range(self.num_bits*2)]
        for i in range(self.num_bits):
            for j in reversed(range(self.num_bits)):
                idx = j + s_space // 2
                partial_product_matrix[idx].append(("p", j, i, inverted))
            s_space += 2

        return partial_product_matrix
    


    @staticmethod
    def create_stage_string(stage, space=20):
        max_h = len(max(stage, key=lambda x: len(x)))
        stage_string = []
        for i in range(max_h):
            i_str = []
            for j in range(len(stage)- 1, -1, -1):
                if len(stage[j]) > i:
                   i_str.append(create_name(stage[j][i]).ljust(space).rjust(space))
                else: 
                    i_str.append("-".ljust(space).rjust(space))

            stage_string.append("   |   ".join(i_str))

        return "\n".join(stage_string)  + "\n\n\n\n\n\n\n"


    def put_max_adders(self, reduction_matrix, col_ids):
        for col_i in col_ids:
            col = reduction_matrix[col_i]
            col_h = len(col)
            if col_h == 2:
                col.insert(0, ("1'b0", False))
                col_h += 1

            if col_h < 3:
                continue
                

            redct_n = 3
            for _ in range(col_h // redct_n):
                adder_input = [ col.pop(0) for i in range(redct_n)]
                adder = FullAdder(adder_input[0], adder_input[1], adder_input[2])
                self.adders[adder.name] = adder

                reduction_matrix[col_i].append(adder.sout)
                if col_i+1 < len(reduction_matrix):
                    reduction_matrix[col_i+1].append(adder.cout)

                print(_)
    
    def reduce_col_to_target_height(self, reduction_matrix, col_i, target_height):
        reduct_stage_col = reduction_matrix[col_i]
        height = len(reduct_stage_col)
        reduce_bit_count = height - target_height
        adder = None
        if reduce_bit_count == 1:
            adder_n = 2
            next_stage_adder_inputs = [reduct_stage_col.pop(0) for _ in range(adder_n)]
            adder = HalfAdder(next_stage_adder_inputs[0], next_stage_adder_inputs[1])
        else:
            print()
        # if adder_n == 2:
        #     adder = HalfAdder(next_stage_adder_inputs[0], next_stage_adder_inputs[1])
        # elif adder_n == 3:
        #     adder = FullAdder(next_stage_adder_inputs[0], next_stage_adder_inputs[1], next_stage_adder_inputs[2])
        if not adder is None:
            reduction_matrix[col_i].append(adder.s_out)
            reduction_matrix[col_i + 1].append(adder.c_out)

    def run_algo(self):
        reduction_stages_string = []
        reduction_heights = self.create_reduction_height()
        reduction_matrix = self.create_partial_product(inverted=False) 
        reduction_matrix_heights = np.array([len(col) for col in reduction_matrix])
        curr_stage_max_height = round_down(reduction_heights, max(reduction_matrix_heights)) 

        # stages[1] = [[] for _ in range(self.num_bits*2)]
        for stage_i in range(0, 1):
            # first_in_stage = True
            for col_i in range(self.num_bits*2):
                col = reduction_matrix[col_i]
                col_height = reduction_matrix_heights[col_i]
                if col_height <= 2 or col_height <= curr_stage_max_height:
                    continue
            
                # if col_height == 3:
                #     col.insert(0, "1'b0")
                self.reduce_col_to_target_height(reduction_matrix, col_i, target_height=curr_stage_max_height)
                

            [reduction_stages_string.append(self.create_stage_string(reduction_matrix))]
        with open("/project/cadscripts/NeoLogicRoot/VerilogENV/mul_project/logs/dadda_multiplier_8bit_stages_str.txt", "w") as f:
            f.writelines(reduction_stages_string) 


    def run(self):
        reduction_stages_string = []

        number_a_bits, number_y_bits = "10101011", "01111001"
        x_np = np.array(list(number_a_bits), dtype="int")
        y_np = np.array(list(number_y_bits), dtype="int")
        reduction_heights = self.create_reduction_height()

        print(x_np, y_np)
        reduction_matrix = self.create_partial_product(x_np, y_np, inverted=False) 
        reduction_stages_string.append(self.create_stage_string(reduction_matrix))
        
        reduction_matrix_id = np.arange(len(reduction_matrix))

        # for i in range(3):
        # self.put_max_adders(reduction_matrix, [6, 1, 2, 2, 3, 3, 4, 4, 4, 5, 5, 5, 6, 6, 6, 7, 7, 7, 8, 8, 8, 9, 9, 9, 10, 10, 10, 11, 11, 12, 12, 13, 13, 14])

        # self.put_max_adders(reduction_matrix, [6, 7, 4, 2, 3, 4, 5, 3, 4, 5, 5, 6, 7, 6, 8, 8, 7, 9, 8, 10, 9, 10, 9, 10, 11, 11, 12, 13, 12, 13, 14])

        # self.put_max_adders(reduction_matrix, [1, 2, 3, 3, 2, 5, 4, 3, 4, 4, 6, 5, 7, 6, 5, 8, 9, 10, 6, 7, 8, 7, 6, 8, 7, 9, 10, 8, 9, 11, 11, 10, 12,11, 13, 12, 13, 14 ])
        # self.put_max_adders(reduction_matrix, [6, 7, 4, 2, 3, 4, 5, 3, 4, 5, 5, 6, 7, 6, 8, 8, 7, 9, 8, 10, 9, 10, 9, 10, 11, 11, 12, 13, 12, 13, 14])
        # self.put_max_adders(reduction_matrix, [6, 7, 4, 2, 3, 4, 5, 3, 4, 5, 5, 6, 7, 6, 8, 8, 7, 9, 8, 10, 9, 10, 9, 10, 11, 11, 12, 13, 12, 13, 14])
        
        self.put_max_adders(reduction_matrix, [6])

        reduction_stages_string.append(self.create_stage_string(reduction_matrix))



        # even_height_id = (reduction_matrix_heights % 2 == 0).nonzero()[0]
        # self.put_max_adders(reduction_matrix, reduction_matrix_heights, even_height_id)
        # reduction_stages_string.append(self.create_stage_string(reduction_matrix))

        # reduction_matrix_heights = np.array([len(col) for col in reduction_matrix])
        # height_id = reduction_matrix_heights.nonzero()[0]
        # self.put_max_adders(reduction_matrix, reduction_matrix_heights, height_id)
        # reduction_stages_string.append(self.create_stage_string(reduction_matrix))


        # reduction_matrix_heights = np.array([len(col) for col in reduction_matrix])
        # height_id = reduction_matrix_heights.nonzero()[0]
        # self.put_max_adders(reduction_matrix, reduction_matrix_heights, height_id)
        # reduction_stages_string.append(self.create_stage_string(reduction_matrix))

        with open("./dadda_multiplier_8bit_stages_str.txt", "w") as f:
            f.writelines(reduction_stages_string) 
        


TetroGenerator().run_algo()