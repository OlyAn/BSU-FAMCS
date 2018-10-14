#include <iostream>
#include <stdio.h>
#include "utilities.h"

using namespace std;

struct process_output {
    double **result;
    double duration;
};

void multiply_matrices_block(double **A, double **B, double **C, int N1, int N2, int N3, int R, int nThreads);

process_output process(double **A, double **B, int N, int R, int nThreads);


int main(int argc, const char *argv[]) {
    process_output result;

    double **A, **B;

    int N[] = {500, 1000, 2000};
    int R[] = {1, 5, 10, 20, 50, 100, 250, 500, 1000, 2000};
    int N_Threads[] = {1, 2, 4, 8, 16};

    int N_LENGTH = 3;
    int R_LENGTHS[] = {8, 9, 10};
    int N_THREADS_LENGTH = 5;
    
    /* Block parallel */
    for (int i = 0; i < N_LENGTH; i++) {
        int curN = N[i];
        cout << curN << endl;

        A = alloc_2d_array(curN, curN);
        B = alloc_2d_array(curN, curN);
        matrix_init(A, curN, curN);
        matrix_init(B, curN, curN);

        for (int j = 0; j < R_LENGTHS[i]; j++) {
            int curR = R[j];
            cout << curR;

            for (int k = 0; k < N_THREADS_LENGTH; k++) {
                int cur_N_Threads = N_Threads[k];
                result = process(A, B, curN, curR, cur_N_Threads);
                cout << " " << result.duration << " ";
            }

            cout << endl;
        }
        cout << endl;

        free(A);
        free(B);
        free(result.result);
    }

    return 0;
}

process_output process(double **A, double **B, int N, int R, int nThreads) {
    double **C;
    double time_s, time_e;

    C = alloc_2d_array(N, N);
    matrix_init_number(C, N, N, 0.0);

    time_s = clock();
    multiply_matrices_block(A, B, C, N, N, N, R, nThreads);
    time_e = clock();

    process_output result;

    result.duration = get_time(time_s, time_e);
    result.result = C;
    return result;
}

void multiply_matrices_block(double **A, double **B, double **C, int N1, int N2, int N3, int R, int nThreads) {
    /* numbers of blocks */
    const int Q1 = N1 / R;
    const int Q2 = N3 / R;
    const int Q3 = N2 / R;

#pragma omp parallel for num_threads(nThreads)
    for (int il = 0; il < Q1; il++) {
        for (int jl = 0; jl < Q2; jl++) {
            for (int kl = 0; kl < Q3; kl++) {

                for (int i = il * R; i < (il + 1) * R; i++) {
                    for (int j = jl * R; j < (jl + 1) * R; j++) {
                        for (int k = kl * R; k < (kl + 1) * R; k++) {
                            C[i][j] = C[i][j] + A[i][k] * B[k][j];
                        }
                    }
                }

            }
        }
    }
}

