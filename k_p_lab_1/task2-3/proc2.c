#include <stdio.h>
#include "proc2.h"

void process_array2(const int *a, int n)
{
    long long sum = 0;
    int i, found;

    for (i = 0; i < n; ++i) {
        sum += a[i];
    }

    printf("Sum of elements = %lld\n", sum);
    printf("Sum / 3 = %.2f\n", (double)sum / 3.0);

    found = 0;
    printf("Positions (1-based) of elements less than sum/3: ");

    for (i = 0; i < n; ++i) {
        if ((long long)a[i] * 3 < sum) {
            printf("%d ", i + 1);
            found = 1;
        }
    }

    if (!found) {
        printf("none");
    }

    printf("\n");
}