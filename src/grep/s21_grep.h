#ifndef SRC_GREP_S21_GREP_H_
#define SRC_GREP_S21_GREP_H_

#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

enum flag { e, i, v, c, l, n, h, s, f, o };

void s21_parcer(int* argc, char*** argv, int flag[]);
void s21_flag_work(int flag[], FILE* fp, char pattern[], char file_name[],
                   int argc);
void flag_o(char* str, char* pattern);

#endif  // SRC_GREP_S21_GREP_H_
