#include "llvm/ADT/Statistic.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Type.h"
#include "llvm/Support/raw_ostream.h"
#include "Hello.h"

/* The LLVM_DEBUG macros use this define to categorize each debug message
 * with respect to the part of LLVM who sent it. */
#define DEBUG_TYPE "hello"

/* LLVM statistics are counters you can use to collect aggregate information
 * about your optimization. */
STATISTIC(MyHelloCounter, "Counts number of functions greeted");

namespace llvm {

// Main method of the pass. Called for each function in the module
PreservedAnalyses MyHelloWorldPass::run(Function &F, FunctionAnalysisManager &AM) {
  // Update the statistics
  ++MyHelloCounter;
  // Print Hello and the name of the function we are greeting
  errs() << "Hello: " << F.getName() << '\n';
  // We didn't touch the code so all analyses are preserved
  return PreservedAnalyses::all();
}

}
