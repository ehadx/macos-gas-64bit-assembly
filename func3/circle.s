  .extern pi
  .global c_circum
  .global c_area

  .section __TEXT,__text
c_area:
push %rbp
mov %rsp, %rbp
  movsd pi(%rip), %xmm1
  mulsd %xmm0, %xmm0
  mulsd %xmm1, %xmm0
mov %rbp, %rsp
pop %rbp
ret
c_circum:
push %rbp
mov %rsp, %rbp
  movsd pi(%rip), %xmm1
  addsd %xmm0, %xmm0
  mulsd %xmm1, %xmm0
mov %rbp, %rsp
pop %rbp
ret
