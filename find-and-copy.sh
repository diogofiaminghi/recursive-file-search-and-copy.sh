#!/bin/bash

# Asks the user to enter parts of the filenames to search for, separated by spaces
read -p "Enter part(s) of the filename(s) to search for (separated by spaces): " -a search_names

# Asks the user to enter the name of the folder to be created inside /tmp directory
read -p "Enter the name of the folder to be created inside /tmp directory: " folder_name

# Defines the full path of the destination directory
dest="/tmp/$folder_name"

# Creates the new destination folder if it doesn't exist
mkdir -p "$dest"

# Finds all files containing any of the specified name parts in the current directory and its subdirectories,
# and copies each found file to the destination directory
found_files=0
for name_part in "${search_names[@]}"
do
    echo "Searching for files containing \"$name_part\"..."
    find . -type f -name "*$name_part*" -exec cp {} "$dest" \; -print
    if [ $? -eq 0 ]; then
        found_files=$((found_files + 1))
    fi
done

if [ $found_files -eq 0 ]; then
    echo "No files found containing any of the specified name parts."
else
    echo "Finished searching for files containing the specified name parts."
    echo "Found and copied $found_files files to $dest directory:"
    ls -1 "$dest"
fi
