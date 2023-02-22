#!/usr/bin/env python
# -*-coding:utf8-*-

from __future__ import print_function
import os
import sys
import subprocess


def write_code(texfile, sheet, authors, source_files):
    # Write header first
    texfile.write("\\documentclass[8pt,DIV=14]{scrartcl}\n")
    texfile.write("\\usepackage{polyglossia}\n")
    texfile.write("    \\setdefaultlanguage[spelling=new, babelshorthands=true]{german}\n")
    texfile.write("\\usepackage{fontspec}\n")
    texfile.write("    \\setmainfont{Fira Mono}\n")
    texfile.write("\\usepackage{xcolor}\n")
    texfile.write("\\usepackage{caption}\n")
    texfile.write("\\usepackage{listings}\n")
    texfile.write("\\DeclareCaptionFont{white}{ \\color{white} }\n")
    texfile.write("\\DeclareCaptionFormat{listing}{\n")
    texfile.write("  \\colorbox[cmyk]{0.43, 0.35, 0.35,0.01 }{\n")
    texfile.write("    \\parbox{\\textwidth}{\\hspace{15pt}#1#2#3}\n")
    texfile.write("  }\n")
    texfile.write("}\n")
    texfile.write("\\captionsetup[lstlisting]{ format=listing, labelfont=white, textfont=white, singlelinecheck=false, margin=0pt, font={bf,footnotesize} }\n")
    texfile.write("\\lstset{ %\n")
    texfile.write("  % backgroundcolor=\\color{white},   % choose the background color; you must add \\usepackage{color} or \\usepackage{xcolor}\n")
    texfile.write("  % basicstyle=\\footnotesize,        % the size of the fonts that are used for the code\n")
    texfile.write("  breakatwhitespace=true,         % sets if automatic breaks should only happen at whitespace\n")
    texfile.write("  breaklines=true,                 % sets automatic line breaking\n")
    texfile.write("  captionpos=t,                    % sets the caption-position to bottom\n")
    texfile.write("  commentstyle=\\color{gray},    % comment style\n")
    texfile.write("  % deletekeywords={...},            % if you want to delete keywords from the given language\n")
    texfile.write("  % escapeinside={\\%*}{*)},          % if you want to add LaTeX within your code\n")
    texfile.write("  extendedchars=true,              % lets you use non-ASCII characters; for 8-bits encodings only, does not work with UTF-8\n")
    texfile.write("  % frame=single,                    % adds a frame around the code\n")
    texfile.write("  keepspaces=true,                 % keeps spaces in text, useful for keeping indentation of code (possibly needs columns=flexible)\n")
    texfile.write("  keywordstyle=\\color{blue},       % keyword style\n")
    texfile.write("  % language=Octave,                 % the language of the code\n")
    texfile.write("  % morekeywords={*,...},            % if you want to add more keywords to the set\n")
    texfile.write("  numbers=left,                    % where to put the line-numbers; possible values are (none, left, right)\n")
    texfile.write("  numbersep=2pt,                   % how far the line-numbers are from the code\n")
    texfile.write("  numberstyle=\\tiny\\color{gray}, % the style that is used for the line-numbers\n")
    texfile.write("  rulecolor=\\color{black},         % if not set, the frame-color may be changed on line-breaks within not-black text (e.g. comments (green here))\n")
    texfile.write("  showspaces=false,                % show spaces everywhere adding particular underscores; it overrides 'showstringspaces'\n")
    texfile.write("  showstringspaces=false,          % underline spaces within strings only\n")
    texfile.write("  showtabs=false,                  % show tabs within strings adding particular underscores\n")
    texfile.write("  stepnumber=1,                    % the step between two line-numbers. If it's 1, each line will be numbered\n")
    texfile.write("  stringstyle=\\color{brown},     % string literal style\n")
    texfile.write("  tabsize=4,                       % sets default tabsize to 2 spaces\n")
    texfile.write("  title=\\lstname                   % show the filename of files included with \\lstinputlisting; also try caption instead of title\n")
    texfile.write("}\n")

    # Now the body with the code parts
    # Adjust authors and exercise number
    texfile.write("\\title{Code für " + "{}".format(sheet) + "}\n")
    texfile.write("\\author{{{}}}\n".format(", ".join(authors)))
    texfile.write("\\begin{document}\n")
    texfile.write("\\maketitle\n")
    # Input all code files TODO add extension and filename
    # Get the right syntax key from the file extension
    extensions = {".py": "Python", ".cxx": "C++", ".cpp": "C++", ".c": "C"}
    # Input all source files
    for f in source_files:
        _, ext = os.path.splitext(f)
        lan = extensions[ext]
        texfile.write("\\lstinputlisting[language={}]{{{}}}\n".format(lan, f))
    texfile.write("\\end{document}\n")

    return


def print_code(path):
    # Parse all arguments:
    # path contains the path to the group folder: blattxx/groupnames
    print("Creating code print for directory:")
    print("    {}".format(path))
    # Extract sheet and authors from path
    sheet, authors = path.split("/")
    authors = authors.split("_")
    # Get source files in path
    extensions = [".py", ".cxx", ".cpp", ".c"]
    source_files = []
    for f in os.listdir(path):
        for ext in extensions:
            if f.endswith(ext):
                # Add correct filepath so that tex finds the files
                fpath = os.path.join("../", os.path.join(path, f))
                source_files.append(fpath)

    print(60 * "-")
    print("Found information:")
    print("    Sheet        :  {}".format(sheet))
    print("    Authors      :  {}".format(authors))
    print("    Source files :  {}".format(source_files))
    print(60 * "-")

    # Create temp build folder
    builddir = "build"
    if not os.path.exists(builddir):
        os.makedirs(builddir)

        # Parse the source files in the group folder
        # TODO
    print("Creating temp build folder.")
    with open("build/code.tex", "w") as texfile:
        # Write code in a tex file
        write_code(texfile, sheet, authors, source_files)

        # Now compile the tex file
    print("Compile tex file.")
    subprocess.call(["lualatex", "-output-directory=build", "build/code.tex"])

    # Rename and move code.pdf from the build folder
    print("Move pdf up and rename to:")
    print("    {}.pdf".format("_".join(authors)))
    subprocess.call(["mv", "build/code.pdf", "./{}.pdf".format("_".join(authors))])

    # Clean up: remove the build folder
    print("Cleaning up build folder.")
    subprocess.call(["rm", "-rf", "build"])

    print("Done. Exiting.")
    return


if __name__ == "__main__":
    """
	Usage: python codeprint.py Blattxx/

	Creates printable source code from alle source files in every group folder.

	Folders must be structured like: Blattxx/Name_Name_Name for every group.
	"""
    if len(sys.argv) == 2:
        path = sys.argv[1]
        for f in os.listdir(path):
            grouppath = os.path.join(path, f)
            if os.path.isdir(grouppath):
                print(grouppath)
                print_code(grouppath)
    else:
        print("Argument must be the group folder. Exiting without doing anything.")
