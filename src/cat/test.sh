# #!/bin/bash

> result.txt
> original.txt
> s21_cat.txt

# # -b +

cat -b test.txt >> original.txt
./s21_cat -b test.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

cat -b test1.txt >> original.txt
./s21_cat -b test1.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

cat -b test2.txt >> original.txt
./s21_cat -b test2.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

# # -c +

cat -e test.txt >> original.txt
./s21_cat -e test.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

cat -e test1.txt >> original.txt
./s21_cat -e test1.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

cat -e test2.txt >> original.txt
./s21_cat -e test2.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

# # -n +

cat -n test.txt >> original.txt
./s21_cat -n test.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

cat -n test1.txt >> original.txt
./s21_cat -n test1.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

cat -n test2.txt >> original.txt
./s21_cat -n test2.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

# # -s +

cat -s test.txt >> original.txt
./s21_cat -s test.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

cat -s test1.txt >> original.txt
./s21_cat -s test1.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

cat -s test2.txt >> original.txt
./s21_cat -s test2.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

# # -t +

cat -t test.txt >> original.txt
./s21_cat -t test.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

cat -t test1.txt >> original.txt
./s21_cat -t test1.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt

cat -t test2.txt >> original.txt
./s21_cat -t test2.txt >> s21_cat.txt
diff -s original.txt s21_cat.txt >> result.txt
