/*  DRIVER PROGRAM FOR MATRIX MULTIPLICATION
    Löffler Levente
    R1NO3R
*/


#include <stdio.h>
#include "matrix_print.h"
#include "matrix_mul.h"


int main(void)
{
    const int N = 3;

    int left[] = { 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    int right[] = { 9, 8, 7, 6, 5, 4, 3, 2, 1 };
    int output[N * N];

    matrix_mul(left, right, output, N);

    printf("left:\n");
    matrix_print(left, N);
    printf("right:\n");
    matrix_print(right, N);
    printf("output:\n");
    matrix_print(output, N);

    return 0;
}