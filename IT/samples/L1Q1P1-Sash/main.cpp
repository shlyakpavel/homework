#include <iostream>

using namespace std;

int main()
{
    int a[10], b[10], c[10], na, nb, nc=0, i, j;
    //na, nb, nc-длины массивов a, b, c
    cout << "введите длину массива А:"; cin >> na;
    cout << "введите массив А" << endl;
    for(i=0;i<na;i++) cin >> a[i];
    cout << "введите длину массива B:"; cin >> nb;
    cout << "введите массив B" << endl;

    for(i=0;i<nb;i++) cin >> b[i];

    for(i=0;i<na;i++){
            for (j=0; (j<nb) && (a[i]!=b[j]); j++){break;}; //цикл закрыт
            if (j==nb) { //проверка отсутствия a[i] в c
                for (j=0;j<nc&&a[i]!=c[j];j++);
                if (j==nc){ /* если a[i] нет в c, то заносим его в этот массив */
                    c[nc]=a[i];
                    nc=nc+1;
                }
            }
    }

    //вывод результата
    if (nc==0)
        cout << "массив C пуст" << endl;
    else{
        cout << "Массив C" << endl;
        for(i=0;i<nc;i++)
            cout << c[i] << " ";
        cout << endl;
    }
    return 0;
}
