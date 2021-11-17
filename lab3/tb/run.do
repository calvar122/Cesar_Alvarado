if [file exists work] {vdel -all}
vlib work

#vlog -f files.f
vlog +define+POS_RESET +define+WARNING -f files.f

onbreak {resume}
set NoQuitOnFinish 1
vsim -voptargs=+acc work.TB_FFD_macros 
#do wave.do
run 5ms
