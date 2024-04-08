cmake_minimum_required(VERSION 3.4.3) # like llvm

project(llvm-pass-demo)

find_package(LLVM REQUIRED CONFIG)

add_definitions(${LLVM_DEFINITIONS})
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")
include_directories(${LLVM_INCLUDE_DIRS})
include(AddLLVM)
# sets build options to the same ones used when building LLVM
include(HandleLLVMOptions)

# to be kept in sync with LLVM!
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(LLVMHello)
