transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/Top_Module.v}
vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/Register_Select.v}
vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/Registers.v}
vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/pc_write_enable.v}
vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/pc_update_logic.v}
vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/Parallel_Access_Shift_Register.v}
vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/opcode_decoder.v}
vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/Flag_Calculator.v}
vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/Flags.v}
vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/eight_bit_shifter.v}
vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/eight_bit_adder.v}
vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/Datapath.v}
vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/DataMemory.v}
vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/control_final.v}
vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/code_memory.v}
vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/ALU.v}

vlog -vlog01compat -work work +incdir+D:/SEM3\ Done/EE\ 224/Projects/i281\ CPU/EE224-Course-Project-2025 {D:/SEM3 Done/EE 224/Projects/i281 CPU/EE224-Course-Project-2025/tb_top_module.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  tb_top_module

add wave *
view structure
view signals
run -all
