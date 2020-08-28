  .intel_syntax noprefix
  .global _adouble

  .section __TEXT,__text
_adouble:
  push rbp
  mov rbp, rsp

    mov rcx, rsi
    mov rbx, rdi
    mov r12, 0
  loop:
    movsd xmm0, qword ptr [rbx + r12 * 8]
    addsd xmm0,xmm0
    movsd qword ptr [rbx + r12 * 8], xmm0
    inc r12
    loop loop

  leave
  ret
