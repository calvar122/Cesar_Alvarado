onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB_mux2to1/a
add wave -noupdate /TB_mux2to1/b
add wave -noupdate /TB_mux2to1/s
add wave -noupdate /TB_mux2to1/o_gold
add wave -noupdate /TB_mux2to1/o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {128 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {0 ps} {210 ps}
