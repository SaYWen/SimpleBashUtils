#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>

enum flag { b, e, n, s, t, v, E, T };

void s21_parcer(int argc, char **argv, int *flag);

int main(int argc, char** argv) {
  int flag[8] = {0};
  s21_parcer(argc, argv, flag);
  argv++;
  while (*argv) {
    if (**argv == '-') {
      argv++;
    } else {
      int count = 1;
      FILE* fp;
      char ch;
      if ((fp = fopen(*argv, "r")) == NULL) {
        printf("Cannot open file.\n");
        break;
      }
      char pred = -1;
      int flags = 1;
      while ((ch = getc(fp)) != EOF) {
        if (flag[s] == 1) {
          if (ch == 10) {
            flags++;
          } else {
            flags = 0;
          }
        }
        if (flags < 3) {
          int flagv = 0;
          if (flag[n] == 1 && (pred == 10 || pred == -1) && flag[b] == 0) {
            printf("%6d\t", count);
            count++;
          }
          if (flag[b] == 1 && (pred == 10 || pred == -1) && ch != 10) {
            printf("%6d\t", count);
            count++;
          }
          if (flag[v] == 1) {
            if (ch > -1 && ch < 32 && ch != 9 && ch != 10) {
              printf("^%c", ch + 64);
              flagv = 1;
            }
          }
          if (flag[e] == 1 && ch == 10) {
            printf("$");
          }
          if (flag[t] == 1 && ch == 9) {
            printf("^%c", ch + 64);
            flagv = 1;
          }
          if (flagv == 0) {
            printf("%c", ch);
          }
        }
        pred = ch;
      }
      fclose(fp);
      argv++;
    }
  }
  return 0;
}

void s21_parcer(int argc, char **argv, int *flag) {
  int rez;
  int option_index;
  char* short_options = "benstvET";
  const struct option long_options[] = {
      {"number-nonblank", no_argument, NULL, 'b'},
      {"number", no_argument, NULL, 'n'},
      {"squeeze-blank", no_argument, NULL, 's'}};
  while ((rez = getopt_long(argc, argv, short_options, long_options,
                            &option_index)) != -1) {
    switch (rez) {
      case 'b':
        flag[b] = 1;
        break;
      case 'e':
        flag[v] = 1;
        flag[e] = 1;
        break;
      case 'n':
        flag[n] = 1;
        break;
      case 's':
        flag[s] = 1;
        break;
      case 't':
        flag[v] = 1;
        flag[t] = 1;
        break;
      case 'v':
        flag[v] = 1;
        break;
      case 'E':
        flag[e] = 1;
        break;
      case 'T':
        flag[t] = 1;
        break;
      default:
        printf("found unknown option\n");
        break;
    }
  }
}
