#!/bin/bash
clear
#------Homework done by Pavel Shlyak. All rights reserved

echo -e "\033[37;1;41m Ex. 1.1 Generate random number \033[0m"
echo I\'m born on 28th of July. So the magic is 2807. No need to append anything

x=2807
x1=$(echo scale=2\;$(shuf -i 1-$x -n 1)/10 | bc -l)
x2=$(echo scale=2\;$(shuf -i 1-$x -n 1)/10 | bc -l)
x3=$(echo scale=2\;$(shuf -i 1-$x -n 1)/10 | bc -l)
x4=$(echo scale=2\;$(shuf -i 1-$x -n 1)/10 | bc -l)
printf "x1=$x1\nx2=$x2\nx3=$x3\nx4=$x4\n\n"

echo -e "\033[37;1;41m Ex. 1.2 change base according to the list \033[0m"
echo "I'm 32nd in the student list, so 9, 4, 3, 6 are the proper value bases for me"
echo -n "$x1 in a base 9 is "
echo "obase=9; $x1" | bc
echo -n "$x2 in a base 4 is "
echo "obase=4; $x2" | bc
echo -n "$x3 in a base 3 is "
echo "obase=3; $x3" | bc
echo -n "$x4 in a base 6 is "
echo "obase=6; $x4" | bc

echo -e "\033[37;1;41m Ex. 1.3 \033[0m"
echo "obase=3; $x1" | bc
echo "obase=9; $x3" | bc

echo -e "\033[37;1;41m Ex. 1.4 display all the numbers in dec, bin, oct and hex \033[0m"
#----Convert everything to binary form----
x1b=$(echo "obase=2; $x1" | bc)
x2b=$(echo "obase=2; $x2" | bc)
x3b=$(echo "obase=2; $x3" | bc)
x4b=$(echo "obase=2; $x4" | bc)
#----Convert everything to octa----
x1o=$(echo "ibase=2;obase=1000; $x1b" | bc)
x2o=$(echo "ibase=2;obase=1000; $x2b" | bc)
x3o=$(echo "ibase=2;obase=1000; $x3b" | bc)
x4o=$(echo "ibase=2;obase=1000; $x4b" | bc)
#----Convert everything to hex----
x1h=$(echo "ibase=2;obase=10000; $x1b" | bc)
x2h=$(echo "ibase=2;obase=10000; $x2b" | bc)
x3h=$(echo "ibase=2;obase=10000; $x3b" | bc)
x4h=$(echo "ibase=2;obase=10000; $x4b" | bc)
#----Output---
echo "Dec. $x1 in binary form is $x1b, in octal $x1o and $x1h in hex"
echo "Dec. $x2 in binary form is $x2b, in octal $x2o and $x2h in hex"
echo "Dec. $x3 in binary form is $x3b, in octal $x3o and $x3h in hex"
echo "Dec. $x4 in binary form is $x4b, in octal $x4o and $x4h in hex"

