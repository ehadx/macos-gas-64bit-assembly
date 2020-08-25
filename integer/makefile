all: integer.o a.out
integer.o: integer.s
	as integer.s -o integer.o
a.out: integer.o
	ld integer.o -lSystem
clean:
	rm *.o a.out
