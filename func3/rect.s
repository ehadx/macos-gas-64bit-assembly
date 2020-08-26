  .extern pi
  .global r_circum
  .global r_area

  .section __TEXT,__text
r_area:
push %rbp
mov %rsp, %rbp
  mov %rsi, %rax
  imul %rdi, %rax
mov %rbp, %rsp
pop %rbp
ret
r_circum:
push %rbp
mov %rsp, %rbp
  mov %rsi, %rax
  add %rdi, %rax
  add %rax, %rax
mov %rbp, %rsp
pop %rbp
ret
