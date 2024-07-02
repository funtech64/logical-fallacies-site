#!/bin/bash

# Directory paths
REPO_PATH=$(dirname "$0")/..
HTML_DIR="$REPO_PATH"
IMAGES_DIR="$REPO_PATH/images"
ART_DIR="$REPO_PATH/art"

# Create the art directory if it doesn't exist
if [ ! -d "$ART_DIR" ]; then
    mkdir "$ART_DIR"
    echo "Created art directory."
else
    echo "Art directory already exists."
fi

# Move all image files from images to art
if [ -d "$IMAGES_DIR" ]; then
    mv "$IMAGES_DIR"/* "$ART_DIR"/
    echo "Moved all files from images to art directory."
else
    echo "Images directory does not exist. No files to move."
fi

# Function to update image paths in HTML files
update_image_paths() {
    local file="$1"
    # Check if the file contains image paths that need to be updated
    if grep -q "/images" "$file"; then
        # Replace /images with /art
        sed -i 's|/images|/art|g' "$file"
        echo "Updated image paths in $file"
    else
        echo "No update needed for $file"
    fi
}

export -f update_image_paths

# Find all HTML files and update them
find "$HTML_DIR" -name "*.html" -exec bash -c 'update_image_paths "$0"' {} \;

echo "All HTML files have been processed."

