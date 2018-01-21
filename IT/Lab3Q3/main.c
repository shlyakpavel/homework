// This is a personal academic project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com

/* Pavel Shlyak, 2018
 * Разработать программу для решения задачи, состоящей из трех частей.
 * Каждую часть оформить в виде отдельной функции.
 * Ввод и вывод данных, а также проверку существования результата необходимо осуществлять в главной программе.
 * Даны символьные строки (ввод осуществляется до тех пор,  пока не будет введена пустая строка). Требуется:
 * Варианты 1) 170%8+1=3    2) 170%9+1=9    3)170%10+1=1
 * Задания:
 * 1) Выделить из каждой строки и напечатать подстроки не содержащие русских букв.
 * 2) Среди выделенных подстрок найти подстроку, состоящую только из латинских букв и цифр.
 * 3) Преобразовать  исходную  строку,  которой  принадлежит  найденная подстрока, следующим образом:
 *    удалить все символы, отличные от русских букв. */

#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

#define chk_ptr(x) if (!x) puts("Memory allocation error!"), exit(1);

typedef enum { FALSE, TRUE } bool;

void find_subs(char *text, unsigned long text_size, char* subs){
    char *tmp;
    bool keep = TRUE;
    for (unsigned long i=0; i< text_size; i++){
        tmp = realloc(subs, (text_size+1) * sizeof(char));
        chk_ptr(tmp);
        subs = tmp;
        keep = ( *((short*) (text+i)) ) <= ( (short) ('а') ) || ( *((short*) (text+i)) ) >= ( (short) ('я') );
        if (keep) *(subs + i) = *(text+i); else *(subs + i) = '\n', i++;
    }
}

int main()
{
    //  Initialization of the global variables
    char *text, *tmp, *cur;    //A pointer to the source text, a temporary pointer and a current position pointer
    short EOT=0;
    unsigned long text_size = 0; //NEVER USE cur - text!!! NEVER!!!!! Otherwise you're likely to get allocation errors
    text = (char*) malloc(sizeof(char));
    chk_ptr(text);

    //  Input
    //  Todo: check for text_size overflow
    for (text_size=0; !EOT && (text_size < INT_MAX); text_size++){
        tmp = realloc(text, (text_size+1) * sizeof(char));
        chk_ptr(tmp);
        text = tmp;
        cur = (text + text_size);
        *cur=getchar();
        EOT = (*cur == '\n') && (*(cur) == *(cur - 1));
    }
    //Task one
    char* subs = (char*) malloc(sizeof(char));  //Otherwise PVS_STUDIO finds that it is _probably_ a mistake
    chk_ptr(subs);
    find_subs(text, text_size, subs);

    //  Output
    //  text_size includes the last '\n'. Use < instead of <= for that reason
    puts("Original text:");
    for (ulong cur = 0; cur < text_size; cur++){
        putchar(*(text+cur));
    }
    puts("Task one. Substrings:");
    for (ulong cur = 0; cur < text_size; cur++){
        putchar(*(subs+cur));
    }
    return 0;
}
