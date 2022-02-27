#! /bin/bash
# 2021-12-21
# genlab.sh
# Simple script to automate the process of creating my OSCP reports.

#Script variables
# --------------------------------------------------------- #
# Input markdown filename.
src='SOMETHING.md' # <-- CHANGE THIS
# read -p 'Input filename: ' src

# Output pdf filename.
out='SOMETHING.pdf' # <-- CHANGE THIS
# read -p 'Output filename: ' out

# Template path
template='/usr/share/pandoc/data/templates/eisvogel.latex' # <-- CHANGE THIS

# PDF reader
pdfr='xreader' # <-- CHANGE THIS
# --------------------------------------------------------- #

# Minor error handling
if [ $# -ne 0 ]
then
  printf "Arguments not allowed, change filenames in variables at beginning of script.";
  exit 1
elif [ ! -f $src ]
then
  printf "$src dosen't exist, check variable 'src'."
  exit 1
elif [ ! -f $template ]
then
  printf "$template dosen't exist.\n"
  printf "Download latest release of eisvogel:\nhttps://github.com/Wandmalfarbe/pandoc-latex-template/releases/\n"
  exit 1
elif ! command -v $pdfr &> /dev/null
then
  printf "$pdfr is not in path, check variable 'pdfr'.\n"
  exit 1
fi

# THIS IS WHERE THE MAGIC HAPPENS
# Generating pdf with pandoc.
printf "Generating $out from $src with template:\n$template\nAutomatic preview with: $pdfr\n"
p_errors=''
pandoc $src -o $out --from markdown+yaml_metadata_block --template $template --listings 43>p_errors

# Preview of output, or print errors from pandoc if any.
p_exit=$?
if [ $p_exit -eq 0 ];
then
  $pdfr $out &
  # echo "No preview!"
  exit 0;
else
  if [ -f $out ]
  then
    printf "$out exists, but pandoc exited with errors.\n";
  fi
  printf "pandoc exit code: $p_exit\nErrors:\n";
  printf "$p_errors\n";
  exit $p_exit
fi
