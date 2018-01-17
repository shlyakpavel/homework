/*Shlyak Pavel, 2018
 * 170%8+1=3
 * 170%9+1=9
 * 170%10+1=10 */

#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    char** text = new char* [20]; //20 lines
    //cin.get();
    int i=0;
    do
    {
        text[++i] = new char[80];
        cout << "Строка " << i << "-> ";
        cin.getline(text[i], 80);
    } while (text[i]);
    cout << endl;
    for (int m = 0; m < i; i++)
    {
        cout << text[m] << endl;
    }
    for (int i = 0; i < 20; i++) delete [] text[i];
    delete [] text;
    return 0;
}
