all: console1.o a.out
console1.o: console1.s
	as console1.s -o console1.o
a.out: console1.o
	ld console1.o -lSystem
clean:
	rm *.o a.out
