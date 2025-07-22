from dataclasses import dataclass
import numpy as np


@dataclass
class FullAdder:
    a: str
    b: str
    cin: str

    _count: int = 0  # not included in dataclass fields

    def __post_init__(self):
        type(self)._count += 1
        self.id = type(self)._count
        self.sout = f"{FullAdder.__name__}_{self.id}_sout"
        self.cout = f"{FullAdder.__name__}_{self.id}_cout"

class TetroGenerator:
    def __init__(self) -> None:
        self.num_bits = 8
        self.full_adders = []

    def create_partial_product(self, x_np, y_np, inverted=False):
        s_space = 0
        partial_product_matrix = [[] for x in range(len(y_np)*2)]
        for i, yb in enumerate(y_np[::-1]):
            for j, xb in enumerate(reversed(x_np)):
                idx = j + s_space // 2
                partial_product_matrix[idx].append(("p", j, i, inverted))
            s_space += 2

        return partial_product_matrix
    

    def run(self):
        number_a_bits, number_y_bits = "10101011", "01111001"
        x_np = np.array(list(number_a_bits), dtype="int")
        y_np = np.array(list(number_y_bits), dtype="int")

        print(x_np, y_np)
        partial_product_matrix = self.create_partial_product(x_np, y_np, inverted=False) 

        for i in range(self.num_bits*2):
            p_h = len(partial_product_matrix[i])
            p_col = partial_product_matrix[i]

            if p_h < 3:
                continue

            if p_h == 3:
                in_src = [p_col.pop(0) for _ in range(2)]
                in_src += ["1'b0"]

                fadder = FullAdder(in_src[0], in_src[1], in_src[2])
                self.full_adders.append(fadder)
                fadder.cout
            print()


TetroGenerator().run()