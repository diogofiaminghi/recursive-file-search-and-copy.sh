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
for name_part in "${search_names[@]}"
do
    find /home -type f -name "*$name_part*" -exec cp {} "$dest" \;
done
