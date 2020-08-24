// use jump to implement an if condition
  .section __TEXT,__text
  .extern _printf
  .globl _main
_main:
  push %rbp
  mov %rsp, %rbp
  mov number1(%rip), %rax
  mov number2(%rip), %rbx
  cmp %rbx, %rax
  jge greater                     // if rax >= rbx
  lea fmt2(%rip), %rdi
  mov $0x0, %rax
  call _printf
  jmp exit
greater:
  lea fmt1(%rip), %rdi
  mov $0x0, %rax
  call _printf
exit:
  mov %rbp, %rsp
  pop %rbp
  ret

  .section __TEXT,__const
number1:
  .quad 46
number2:
  .quad 490
  
  .section __TEXT,__cstring
fmt1:
  .asciz "number1 >= number2\n"
fmt2:
  .asciz "number1 < number2\n"
