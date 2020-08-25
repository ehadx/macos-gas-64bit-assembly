all: func1.o a.out
func1.o: func1.s
	as func1.s -o func1.o
a.out: func1.o
	ld func1.o -lSystem
clean:
	rm *.o a.out
