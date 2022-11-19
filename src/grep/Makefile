CC = gcc -std=c11
CFLAGS = -Wall -Werror -Wextra
LIBS = -lcheck
TARGET_GREP = s21_grep
OS = $(shell uname)

all: clean s21_grep

$(TARGET_GREP): s21_grep.o
	$(CC) s21_grep.o -D_GNU_SOURCE $(CFLAGS) -o $@

s21_grep.o: s21_grep.c
	$(CC) -c s21_grep.c -D_GNU_SOURCE $(CFLAGS) -o $@

test: clean s21_grep
	sh ./test.sh

clean:
	rm -rf *.o *.so *.a fizz *.gc* *.info report *.out 
	rm -rf s21_grep
	rm -rf *.gcda *.gcno

rebuild: clean all

linter:
	cp ../../materials/linters/CPPLINT.cfg CPPLINT.cfg
	python3 ../../materials/linters/cpplint.py --extensions=c *.c
	python3 ../../materials/linters/cpplint.py --extensions=c *.h
	rm -rf CPPLINT.cfg

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem *.c

memcheck: clean s21_grep mem

mem:
ifeq ($(OS), Linux)
	valgrind --leak-check=full --show-leak-kinds=all ./s21_grep -eivnhso 1 *.txt
else
	leaks --atExit -- ./s21_grep -eivnhso 1 test1.txt
endif

