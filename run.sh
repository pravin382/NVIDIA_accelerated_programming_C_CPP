#! /bin/bash
cd build
printf "Building ...\n"

cmake -DCMAKE_CUDA_FLAGS="-arch=sm_50" ..
make

printf "\nOutput from the program\n\n"
./main