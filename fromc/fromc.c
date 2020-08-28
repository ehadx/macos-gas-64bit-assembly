#include <stdio.h>
#include <string.h>

extern int rarea(int, int);
extern int rcircum(int, int);
extern double carea(double);
extern double ccircum(double);
extern void sreverse(char *, int);
extern void adouble(double [], int);
extern double asum(double [], int);

int main() {
  printf("Compute area and circumference of a rectangle\n");
  printf("Enter the length of one side : \n");
  
  int side1;
  scanf("%d", &side1);

  printf("Enter the length of the other side : \n");

  int side2;
  scanf("%d", &side2);

  // call assembly function with int arguments
  int r_area = rarea(side1, side2);
  int r_circum = rcircum(side1, side2);

  printf("The area of the rectangle = %d\n", r_area);
  printf("The circumference of the rectangle = %d\n\n", r_circum);

  printf("Compute area and circumference of a circle\n");
  printf("Enter the radius : \n");

  double radius;
  scanf("%lf", &radius);

  // call assembly function with double argument
  double c_area = carea(radius);
  double c_circum = ccircum(radius);

  printf("The area of the circle = %lf\n", c_area);
  printf("The circumference of the circle = %lf\n\n", c_circum);

  printf("Reverse a string\n");
  printf("Enter the string:\n");

  char rstring[64];
  scanf("%s", rstring);
  printf("The string is = %s\n", rstring);

  // call an assembly function with string argument
  sreverse(rstring, strlen(rstring));
  printf("The reversed string is = %s\n\n", rstring);

  printf("Some array manipulations\n");

  double darray[] = { 70.0, 83.2, 91.5, 72.1, 55.5 };
  long int len = sizeof(darray) / sizeof(double);
  
  printf("The array has %lu elements\n",len);
  printf("The elements of the array are: \n");

  for (int i = 0; i < len; i++)
    printf("Element %d = %lf\n",i, darray[i]);
  
  // call an assembly function with array argument
  double sum = asum(darray, len);
  printf("The sum of the elements of this array = %lf\n", sum);
  
  adouble(darray,len);
  printf("The elements of the doubled array are: \n");
  for (int i = 0; i < len; i++)
    printf("Element %d = %lf\n",i, darray[i]);
    
  sum = asum(darray,len);
  printf("The sum of the elements of this doubled array = %lf\n", sum);
  return 0;
}
