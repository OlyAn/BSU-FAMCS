import matplotlib.pyplot as plt
from tabulate import tabulate
import numpy as np

headers = [
           'block size',
           '1 thread time, s',
           '2 threads time, s',
           '4 threads time, s',
           '8 threads time, s',
           '16 threads time, s'
           ]
parallelism_type = ['Outer cycle parallelism', 'Inner cycle parallelism']

matrix_sizes_length = 3
block_sizes_length = [8, 9, 10]
threads_counts_length = 5
threads_counts = [1, 2, 4, 8, 16]

fout = open('formatted_output.txt', 'a')
fout.truncate(0)

with open('output.txt', 'r') as file:
    for k in range(0, 2):
        for i in range(0, matrix_sizes_length):
            plots = []
            size = file.readline().strip()
            title = f'Matrix {size}x{size}. {parallelism_type[k]}'

            table = [file.readline().split() for _ in range(block_sizes_length[i])]
            data = np.array(table)
            block_sizes = list(map(int, data[:, 0]))

            fout.write(title + '\n\n')
            fout.write(tabulate(data, headers=headers, tablefmt='rst') + '\n\n')

            plt.title(title)
            plt.xlabel('Block size')
            plt.ylabel('Elapsed time, seconds')
            for j in range(1, threads_counts_length+1):
                plots.append(plt.plot(block_sizes, list(map(float, data[:, j])), label=f'{threads_counts[j-1]} thread(s)')[0])
            plt.legend(handles=plots)
            plt.show()
            file.readline()
fout.close()
