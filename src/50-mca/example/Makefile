LLVM_MCA ?= llvm-mca
CLANG ?= clang
CFLAGS ?= -O3 -march=native
LLVM_MCA_FLAGS ?=
SRC := \
  01_add_reduction_v1.c\
  01_add_reduction_v2.c\
  01_add_reduction_v2b.c\
  01_add_reduction_v3.c\
  01_add_reduction_v3_nocache.c\
  01_add_reduction_v3b.c\
  01_add_reduction_v4.c\
  01_add_reduction_v5.c\
  02_mtx_mul_v1.c\
  02_mtx_mul_v2.c\
  02_mtx_mul_v3.c\
  02_mtx_mul_v4.c

OUTPUT := $(SRC:.c=)
ASM_OUT := $(SRC:.c=.s)
MCA_OUT := $(SRC:.c=.mca.txt) 01_add_reduction_v1b.mca.txt

.PHONY: all
all:	$(OUTPUT) $(ASM_OUT) $(MCA_OUT)

%:	%.c benchmark.c benchmark.h
	$(CLANG) $(CFLAGS) benchmark.c $< -o $@

%.s:	%.c
	$(CLANG) $(CFLAGS) -S $< -o $@

%.mca.txt:	%.s
	if [[ -e $*.c ]]; then \
	  mca_options=$$(cat $*.c | grep -E '//LLVM-MCA-OPTIONS' | sed -e 's/\/\/LLVM-MCA-OPTIONS//g');\
	else \
	  mca_options=$$(cat $< | grep -E '#+LLVM-MCA-OPTIONS' | sed -E -e 's/#+LLVM-MCA-OPTIONS//g');\
	fi; \
	$(LLVM_MCA) $$mca_options $(LLVM_MCA_FLAGS) $< > $@

.PHONY: clean
clean:
	rm -f $(OUTPUT) $(ASM_OUT) $(MCA_OUT)

