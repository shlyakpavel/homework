#include "work.h"

Work::Work()
{

}

Work::~Work(){

}

unsigned long long Work::first_alg(unsigned long long number) {
    unsigned long long lnmo; // L(n - 1)
    unsigned long long ln; // L(n)
    unsigned long long n = number;
    //unsigned long long result = 0;
    lnmo=1;
    for(unsigned int i=1;i<n;i++)
    {
       ln=2*lnmo+1;
       lnmo=ln;
    }
    return ln;

}



unsigned long long Work::second_alg(unsigned long long number) {
    if (number == 1) return 1;
    return 2 * second_alg(number-1) + 1;
}
