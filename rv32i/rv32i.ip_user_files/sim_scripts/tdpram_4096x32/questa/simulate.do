onbreak {quit -f}
onerror {quit -f}

vsim  -lib xil_defaultlib tdpram_4096x32_opt

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure
view signals

do {tdpram_4096x32.udo}

run 1000ns

quit -force
