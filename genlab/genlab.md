# genlab

- https://github.com/noraj/OSCP-Exam-Report-Template-Markdown

Initial problem/situation: I started taking all my notes in markdown for the OSCP lab report(about 200 pages). My first attempts of generating a pdf from this was horrible.

Solution: Steal noraj's work and create my own script with it.

## Requirements
```
sudo pacman -S pandoc, texlive-most
```

## Usage
See the noraj github page for exampls on the YAML headers. Change variables like template and pdf readers.

Run script, when generated it will open the pdf in you reader of choice.

```
bash genlab.sh
```
