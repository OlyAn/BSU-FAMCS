from utils import *
from numpy import mean, var
from tabulate import tabulate

k  = 3
P  = 15800.0
S1 = 16800.0
S2 = 17000.0

result = []
maxs = ['S_max']
mins = ['S_min']
means = ['Mean']
vars = ['Variance']
ps = ['P{S1 ≤ S ≤ S2}']

with open('output.txt', 'w') as output:
    for _ in range(0, 6):
        for _ in range(0, 1000):
            a1 = basic_rv()  # q1 = (0.7, 1.0)

            if a1 < 0.7:
                n1 = 1/12
                i1 = continuous_uniform_rv(0.03, 0.042)
            else:
                n1 = 1/4
                i1 = continuous_uniform_rv(0.05, 0.062)

            a2 = basic_rv()  # q2 = (0.5, 0.9, 1.0)

            if a2 < 0.5:
                n2 = 1/4
                i2 = continuous_uniform_rv(0.05, 0.062)
            elif a2 < 0.9:
                n2 = 1/3
                i2 = continuous_uniform_rv(0.06, 0.07)
            else:
                n2 = 1/2
                i2 = continuous_uniform_rv(0.065, 0.078)

            n3 = 1 - (n1 + n2)

            if n3 > 0.5:
                i3 = continuous_uniform_rv(0.06, 0.08)
            else:
                i3 = continuous_uniform_rv(0.05, 0.078)

            result.append(P*(1 + n1*i1 + n2*i2 + n3*i3))

        maxs.append(max(result))
        mins.append(min(result))
        means.append(mean(result))
        vars.append(var(result))
        ps.append(sum(S1 <= x <= S2 for x in result) / len(result))

    table = [maxs, mins, means, vars, ps]

    output.write(tabulate(
        table,
        numalign='right'
    ))
