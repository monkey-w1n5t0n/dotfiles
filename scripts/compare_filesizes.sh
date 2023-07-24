#!/usr/bin/env sh

# Check if the number of arguments is correct
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <dir1> <dir2>"
  exit 1
fi

dir1="$1"
dir2="$2"

# Check if the directories exist
if [ ! -d "$dir1" ]; then
  echo "Directory $dir1 does not exist"
  exit 1
fi

if [ ! -d "$dir2" ]; then
  echo "Directory $dir2 does not exist"
  exit 1
fi

# Check if the directories have the same number of files
num_files1=$(ls -1 "$dir1" | wc -l)
num_files2=$(ls -1 "$dir2" | wc -l)

if [ "$num_files1" -ne "$num_files2" ]; then
  echo "The directories have a different number of files"
  exit 1
fi

# Check if filenames match and compare their file sizes
for file in "$dir1"/*; do
  file_name=$(basename "$file")
  file2="$dir2/$file_name"

  if [ ! -f "$file2" ]; then
    echo "File $file_name not found in $dir2"
    exit 1
  fi

  # Compare file sizes
  size1=$(stat -c%s "$file")
  size2=$(stat -c%s "$file2")

  if [ "$size1" -gt "$size2" ]; then
    cp "$file" "$file2"
    echo "Copied $file_name from $dir1 to $dir2 (overwritten)"
  elif [ "$size1" -lt "$size2" ]; then
    cp "$file2" "$file"
    echo "Copied $file_name from $dir2 to $dir1 (overwritten)"
  fi
done

echo "Finished copying larger files and overwriting smaller ones"
