transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Epimetheus/Documents/GitHub/Digital-System-Design/UART_Demonstration {C:/Users/Epimetheus/Documents/GitHub/Digital-System-Design/UART_Demonstration/ROM_Memory.v}
vlog -sv -work work +incdir+C:/Users/Epimetheus/Documents/GitHub/Digital-System-Design/UART_Demonstration {C:/Users/Epimetheus/Documents/GitHub/Digital-System-Design/UART_Demonstration/Lab_Project_A.sv}
vlog -sv -work work +incdir+C:/Users/Epimetheus/Documents/GitHub/Digital-System-Design/UART_Demonstration {C:/Users/Epimetheus/Documents/GitHub/Digital-System-Design/UART_Demonstration/TXDriver.sv}
vlog -sv -work work +incdir+C:/Users/Epimetheus/Documents/GitHub/Digital-System-Design/UART_Demonstration {C:/Users/Epimetheus/Documents/GitHub/Digital-System-Design/UART_Demonstration/Counter.sv}

vlog -sv -work work +incdir+C:/Users/Epimetheus/Documents/GitHub/Digital-System-Design/UART_Demonstration {C:/Users/Epimetheus/Documents/GitHub/Digital-System-Design/UART_Demonstration/TXDriver_testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  TXDriver_testbench

add wave *
view structure
view signals
run -all
