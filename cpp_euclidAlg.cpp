#include <iostream>
#include <vector>
using namespace std;

int gcd(int a, int b) {
	int remainder, divisor;
	if (a > b) {
		divisor = b;
		remainder = a % b;
		//cout << divisor << endl;
	}
	else {
		divisor = a;
		remainder = b % a;
		//cout << divisor << endl;
	}
	if (remainder == 0) {
		return divisor;
	}
	else {
		return (gcdOrdered(divisor, remainder));
	}

	return -1;
}

int gcdOrdered(int largerInt, int smallerInt) {
	int remainder = largerInt % smallerInt;
	//cout << smallerInt << endl;
	if (remainder == 0) {
		return smallerInt;
	}
	else {
		return (gcd(smallerInt, remainder));
	}

	return -1;
}

int main() {
	/*vector<int> primes;
	primes.push_back(2);
	primes.push_back(3);
	for (int i = 4; i < 255; i++) {
		for (int j = 2; j < i; j++) {
			int check = gcd(i, j);
			bool isPrime = true;
			if (check == 1 && isPrime == false) {
				primes.push_back(
			}
			else
				
		}
	}*/
}