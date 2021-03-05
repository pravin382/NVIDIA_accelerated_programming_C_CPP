cmake_minimum_required(VERSION 3.11)

project(Accelerated_pragramming LANGUAGES CUDA CXX)
cmake_policy( SET CMP0104 OLD )

if(NOT DEFINED CMAKE_CUDA_STANDARD)
    set(CMAKE_CUDA_STANDARD 11)
    set(CMAKE_CUDA_STANDARD_REQUIRED ON)
endif()

# add executable

add_executable(main
  ../Solutions/01-hello-gpu.cu
)

