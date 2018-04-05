onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Mux_5_to_1_testbench/m
add wave -noupdate /Mux_5_to_1_testbench/y
add wave -noupdate /Mux_5_to_1_testbench/x
add wave -noupdate /Mux_5_to_1_testbench/w
add wave -noupdate /Mux_5_to_1_testbench/v
add wave -noupdate /Mux_5_to_1_testbench/u
add wave -noupdate /Mux_5_to_1_testbench/S2
add wave -noupdate /Mux_5_to_1_testbench/S1
add wave -noupdate /Mux_5_to_1_testbench/S0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
