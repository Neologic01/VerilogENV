log_dir="/project/cadscripts/NeoLogicRoot/VerilogENV/mul_project/cmp/logs"
working_dir="/project/cadscripts/NeoLogicRoot/VerilogENV/mul_project/cmp/"
# src_v="mul_8_wallace"
src_v="cmp_6_3"
src_tb_v="mult_tb"
out_vvd_file="$log_dir/run_v.out"
out_vcd_file="$log_dir/wave_$src_v"

iverilog -g2012 -o $out_vvd_file "${working_dir}/${src_v}.v" "${working_dir}/${src_tb_v}.v"
echo $?
vvp $out_vvd_file +vcd=$out_vcd_file.vcd > "${out_vcd_file}-vec.res"
# echo $?
# rm $out_vvd_file
