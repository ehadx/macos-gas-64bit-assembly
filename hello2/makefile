all: hello2.o a.out
hello2.o: hello2.s
	as hello2.s -o hello2.o
a.out: hello2.o
	ld hello2.o -lSystem
clean:
	rm *.o a.out
