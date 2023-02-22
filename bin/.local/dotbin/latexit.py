#!/usr/bin/env python3
from argparse import ArgumentParser
from pathlib import Path
from subprocess import run

parser = ArgumentParser()
parser.add_argument("equation", type=str)
parser.add_argument("--verbose", "-v", action="store_true")
parser.add_argument("--open", "-o", action="store_true")
parser.add_argument("--file", "-f", action="store_true")
args = parser.parse_args()


packages = {
    "amsmath",
    "amssymb",
    "dsfont",
}
filename = Path("/tmp/latexit.pdf")


def build_document(equation: str):
    doc = r"\documentclass[border=1pt,preview]{standalone}"
    doc += "".join(r"\usepackage{" + p + "}" for p in packages)
    doc += r"\begin{document}\begin{align*}"
    doc += equation
    doc += r"\end{align*}\end{document}"
    return doc


def main(equation: str, verbose: bool, file: bool):
    if file:
        with open(equation, "r") as f:
            equation = f.read().replace("\n", "")
    print(equation)
    doc = build_document(equation)
    run(
        [
            "pdflatex",
            "--output-directory=/tmp",
            "--interaction=nonstopmode",
            "--halt-on-error",
            f"--jobname={filename.stem}",
            doc,
        ],
        check=True,
        capture_output=not verbose,
    )
    run(
        [
            "pdfcrop",
            "--margins=3",
            filename,
            filename,
        ],
        check=True,
        capture_output=not verbose,
    )
    if args.open:
        run(["xdg-open", filename], check=True, capture_output=not verbose)
    else:
        print(filename)


if __name__ == "__main__":
    main(args.equation, args.verbose, args.file)
