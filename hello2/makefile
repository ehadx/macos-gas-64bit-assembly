all: hello2.o hello2
hello2.o:
	as hello2.s -o hello2.o
hello2: hello2.o
	ld hello2.o -lSystem
clean:
	rm *.o a.out
