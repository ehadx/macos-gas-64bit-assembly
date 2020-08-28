  .intel_syntax noprefix
  .global _sreverse

  .section __TEXT,__text
_sreverse:
  push rbp
  mov rbp, rsp

    mov rcx, rsi
    mov rbx, rdi
    mov r12, 0
  pushloop:
    mov rax, qword ptr [rbx + r12]
    push rax
    inc r12
    loop pushloop

    mov rcx, rsi
    mov rbx, rdi
    mov r12, 0
  popLoop:
    pop rax
    mov byte ptr [rbx + r12], al
    inc r12
    loop popLoop

  mov rax, rdi
  leave
  ret
