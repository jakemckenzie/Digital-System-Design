transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vlog -sv -work work +incdir+. {LabA_7_1200mv_85c_slow.svo}

vlog -sv -work work +incdir+/home/ammon/Desktop/TCES330/Digital-System-Design/UART_Demonstration {/home/ammon/Desktop/TCES330/Digital-System-Design/UART_Demonstration/TXDriver.sv}
vlog -sv -work work +incdir+/home/ammon/Desktop/TCES330/Digital-System-Design/UART_Demonstration {/home/ammon/Desktop/TCES330/Digital-System-Design/UART_Demonstration/TXDriver_testbench.sv}
vlog -vlog01compat -work work +incdir+/home/ammon/Desktop/TCES330/Digital-System-Design/UART_Demonstration {/home/ammon/Desktop/TCES330/Digital-System-Design/UART_Demonstration/ROM.v}
vlog -sv -work work +incdir+/home/ammon/Desktop/TCES330/Digital-System-Design/UART_Demonstration {/home/ammon/Desktop/TCES330/Digital-System-Design/UART_Demonstration/Pulser.sv}

vsim -t 1ps +transport_int_delays +transport_path_delays -L altera_ver -L cycloneive_ver -L gate_work -L work -voptargs="+acc"  TXDriver_testbench

add wave *
view structure
view signals
run -all
