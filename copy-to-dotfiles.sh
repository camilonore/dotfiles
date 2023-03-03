#!/bin/bash

<<<<<<< HEAD
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
=======
# List of files to copy if has a / in the name
# it will be copied to the same path in the home directory
# otherwise it will be copied to the home directory

files=(
  .zshrc
  .oh-my-zsh/custom/
  .config/nvim/lua/custom/
  .config/kitty/
  .config/touchegg/
  .config/redshift.conf
  .conky/
  .fonts/
  .icons/
  .themes/
)

# Destination directory
destination="$HOME/dev/dotfiles"

# Loop through each file and copy it to the destination directory
for file in "${files[@]}"; do

  if [[ $file == */ ]]; then
    new_file="${file::-1}"
    mkdir -p "$destination/$new_file"
    echo "Created directory $destination/$new_file"
    cp -r -u "$HOME/$new_file"/* "$destination/$new_file"
  else
    cp -u "$HOME/$file" "$destination/$file"
  fi

  echo "Copied $file to $destination/$file"
done
>>>>>>> faa09070 (Updates)

