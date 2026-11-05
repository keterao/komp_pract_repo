#include <stdio.h>

int main()
{
    int A = 0, B = 0;

    printf("Enter natural A and B: ");
    if (scanf("%d %d", &A, &B) != 2 || A <= 0 || B <= 0) {
        printf("error\n");
        return 1;
    }

    int limit = A * B;
    int found = 0;

    printf("Numbers divisible by both, less than %d:\n", limit);

    for (int x = 1; x < limit; ++x) {
        if (x % A == 0 && x % B == 0) {
            printf("%d ", x);
            found = 1;
        }
    }

    if (!found)
        printf("none");

    printf("\n");
    return 0;
}