  .extern _printf
  .global _main
  
  .section __TEXT,__text
_main:
  push %rbp
  mov %rsp, %rbp
    call area
    lea fmt(%rip), %rdi
    movsd radius(%rip), %xmm1
    mov $0x1, %rax
    call _printf
  leave
  ret
area:
  push %rbp
  mov %rsp, %rbp
    movsd radius(%rip), %xmm0
    mulsd radius(%rip), %xmm0
    mulsd pi(%rip), %xmm0
  leave
  ret

  .section __TEXT,__literal8
radius:
  .double 10.0
pi:
  .double 3.14

  .section __TEXT,__cstring
fmt:
  .asciz "The area of the circle is %.2f\n"