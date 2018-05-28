#include "work.h"

Work::Work()
{

}


unsigned long Work::process_normal(){
    //used to store catalan numbers
        unsigned long catalan[n+1];

        catalan[0]=catalan[1]=1;
        int i,j;

        for(i=2;i<=n;i++)
        {
            catalan[i]=0;
            for(j=0;j<i;j++)
                catalan[i]+=catalan[j]*catalan[i-j-1];
        }
        return catalan[n];
}

unsigned long int catalan(unsigned char n)
{
    // Base case
    if (n <= 1) return 1;

    // catalan(n) is sum of catalan(i)*catalan(n-i-1)
    unsigned long int res = 0;
    for (int i=0; i<n; i++)
        res += catalan(i)*catalan(n-i-1);

    return res;
}
unsigned long Work::process_recursive(){
    return catalan(n);
}

// Returns value of Binomial Coefficient C(n, k)
unsigned long int binomialCoeff(unsigned int n, unsigned int k)
{
    unsigned long int res = 1;

    // Since C(n, k) = C(n, n-k)
    if (k > n - k)
        k = n - k;

    // Calculate value of [n*(n-1)*---*(n-k+1)] / [k*(k-1)*---*1]
    for (unsigned int i = 0; i < k; ++i)
    {
        res *= (n - i);
        res /= (i + 1);
    }

    return res;
}


unsigned long Work::process_bin(){
    // Calculate value of 2nCn
    unsigned long int c = binomialCoeff(2*n, n);

    // return 2nCn/(n+1)
    return c/(n+1);
}
