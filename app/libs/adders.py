from myhdl import block, always_comb, Signal, intbv

@block
def FullAdder(a, b, cin, sout, cout):
    @always_comb
    def logic():
        sout.next = a ^ b ^ cin
        cout.next = (a & b) | (b & cin) | (a & cin)

    return logic