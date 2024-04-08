#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "Hello.h"

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
              if (Name == "hello") {
                PM.addPass(MyHelloWorldPass());
                return true;
              }
              return false;
            });
      }};
}
