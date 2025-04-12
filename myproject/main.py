"""Main script.

"""

import sys
import argparse

def parse_args(args):
    parser = argparse.ArgumentParser()
    # parser.add_argument('-n', default=1)
    return parser.parse_args(args)

def main(args):
    print(f"Handled args: {args}")
    return


#######################
##  Main Entrypoint  ##
#######################

if __name__ == "__main__":
    args = parse_args(sys.argv[1:])
    main(args)
