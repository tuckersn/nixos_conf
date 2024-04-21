#!/usr/bin/env bash

export DIR_TIMESTAMP=$(date +"%y-%m-%d-%H-%M")
export DIRT_TIMESTAMP_DIR=/srv/nix_backups/$DIR_TIMESTAMP


validate_toml() {
    # Function to validate a TOML file using the Python script

    # Check if the correct number of arguments was provided
    if [ "$#" -ne 1 ]; then
        echo "Usage: validate_toml <path_to_toml_file>"
        return 1
    fi

    # Path to the TOML file from the argument
    FILE_PATH="$1"

    # Check if the specified file exists
    if [ ! -f "$FILE_PATH" ]; then
        echo "Error: File does not exist."
        return 1
    fi

    # Run the Python script to validate the TOML file
    python validate_toml.py "$FILE_PATH"
}


validate_toml "./conf/nix.toml"
validate_toml "./conf/vars.toml"


mv -r /etc/nixos/ $DIR_TIMESTAMP_DIR
cp -a ./ /etc/nixos/