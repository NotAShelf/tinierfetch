#!/usr/bin/env python3

import sys, os

if len(sys.argv) > 1:
    COLOR = sys.argv[1] == "color"
else:
    COLOR = True

def main():
    for env in ["USER", "SHELL", "TERM", "LANG"]:
        if COLOR:
            sys.stdout.write("\033[0;" + "m" + env + ":\033[0m" + os.environ.get(env) + "\n")
        else:
            sys.stdout.write(env + ": " + os.environ.get(env))

    sys.stdout.write("\x1B[35mcolors: \x1B[0m\x1B[41m \x1B[42m \x1B[43m \x1B[44m \x1B[45m \x1B[0m" + "\n")

if __name__ == '__main__':
    main()
