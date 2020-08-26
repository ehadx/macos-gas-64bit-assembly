all: func3.o a.out
func3.o: func3.s rect.o circle.o
	as func3.s -o func3.o
rect.o: rect.s
	as rect.s -o rect.o
circle.o: circle.s
	as circle.s -o circle.o
a.out: func3.o
	ld func3.o rect.o circle.o -lSystem
clean:
	rm *.o a.out
