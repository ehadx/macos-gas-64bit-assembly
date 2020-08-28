  .intel_syntax noprefix
  .global _asum

  .section __TEXT,__text
_asum:
  push rbp
  mov rbp, rsp

    mov rcx, rsi
    mov rbx, rdi
    mov r12, 0
    movsd xmm0, qword ptr [rbx + r12 * 8]
    dec rcx

  sloop:
    inc r12
    addsd xmm0, qword ptr [rbx + r12 * 8]
    loop sloop

  leave
  ret
