  .global _main

  .section __TEXT,__cstring
msg1:
  .asciz "Hello, World!\n"
  msg1_len = . - msg1 - 1
msg2:
  .asciz "Your turn: "
  msg2_len = . - msg2 - 1
msg3:
  .asciz "You answered: "
  msg3_len = . - msg3 - 1

  .section __DATA,_bss
  input_len = 10
input:
  .space input_len+1

  .section __TEXT,__text
_main:
  push %rbp
  mov %rsp, %rbp

    lea msg1(%rip), %rsi
    mov $msg1_len, %rdx
    call prints

    lea msg2(%rip), %rsi
    mov $msg2_len, %rdx
    call prints

    lea input(%rip), %rsi
    mov $input_len, %rdx
    call reads

    lea msg3(%rip), %rsi
    mov $msg3_len, %rdx
    call prints

    lea input(%rip), %rsi
    mov $input_len, %rdx
    call prints

  leave
  ret

prints:
  push %rbp
  mov %rsp, %rbp

    mov $0x4 + 0x2000000, %rax
    mov $0x1, %rdi
    syscall

  leave
  ret

reads:
  push %rbp
  mov %rsp, %rbp

    mov $0x3 + 0x2000000, %rax
    mov $0x0, %rdi
    syscall

  leave
  ret
