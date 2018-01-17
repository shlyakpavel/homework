/* Pavel Shlyak, 2018
 * В первой программе для форматного ввода и вывода данных используются функции scanf и printf,
 * а  для обращения к элементам матрицы - указатель.
 * Вариант 170%45+1=36
 * В заданной целочисленной прямоугольной матрице поменять местами следующие  два элемента:
 * Два первых отрицательных в четных строках.
*/

#define MAXCOLS 10
#define MAXSTR 15
typedef unsigned int uint;
typedef unsigned short ushort;

#include <iostream>

using namespace std;

void input(int matrix[MAXSTR][MAXCOLS], ushort *cols, ushort *strings){
    do {
    printf("Введите ненулевое положительное количество строк(<=%d) и столбцов(<=%d)\n", MAXSTR, MAXCOLS);
    scanf("%hu%hu", strings, cols);}
    while (*strings == 0 || *cols == 0);
    /* Рассчёт количества элементов в матрице */
    uint els = (*cols) * (*strings);
    printf("Введите матрицу из %d элементов\n", els);
    int *p = &matrix[0][0];
    //int s, c;
    /*for (s=0; s < *strings; s++){
        for (c=0; c < *cols; c++){
            scanf("%d", &matrix[s][c]);
        }
    }*/
    for (uint i=0; i < els; i++)
        scanf("%d", p + i);
}

int process(int matrix[MAXSTR][MAXCOLS], ushort *cols, ushort *strings){
    int *p = &matrix[0][0];
    for (uint i=0; i < (uint) ((*cols) * (*strings)); i++){
        if ( (i / *cols)%2 )    //если строка чётная
            --i+=*cols;         //то пропустим её
        else
            printf("%d", *(p + i));
    }
    return 0;
}


void output(int matrix[MAXSTR][MAXCOLS], ushort *cols, ushort *strings){
    for (uint i=0; i < (uint) ((*cols) * (*strings)); i++){
        if (! (i%*cols) ) printf("\n");
        printf("%d ", *(&matrix[0][0]) + i);
    }
    printf("\n");
}

int main()
{
    /* Синхронизация с потоком C нам не нужна*/
    std::ios::sync_with_stdio(false);
    /* Декларирование и инициализация переменных */
    int matrix[MAXSTR][MAXCOLS];
    ushort *cols = new ushort,
            *strings = new ushort;

    /* Ввод данных */
    input(matrix, cols, strings);
    /* Вычисления */
    int ret = process(matrix, cols, strings);
    /* Анализ существования результата */
    if (ret == 0){};
    /* Вывод данных */
    output(matrix, cols, strings);
    return 0;
}
