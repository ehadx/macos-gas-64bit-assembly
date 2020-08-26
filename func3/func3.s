  .extern _printf
  .extern c_area
  .extern c_circum
  .extern r_area
  .extern r_circum

  .global _main
  .global pi

  .section __TEXT,__literal8
pi:     .double 3.141592654
radius: .double 10.0
  .section __TEXT,__const
side1: .quad 4
side2: .quad 5 
  .section __TEXT,__cstring
fmtf: .asciz "%s %f\n"
fmti: .asciz "%s %d\n"
ca:   .asciz "The circle area is "
cc:   .asciz "The circle circumference is "
ra:   .asciz "The rectangle area is "
rc:   .asciz "The rectangle circumference is "
  .section __TEXT,__text
_main:
push %rbp
mov %rsp, %rbp
// circle area
  call c_area
  // print
    lea fmtf(%rip), %rdi
    lea ca(%rip), %rsi
    mov $1, %rax
    call _printf
// circle circumference
  movsd radius(%rip), %xmm0
  call c_circum
  // print
    lea fmtf(%rip), %rdi
    lea cc(%rip), %rsi
    mov $1, %rax
    call _printf
// rectangle area
  mov side1(%rip), %rdi
  mov side2(%rip), %rsi
  call r_area
  // print
    lea fmtf(%rip), %rdi
    lea ra(%rip), %rsi
    mov %rax, %rdx
    mov $0, %rax
    call _printf
// rectangle circumference
  mov side1(%rip), %rdi
  mov side2(%rip), %rsi
  call r_circum
  // print
    lea fmtf(%rip), %rdi
    lea rc(%rip), %rsi
    mov %rax, %rdx
    mov $0, %rax
    call _printf
mov %rbp, %rsp
pop %rbp
ret
