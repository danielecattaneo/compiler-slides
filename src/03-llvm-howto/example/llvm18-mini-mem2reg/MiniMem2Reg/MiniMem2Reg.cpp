#include <assert.h>
#include "llvm/ADT/SmallVector.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Instructions.h" // The various kinds of instructions
#include "llvm/Support/raw_ostream.h"
#include "MiniMem2Reg.h"

using namespace llvm;

#define DEBUG_TYPE "minimem2reg"

static bool checkIfPromotable(AllocaInst *Alloca) {
  // This is just a simplified version of mem2reg so we only accept allocas
  // that are stored to only once. We use this variable to count the number of
  // store instructions.
  unsigned NumStores = 0;

  // Check all the users
  for (auto U: Alloca->users()) {
    // All users must be loads or stores
    if (StoreInst *Store = dyn_cast<StoreInst>(U)) {
      // Our alloca must be the pointer operand, otherwise bail out.
      // If the pointer is stored somewhere else, then we can't tell where it
      // is loaded back from there later and then dereferenced.
      if (Alloca != Store->getPointerOperand())
        return false;
      // Maximum 1 store
      NumStores++;
      if (NumStores > 1)
        return false;
      // All OK, next one
      continue;
    }
    if (isa<LoadInst>(U)) {
      // If it's a load it's OK, next one
      continue;
    }
    // Not a load or a store, bail out
    return false;
  }

  // Checks passed!
  return true;
}

static void findAllocas(Function &F, SmallVectorImpl<AllocaInst *> &Res) {
  // Allocas only appear in the entry block
  BasicBlock &Entry = F.getEntryBlock();
  // Iterate through all instructions, if they are promotable allocas add them
  // to the list
  for (auto &Inst: Entry) {
    if (AllocaInst *Alloca = dyn_cast<AllocaInst>(&Inst)) {
      LLVM_DEBUG(dbgs() << "Found " << *Alloca << "\n");
      if (checkIfPromotable(Alloca))
        Res.push_back(Alloca);
      else
        LLVM_DEBUG(dbgs() << *Alloca << " is not promotable\n");
    }
  }
}

static void promoteAlloca(AllocaInst *Alloca) {
  LLVM_DEBUG(dbgs() << "Promoting " << *Alloca << "\n");
  // Find the store
  StoreInst *Store = nullptr;
  for (auto U: Alloca->users())
    if ((Store = dyn_cast<StoreInst>(U)))
      break;
  assert(Store && "There should be at least one store");
  LLVM_DEBUG(dbgs() << "The store is " << *Store << "\n");

  // Replace all loads with the values stored
  Value *ValueStored = Store->getValueOperand();
  for (auto U: Alloca->users()) {
    LoadInst *Load = dyn_cast<LoadInst>(U);
    if (!Load || (Load && Alloca != Load->getPointerOperand()))
      break;
    LLVM_DEBUG(
        dbgs() << "RAUW of " << Load->getNameOrAsOperand() << " with " << 
        ValueStored->getNameOrAsOperand() << "\n");
    Load->replaceAllUsesWith(ValueStored);
    Load->eraseFromParent();
  }

  Store->eraseFromParent();
  Alloca->eraseFromParent();
  LLVM_DEBUG(dbgs() << "Finished\n");
}

namespace llvm {

PreservedAnalyses MiniMem2Reg::run(Function &F, FunctionAnalysisManager &AM) {
  LLVM_DEBUG(
      dbgs() << "Running minimem2reg on " << F.getNameOrAsOperand() << "\n");

  // Try promoting allocas until we find no more to change.
  // This allows this simple algorithm to also be effective in case there are
  // simple double-indirections (pointers to pointers) which then are
  // promoted in multiple steps. For instance:
  //   %x.addr = alloca ptr, align 8       ; ineligible for promotion...
  //   %y = alloca ptr, align 8
  //   store ptr %x, ptr %x.addr, align 8
  //   store ptr %x.addr, ptr %y, align 8  ; ...appears here as value argument
  //   %0 = load ptr, ptr %y, align 8
  //   %1 = load ptr, ptr %0, align 8
  //   %2 = load i32, ptr %1, align 4
  // is first transformed to:
  //   %x.addr = alloca ptr, align 8       ; now eligible
  //   store ptr %x, ptr %x.addr, align 8
  //   %1 = load ptr, ptr %x.addr, align 8
  //   %2 = load i32, ptr %1, align 4
  // and then to:
  //   %2 = load i32, ptr %x, align 4
  SmallVector<AllocaInst *, 8> Allocas;
  findAllocas(F, Allocas);
  while (Allocas.size() > 0) {
    for (AllocaInst *Alloca: Allocas) {
      promoteAlloca(Alloca);
    }
    Allocas.clear();
    findAllocas(F, Allocas);
  }

  // Safe return value for simplicity
  return PreservedAnalyses::none();
}

}
