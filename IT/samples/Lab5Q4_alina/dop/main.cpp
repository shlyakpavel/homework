// This is a personal academic project. Dear PVS-Studio, please check it.
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

#include <cstdio>
#include <cstring>

using namespace std;

#define FAIL(str)                                                              \
  {                                                                            \
    puts(str);                                                                 \
    return 1;                                                                  \
  }

#define SCORE_NUM 5
#define GROUP "BIV181"
#define NEEDS_AVG_SCORE

// Why is it so bad? Read more about data aligment
struct person {
  char *familia;
  char *name;
  char *otchestvo;
};

struct scores {
  unsigned char B[SCORE_NUM];
#ifdef NEEDS_AVG_SCORE
  float average;
#endif
};

struct element {
  element *next;
  struct {
    person fio;
    char *group;
    scores uspevaemost;
  } student;
};

bool nendof(FILE *fl) {
  size_t addr = ftell(fl);
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
  element *current = new element();
  element *first = current;
  do {
    current->next = new element();
    current = current->next;
    // Read fio
    fscanf(fl, "%ms", &current->student.fio.familia);
    fscanf(fl, "%ms", &current->student.fio.name);
    fscanf(fl, "%ms", &current->student.fio.otchestvo);
    // Read group (most important in my case)
    fscanf(fl, "%ms", &current->student.group);
    // Read scores and sum them up
    #ifdef NEEDS_AVG_SCORE
    float sum = 0;
    #endif
    for (unsigned char i = 0; i < SCORE_NUM; i++) {
      fscanf(fl, "%hhu", &current->student.uspevaemost.B[i]);
      #ifdef NEEDS_AVG_SCORE
      sum += current->student.uspevaemost.B[i];
      #endif
    }
    #ifdef NEEDS_AVG_SCORE
    // Find an average(mean) value
    current->student.uspevaemost.average = sum / SCORE_NUM;
    #endif
  } while (nendof(fl));
  current->next = first->next;
  fclose(fl);
  return current;
}

void element_destructor(element *el) {
  delete (el->student.fio.familia);
  delete (el->student.fio.name);
  delete (el->student.fio.otchestvo);
  delete (el->student.group);
  delete (el);
}

void output(element *head) {
  const char file_name[] = "out.txt"; // Output file
  FILE *fl = fopen(file_name, "w");
  // Print elements one by one
  element *cur = head;
  do {
    cur = cur->next;
    fprintf(fl, "%s\n", cur->student.fio.familia);
    fprintf(fl, "%s\n", cur->student.fio.name);
    fprintf(fl, "%s\n", cur->student.fio.otchestvo);
    fprintf(fl, "%s\n", cur->student.group);
    for (unsigned char i = 0; i < SCORE_NUM; i++)
      fprintf(fl, " %hhu", cur->student.uspevaemost.B[i]);
    fputc('\n', fl);
  } while ( cur != head);
  fclose(fl);
}

unsigned char process(element *&head) {
  // The function returns amount of deleted elements (not more then 255)
  unsigned char elements = 0;
  element *cur = head;
  do {
    cur = cur->next;
    if (!strcmp(cur->student.group, GROUP)){
        element *toadd = new element();
        toadd->student.fio.familia = "HOHO";
        toadd->student.group = "HIHI";
        toadd->next = cur->next;
        cur->next = toadd;
        elements++;
    }
  } while ( cur != head);
  return elements;
}

int main() {
  element *data = input();
  if (!data)
    FAIL("Quiting now.");
  if (!process(data))
    FAIL("Nothing found");
  if (data)
    output(data);
  else
    FAIL("Nothing left");
  return 0;
}
