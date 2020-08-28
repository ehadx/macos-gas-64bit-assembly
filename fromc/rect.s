  .intel_syntax noprefix
  .global _rarea
  .global _rcircum

  .section __TEXT,__text
_rarea:
  push rbp
  mov rbp, rsp

    mov rax, rdi
    imul rsi

  leave
  ret

_rcircum:
  push rbp
  mov rbp, rsp

    mov rax, rdi
    add rax, rsi
    imul rax, 2

  leave
  ret
