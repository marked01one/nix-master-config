# Shell script that finds 6-digit hex color codes (#XXXXXX) in a file
# and prints each code alongside a visual representation of that color.

# Check if a file path was provided
if [ -z "$1" ]; then
  echo "Usage: $0 <filepath>"
  echo "Example: $0 styles.css"
  exit 1
fi

FILEPATH="$1"

# Check if the file exists
if [ ! -f "$FILEPATH" ]; then
  echo "Error: File not found at '$FILEPATH'."
  exit 1
fi

# Function to convert a hex color code to a colored block using ANSI True Color
# (24-bit) escapes.
# Takes one argument: the hex code (e.g., "#AABBCC").
function print_color_block() {
  local hex_code="${1#\#}" # Remove the '#' prefix
  local R_hex="${hex_code:0:2}"
  local G_hex="${hex_code:2:2}"
  local B_hex="${hex_code:4:2}"

  # Convert hex components to decimal (RGB values)
  # The '16#' prefix tells the shell to interpret the string as base-16 (hex)
  local R_dec=$((16#$R_hex))
  local G_dec=$((16#$G_hex))
  local B_dec=$((16#$B_hex))

  # ANSI escape code for True Color (24-bit):
  # \033[48;2;R;G;Bm - Sets the background color
  # \033[0m - Resets all attributes (color and background)
  local ANSI_COLOR_START="\033[48;2;${R_dec};${G_dec};${B_dec}m"
  local ANSI_COLOR_END="\033[0m"
  local COLOR_BLOCK="${ANSI_COLOR_START}     ${ANSI_COLOR_END} "

  # Output the color block, a space, and the original hex code
  echo -e "$COLOR_BLOCK" "$1"
}

echo "Color  Hex Code"
echo "-----  --------"

# Use grep to find all instances of 6-digit hex codes (case-insensitive)
# -o: Only print the matching part of a line
# -E: Use extended regular expressions
# Pattern: # followed by exactly six hex digits (0-9, a-f, A-F)
grep -oE '#[0-9a-fA-F]{6}' "$FILEPATH" | while read -r hex_code; do
  # Pass the found hex code to the function for coloring and printing
  print_color_block "$hex_code"
done

echo ""
