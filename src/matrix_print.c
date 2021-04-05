#include "matrix_print.h"
#include <stdio.h>

void matrix_print(int matrix[], int N)
{
    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
            printf("%d ", matrix[i * N + j]);

        printf("\n");
    }
}