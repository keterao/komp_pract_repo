#include <stdio.h>
#include "proc3.h"

void process_array3(const int *a, int n)
{
    long long sum = 0;
    int i;

    for (i = 0; i < n; i += 2) {
        if (a[i] % 2 == 0) {
            sum += a[i];
        }
    }

    printf("Sum of even elements at even indices (C indexing, from 0): %lld\n", sum);
}