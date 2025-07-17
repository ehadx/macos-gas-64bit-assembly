// use jump to implement a loop
  .section __TEXT,__text
  .extern _printf
  .globl _main
_main:
  push %rbp
  mov %rsp, %rbp
  mov $0x0, %rbx            // counter
  mov $0x0, %rax            // sum
loop:
  add %rbx, %rax
  inc %rbx
  cmp number(%rip), %rbx
  jle loop                  // rbx <= number
  lea fmt(%rip), %rdi
  mov number(%rip), %rsi
  mov %rax, %rdx
  mov $0x0, %rax
  call _printf
  mov %rbp, %rsp
  pop %rbp
  ret

  .section __TEXT,__const
number:
  .quad 5

  .section __TEXT,__cstring
fmt:
  .string "The sum from 0 to %ld is %ld\n"
