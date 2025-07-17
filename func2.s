  .extern _printf
  .global _main

  .section __TEXT,__literal8
    radius: .double 10.0

  .section __TEXT,__text
area:
  .section __TEXT,__literal8
    1: .double 3.141592654 // pi
  .section __TEXT,__text
  push %rbp
  mov %rsp, %rbp
    movsd radius(%rip), %xmm0
    mulsd radius(%rip), %xmm0
    mulsd 1b(%rip), %xmm0
  leave
  ret

circum:
  .section __TEXT,__literal8
    1: .double 3.14 // pi
  .section __TEXT,__text
  push %rbp
  mov %rsp, %rbp
    movsd radius(%rip), %xmm0
    addsd radius(%rip), %xmm0
    mulsd 1b(%rip), %xmm0
  leave
  ret

circle:
  .section __TEXT,__cstring
    1: .asciz "The area is %f\n"
    2: .asciz "The circumference is %f\n"
  .section __TEXT,__text
  push %rbp
  mov %rsp, %rbp
    call area
    lea 1b(%rip), %rdi
    mov $0x1, %rax
    call _printf
    call circum
    lea 2b(%rip), %rdi
    mov $0x1, %rax
    call _printf
  leave
  ret
  
_main:
  push %rbp
  mov %rsp, %rbp
    call circle
  leave
  ret
