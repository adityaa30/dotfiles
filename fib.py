# A simple script to calculate the n-th fibonacci number

import argparse

def fibonacci(n):
    fib = [0, 1]
    for i in range(2, n + 1, 1):
        fib.append(fib[i - 1] + fib[i - 2])
    return fib[n]

# Create the ArgumentParser instance
parser = argparse.ArgumentParser()

# Create a group where only one argument will be accepted at once
# thereby mutually exclusive group
group = parser.add_mutually_exclusive_group()
group.add_argument('-v', '--verbose', action='store_true')
group.add_argument('-q', '--quiet', action='store_true')

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
    help='Output the result to a file (fibonacci.txt)',
    action='store_true',
)

# Get all the arguments entered by the user
args = parser.parse_args()

# Calculate the nth fibonacci number and output according to the given argument
result = fibonacci(args.num)
if args.verbose:
    print('{}th fibonacci number: {}'.format(args.num, result))
elif args.quiet:
    print(result)
else:
    print('Fibonacci({}) = {}'.format(args.num, result))

if args.output:
    with open('fibonacci.txt', 'a') as f:
        f.write('{}th fibonacci number: {}\n'.format(args.num, result))