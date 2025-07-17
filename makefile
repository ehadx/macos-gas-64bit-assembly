EXAMPLES = cmdline console1 console2 float func1 func2 hello1 hello2 hello3 \
   integer jump1 jump2 loop macro stack fromc inline1 inline2 func3
LINKER_FLAGS = -lSystem -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib

.SUFFIXES:

.PHONY: all clean

all: $(EXAMPLES)

fromc: fromc/fromc.c fromc_circle.o fromc_rect.o fromc_sreverse.o fromc_asum.o fromc_adouble.o
	mkdir -p out
	clang fromc/fromc.c fromc_circle.o fromc_rect.o fromc_sreverse.o fromc_asum.o fromc_adouble.o -o out/$@
fromc_circle.o: fromc/circle.s
	as $< -o $@
fromc_rect.o: fromc/rect.s
	as $< -o $@
fromc_sreverse.o: fromc/sreverse.s
	as $< -o $@
fromc_asum.o: fromc/asum.s
	as $< -o $@
fromc_adouble.o: fromc/adouble.s
	as $< -o $@

inline1:
	clang inline1.c -o out/$@
inline2:
	clang inline2.c -o out/$@

func3: func3.o func3_rect.o func3_circle.o
	ld func3.o func3_rect.o func3_circle.o -o out/$@ $(LINKER_FLAGS)
func3.o: func3/func3.s
	as $< -o $@
func3_rect.o: func3/rect.s
	as $< -o $@
func3_circle.o: func3/circle.s
	as $< -o $@

%.o: %.s
	as -o $@ $<
%: %.o
	mkdir -p out
	ld -o out/$@ $(LINKER_FLAGS) $<

clean:
	rm -rf out *.o
