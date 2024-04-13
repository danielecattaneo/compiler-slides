# mini-mem2reg

This is an example LLVM pass that re-implements a simplified version of
mem2reg for illustration purposes.

It does not try to promote allocas to registers in all conditions, but only
when there is only one single store to the allocated memory.

## How to build

```sh
$ mkdir build
$ cd build
$ cmake LLVM_DIR=/which/llvm/you/want/to/build/against ..
$ make
```

## How to test

If you want to run the pass on a C file called "test.c":

```sh
$ cd build # if you are not already there
$ clang-18 -o test.ll -S -emit-llvm -Xclang -disable-O0-optnone test.c
$ opt -load-pass-plugin=MiniMem2Reg/MiniMem2Reg.dylib -passes='minimem2reg' -S test.ll
```
