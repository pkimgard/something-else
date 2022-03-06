# Do the same command on multiple files
for file in file1 file2 file3; do command $file; done
for file in *; do wc -l $file; done
for file in *.txt; do wc -l $file; done

# Do the same command over each line in file
# If there's no line terminal feed in your file, 'while read' will skip the last line, google it.
while read line; do echo "$line"; done < file.txt
cat file.txt | while read line; do echo "$line"; done
for line in $(cat file.txt); do echo $line; done
