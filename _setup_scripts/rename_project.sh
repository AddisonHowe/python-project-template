#!/bin/bash
#=============================================================================
#
# FILE: rename_project.sh
#
# USAGE: rename_project.sh name
#
# DESCRIPTION: Replaces all occurences of the default name "myproject" with the
#  given new name. Only handles occurences in the default project state, and 
#  shouldbe run immediately after cloning.
#
# EXAMPLE: sh _setup_scripts/rename_project.sh mynewproject
#=============================================================================

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 name"
    exit 1
fi

newname=$1

OLDNAME="myproject"

read -p "This action will alter current files and directories. 
Occurences of '$OLDNAME' will be replaced with '$name'. 
Do you want to continue? (y/n): " answer

case "$answer" in
    [Yy]* ) echo "Continuing...";;
    [Nn]* ) echo "Aborting."; exit 1;;
    * ) echo "Please answer [y]es or [n]o."; exit 1;;
esac


# Replace all occurences in specific files
flist=(
    "setup.py"
    "pyproject.toml"
    "${OLDNAME}/__main__.py"
    "tests/test_core.py"
    "README.md"
)

for f in ${flist[@]}; do
    echo Modifying $f
    sed -i.bak "s/${OLDNAME}/${newname}/g" ${f} && rm ${f}.bak    
done

# Rename src directory
mv ${OLDNAME} ${newname}
