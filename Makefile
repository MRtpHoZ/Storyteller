# the compiler: llvm
CC = llvm-g++

# compiler flags:
# -g adds debugging information to the executable file
# -Wall turns on most, but not all, compiler warnings
CFLAGS = -Wall -g

# defines any directories containing header files other than /usr/include
INCLUDES = -I./src

# defines library paths in addition to /usr/lib 
LFLAGS = -L./lua/lib/

# defines any libraries to link into executable
LIBS = -llua

# defines the C++ source files 
SRCS = src/Storyteller.cpp src/LuaInterface.cpp src/main.cpp

# defines the C++ object files
OBJS = $(SRCS:.cpp=.o)

# the build target executable
TARGET = ./Storyteller 

# defines fake targets
.PHONY: depend clean 

all: $(TARGET)
	@echo Compiling Storyteller...

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) -o $(TARGET) $(OBJS) $(LFLAGS) $(LIBS) 

.c.o:
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

clean:
	$(RM) src/*.o src/*~ $(TARGET)

depend: $(SRCS)
	makedepend $(INCLUDES) $^

# DO NOT DELETE THIS LINE -- make depend needs it

