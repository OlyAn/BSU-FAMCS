//
// Created by olya_ on 10/6/2018.
//

#ifndef LAB_01_UTILITIES_H
#define LAB_01_UTILITIES_H

#include <stdio.h>
#include <ctime>
#include <iostream>
#include <stdlib.h>
#include <malloc.h>

using namespace std;

double get_time(double first, double second);

void matrix_init(double **m, int n , int k);
void matrix_init_number(double **m, int n , int k, double number);
void print_matrix(double **m, int n , int k);
double **alloc_2d_array(int rows, int cols);

#endif
