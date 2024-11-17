#!/usr/bin/env bash

input_file="input.txt"
output_file="output.txt"
error_file="compile_error.txt"
executable="/tmp/program"

# Get the file extension
extension="${1##*.}"

# Get memory and time limits
tl=$(head -n 1 "$1" | grep -oP '(?<=TL:)\s*\K\d+(?=s)')
# ml=$(head -n 2 "$1" | tail -n 1 | grep -oP '(?<=ML:)\s*\K\d+(?=MB)')

# Ensure input file exists
touch "$input_file"

# Compile based on file type
echo ":: Compiling source file ::"
if [ "$extension" = "cpp" ]; then
    g++ -std=c++20 -O2 -Wall -Wextra -Wshadow -pedantic \
        -fstack-protector \
        "$1" -o "$executable" 2> "$error_file"
elif [ "$extension" = "c" ]; then
    gcc "$1" -o "$executable" 2> "$error_file"
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
# if [ ! -z "$ml" ]; then
#     echo ":: Setting memory limit to ${ml}MB ::"
#     # Convert MB to KB for ulimit
#     memory_kb=$((ml * 1024))
#     
#     # Set memory limit and run with timeout
#     run_command="ulimit -v $memory_kb && "
# fi

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
# elif [ $exit_code -eq 137 ] || [ $exit_code -eq 134 ]; then
#     echo "Memory Limit Exceeded (${ml}MB)" > "$output_file"
elif [ $exit_code -eq 0 ]; then
    echo ":: Program ran successfully ::"
else
    echo "There was an error running the program"
fi

# Cleanup
rm -f "$executable" "$error_file"
