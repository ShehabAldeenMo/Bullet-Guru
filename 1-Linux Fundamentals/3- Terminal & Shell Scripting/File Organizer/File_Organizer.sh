#!/bin/bash

# Function to organize files based on their file types
organize_files() {
    local dir="$1"  # Assign the first argument to the variable 'dir'
    
    # Check if the directory exists
    if [[ ! -d "$dir" ]]; then
        echo "Error: Directory '$dir' does not exist."
        exit 1  # Exit the script if the directory doesn't exist
    fi

    # Iterate over each file in the directory
    for file in "$dir"/*; do
        # Skip directories and handle hidden files
        if [[ -d "$file" || "$(basename "$file")" == .* ]]; then
            continue  # Skip to the next file if it's a directory or hidden
        fi

        # Extract the file extension using parameter expansion
        ext="${file##*.}"  # Extracts the part after the last '.'
        base="${file##*/}" # Extracts the filename without the path

        # Determine the subdirectory based on the file extension
        if [[ "$base" == "$ext" ]]; then
            ext="misc"  # If the file has no extension, assign it to 'misc'
        elif [[ -z "$ext" ]]; then
            ext="misc"  # If the extension is empty, assign it to 'misc'
        fi

        # Create the subdirectory if it doesn't exist
        subdir="$dir/$ext"  # Define the subdirectory path based on the extension
        mkdir -p "$subdir"  # Create the subdirectory if it doesn't exist

        # Move the file into the appropriate subdirectory
        mv "$file" "$subdir/"
    done
}

# Check if the user has provided exactly one argument (the directory path)
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <directory>"
    exit 1  # Exit the script if no directory or too many arguments are provided
fi

# Call the function with the provided directory argument
organize_files "$1"  # Pass the directory path to the organize_files function

# Print a confirmation message after organizing the files
echo "Files have been organized."
