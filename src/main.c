/*  DRIVER PROGRAM FOR MATRIX MULTIPLICATION
    Löffler Levente
    R1NO3R
*/

#include <stdio.h>

void matrix_mul(int left[], int right[], int output[], int N);
/*{
    for (int i = 0; i < N * N; i++)
        output[i] = 0;

    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            for (int k = 0; k < N; k++)
                output[i * N + j] += left[i * N + k] * right[k * N + j];
}*/

int main(void)
{
    const int N = 2;

    int left[] = { 1, 2, 3, 4 };
    int right[] = { 2, 3, 4, 5 };
    int output[N * N];

    matrix_mul(left, right, output, N);

    for (int i = 0; i < N; i++)
    {
        for (int j = 0; j < N; j++)
            printf("%d ", output[i * N + j]);

        printf("\n");
    }

    return 0;
}