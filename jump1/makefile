all: jump1.o a.out
jump1.o: jump1.s
	as jump1.s -o jump1.o
a.out: jump1.o
	ld jump1.o -lSystem
clean:
	rm *.o a.out
