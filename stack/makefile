all: stack.o a.out
stack.o: stack.s
	as stack.s -o stack.o
a.out: stack.o
	ld stack.o -lSystem
clean:
	rm *.o a.out
