CC = gcc
FLAGS = -Wall -Wextra -Werror -std=c11
OS = $(shell uname)

default: all

all: clean s21_cat linter cppcheck mem

s21_cat:
	$(CC) $(FLAGS) -o s21_cat s21_cat.c

clean:
	rm -rf *.a *.o *.out s21_cat

memcheck: clean s21_cat mem

mem:
ifeq ($(OS), Linux)
	valgrind --leak-check=summary ./s21_cat -nbets *.txt
else
	leaks --atExit -- ./s21_cat -nbets *.txt
endif

test: clean s21_cat
	sh ./test.sh

linter:
	cp ../../materials/linters/CPPLINT.cfg CPPLINT.cfg
	python3 ../../materials/linters/cpplint.py --extensions=c *.c
	rm -rf CPPLINT.cfg

cppcheck:
	cppcheck --enable=all --suppress=missingIncludeSystem *.c
