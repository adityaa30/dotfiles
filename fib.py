# A simple script to calculate the n-th fibonacci number

import argparse

def fibonacci(n):
    fib = [0, 1]
    for i in range(2, n + 1, 1):
        fib.append(fib[i - 1] + fib[i - 2])
    return fib[n]

# Create the ArgumentParser instance
parser = argparse.ArgumentParser()

# Add an argument to the parser
parser.add_argument(
    'num',
    help='The fibonacci number you wish to calculate',
    type=int
)

# Add an extra argument if to save the output to a .txt file
parser.add_argument(
    '-O',
    '--output',
    help='Output the result to a file',
    action='store_true',
)

# Get all the arguments entered by the user
args = parser.parse_args()

result = fibonacci(args.num)
print(result)

if args.output:
    with open('fibonacci.txt', 'a') as f:
        f.write('{}th fibonacci number: {}\n'.format(args.num, result))