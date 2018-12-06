import random as r
A = C = 2 ** 15 + 1
M = 2 ** 32 + 1


def linear_congruential_generator(n, a=A, c=C, m=M):
    for i in range(n):
        a = (c * a) % m
        yield a / m


basic_random_values = list(linear_congruential_generator(9999))


def basic_rv():
    return basic_random_values[r.randint(0, 9990)]


def continuous_uniform_rv(a, b):
    return a + (b - a) * basic_rv()