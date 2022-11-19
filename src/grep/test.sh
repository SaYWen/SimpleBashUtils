#!/bin/bash

> result
> original
> s21_grep1

# # -all +

grep -vin 1 test.txt >> original
./s21_grep -vin 1 test.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -vin '[Linux, is]' *.txt >> original
./s21_grep -vin '[Linux, is]' *.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -vinlc '[prikolchik, mia]' test2.txt >> original
./s21_grep -vinlc '[prikolchik, mia]' test2.txt >> s21_grep1
diff -s original s21_grep1 >> result

# -noflag +

grep 1 test.txt >> original
./s21_grep 1 test.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep '[Linux, is]' test1.txt >> original
./s21_grep '[Linux, is]' test1.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep '[prikolchik, mia]' test2.txt >> original
./s21_grep '[prikolchik, mia]' test2.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep 1 *.txt >> original
./s21_grep 1 *.txt >> s21_grep1
diff -s original s21_grep1 >> result

# -e +

grep -e 1 test.txt >> original
./s21_grep 1 -e test.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -e Linux test1.txt >> original
./s21_grep -e Linux test1.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -e ra *.txt >> original
./s21_grep -e ra *.txt >> s21_grep1
diff -s original s21_grep1 >> result

# -i +

grep -i g *.txt >> original
./s21_grep -i g *.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -i The test1.txt >> original
./s21_grep -i The test1.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -i M test2.txt >> original
./s21_grep -i M test2.txt >> s21_grep1
diff -s original s21_grep1 >> result

# -v +

grep -v '[0-9]' *.txt >> original
./s21_grep -v '[0-9]' *.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -v Linux test1.txt >> original
./s21_grep -v Linux test1.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -v kekw test2.txt >> original
./s21_grep -v kekw test2.txt >> s21_grep1
diff -s original s21_grep1 >> result

# -c +

grep -c 1 *.txt >> original
./s21_grep -c 1 *.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -c '[Linux, is]' test1.txt >> original
./s21_grep -c '[Linux, is]' test1.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -c '[prikolchik, mia]' test2.txt >> original
./s21_grep -c '[prikolchik, mia]' test2.txt >> s21_grep1
diff -s original s21_grep1 >> result

# -l +

grep -l 1 test.txt >> original
./s21_grep -l 1 test.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -l 100 *.txt >> original
./s21_grep -l 100 *.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -l '[Mama, mia]' test2.txt >> original
./s21_grep -l '[Mama, mia]' test2.txt >> s21_grep1
diff -s original s21_grep1 >> result

# -n +

grep -n 123 *.txt >> original
./s21_grep -n 123 *.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -n '[Linux, is]' test1.txt >> original
./s21_grep -n '[Linux, is]' test1.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep '[Mama, kekw]' test2.txt >> original
./s21_grep '[Mama, kekw]' test2.txt >> s21_grep1
diff -s original s21_grep1 >> result

# -h +

grep -h 1 test.txt test1.txt >> original
./s21_grep -h 1 test.txt test1.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -h '[Linux, is]' test1.txt test2.txt >> original
./s21_grep -h '[Linux, is]' test1.txt test2.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -h 1 *.txt >> original
./s21_grep -h 1 *.txt >> s21_grep1
diff -s original s21_grep1 >> result

# -s +

grep -s 1 test >> original
./s21_grep -s 1 test >> s21_grep1
diff -s original s21_grep1 >> result

grep -s '[Linux, is]' test1.tx >> original
./s21_grep -s '[Linux, is]' test1.tx >> s21_grep1
diff -s original s21_grep1 >> result

grep -s mama lexakrutoi >> original
./s21_grep -s mama lexakrutoi >> s21_grep1
diff -s original s21_grep1 >> result

# -f +

grep -f flagf.txt *.txt >> original
./s21_grep -f flagf.txt *.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -f flagf.txt test1.txt >> original
./s21_grep -f flagf.txt test1.txt >> s21_grep1
diff -s original s21_grep1 >> result

grep -f flagf.txt test2.txt >> original
./s21_grep -f flagf.txt test2.txt >> s21_grep1
diff -s original s21_grep1 >> result

# -o +

grep -o 1 test.txt >> original
./s21_grep -o 1 test.txt >> s21_grep1
diff -s original s21_grep1 >> result

# grep -on Li test1.txt >> original
# ./s21_grep -on Li test1.txt >> s21_grep1
# diff -s original s21_grep1 >> result

grep -o s test2.txt >> original
./s21_grep -o s test2.txt >> s21_grep1
diff -s original s21_grep1 >> result
