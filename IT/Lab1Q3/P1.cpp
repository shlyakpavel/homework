/*
 * 170%49+1=24
 * Все элементы массива A, отсутствующие в массиве B. Все элементы
 * массива C должны быть различными.
 */

#include <iostream>

using namespace std;

int main() {
    int a[10], b[10], c[10], na, nb, nc = 0, * ua, * ub, * uc;
    //na,nb,nc-длины массивов a,b,c
    printf("введите длину массива А:");
    scanf("%d",& na);
    printf("введите массив А\n");
    for (ua = a; ua < a + na; ua++)
        scanf("%d", ua); //ввод (nb, b[0:nb-1]) - аналогично
    printf("введите длину массива B:");
    scanf("%d", & nb);
    printf("введите массив B\n");
    for (ub = b; ub< b + nb; ub++)
        scanf("%d", ub);

    for (ua = a; ua < a + na; ua++){
        //проверка отсутствия a[i] в b
        for (ub = b; ub < b + nb && * ua != * ub; ub++); //цикл закрыт
        if (ub == b + nb) //условие отсутствия a[i] в b
        { //проверка отсутствия a[i] в c
            for (uc = c; uc < c + nc && * ua != * uc; uc++);
            //если a[i] нет в с, запишем его в массив с
            if(uc == c + nc) {
                nc++; * uc++ = * ua;
            }}
    }
    //вывод результата
    if (nc == 0)
        printf("массив C пуст\n");
    else {
        printf("Массив C\n");
        for (uc = c; uc < c + nc; uc++) printf("%7d", * uc);
        printf("\n");
    }
    return 0;
}
