/*
 * 170%49+1=24
 * Все элементы массива A, отсутствующие в массиве B. Все элементы
 * массива C должны быть различными.
 */
#include <iostream>
using namespace std;
int main()
{
    setlocale(LC_ALL, ".1251");
    int a[10], b[10], anew[10], c[10], na, nb, nnew, nc=0, i, j;
    //na, nb, nc-длины массивов a, b, c
    cout << "введите длину массива А:"; cin >> na;
    if (na > 0){
    cout << "введите массив А" << endl;
    for(i=0;i<na;i++) cin >> a[i];
    }
    cout << "введите длину массива B:"; cin >> nb;
    if  (nb > 0) {
        cout << "введите массив B" << endl;
        for(i=0;i<nb;i++) cin >> b[i];
    }
    for(i=0;i<na;i++){
            for (j=0;j<nb&&a[i]!=b[j];j++); //цикл закрыт
            if (j==nb) //условие отсутствия a[i] в b
            { //проверка отсутствия a[i] в c
                for (j=0;j<nc&&a[i]!=c[j];j++);
                if (j==nc) /* если a[i] нет в c, то заносим его в этот массив */
                    c[nc++]=a[i];
            }
    }
    //вывод результата
    if (nc==0)
        cout << "массив C пуст" << endl;
    else
    {
        cout << "Массив C" << endl;
        for(i=0;i<nc;i++)
            cout << c[i] << " ";
        cout << endl;
    }
    cout << "Удалить из массива A элементы, присутствующие в массиве B ровно два раза. ЫГОГО";
    nnew=0;
    for (i=0; i<na; i++){
        int c = 0;
        for (j=0; j < nb; j++){
            if ( a[i]==b[j] ) c++;
        }
        if (c!=2){
            anew[nnew++]=a[i];
        }
    }
    if (na==0)
        cout << "массив A пуст" << endl;
    else
    {
        cout << "Массив A" << endl;
        for(i=0;i<nnew;i++)
            cout << anew[i] << " ";
        cout << endl;
    }
    return 0;
}
