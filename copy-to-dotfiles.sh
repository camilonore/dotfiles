#!/bin/bash

# Define the source and destination directories
src_dir="$HOME/.oh-my-zsh"
dest_dir="$HOME/dev/dotfiles"

# Create the destination directory if it doesn't exist
if [ ! -d "$dest_dir" ]; then
  mkdir -p "$dest_dir"
fi

# Copy the .oh-my-zsh directory to the destination directory
cp -r "$src_dir" "$dest_dir"

# Print a success message
echo "Copied .oh-my-zsh directory from $src_dir to $dest_dir"

