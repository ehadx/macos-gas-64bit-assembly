all: func2.o a.out
func2.o: func2.s
	as func2.s -o func2.o
a.out: func2.o
	ld func2.o -lSystem
clean:
	rm *.o a.out
