#!/bin/bash

# Directory paths
REPO_PATH=$(dirname "$0")/..
HTML_DIR="$REPO_PATH"

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

