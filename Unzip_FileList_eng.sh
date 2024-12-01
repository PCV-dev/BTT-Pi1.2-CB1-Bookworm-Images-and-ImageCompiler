#!/bin/bash

# Check if the FileList.txt file exists
if [ ! -f "FileList.txt" ]; then
  echo "The file FileList.txt was not found."
  exit 1
fi

# Process all directories listed in the FileList.txt file
while IFS= read -r directory; do
  # Skip if the line is empty
  if [ -z "$directory" ]; then
    continue
  fi

  echo "Processing directory: $directory"

  # Check if the directory exists
  if [ ! -d "$directory" ]; then
    echo "The directory '$directory' does not exist."
    continue
  fi

  # Change to the directory
  cd "$directory" || { echo "Cannot enter the directory '$directory'."; continue; }

  # Process all split ZIP archives
  for zip_part in *.zip.001; do
    # Determine the base name to properly concatenate the archives
    base_name="${zip_part%.zip.001}"

    # Concatenate parts into a complete ZIP archive
    echo "Concatenating parts into: ${base_name}.zip"
    cat "${base_name}".zip.* > "${base_name}.zip"

    # Extract the complete ZIP archive
    if [ -f "${base_name}.zip" ]; then
      echo "Extracting: ${base_name}.zip"
      unzip -o "${base_name}.zip" || { echo "Error extracting ${base_name}.zip"; continue; }

      # Optionally: Delete the complete ZIP archive and parts to save space
      echo "Deleting: ${base_name}.zip and parts"
      rm -f "${base_name}.zip" "${base_name}".zip.*
    fi
  done

  # Return to the initial directory
  cd - > /dev/null || exit 1

done < "FileList.txt"

echo "All specified directories have been processed successfully."

