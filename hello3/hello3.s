// print hello world using printf
  .section __TEXT,__text
  .extern _printf
  .globl _main
_main:
  // function prologue
  push %rbp
  mov %rsp, %rbp

  lea format(%rip), %rdi       // 1st arg
  lea msg(%rip), %rsi          // 2nd arg
  mov $0x0, %rax               // no xmm
  call _printf

  // function epilogue
  mov %rbp, %rsp
  pop %rbp

  mov $0x1 + 0x2000000, %rax      // exit
  mov $0x0, %rdi
  syscall

  .section __TEXT,__cstring
format:
  .asciz "%s"
msg:
  .asciz "hello world!\n"
msg_len = . - msg - 1
