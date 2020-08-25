all: float.o a.out
float.o: float.s
	as float.s -o float.o
a.out: float.o
	ld float.o -lSystem
clean:
	rm *.o a.out
