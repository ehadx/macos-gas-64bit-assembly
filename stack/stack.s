  .extern _printf

  .section __TEXT,__text
  .global _main
_main:
  push %rbp
  mov %rsp, %rbp
  // print orginal
    lea fmt1(%rip), %rdi
    lea string(%rip), %rsi
    mov $0x0, %rax
    call _printf
  // push the string char per char on the stack
    xor %rax, %rax
    lea string(%rip), %rbx
    mov $stringlen, %rcx
    mov $0x0, %r12
    pushloop:      
      movb (%rbx, %r12), %al
      push %rax
      inc %r12
      loop pushloop
  // pop the string char per char from the stack
  // this will reverse the original string
    lea string(%rip), %rbx
    mov $stringlen, %rcx
    mov $0x0, %r12
    poploop:
      pop %rax
      movb %al, (%rbx, %r12)
      inc %r12
      loop poploop
    movb $0x0, (%rbx, %r12)
  // print the reversed string
    lea fmt2(%rip), %rdi
    lea string(%rip), %rsi
    mov $0x0, %rax
    call _printf
  mov %rbp, %rsp
  pop %rbp
  ret

  .section __TEXT,__cstring
fmt1:
  .asciz "The original string: %s\n"
fmt2:
  .asciz "The reversed string: %s\n"

  .section __DATA,__data
string:
  .asciz "ABCDE"
  stringlen = . - string - 1
