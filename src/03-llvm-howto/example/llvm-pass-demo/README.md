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
