   .intel_syntax noprefix
   .global _main
   .extern _printf

   .section __TEXT,__cstring
msg: .asciz "The command and arguments: \n"
fmt: .asciz "%s\n"

   .section __TEXT,__text
_main:
   push rbp
   mov rbp, rsp

   mov r12, rdi          // argc
   mov r13, rsi          // argv*

   lea rdi, [msg + rip]  // msg(%rip)
   call _printf
   mov r14, 0x0
loop:
   lea rdi, [fmt + rip]  // fmt(%rip)
   mov rsi, qword ptr [r13+r14*8] // (%r13, %r14, 0x8)
   call _printf
   inc r14
   cmp r14, r12         // number of argument reached?
   jl loop

   leave
   ret
