from utils import *
from tabulate import tabulate
from math import exp
from numpy import var


a = 0
b = 1
results = []
true_value = 1


def f(x):
    return x * exp(x)


def h(x):
    return x ** 2


def integrate_h(t, p):
    return (p ** 3 - t ** 3) / 3


def monte_carlo(n):
    avg = sum([f(continuous_uniform_rv(a, b)) for _ in range(0, n)]) / n
    return (b - a) * avg


def monte_carlo_main_part(n):
    avg = 0
    for _ in range(0, n):
        x_i = continuous_uniform_rv(a, b)
        avg += f(x_i) - h(x_i)
    avg /= n

    return (b - a) * avg + integrate_h(a, b)


N_values = [10, 50, 100, 500, 1000]
with open('output.txt', 'w') as output:

    mcs = [monte_carlo(N) for N in N_values]
    mcs_variance = var(mcs)
    main_parts = [monte_carlo_main_part(N) for N in N_values]
    main_parts_variance = var(main_parts)

    table = tabulate([
        ['N'] + N_values,
        ['Monte Carlo'] + mcs,
        ['Main part'] + main_parts
    ], numalign="right")
    output.write(table + '\n')
    # output.write(f'Variance(Monte Carlo): {round(mcs_variance, 5)}\n')
    # output.write(f'Variance(Main parts): {round(main_parts_variance, 5)}')
