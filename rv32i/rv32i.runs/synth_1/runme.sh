#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/home/tony/tools/xilinx/Vitis/2022.2/bin:/home/tony/tools/xilinx/Vivado/2022.2/ids_lite/ISE/bin/lin64:/home/tony/tools/xilinx/Vivado/2022.2/bin
else
  PATH=/home/tony/tools/xilinx/Vitis/2022.2/bin:/home/tony/tools/xilinx/Vivado/2022.2/ids_lite/ISE/bin/lin64:/home/tony/tools/xilinx/Vivado/2022.2/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/tony/Desktop/riscv/rv32i/rv32i.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log rv32i_cpu.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source rv32i_cpu.tcl
