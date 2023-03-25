#!/bin/bash
source /opt/intel/oneapi/setvars.sh > /dev/null 2>&1
/bin/echo "##" $(whoami) is compiling Fractal DPCPP
icpx -fsycl lab/main.cpp -o bin/main
if [ $? -eq 0 ]; then bin/main; fi
