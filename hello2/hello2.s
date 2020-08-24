// print hello world to stdout
  .section __TEXT,__text
  .globl _main
_main:
  // function prologue
  push %rbp
  mov %rsp, %rbp

  mov $0x4 + 0x2000000, %rax      // write
  mov $0x1, %rdi
  lea msg(%rip), %rsi
  mov $msg_len, %rdx
  syscall

  // function epilogue
  mov %rbp, %rsp
  pop %rbp

  mov $0x1 + 0x2000000, %rax      // exit
  mov $0x0, %rdi
  syscall

  .section __TEXT,__data
msg:
  .asciz "hello world!\n"
msg_len = . - msg - 1

// another way to get length
// msg_start:
//   .asciz "hello world!\n"
// msg_end:
//   .equ msg_len, msg_end - msg_start - 1