all: macro.o a.out
macro.o: macro.s
	as macro.s -o macro.o
a.out: macro.o
	ld macro.o -lSystem
clean:
	rm *.o a.out
