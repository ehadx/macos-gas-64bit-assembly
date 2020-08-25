  .extern _printf

  .section __TEXT,__text
  .globl _main
_main:
  push %rbp
  mov %rsp, %rbp

  // displaying the numbers
  lea fmt(%rip), %rdi
  mov num1(%rip), %rsi
  mov num2(%rip), %rdx
  mov $0x0, %rax
  call _printf

  // adding
  mov num1(%rip), %rax
  add num2(%rip), %rax
  mov %rax, resulti(%rip)
  lea fmtint(%rip), %rdi
  lea sumi(%rip), %rsi
  mov resulti(%rip), %rdx
  mov $0x0, %rax
  call _printf

  // substracting
  mov num1(%rip), %rax
  sub num2(%rip), %rax
  mov %rax, resulti(%rip)
  lea fmtint(%rip), %rdi
  lea difi(%rip), %rsi
  mov resulti(%rip), %rdx
  mov $0x0, %rax
  call _printf

  // incrementing
  mov num1(%rip), %rax
  inc %rax
  mov %rax, resulti(%rip)
  lea fmtint(%rip), %rdi
  lea inci(%rip), %rsi
  mov resulti(%rip), %rdx
  mov $0x0, %rax
  call _printf

  // decrementing
  mov num1(%rip), %rax
  inc %rax
  mov %rax, resulti(%rip)
  lea fmtint(%rip), %rdi
  lea deci(%rip), %rsi
  mov resulti(%rip), %rdx
  mov $0x0, %rax
  call _printf

  // shift arithmetic left
  mov num1(%rip), %rax
  sal $0x2, %rax
  mov %rax, resulti(%rip)
  lea fmtint(%rip), %rdi
  lea sali(%rip), %rsi
  mov resulti(%rip), %rdx
  mov $0x0, %rax
  call _printf

  // shift arithmetic right
  mov num1(%rip), %rax
  sar $0x2, %rax
  mov %rax, resulti(%rip)
  lea fmtint(%rip), %rdi
  lea sari(%rip), %rsi
  mov resulti(%rip), %rdx
  mov $0x0, %rax
  call _printf

  // shift arithmetic right with sign extension
  mov neg_num(%rip), %rax
  sar $0x2, %rax
  mov %rax, resulti(%rip)
  lea fmtint(%rip), %rdi
  lea sariex(%rip), %rsi
  mov resulti(%rip), %rdx
  mov $0x0, %rax
  call _printf

  // multiply
  mov num1(%rip), %rax
  imulq num2(%rip)
  mov %rax, resulti(%rip)
  lea fmtint(%rip), %rdi
  lea multi(%rip), %rsi
  mov resulti(%rip), %rdx
  mov $0x0, %rax
  call _printf

  // divide
  mov num1(%rip), %rax
  mov $0x0, %rdx                  // needs to zero before idiv
  idivq num2(%rip)
  mov %rax, resulti(%rip)
  mov %rdx, modulo(%rip)          // rdx to modulo
  lea fmtint(%rip), %rdi
  lea divi(%rip), %rsi
  mov resulti(%rip), %rdx
  mov $0x0, %rax
  call _printf
  lea fmtint(%rip), %rdi
  lea remi(%rip), %rsi
  mov modulo(%rip), %rdx
  mov $0x0, %rax
  call _printf

  mov %rbp, %rsp
  pop %rbp
  ret

  .section __TEXT,__const
num1:
  .quad 128
num2:
  .quad 19
neg_num:
  .quad -12

  .section __TEXT,__cstring
fmt:
  .string "The numbers are %ld and %ld\n"
fmtint:
  .string "%s %ld\n"
sumi:
  .string "The sum is"
difi:
  .string "The difference is"
inci:
  .string "Number 1 Incremented:"
deci:
  .string "Number 1 Decremented:"
sali:
  .string "Number 1 Shift left 2 (x4):"
sari:
  .string "Number 1 Shift right 2 (/4):"
sariex:
  .string "Number 1 Shift right 2 (/4) with sign extention:"
multi:
  .string "The product is"
divi:
  .string "The integer quotient is"
remi:
  .string "The modulo is"

  .section __DATA,__bss
resulti:
  .space 8
modulo:
  .space 8
