all: hello3.o a.out
hello3.o: hello3.s
	as hello3.s -o hello3.o
a.out: hello3.o
	ld hello3.o -lSystem
clean:
	rm *.o a.out
