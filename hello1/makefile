all: hello1.o a.out
hello1.o: hello1.s
	as hello1.s -o hello1.o
a.out: hello1.o
	ld hello1.o -lSystem
clean:
	rm *.o a.out
