from myhdl import block, always_comb, Signal, intbv, instances


class BaseMultiplier:
    def __init__(self) -> None:
        pass

    def create_inputs(self):
        pass



class WallaceMultiplier(BaseMultiplier):
    def __init__(self) -> None:
        self.in_bits_width = 8
        self.out_bits_width = self.in_bits_width*2

        self.a = Signal(intbv(0)[self.in_bits_width:])
        self.b = Signal(intbv(0)[self.in_bits_width:])

        self.result = Signal(intbv(0)[2*self.in_bits_width:])

        self.pp = [Signal(bool(0)) for _ in range(self.in_bits_width * self.in_bits_width)]

    
@block
def generate_partial_products_block(a, b, pp_flat, width):
    @always_comb
    def logic():
        for i in range(width):
            for j in range(width):
                pp_flat[i * width + j].next = a[j] & b[i]
    return instances()


@block
def WallaceMultiplierTop(a, b, result, width):
    pp_flat = [Signal(bool(0)) for _ in range(width * width)]

    @always_comb
    def generate_pp():
        for i in range(width):
            for j in range(width):
                pp_flat[i * width + j].next = a[j] & b[i]

    return instances()  