#!/bin/bash

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

# Remove current files

for file in "${files[@]}"; do
  if [[ $file == */ ]]; then
    new_file="${file::-1}"
    rm -rf "$destination/$new_file"
    echo "Removed directory $destination/$new_file"
  else
    rm -rf "$destination/$file"
    echo "Removed $destination/$file"
  fi
done

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

