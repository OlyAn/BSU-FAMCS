cmake_minimum_required(VERSION 3.9)
project(Lab_01)

find_package(OpenMP)
if (OPENMP_FOUND)
    set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${OpenMP_C_FLAGS}")
    set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OpenMP_CXX_FLAGS}")
    set (CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${OpenMP_EXE_LINKER_FLAGS}")
endif()
set(CMAKE_CXX_STANDARD 17)

add_executable(LaParallelComputing/BlockMatricesMultiplication/Multiplication/.idea
b_01 main.cpp utilities.cpp utilities.h)