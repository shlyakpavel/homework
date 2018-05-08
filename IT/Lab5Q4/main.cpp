// This is an open source non-commercial project. Dear PVS-Studio, please check
// it.
// PVS-Studio Static Code Analyzer for C, C++ and C#: http://www.viva64.com
/* Имя файла задает пользователь. Массив баллов B[0:4] содержит данные о
 * результатах сдачи экзаменов, по 10-балльной шкале.
 * Каждое поле структуры занимает в файле одну строку, а массив оценок
 * размещается на отдельной строке.
 * Средний балл не записан в файле, а вычисляется в процессе чтения данных.
 * Структуры размещаются в стеке
 * реализованном с помощью двунаправленного линейного списка.
 * Для полученного списка программа выполняет следующие действия:
 * удаляет записи о студентах из заданной группы;
 */

#include <stdio.h>
#include <string.h>

typedef unsigned char byte;

using namespace std;

#define FAIL(str)                                                              \
  {                                                                            \
    puts(str);                                                                 \
    return 1;                                                                  \
  }

#define SCORE_NUM 5

struct person {
  char *familia;
  char *name;
  char *otchestvo;
};
struct scores {
  byte B[SCORE_NUM];
  float average;
};

struct student {
  person fio;
  char *group;
  scores uspevaemost;
};

struct element {
  element *next;
  element *prev;
  student stud;
};

bool nendof(FILE *fl) {
  int addr = ftell(fl);
  bool res = (fgetc(fl) != EOF) && (fgetc(fl) != EOF);
  fseek(fl, addr, 0);
  return res;
}

element *input() {
  puts("Input file name:");
  char *file_name;
  scanf("%ms", &file_name);
  FILE *fl = fopen(file_name, "r");
  delete (file_name);
  if (fl == NULL) {
    perror("Failed: couldn't open the file");
    return NULL;
  }
  element *current;
  element *prev = NULL;
  do {
    current = new element();
    current->prev = prev;
    // Read fio
    fscanf(fl, "%ms", &current->stud.fio.familia);
    fscanf(fl, "%ms", &current->stud.fio.name);
    fscanf(fl, "%ms", &current->stud.fio.otchestvo);
    // Read group (most important in my case)
    fscanf(fl, "%ms", &current->stud.group);
    // Read scores and sum them up
    float sum = 0;
    for (byte i = 0; i < SCORE_NUM; i++) {
      fscanf(fl, "%hhu", &current->stud.uspevaemost.B[i]);
      sum += current->stud.uspevaemost.B[i];
    }
    // Find an average(mean) value
    current->stud.uspevaemost.average = sum / SCORE_NUM;
    // Set the next element for the previous one
    if (prev)
      prev->next = current;
    prev = current;
  } while (nendof(fl));
  fclose(fl);
  return current;
}

void element_destructor(element *el) {
  delete (el->stud.fio.familia);
  delete (el->stud.fio.name);
  delete (el->stud.fio.otchestvo);
  delete (el->stud.group);
  delete (el);
}

void output(element *head) {
  const char file_name[] = "out.txt"; // Output file
  FILE *fl = fopen(file_name, "w");
  // find the first element
  element *first;
  for (first = head; first->prev; first = first->prev)
    ;
  // Print elements one by one
  for (element *cur = first; cur; cur = cur->next) {
    fprintf(fl, "%s\n", cur->stud.fio.familia);
    fprintf(fl, "%s\n", cur->stud.fio.name);
    fprintf(fl, "%s\n", cur->stud.fio.otchestvo);
    fprintf(fl, "%s\n", cur->stud.group);
    for (byte i = 0; i < SCORE_NUM; i++)
      fprintf(fl, " %hhu", cur->stud.uspevaemost.B[i]);
    fputc('\n', fl);
  };
  fclose(fl);
}

byte process(element *&head) {
  // The function returns amount of deleted elements (not more then 255)
  byte elements = 0;
  element *el = head;
  while (el) {
    if (!strcmp(el->stud.group, "BIV182")) {
      // delete element
      if (el->prev)
        el->prev->next = el->next; // Previous element to point on the next one
      if (el->next)
        el->next->prev = el->prev; // Next element to point on the previous one
      if (el == head)
        head = el->prev;
      element *tmp_ptr;
      tmp_ptr = el;
      el = el->prev;
      element_destructor(tmp_ptr);
      elements++;
    } else
      el = el->prev;
  }
  return elements;
}

int main() {
  element *data = input();
  if (!data)
    FAIL("Quiting now.");
  if (!process(data))
    FAIL("Nothing to delete");
  if (data)
    output(data);
  else
    FAIL("Nothing left");
  return 0;
}
