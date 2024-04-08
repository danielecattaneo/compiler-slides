# llvm-pass-demo

This is basically the LLVMHello pass you can find in the sources of LLVM
(https://github.com/llvm/llvm-project/tree/master/llvm/lib/Transforms/Hello)
except with more comments and ported to be an out-of-tree pass.

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
$ opt -load-pass-plugin=LLVMHello/MyHelloPass.dylib -passes='hello' -disable-output test.ll
```
