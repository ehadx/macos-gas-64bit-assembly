#include <stdio.h>

int x = 11, y = 12, sum, prod;

__attribute__((naked)) int subtract()
{
  __asm__(
    "push %rbp;"
    "mov %rsp, %rbp;"
    "mov _x(%rip), %rax;"
    "sub _y(%rip), %rax;"
    "mov %rbp, %rsp;"
    "pop %rbp;"
    "ret"
  );
}
void multiply()
{
  __asm__(
    "mov _x(%rip), %rax;"
    "imul _y(%rip), %rax;"
    "mov %rax, _prod(%rip)"
  );
}
int main()
{
  printf("The numbers are %d and %d.\n",x,y);
  __asm__(
    "mov _x(%rip), %rax;"
    "add _y(%rip), %rax;"
    "mov %rax, _sum(%rip)"
  );
  printf("The sum is %d.\n", sum);
  printf("The difference is %d.\n", subtract());
  multiply();
  printf("The product is %d.\n", prod);
}
