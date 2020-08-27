all: cmdline.o a.out
cmdline.o: cmdline.s
	as cmdline.s -o cmdline.o
a.out: cmdline.o
	ld cmdline.o -lSystem
clean:
	rm *.o a.out
