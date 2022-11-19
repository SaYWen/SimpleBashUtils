#include "s21_grep.h"

int main(int argc, char** argv) {
  FILE* fp = NULL;
  FILE* fl = NULL;
  int flag[10] = {0};
  char file_name[256] = {0};
  char pattern[2048] = {0};
  char ch;
  s21_parcer(&argc, &argv, flag);
  argv++;
  int file_open = 1;
  while (*argv) {
    if (**argv == '-') {
      argv++;
    } else {
      if (file_open) {
        if (flag[f]) {
          fl = fopen(*argv, "r");
          int i = 0;
          while ((ch = getc(fl)) != 10) {
            pattern[i] = ch;
            i++;
          }
          fclose(fl);
        } else {
          strcpy(pattern, *argv);
        }
        argv++;
      }
      snprintf(file_name, 256, "%s", *argv);
      int file_empty = 0;
      if ((fp = fopen(file_name, "r")) == NULL) {
        if (!flag[s]) {
          printf("Cannot open file.\n");
        }
        break;
      } else {
        if (getc(fp) == EOF) {
          file_empty = 1;
        }
        fseek(fp, 0, SEEK_SET);
        file_open = 0;
      }
      if (!file_empty) {
        s21_flag_work(flag, fp, pattern, file_name, argc);
      }
      argv++;
      fclose(fp);
    }
  }
  return 0;
}

void flag_o(char *str, char *pattern) {
  char output[128] = {0};
  size_t count = 0;
  size_t prikol = 0;
  while (str[count] != 0) {
    if (strspn(&str[count], pattern) >= 1) {
      output[prikol] = str[count];
      prikol++;
      for (size_t i = 0; i < strlen(output); i++) {
        if (output[i] != pattern[i]) {
          for (size_t j = 0; j < strlen(output); j++) {
            output[j] = 0;
          }
          prikol = 0;
        }
      }
      if (strcmp(output, pattern) == 0 && prikol == strlen(pattern)) {
        prikol = 0;
        printf("%s", output);
        printf("\n");
        for (size_t i = 0; i < strlen(output); i++) {
          output[i] = 0;
        }
      }
    }
    count++;
  }
}

void s21_parcer(int* argc, char*** argv, int flag[]) {
  int option_index, rez;
  char* options = "eivclnhsfo";
  while ((rez = getopt_long(*argc, *argv, options, 0, &option_index)) != -1) {
    switch (rez) {
      case 'e':
        flag[e] = 1;
        break;
      case 'i':
        flag[i] = 1;
        break;
      case 'v':
        flag[v] = 1;
        break;
      case 'c':
        flag[c] = 1;
        break;
      case 'l':
        flag[l] = 1;
        break;
      case 'n':
        flag[n] = 1;
        break;
      case 'h':
        flag[h] = 1;
        break;
      case 's':
        flag[s] = 1;
        break;
      case 'f':
        flag[f] = 1;
        break;
      case 'o':
        flag[o] = 1;
        break;
      default:
        printf("Found unknown option\n");
        break;
    }
  }
}

void s21_flag_work(int flag[], FILE* fp, char pattern[], char file_name[],
                   int argc) {
  regex_t regex;
  char* str = NULL;
  size_t massive = 0;
  int regflag = 0;
  int regexec_find = 0;
  int find;
  int read = 1;
  int string_count = 0;
  int option_l = 1;
  int matches = 0;
  while (read != EOF && option_l) {
    read = getline(&str, &massive, fp);
    string_count++;
    if (read != EOF && str) {
      if (flag[v]) {
        regexec_find = REG_NOMATCH;
      }
      if (flag[i]) {
        regflag = REG_ICASE;
      }
      regcomp(&regex, pattern, regflag);
      find = regexec(&regex, str, 0, NULL, 0);
      regfree(&regex);
      if (find == regexec_find) {
        matches++;
        if (flag[l]) {
          option_l = 0;
        }
        if (matches == 1 && flag[c] && argc > 4) {
          printf("%s:", file_name);
          }
        if (argc > 4 && !flag[h] && !flag[l] && !flag[c]) {
          printf("%s:", file_name);
        }
        if (flag[n] && !flag[c]) {
          printf("%d:", string_count);
        }
        if (option_l && !flag[c]) {
          if (flag[o]) {
            flag_o(str, pattern);
          } else {
            printf("%s", str);
          }
        }
      }
    }
  }
  if (flag[c] && !flag[l]) {
    printf("%d\n", matches);
  }
  if (flag[l] && !option_l) {
    printf("%s\n", file_name);
  }
  free(str);
}
