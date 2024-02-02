all: debug

# <replace-me>

<replace-me> := build/<replace-me>.o

build/bmp.o: src/bmp/bmp.cpp
	g++ -c $^ -o $@

# Phonies

.PHONY: all clean lib debug

lib: build build/lib-<replace-me>.a

debug: build build/debug

build:
	mkdir -p build

clean:
	rm -rf build/

# Linking

build/lib_bmp.a: $(<replace-me>)
	ar rcs $@ $^

# Main / Entry point

build/main: build/main.o $(<replace-me>)
	g++ $^ -o $@

build/main.o: src/main.cpp
	g++ -c $^ -o $@
