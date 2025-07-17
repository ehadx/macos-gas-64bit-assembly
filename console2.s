  .global _main

  .section __TEXT,__cstring
msg1:
  .asciz "Hello, World!\n"
msg2:
  .asciz "Your turn (a-z): "
msg3:
  .asciz "You answered: "
nl:
  .asciz "\n"

  .section __DATA,_bss
  input_len = 10
input:
  .space input_len+1

  .section __TEXT,__text
_main:
  push %rbp
  mov %rsp, %rbp

    lea msg1(%rip), %rdi
    call prints

    lea msg2(%rip), %rdi
    call prints

    lea input(%rip), %rdi
    mov $input_len, %rsi
    call reads

    lea msg3(%rip), %rdi
    call prints

    lea input(%rip), %rdi
    mov $input_len, %rsi
    call prints

    lea nl(%rip), %rdi
    call prints

  leave
  ret

prints:
  push %rbp
  mov %rsp, %rbp

    push %r12

      /* count chars */
      xor %rdx, %rdx
      mov %rdi, %r12

    lengthloop:
      cmpb $0x0, (%r12)
      je lengthfound                // length found
      inc %rdx
      inc %r12
      jmp lengthloop                // repeat

    lengthfound:
      cmp $0x0, %rdx                // length = 0
      je 1f                         // done
      mov %rdi, %rsi
      mov $0x4 + 0x2000000, %rax
      mov $0x1, %rdi
      syscall

  1: /* done */
    pop %r12

  leave
  ret

reads:
  .section __DATA,__bss
    1: .space 1
  .section __TEXT,__text
  push %rbp
  mov %rsp, %rbp

    push %r12
    push %r13
    push %r14

      mov %rdi, %r12
      mov %rsi, %r13
      xor %r14, %r14

    readchar:
      mov $0x3 + 0x2000000, %rax
      mov $0x0, %rdi
      lea 1b(%rip), %rsi
      mov $0x1, %rdx
      syscall

      movb 1b(%rip), %al
      cmpb nl(%rip), %al
      je 1f                             // done
      cmpb $97, %al
      jl readchar                       // lower than a
      cmpb $122, %al
      jg readchar                       // greater than z
      inc %r14
      cmp %r13, %r14
      ja readchar
      movb %al, (%r12)
      inc %r12
      jmp readchar

  1: /* done */
    inc %r12
    movb $0x0, (%r12)
    pop %r14
    pop %r13
    pop %r12

  leave
  ret
