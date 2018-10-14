//
// Created by olya_ on 10/6/2018.
//

#include <stdlib.h>
#include "utilities.h"

using namespace std;

double get_time(double tstart, double tend) {
    return (tend - tstart) / (double) CLOCKS_PER_SEC;
}

void matrix_init(double **m, int n, int k) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < k; j++) {
            m[i][j] = (rand() % 200) - 100;
        }
    }
}

void matrix_init_number(double **m, int n, int k, double number) {
    for (int i = 0; i < n; i++) {
        for (int j = 0; j < k; j++) {
            m[i][j] = number;
        }
    }
}

void print_matrix(double **m, int n, int k) {
    printf("******************************************************\n");
    printf("Result Matrix:\n");
    for (int i = 0; i < n; i++) {
        printf("\n");
        for (int j = 0; j < k; j++) {
            printf("%6.2f   ", m[i][j]);
        }
    }
    printf("\n******************************************************\n");
}

double **alloc_2d_array(int rows, int cols) {
    int i;
    double *data = (double *) malloc(rows * cols * sizeof(double));
    double **array = (double **) malloc(rows * sizeof(double *));
    for (i = 0; i < rows; i++)
        array[i] = &(data[cols * i]);

    return array;
}