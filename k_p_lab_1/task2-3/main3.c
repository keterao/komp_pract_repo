#include <stdio.h>
#include "io.h"
#include "proc3.h"

int main(void)
{
    int M[15];

    printf("Enter 15 integers for array M:\n");
    input_array(M, 15);
    print_array(M, 15);
    process_array3(M, 15);

    return 0;
}