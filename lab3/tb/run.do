<<<<<<< HEAD
#do
if [file exists work] {vdel -all}
vlib work

#vlog -f files.f				   #to look only what is included in files.c
#vlog +define+POS_RESET +define+WARNING -f files.f #to compile just what POS.. says
vlog +incdir+../ +incdir+../src -f files.f
onbreak {resume}
set NoQuitOnFinish 1
vsim -voptargs=+acc work.TB_FFD 
=======
if [file exists work] {vdel -all}
vlib work

#vlog -f files.f
vlog +define+POS_RESET +define+WARNING -f files.f

onbreak {resume}
set NoQuitOnFinish 1
vsim -voptargs=+acc work.TB_FFD_macros 
>>>>>>> e199a13e82812aa3488eace283dd5fd3ee6bf0a8
#do wave.do
run 5ms
