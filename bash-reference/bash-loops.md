# Bash loops

## Same command on multiple files

```bash
for file in file1 file2 file3; do command $file; done
for file in *; do wc -l $file; done
for file in *.txt; do wc -l $file; done
```

## Same command on each line in file

*If there's no line terminal feed in your file, 'while read' will skip the last line, google it.*

```bash
while read line; do echo "$line"; done < file.txt
cat file.txt | while read line; do echo "$line"; done
for line in $(cat file.txt); do echo $line; done
```
