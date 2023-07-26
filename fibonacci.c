#include <stdio.h>

extern int fib(int n);

int main() {
    int n = 9;
    printf("%d\n", fib(n));
    return 0;
}

