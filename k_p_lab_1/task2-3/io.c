#include <stdio.h>
#include "io.h"

void input_array(int *a, int n)
{
    int i;
    for (i = 0; i < n; ++i) {
        printf("a[%d] = ", i);
        scanf("%d", &a[i]);
    }
}

void print_array(const int *a, int n)
{
    int i;
    printf("Array: ");
    for (i = 0; i < n; ++i) {
        printf("%d ", a[i]);
    }
    printf("\n");
}