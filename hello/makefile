all: hello.o hello
hello.o:
	as hello.s -o hello.o
hello: hello.o
	ld hello.o -lSystem
clean:
	rm *.o a.out
