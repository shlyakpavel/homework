#include <iostream>
#include <cmath>
using namespace std;

long double proc(long double x, int n){
	int nmod = 2*n+1;
	return 1/(nmod*pow(x,nmod));
}

long double exact(long double x, int n){
	return 0.5*log((x+1)/(x-1));
}

int main(){
	long double x, ex, result = 0;
	int i, n = 0;
	cin >> x >> n;
	for (i=0; i<=n; i++)
		result= result + proc(x, i);
	ex=exact(x,n);
	cout << result << endl << ex << endl;
};
