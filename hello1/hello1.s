// print hello world to stdout
  .section __TEXT,__text
  .globl _main
_main:
  mov $0x4 + 0x2000000, %rax      // write
  mov $0x1, %rdi
  lea msg(%rip), %rsi
  mov $0x13, %rdx
  syscall

  mov $0x1 + 0x2000000, %rax      // exit
  mov $0x0, %rdi
  syscall

  .section __TEXT,__data
msg:
  .asciz "hello world!\n"
