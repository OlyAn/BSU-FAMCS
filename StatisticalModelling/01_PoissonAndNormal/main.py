import np
import random
import tabulate
import matplotlib.pyplot as plt
from math import sqrt, exp
from numpy import mean, std
from scipy.stats import norm
from utils import *


LAMBDAS = [6, 9, 12, 15, 18]
M = 100


def poisson(λ, size):
    for _ in range(size):
        n = 0
        alpha = basic_random_values[random.randint(0, 9000)]

        while alpha >= exp(-λ):
            alpha *= basic_random_values[random.randint(0, 9000)]
            n += 1
        yield n


def standard_gauss_rv():
    return sum([
        basic_random_values[random.randint(1, 9000)] for _ in range(12)
    ]) - 6


def gauss(m, standard_deviation, size):
    for _ in range(size):
        yield m + standard_deviation * standard_gauss_rv()


poissons_means = []
normals_means = []
poissons_std = []
normals_std = []

for λ in LAMBDAS:
    poissons = sorted(list(poisson(λ, M)))
    normals = sorted(list(gauss(λ, sqrt(λ), M)))

    density_poisson = norm.pdf(poissons, mean(poissons), std(poissons))
    plt.plot(poissons, density_poisson)
    plt.hist(poissons, density=True)
    plt.title(f'Poisson distribution. λ = {λ}')
    plt.savefig(f'plots/poisson_{λ}')
    plt.show()
    poissons_means.append(mean(poissons))
    poissons_std.append(std(poissons)**2)

    density_normals = norm.pdf(normals, mean(normals), std(normals))
    plt.plot(normals, density_normals)
    plt.hist(normals, density=True)
    plt.title(f'Normal distribution. μ = {λ}, σ^2 = {round(sqrt(λ), 3)}')
    plt.savefig(f'plots/normal_{λ}')
    plt.show()
    normals_means.append(round(mean(normals), 2))
    normals_std.append(round(std(normals), 2)**2)

with open("output.txt", "w") as output:
    output.write(
        tabulate.tabulate(
            np.c_[LAMBDAS, poissons_means, normals_means, poissons_std, normals_std],
            headers=['λ', 'Poisson(Mean)', 'Normal(Mean)', 'Poisson(Variance)', 'Normal(Variance)']
        )
    )

