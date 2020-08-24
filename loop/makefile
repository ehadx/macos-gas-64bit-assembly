all: loop.o a.out
loop.o: loop.s
	as loop.s -o loop.o
a.out: loop.o
	ld loop.o -lSystem
clean:
	rm *.o a.out
