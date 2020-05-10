#include "llvm/ADT/Statistic.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Type.h"
#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

/* The LLVM_DEBUG macros use this define to categorize each debug message
 * with respect to the part of LLVM who sent it. */
#define DEBUG_TYPE "hello"


/*
 * Example I: Say Hello to every function
 */

/* LLVM statistics are counters you can use to collect aggregate information
 * about your optimization. */
STATISTIC(HelloCounter, "Counts number of functions greeted");

namespace {

  // Hello - The first implementation, without getAnalysisUsage.
  struct Hello : public FunctionPass {
    // Pass identification, replacement for typeid
    static char ID;
    // Initializer
    Hello() : FunctionPass(ID) {}

    // Main method of the pass. Called for each function in the module
    bool runOnFunction(Function &F) override {
      // Update the statistics
      ++HelloCounter;
      // Print Hello and the name of the function we are greeting
      errs() << "Hello: ";
      errs().write_escaped(F.getName()) << '\n';
      // Return false for "no error"
      return false;
    }
  };

}

/* Identifier of the pass. Used internally by LLVM. */
char Hello::ID = 0;
/* Allocation of the static instance of the pass. Every pass is allocated
 * a single time statically using this syntax. The name of the instance
 * does not matter.
 * 
 * First argument: command line switch used in `opt` to invoke the pass
 * Second argument: description shown in `opt -help` */
static RegisterPass<Hello> X("hello", "Hello World Pass");


/*
 * Example II: Say Hello to every function (variant)
 */

namespace {

  // Hello2 - The second implementation with getAnalysisUsage implemented.
  struct Hello2 : public FunctionPass {
    static char ID;
    Hello2() : FunctionPass(ID) {}

    bool runOnFunction(Function &F) override {
      ++HelloCounter;
      errs() << "Hello: ";
      errs().write_escaped(F.getName()) << '\n';
      return false;
    }

    // We don't modify the program, so we preserve all analyses.
    void getAnalysisUsage(AnalysisUsage &AU) const override {
      AU.setPreservesAll();
    }
  };
}

char Hello2::ID = 0;
static RegisterPass<Hello2>
Y("hello2", "Hello World Pass (with getAnalysisUsage implemented)");
