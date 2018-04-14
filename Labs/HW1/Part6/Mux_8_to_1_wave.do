onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Mux_8_to_1_testbench/z
add wave -noupdate /Mux_8_to_1_testbench/select_bit1
add wave -noupdate /Mux_8_to_1_testbench/select_bit2
add wave -noupdate /Mux_8_to_1_testbench/select_bit3
add wave -noupdate /Mux_8_to_1_testbench/BLANK1
add wave -noupdate /Mux_8_to_1_testbench/BLANK2
add wave -noupdate /Mux_8_to_1_testbench/BLANK3
add wave -noupdate /Mux_8_to_1_testbench/H
add wave -noupdate /Mux_8_to_1_testbench/E
add wave -noupdate /Mux_8_to_1_testbench/L1
add wave -noupdate /Mux_8_to_1_testbench/L2
add wave -noupdate /Mux_8_to_1_testbench/O
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
