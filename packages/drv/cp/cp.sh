#!/usr/bin/env bash
#
# This is a simple script which compiles and runs a cpp or c file
# I use it along with neovim for competitive programming.
# This script does not depend on neovim, however, my neovim config depends on it :P
# 

input_file="input.txt"
output_file="output.txt"
error_file="compile_error.txt"
executable="/tmp/program"

# Get the file extension
extension="${1##*.}"

# Get memory and time limits
tl=$(head -n 1 "$1" | grep -oP '(?<=TL:)\s*\K\d+(?=s)')

# Ensure input file exists
touch "$input_file"

cpp_compile_flags="-fsanitize=address,undefined -include $HOME/.config/scripts/bits/stdc++.h -I$HOME/.config/scripts -Winvalid-pch -std=c++20"
c_compile_flags=""
if [[ "$2" = "debug" ]]; then
    echo ":: Compiling with DEBUG flag ::"
    cpp_compile_flags="-g"
    c_compile_flags="-g"
fi

# Compile based on file type
echo ":: Compiling source file ::"
if [ "$extension" = "cpp" ]; then
    sh -c "g++ '$1' $cpp_compile_flags -o '$executable' 2> '$error_file'"
elif [ "$extension" = "c" ]; then
    sh -c "gcc '$1' $c_compile_flags -o '$executable' 2> '$error_file'"
else
    echo "Unsupported file type: $extension" > "$output_file"
    exit 1
fi

# Check if compilation succeeded
if [ $? -ne 0 ]; then
    echo "Compilation Error:" > "$output_file"
    cat "$error_file" >> "$output_file"
    exit 1
fi

# Run the program with or without limits
run_command=""

if [ ! -z "$tl" ]; then
  echo ":: Setting time limit to ${tl}s ::"
  run_command+="timeout ${tl}s " 
fi

run_command+="\"$executable\" < \"$input_file\" > \"$output_file\" 2>&1"
sh -c "$run_command"
exit_code=$?

# Check exit code and update output accordingly
if [ $exit_code -eq 124 ]; then
    echo "Time Limit Exceeded (${tl}s)" > "$output_file"
elif [ $exit_code -eq 0 ]; then
    echo ":: Program ran successfully ::"
else
    echo ":: There was an error running the program ::"
fi
