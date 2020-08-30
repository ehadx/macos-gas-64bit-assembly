  .extern _printf
  .globl _main

  .macro double_it num
    sal $1, \num
  .endm

  .macro prntf strng, num
    .section __TEXT,__cstring
    1: .asciz "\strng"
    .section __TEXT,__text
    lea fmtint(%rip), %rdi
    lea 1b(%rip), %rsi
    mov \num, %rdx
    mov $0, %rax
    call _printf
  .endm

  .section __TEXT,__text
_main:
  push %rbp
  mov %rsp, %rbp

    prntf "the number is", number(%rip)
    mov number(%rip), %rax
    double_it %rax
    mov %rax, number(%rip)
    prntf "the number times 2 is", number(%rip)

  leave
  ret

  .section __TEXT,__cstring
fmtint: .asciz "%s %ld\n"
  .section __DATA,__data
number: .quad 15
