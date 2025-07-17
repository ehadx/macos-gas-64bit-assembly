   // use loop instruction
   .section __TEXT,__text
   .extern _printf
   .globl _main
_main:
   push %rbp
   mov %rsp, %rbp
   mov number(%rip), %rcx            // counter
   mov $0x0, %rax
loop:
   add %rcx, %rax
   loop loop                         // loop and dec rcx until 0
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
