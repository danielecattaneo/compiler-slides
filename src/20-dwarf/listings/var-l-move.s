     5: leaq 16(%rsp), %rbx
    22: leaq 40(%rbx), %rdx  p: %rbx
    26: xorl %eax, %eax      p: %rbx
    28: movq %rbx, %rdi      p: %rbx
/-> 30: addq $4, %rdi        p: %rdi
|   34: addl -4(%rdi), %eax  p: %rdi
|   37: cmpq %rdx, %rdi      p: %rdi
\-- 3a: jne  -12 <main+0x30> p: %rdi
    3c: leaq 12(%rsp), %rdi
    41: movl %eax, 12(%rsp)
