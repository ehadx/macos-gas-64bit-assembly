all: hello1.o hello1
hello1.o:
	as hello1.s -o hello1.o
hello1: hello1.o
	ld hello1.o -lSystem
clean:
	rm *.o a.out
