all: hello3.o hello3
hello3.o:
	as hello3.s -o hello3.o
hello3: hello3.o
	ld hello3.o -lSystem
clean:
	rm *.o a.out
