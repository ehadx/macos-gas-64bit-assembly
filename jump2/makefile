all: jump2.o a.out
jump2.o: jump2.s
	as jump2.s -o jump2.o
a.out: jump2.o
	ld jump2.o -lSystem
clean:
	rm *.o a.out
