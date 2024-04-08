#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "MiniMem2Reg.h"

using namespace llvm;

extern "C" ::llvm::PassPluginLibraryInfo LLVM_ATTRIBUTE_WEAK llvmGetPassPluginInfo()
{
  return {
      LLVM_PLUGIN_API_VERSION,
      "Hello",
      "1.0",
      [](PassBuilder &PB) {
        PB.registerPipelineParsingCallback(
            [](StringRef Name, FunctionPassManager &PM, ArrayRef<PassBuilder::PipelineElement>) {
              if (Name == "minimem2reg") {
                PM.addPass(MiniMem2Reg());
                return true;
              }
              return false;
            });
      }};
}
