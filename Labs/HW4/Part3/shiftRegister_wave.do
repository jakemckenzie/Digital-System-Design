onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /shiftRegister_testbench/in1
add wave -noupdate /shiftRegister_testbench/out2
add wave -noupdate /shiftRegister_testbench/out3
add wave -noupdate /shiftRegister_testbench/out4
add wave -noupdate /shiftRegister_testbench/out5
add wave -noupdate /shiftRegister_testbench/out6
add wave -noupdate /shiftRegister_testbench/out7
add wave -noupdate /shiftRegister_testbench/out8
add wave -noupdate /shiftRegister_testbench/out1
add wave -noupdate /shiftRegister_testbench/i
add wave -noupdate /shiftRegister_testbench/Clock
add wave -noupdate /shiftRegister_testbench/Reset
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {70 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 260
configure wave -valuecolwidth 287
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
WaveRestoreZoom {24 ps} {115 ps}
