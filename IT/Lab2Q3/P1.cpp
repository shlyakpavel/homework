/* Pavel Shlyak, 2018
 * В первой программе для форматного ввода и вывода данных используются функции scanf и printf,
 * а  для обращения к элементам матрицы - указатель.
 * Вариант 170%45+1=36
 * В заданной целочисленной прямоугольной матрице поменять местами следующие  два элемента:
 * Два первых отрицательных в четных строках.
 * Тест: seq -3 100 | shuf -r | ./Lab2Q3P1
*/

#include <iostream>

#define MAXCOLS 45
#define MAXSTR 25

typedef unsigned int uint;
typedef unsigned short ushort;

using namespace std;

void input(int matrix[MAXSTR][MAXCOLS], ushort *cols, ushort *strings){
    do {
    printf("Введите ненулевое положительное количество строк(<=%d) и столбцов(<=%d)\n", MAXSTR, MAXCOLS);
    scanf("%hu%hu", strings, cols);}
    while (*strings == 0 || *cols == 0 || *strings >= MAXSTR || *cols >= MAXCOLS);
    /* Рассчёт количества элементов в матрице */
    uint els = (*cols) * (*strings);
    printf("Введите матрицу из %d элементов\n", els);
    for (uint i=0; i < els; i++)
        scanf("%d", *matrix + i);
}

int process(int matrix[MAXSTR][MAXCOLS], ushort *cols, ushort *strings){
    int fn = -1;   //первое отрицательное
    for (uint i=0; i < (uint) ((*cols) * (*strings)); i++){
        if ( (i / *cols)%2 )    //если строка чётная
            --i+=*cols;         //то пропустим её
        else
            if (*( *matrix + i) < 0){
                if (fn >= 0){
                    /* Замена */
                    int tmp = *( *matrix + fn);
                    *( *matrix + fn) = *( *matrix + i);
                    *( *matrix + i) = tmp;
                    i=(*cols) * (*strings);
                    fn=-2;
                }
                else fn = i;
            }
    }
    return fn;
}


void output(int matrix[MAXSTR][MAXCOLS], ushort *cols, ushort *strings){
    for (uint i=0; i < (uint) ((*cols) * (*strings)); i++){
        if (! (i%*cols) ) printf("\n");
        printf("%d ", *(*matrix + i));
    }
    printf("\n");
}

int main()
{
    /* Синхронизация с потоком C нам не нужна*/
    ios::sync_with_stdio(false);
    /* Декларирование и инициализация переменных */
    int matrix[MAXSTR][MAXCOLS];
    ushort  *cols = new ushort(0),
            *strings = new ushort(0);
    /* Ввод данных */
    input(matrix, cols, strings);
    /* Вычисления */
    int ret = process(matrix, cols, strings);
    /* Анализ существования результата */
    switch ( ret ){
    case -1:
        printf("Матрица не содержит отрицательных чисел на нечётных строках\n");
        break;
    case -2:
        output(matrix, cols, strings);  //вывод данных
        break;
    default:
        printf("Недостаточно отрицательных чисел\n");
    }
    /* Освобождаем память */
    delete cols;
    delete strings;
    return 0;
}
