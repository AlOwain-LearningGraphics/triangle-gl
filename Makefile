all: main

# Compilation units

# triangle := build/main.o

# Phonies

.PHONY: all clean lib debug

main: build build/main

build:
	mkdir -p build

clean:
	rm -rf build/

# Main / Entry point

build/main: build/main.o
	g++ $^ -o $@

build/main.o: src/main.cpp
	g++ -c $^ -o $@
