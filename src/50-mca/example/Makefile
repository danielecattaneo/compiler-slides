LLVM_MCA ?= llvm-mca
CFLAGS ?= -O3 -march=native
SRC := \
  01_add_reduction_v1.c\
  01_add_reduction_v2.c\
  01_add_reduction_v3.c\
  01_add_reduction_v4.c

OUTPUT := $(SRC:.c=)
ASM_OUT := $(SRC:.c=.s)
MCA_OUT := $(SRC:.c=.mca.txt)

.PHONY: all
all:	$(OUTPUT) $(ASM_OUT) $(MCA_OUT)

%:	%.c benchmark.c benchmark.h
	clang $(CFLAGS) benchmark.c $< -o $@

%.s:	%.c
	clang $(CFLAGS) -S $< -o $@

%.mca.txt:	%.s
	mca_options=$$(cat $*.c | grep -E '//LLVM-MCA-OPTIONS' | sed -e 's/\/\/LLVM-MCA-OPTIONS//g');\
	$(LLVM_MCA) $$mca_options $< > $@

.PHONY: clean
clean:
	rm -f $(OUTPUT) $(ASM_OUT) $(MCA_OUT)

