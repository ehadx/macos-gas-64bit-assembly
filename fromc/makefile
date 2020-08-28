all: a.out circle.o rect.o sreverse.o asum.o adouble.o
a.out: fromc.c circle.o rect.o sreverse.o asum.o adouble.o
	clang fromc.c circle.o rect.o sreverse.o asum.o adouble.o
circle.o: circle.s
	as circle.s -o circle.o
rect.o: rect.s
	as rect.s -o rect.o
sreverse.o: sreverse.s
	as sreverse.s -o sreverse.o
asum.o: asum.s
	as asum.s -o asum.o
adouble.o: adouble.s
	as adouble.s -o adouble.o
clean:
	rm *.o a.out
