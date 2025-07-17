EXAMPLES = cmdline console1 console2 float func1 func2 hello1 hello2 hello3 \
   integer jump1 jump2 loop macro stack fromc inline1 inline2 func3
LINKER_FLAGS = -lSystem -L/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/lib
BUILD_DIR = out

.SUFFIXES:

.PHONY: all clean

all: $(EXAMPLES)

FROMC_OBJS = circle.o rect.o sreverse.o asum.o adouble.o
FROMC_OBJS_NAMES = $(addprefix fromc_, $(FROMC_OBJS))
FROMC_OBJS_PATHS = $(addprefix $(BUILD_DIR)/, $(FROMC_OBJS_NAMES))

fromc: fromc/fromc.c $(FROMC_OBJS_NAMES)
	@mkdir -p $(BUILD_DIR)
	clang $< $(FROMC_OBJS_PATHS) -o $(BUILD_DIR)/$@
fromc_circle.o: fromc/circle.s
	@mkdir -p $(BUILD_DIR)
	as $< -o $(BUILD_DIR)/$@
fromc_rect.o: fromc/rect.s
	@mkdir -p $(BUILD_DIR)
	as $< -o $(BUILD_DIR)/$@
fromc_sreverse.o: fromc/sreverse.s
	@mkdir -p $(BUILD_DIR)
	as $< -o $(BUILD_DIR)/$@
fromc_asum.o: fromc/asum.s
	@mkdir -p $(BUILD_DIR)
	as $< -o $(BUILD_DIR)/$@
fromc_adouble.o: fromc/adouble.s
	@mkdir -p $(BUILD_DIR)
	as $< -o $(BUILD_DIR)/$@

FUNC3_OBJS = circle.o rect.o
FUNC3_OBJS_NAMES = $(addprefix func3_, $(FUNC3_OBJS))
FUNC3_OBJS_PATHS = $(addprefix $(BUILD_DIR)/, $(FUNC3_OBJS_NAMES))

func3: $(BUILD_DIR)/func3.o $(FUNC3_OBJS_NAMES)
	@mkdir -p $(BUILD_DIR)
	ld $< $(FUNC3_OBJS_PATHS) -o $(BUILD_DIR)/$@ $(LINKER_FLAGS)
func3.o: func3/func3.s
	@mkdir -p $(BUILD_DIR)
	as $< -o $(BUILD_DIR)/$@
func3_rect.o: func3/rect.s
	@mkdir -p $(BUILD_DIR)
	as $< -o $(BUILD_DIR)/$@
func3_circle.o: func3/circle.s
	@mkdir -p $(BUILD_DIR)
	as $< -o $(BUILD_DIR)/$@

%.o: %.s
	@mkdir -p $(BUILD_DIR)
	as -o $(BUILD_DIR)/$@ $<

%: %.o
	@mkdir -p $(BUILD_DIR)
	ld -o $(BUILD_DIR)/$@ $(LINKER_FLAGS) $(BUILD_DIR)/$<

%: %.c
	@mkdir -p $(BUILD_DIR)
	clang $< -o $(BUILD_DIR)/$@

clean:
	rm -rf $(BUILD_DIR) *.o
