#!/usr/bin/env bash
#  ___    __________   |  Vasanth Developer (Vasanth Srivatsa)
#  __ |  / /___  __ \  |  ------------------------------------------------
#  __ | / / __  / / /  |  https://github.com/vasanthdeveloper/hackintosh-2018.git
#  __ |/ /  _  /_/ /   |
#  _____/   /_____/    |  Overwrite files to the EFI partition
#                      |

# Set execution flags
set -e

# Get the efi directory from arguments or use the default path
if [ "$1" == "" ]; then
    efidir="/Volumes/EFI"
else
    efidir="$1"
fi

# Error out if there is no EFI partition
if [ ! -d "$efidir" ]; then
    echo "Is your EFI partition even mounted?"
    exit 2
fi

# Files to be copyied into the EFI folder
cp "config.plist" "$efidir/EFI/CLOVER/config.plist"