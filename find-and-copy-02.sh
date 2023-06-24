#!/bin/bash

# Asks the user to enter parts of the filenames to search for, separated by spaces
read -p "Enter part(s) of the filename(s) to search for (separated by spaces): " -a search_names

# The folder name will be the actual date with the COPIA_DE_GRAVACOES
folder_name=$(date +"%Y-%m-%d_%H-%M-%S")
folder_name+="-COPIA_DE_GRAVACOES"

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
