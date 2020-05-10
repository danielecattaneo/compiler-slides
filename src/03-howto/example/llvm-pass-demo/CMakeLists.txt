cmake_minimum_required(VERSION 3.4.3) # like llvm

project(llvm-pass-demo)

find_package(LLVM REQUIRED CONFIG)

add_definitions(${LLVM_DEFINITIONS})
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include_directories(${LLVM_INCLUDE_DIRS})
include(AddLLVM)

add_subdirectory(LLVMHello)
