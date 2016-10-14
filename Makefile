CC=llvm-g++
CFLAGS=-I.

demo: src/main.cpp
	$(CC) -o demo src/main.cpp $(CFLAGS)
