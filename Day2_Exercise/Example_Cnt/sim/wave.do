onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tbcounter/TM
add wave -noupdate /tbcounter/Clk
add wave -noupdate /tbcounter/RstB
add wave -noupdate -radix hexadecimal /tbcounter/CntOut
add wave -noupdate /tbcounter/u_Counter/rCnt
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1475000 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {1470700 ps} {1564800 ps}
