log_dir="/project/cadscripts/NeoLogicRoot/verilog_project/mul_project/logs"
src_v="wallace_8_unsigned"
src_tb_v="mult_wallace_tb"
out_vvd_file="run_v.out"
out_vcd_file="$log_dir/wave_$src_v"

iverilog -g2012 -o $out_vvd_file $src_v.v $src_tb_v.v
echo $?
vvp $out_vvd_file +vcd=$out_vcd_file.vcd > "${out_vcd_file}-vec.res"
echo $?
rm $out_vvd_file
