import subprocess
from pathlib import Path

class TBRunner:
    def __init__(self, 
                 src_v_name,
                 src_tb_name,
                 working_dir, 
                 log_dir) -> None:
        # Source files
        self.src_v_file = Path(working_dir) / f"{src_v_name}.v"
        self.src_tb_file = Path(working_dir) / f"{src_tb_name}.v"

        # Output files
        self.out_vvd_file = Path(log_dir) / "run_v.out"
        self.out_vcd_file =  Path(log_dir) / f"wave_{src_v_name}"

    def run_compiler(self):
        # Step 1: Compile with iverilog
        compile_cmd = [
            "iverilog",
            "-g2012",
            "-o", self.out_vvd_file,
            self.src_v_file,
            self.src_tb_file
        ]

        print("Running iverilog compile...")
        compile_result = subprocess.run(compile_cmd, capture_output=True, text=True)

        if compile_result.returncode != 0:
            print("❌ Compilation failed:")
            print(compile_result.stderr)
            exit(1)
        else:
            print("✅ Compilation succeeded.")


    def run_simulation(self):
        # Step 2: Run with vvp
        sim_cmd = [
            "vvp",
            self.out_vvd_file,
            f"+vcd={self.out_vcd_file}.vcd"
        ]

        print("Running simulation...")
        with open(f"{self.out_vcd_file}-vec.res", "w") as output_file:
            sim_result = subprocess.run(sim_cmd, stdout=output_file, stderr=subprocess.PIPE, text=True)

        if sim_result.returncode != 0:
            print("❌ Simulation failed:")
            print(sim_result.stderr)
            exit(1)
        else:
            print("✅ Simulation succeeded. Output saved to:")
            print(f"  VCD file: {self.out_vcd_file}.vcd")
            print(f"  Log file: {self.out_vcd_file}-vec.res")

        if self.out_vvd_file.exists():
            self.out_vvd_file.unlink()
            print("vvd file deleted..")
        else:
            print("File failed to be deleted.. ")
    

    def run_viewer(self):
        subprocess.run(["gtkwave", f"{self.out_vcd_file}.vcd"])


    def run(self):
        self.run_compiler()     
        self.run_simulation()
        self.run_viewer()




# Set your paths
src_v_name = "mul_8_dadda_msb"
src_tb_v_name = "mult_tb"

log_dir = "/project/cadscripts/NeoLogicRoot/VerilogENV/app/logs"
working_dir = "/project/cadscripts/NeoLogicRoot/VerilogENV/mul_project/mul_8"




tb_runner = TBRunner(src_v_name=src_v_name,
                     src_tb_name=src_tb_v_name,
                     log_dir=log_dir,
                     working_dir=working_dir)

tb_runner.run()