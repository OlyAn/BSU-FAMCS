A = C = 2 ** 15 + 1
M = 2 ** 32 + 1


def linear_congruential_generator(n, a=A, c=C, m=M):
    for i in range(n):
        a = (c * a) % m
        yield a / m


basic_random_values = list(linear_congruential_generator(9999))
