all: console2.o a.out
console2.o: console2.s
	as console2.s -o console2.o
a.out: console2.o
	ld console2.o -lSystem
clean:
	rm *.o a.out
