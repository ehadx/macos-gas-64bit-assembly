// print hello world to stdout
  .section __TEXT,__text
  .globl _main
_main:
  mov $0x4 + 0x2000000, %rax      // write
  mov $0x1, %rdi
  lea msg(%rip), %rsi
  mov $0xd, %rdx
  syscall

  mov $0x1 + 0x2000000, %rax      // exit
  mov $0x0, %rdi
  syscall

  .section TEXT,__data
msg:
  .ascii "hello world!\n"