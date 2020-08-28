  .intel_syntax noprefix
  .global _carea
  .global _ccircum

  .section __TEXT,__literal8
pi: .double 3.141592654

  .section __TEXT,__text
_carea:
  push rbp
  mov rbp, rsp

    movsd xmm1, qword ptr [pi + rip]
    mulsd xmm0, xmm0
    mulsd xmm0, xmm1

  leave
  ret

_ccircum:
  push rbp
  mov rbp, rsp

    movsd xmm1, qword ptr [pi + rip]
    addsd xmm0, xmm0
    mulsd xmm0, xmm1

  leave
  ret
