#!/usr/bin/env python
import click
import subprocess
import os.path

preamble = r"""
\documentclass{article}

\usepackage{listings}
\usepackage{color}

\definecolor{mygreen}{rgb}{0,0.6,0}
\definecolor{mygray}{rgb}{0.5,0.5,0.5}
\definecolor{mymauve}{rgb}{0.58,0,0.82}

\lstset{
  backgroundcolor=\color{white},   % choose the background color; you must add \usepackage{color} or \usepackage{xcolor}; should come as last argument
  basicstyle=\footnotesize,        % the size of the fonts that are used for the code
  breakatwhitespace=false,         % sets if automatic breaks should only happen at whitespace
  breaklines=true,                 % sets automatic line breaking
  captionpos=b,                    % sets the caption-position to bottom
  commentstyle=\color{mygreen},    % comment style
  escapeinside={\%*}{*)},          % if you want to add LaTeX within your code
  extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8
  frame=single,	                   % adds a frame around the code
  keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)
  keywordstyle=\color{blue},       % keyword style
  language=Python,                 % the language of the code
  numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)
  numbersep=5pt,                   % how far the line-numbers are from the code
  numberstyle=\tiny\color{mygray}, % the style that is used for the line-numbers
  rulecolor=\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))
  showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'
  showstringspaces=false,          % underline spaces within strings only
  showtabs=false,                  % show tabs within strings adding particular underscores
  % stepnumber=2,                    % the step between two line-numbers. If it's 1, each line will be numbered
  stringstyle=\color{mymauve},     % string literal style
  tabsize=2,	                   % sets default tabsize to 2 spaces
  title=\lstname                   % show the filename of files included with \lstinputlisting; also try caption instead of title
}
"""


@click.command()
@click.argument("input_path", type=click.Path(exists=True, dir_okay=False))
@click.argument(
    "output_dir", type=click.Path(exists=True, dir_okay=True), default="build"
)
def main(input_path, output_dir="build"):

    title = r"\title{%s}" % input_path.replace("_", "-")

    filename = os.path.join(
        output_dir,
        input_path.replace("_", "-").replace("/", "_").replace(".py", ".tex"),
    )

    with open(filename, "w") as f:
        f.write(preamble)
        f.write(title)
        f.write(r"\begin{document}\maketitle")
        f.write(r"\lstinputlisting{%s}\end{document}" % input_path)
        f.write(r"\end{document}")

    subprocess.call(
        [
            "lualatex",
            f"-output-directory={output_dir}",
            "-interaction=batchmode",
            filename,
        ]
    )

    print(f"\nFind generated PDF: {filename.replace('.tex', '.pdf')}")


if __name__ == "__main__":
    main()
