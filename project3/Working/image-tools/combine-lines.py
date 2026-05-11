import sys

def combine_lines():
    combined_line = ''
    for line in sys.stdin:
        if not line.strip():  # skip empty lines
            continue
        combined_line += line.rstrip() + ' '
    print(combined_line)

combine_lines()