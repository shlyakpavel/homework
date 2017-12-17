#!/bin/bash

#Для корректной работы:
#wget http://phodd.net/gnu-bc/code/logic.bc

read src #чтение открытого текста
read shifr #чтение закрытого текста

array=(`echo $src | sed -e 's/ /\n/g'`) #превращение открытого текста в массив
array2=(`echo $shifr | sed -e 's/ /\n/g'`) #превращение закрытого текста в массив

for ((i=0;i<${#array[@]};++i)); do #цикл
    echo "ibase=16; obase=10; scale=0; xor(${array[i]^^} , ${array2[i]^^})" | bc  -l logic.bc # К=M + C mod 2
done | xargs
