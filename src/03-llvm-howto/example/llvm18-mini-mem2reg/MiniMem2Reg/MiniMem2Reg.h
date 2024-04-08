#ifndef MINIMEM2REG_H
#define MINIMEM2REG_H

#include "llvm/IR/PassManager.h"

namespace llvm {

class MiniMem2Reg : public PassInfoMixin<MiniMem2Reg> {
public:
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &AM);
};

} // namespace llvm

#endif
