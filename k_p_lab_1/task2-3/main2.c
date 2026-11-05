#include <stdio.h>
#include "io.h"
#include "proc2.h"

int main(void)
{
    int A[30];

    printf("Enter 30 integers for array A:\n");
    input_array(A, 30);
    print_array(A, 30);
    process_array2(A, 30);

    return 0;
}