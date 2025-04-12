#!/bin/bash
#=============================================================================
#
# FILE: create_environment.sh
#
# USAGE: create_environment.sh
#
# DESCRIPTION: Create a local conda environment with necessary packages.
#
# EXAMPLE: sh _setup_scripts/create_environment.sh
#=============================================================================

read -p "This action will create a conda environment 'env'. 
Do you want to continue? (y/n): " answer

case "$answer" in
    [Yy]* ) echo "Continuing...";;
    [Nn]* ) echo "Aborting."; exit 1;;
    * ) echo "Please answer [y]es or [n]o."; exit 1;;
esac

conda env create -p ./env -f environment.yml --yes
