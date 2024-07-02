#!/bin/bash

# Directory to check
REPO_PATH=$(dirname "$0")/..
FALLACIES_DIR="$REPO_PATH/fallacies"
COMPONENTS_DIR="$REPO_PATH/components"
JS_DIR="$REPO_PATH/js"

# Extensions to check
EXTENSIONS=("html" "js")

# Function to find dead links
find_dead_links() {
    local file_path="$1"
    local dir_path="$2"
    local dead_links=()
    local links

    # Extract href links from the file
    links=$(grep -oP 'href="\K[^"]+' "$file_path")
    
    for link in $links; do
        # Check if link is relative and if the file exists
        if [[ ! "$link" =~ ^http ]] && [[ ! -f "$dir_path/$link" ]] && [[ ! -f "$REPO_PATH/$link" ]]; then
            dead_links+=("$link")
        fi
    done

    echo "${dead_links[@]}"
}

# Main function to check directories
check_directory() {
    local dir_path="$1"
    local ext="$2"

    for file in $(find "$dir_path" -type f -name "*.$ext"); do
        dead_links=$(find_dead_links "$file" "$dir_path")
        if [ ! -z "$dead_links" ]; then
            echo "Dead links found in $file:"
            for link in $dead_links; do
                echo "  $link"
            done
        fi
    done
}

# Check all directories
for ext in "${EXTENSIONS[@]}"; do
    check_directory "$REPO_PATH" "$ext"
done

