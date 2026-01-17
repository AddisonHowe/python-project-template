#!/bin/bash
#=============================================================================
#
# FILE: make_directories.sh
#
# USAGE: make_directories.sh [dir1 [dir2]...]
#
# DESCRIPTION: Add common directories. If no arguments specified, creates 
#   empty directories: out, scripts, logs, notebooks
#
# EXAMPLE: sh make_directories.sh arg1
#=============================================================================

set -euo pipefail

# Default directories
DEFAULT_DIRS=(out scripts logs notebooks)

# If arguments are provided, use them; otherwise use defaults
if [ "$#" -gt 0 ]; then
    DIRS=("$@")
else
    DIRS=("${DEFAULT_DIRS[@]}")
fi

for dir in "${DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "Directory already exists: $dir"
    else
        mkdir -p "$dir"
        echo "Created directory: $dir"
    fi
done
