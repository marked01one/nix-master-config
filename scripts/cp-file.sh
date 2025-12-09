# Shell script to copy text from a file input into the clipboard.

cat "$1" | xclip -selection clipboard
