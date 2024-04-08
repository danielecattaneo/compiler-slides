#ifndef HELLO_H
#define HELLO_H

#include "llvm/IR/PassManager.h"

namespace llvm {

/*
 * Definition of the class for our hello world pass.
 */
class MyHelloWorldPass : public PassInfoMixin<MyHelloWorldPass> {
public:
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
};

} // namespace llvm

#endif
