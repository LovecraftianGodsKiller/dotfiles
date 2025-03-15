#!/bin/bash

# easy-xz-compressor.sh - User-friendly script for XZ compression
# Usage: ./easy-xz-compressor.sh

# Text formatting
BOLD=$(tput bold)
NORMAL=$(tput sgr0)
GREEN=$(tput setaf 2)
BLUE=$(tput setaf 4)
RED=$(tput setaf 1)

# Function to display welcome message
show_welcome() {
    clear
    echo "${BOLD}${BLUE}======================================${NORMAL}"
    echo "${BOLD}       EASY XZ COMPRESSOR TOOL       ${NORMAL}"
    echo "${BOLD}${BLUE}======================================${NORMAL}"
    echo
    echo "This tool helps you compress files and folders into an XZ archive."
    echo
}

# Function to get archive name from user
get_archive_name() {
    local default_name="archive.tar.xz"
    
    echo "${BOLD}Step 1: Name your archive${NORMAL}"
    read -p "Enter archive name or press Enter for default [$default_name]: " OUTPUT_NAME
    
    # Use default if empty
    if [ -z "$OUTPUT_NAME" ]; then
        OUTPUT_NAME=$default_name
    # Add extension if not present
    elif [[ ! $OUTPUT_NAME =~ \.(tar\.xz|txz)$ ]]; then
        OUTPUT_NAME="${OUTPUT_NAME}.tar.xz"
    fi
    
    echo
    echo "${GREEN}✓ Archive will be saved as:${NORMAL} $OUTPUT_NAME"
    echo
}

# Function to get compression level
get_compression_level() {
    local default_level=6
    local valid=false
    
    echo "${BOLD}Step 2: Choose compression level${NORMAL}"
    echo "  Lower (1-3): Faster compression, larger file size"
    echo "  Medium (4-6): Balanced speed and compression"
    echo "  Higher (7-9): Better compression, slower speed"
    
    until [ "$valid" = true ]; do
        read -p "Enter compression level (1-9) or press Enter for default [$default_level]: " COMP_LEVEL
        
        # Use default if empty
        if [ -z "$COMP_LEVEL" ]; then
            COMP_LEVEL=$default_level
            valid=true
        # Validate input is between 1-9
        elif [[ $COMP_LEVEL =~ ^[1-9]$ ]]; then
            valid=true
        else
            echo "${RED}Please enter a number between 1 and 9${NORMAL}"
        fi
    done
    
    echo
    echo "${GREEN}✓ Using compression level:${NORMAL} $COMP_LEVEL"
    echo
}

# Function to select files and directories
select_files() {
    local items=()
    local selection=""
    local finished=false
    
    echo "${BOLD}Step 3: Select files and folders to compress${NORMAL}"
    echo "Type the path to a file or folder and press Enter."
    echo "You can add multiple items one by one."
    echo "When finished, type 'done' or just press Enter."
    echo
    
    until [ "$finished" = true ]; do
        read -p "Add file/folder (or type 'done'): " selection
        
        if [ -z "$selection" ] || [ "$selection" = "done" ]; then
            # Check if we have at least one item
            if [ ${#items[@]} -eq 0 ]; then
                echo "${RED}Please select at least one file or folder${NORMAL}"
            else
                finished=true
            fi
        elif [ ! -e "$selection" ]; then
            echo "${RED}Error: '$selection' doesn't exist. Please try again.${NORMAL}"
        else
            items+=("$selection")
            echo "${GREEN}✓ Added:${NORMAL} $selection"
        fi
    done
    
    FILES_TO_COMPRESS=("${items[@]}")
    
    echo
    echo "${GREEN}✓ Selected ${#FILES_TO_COMPRESS[@]} item(s) for compression${NORMAL}"
    echo
}

# Function to show progress during compression
show_progress() {
    echo
    echo "${BOLD}Compressing files...${NORMAL}"
    echo
}

# Function to perform compression
do_compression() {
    # Create backup folder if needed
    OUTPUT_DIR=$(dirname "$OUTPUT_NAME")
    if [ ! -z "$OUTPUT_DIR" ] && [ "$OUTPUT_DIR" != "." ] && [ ! -d "$OUTPUT_DIR" ]; then
        mkdir -p "$OUTPUT_DIR"
    fi
    
    # Prepare command
    echo "${BOLD}Starting compression...${NORMAL}"
    echo
    
    # Use pv for progress if available, otherwise show a simple message
    if command -v pv &> /dev/null; then
        tar cf - "${FILES_TO_COMPRESS[@]}" | pv -s $(du -sb "${FILES_TO_COMPRESS[@]}" | awk '{sum+=$1} END {print sum}') | xz -"$COMP_LEVEL" > "$OUTPUT_NAME"
    else
        echo "Please wait, this may take a while depending on the size..."
        tar -cf - "${FILES_TO_COMPRESS[@]}" | xz -"$COMP_LEVEL" > "$OUTPUT_NAME"
    fi
    
    # Check if successful
    if [ $? -eq 0 ] && [ -f "$OUTPUT_NAME" ]; then
        # Get archive size
        ARCHIVE_SIZE=$(du -h "$OUTPUT_NAME" | cut -f1)
        
        echo
        echo "${GREEN}${BOLD}Success!${NORMAL} Archive created at: ${BOLD}$OUTPUT_NAME${NORMAL}"
        echo "Size: $ARCHIVE_SIZE"
        echo
        echo "To extract this archive later, use:"
        echo "  tar -xf $OUTPUT_NAME"
        echo
    else
        echo
        echo "${RED}${BOLD}Error:${NORMAL} Failed to create archive.${NORMAL}"
        echo
    fi
}

# Main function
main() {
    show_welcome
    get_archive_name
    get_compression_level
    select_files
    do_compression
}

# Run the script
main
