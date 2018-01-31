// This is a personal academic project. Dear PVS-Studio, please check it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com

/* Pavel Shlyak, 2018
 * Разработать программу для решения задачи, состоящей из трех частей.
 * Каждую часть оформить в виде отдельной функции.
 * Ввод и вывод данных, а также проверку существования результата необходимо
 * осуществлять в главной программе.
 * Даны символьные строки (ввод осуществляется до тех пор,  пока не будет
 * введена пустая строка). Требуется:
 * Варианты 1) 170%8+1=3    2) 170%9+1=9    3)170%10+1=1
 * Задания:
 * 1) Выделить из каждой строки и напечатать подстроки не содержащие русских
 * букв.
 * 2) Среди выделенных подстрок найти подстроку, состоящую только из латинских
 * букв и цифр.
 * 3) Преобразовать  исходную  строку,  которой  принадлежит  найденная
 * подстрока, следующим образом:
 *    удалить все символы, отличные от русских букв. */

#include <limits.h>
#include <locale.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define chk_ptr(x)                                                             \
  if (!x)                                                                      \
    puts("Memory allocation error!"), exit(1);

// typedef enum { false, true } bool;

void find_subs(char *text, unsigned long text_size, char *subs) {
  /* Temporary pointer is designed to safe subs during memory reallocation.
   * It prevents loosing the original pointer then additional memory cannot be
   * allocated */
  char *tmp;
  bool keep = true;
  for (unsigned long i = 0; i < text_size; i++) {
    tmp = realloc(subs, (text_size + 1) * sizeof(char));
    chk_ptr(tmp);
    subs = tmp;

    keep = *(text + i) > ('я') || *(text + i) < ('а');
    keep = keep && (*(text + i) != 'ё');
    if (keep)
      *(subs + i) = *(text + i);
    else
      *(subs + i) = '\n';
  }
}

void find_subs2(char *src, unsigned long text_size, char *res, int *pos) {
  char *tmp = NULL;
  bool stringisgood = true;
  bool charisgood = false;
  int res_size = 0;
  unsigned long i;
  for (i = 0; i < text_size && !(stringisgood && (*(src + i) == '\n')); i++) {
    charisgood = ((*(src + i) >= 'a') && (*(src + i) <= 'z')) ||
                 ((*(src + i) >= '1') && (*(src + i) <= '9'));
    if (!charisgood)
      stringisgood = false;
    if (*(src + i) == '\n')
      stringisgood = true;
    if (stringisgood && charisgood) {
      tmp = realloc(res, (res_size + 1) * sizeof(char));
      chk_ptr(tmp);
      res = tmp;
      *(res + res_size++) = *(src + i);
    } else
      res_size = 0;
  }
  *pos = i - res_size;
  *(res + res_size) = '\n';
}

char *srcwithoutrus(char* src, int pos) {
    char *output;
    int size = 0;
    char* pointer=src+pos;
    output = malloc(sizeof(char)*1000);
    while (*pointer != '\n'){
        bool keep = *pointer > ('я') || *pointer < ('а');
        keep = keep && (*pointer != 'ё');
        if (keep) *(output+size++)=*pointer;
        pointer++;
    }
    *(output+size)='\0';
  return output;
}

int main() {
  setlocale(LC_ALL, ".1251");
  //  Initialization of the global variables
  char *text, *tmp, *cur; // A pointer to the source text, a temporary pointer
                          // and a current position pointer
  short EOT = 0;
  unsigned long text_size = 0; // NEVER USE cur - text!!! NEVER!!!!! Otherwise
                               // you're likely to get allocation errors
  /* C++ Standard - 5.3.3 / 1:
   *    sizeof(char), sizeof(signed char) and sizeof(unsigned char) are 1.
   * However, C Standart does NOT requie char to be one byte only
   * So do NOT replace sizeof(char) with 1 */
  text = (char *)malloc(sizeof(char));
  chk_ptr(text);

  //  Input
  //  Todo: check for text_size overflow
  for (text_size = 0; !EOT && (text_size < INT_MAX); text_size++) {
    tmp = realloc(text, (text_size + 1) * sizeof(char));
    chk_ptr(tmp);
    text = tmp;
    cur = (text + text_size);
    *cur = getchar();
    EOT = (*cur == '\n') && (*(cur) == *(cur - 1));
  }
  // Task one
  char *subs1 = (char *)malloc(sizeof(
      char)); // Otherwise PVS_STUDIO finds that it is _probably_ a mistake
  chk_ptr(subs1);
  find_subs(text, text_size, subs1);
  // Task two
  char *subs2 = (char *)malloc(sizeof(char));
  chk_ptr(subs2);
  int pos;
  find_subs2(subs1, text_size, subs2, &pos);
  //  Output
  //  text_size includes the last '\n'. Use < instead of <= for that reason
  puts("Original text:");
  for (ulong cur = 0; cur < text_size; cur++) {
    putchar(*(text + cur));
  }
  puts("Task one. Substrings without cyryllic:");
  for (ulong cur = 0; cur < text_size; cur++) {
    putchar(*(subs1 + cur));
  }
  if (pos >= 0) {
    puts("Task two. Substrings with only latin characters and numerals:");
    for (ulong cur = 0; *(subs2 + cur) != '\n'; cur++) {
      putchar(*(subs2 + cur));
    }
    puts("\nTask three. Cyryllic part of the string that contains the substing "
         "above:");
    char *task3;
    task3 = srcwithoutrus(text, pos);
    chk_ptr(task3); //  The task three could probably return a null pointer
    puts(task3);    //  Result of the task 3 function
    putchar('\n');
    printf("%d", pos);
  } else
    puts("No way for tasks two and three");
  return 0;
}
