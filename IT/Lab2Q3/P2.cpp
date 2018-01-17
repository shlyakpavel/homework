/* Pavel Shlyak, 2018
 * Во второй программе используются функции потокового ввода-вывода
 * cin и cout, а для обращения к элементам массива используются индексы.
 * Вариант 170%45+1=36
 * В заданной целочисленной прямоугольной матрице поменять местами следующие  два элемента:
 * Два первых отрицательных в четных строках.
 * Тест: seq -3 100 | shuf -r | ./Lab2Q3P2 */

#include <iostream>

#define MAXCOLS 45
#define MAXSTR 25

using namespace std;

void input(int matrix[MAXSTR][MAXCOLS], unsigned short &cols, unsigned short &strings){
    cout << "Введите ненулевое положительное количество строк(<=%d) и столбцов(<=%d)" <<endl;
    cin >> strings >> cols;
    if (strings > MAXSTR || cols > MAXCOLS){
        cout << "Это Вы зря..." << endl;
        exit(1);
    }
    cout << "Введите матрицу" << endl;
    int s, c;
    for (s=0; s < strings; s++){
        for (c=0; c < cols; c++){
           cin >> matrix[s][c];
        }
    }
}

int process(int matrix[MAXSTR][MAXCOLS], unsigned short cols, unsigned short strings){
    return -2;
}

void output(int matrix[MAXSTR][MAXCOLS], int cols, int strings){
    int s, c;
    for (s=0; s < strings; s++){
        for (c=0; c < cols; c++)
            cout << matrix[s][c] << " ";
        cout << endl;
    }
    cout << endl;
}

int main()
{
    /* Русская локаль */
    setlocale(LC_ALL, "RUS");
    /* Синхронизация с потоком std нам не нужна*/
    ios::sync_with_stdio(false);
    /* Декларирование и инициализация переменных */
    int matrix[MAXSTR][MAXCOLS];
    unsigned short cols, strings;
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
    return 0;
}
