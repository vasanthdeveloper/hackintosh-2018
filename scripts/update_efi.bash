#!/usr/bin/env bash
#  ___    __________   |  Vasanth Developer (Vasanth Srivatsa)
#  __ |  / /___  __ \  |  ------------------------------------------------
#  __ | / / __  / / /  |  https://github.com/vasanthdeveloper/hackintosh-2018.git
#  __ |/ /  _  /_/ /   |
#  _____/   /_____/    |  Updates the config.plist file from EFI volume
#                      |

# Set execution flags
set -e

# Check if the script is running as root
if [ ! "$USER" == "root" ]; then
    echo "Privilage elevation required."
    exit 2
fi

# Check which operating system we are running
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=1;;
    Darwin*)    machine=2;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# mountOnDarwin() will mount the drive on macOS system
function mountOnDarwin() {
    driveList=`diskutil list`
    numberOfDrives=$(echo "$driveList" | grep "EFI" | wc -l)
    
    if [ "$numberOfDrives" -gt 1 ]; then
        echo "More than 1 EFI partition detected."
        echo "$driveList" | grep "EFI" | awk '{ print "  "NR" => /dev/"$6" ("$4 $5") "$3 }'
        echo ""
        read -p "Enter the full path of the drive to be mounted: " volumePath

        # Check if the path actually exists
        if [ ! -e "$volumePath" ]; then
            echo "The volume path doesn't exist."
            exit 2
        fi

        # Mount it
        driveName=$(echo "$driveList" | grep `basename "$volumePath"` | awk '{ print $3 }')
        mkdir "/Volumes/$driveName"
        mount -t msdos "$volumePath" "/Volumes/$driveName"
        echo "/Volumes/$driveName"
    else
        volumePath=$(echo "$driveList" | grep "EFI" | awk '{ print "/dev/"$6 }')
        driveName=$(echo "$driveList" | grep "EFI" | awk '{ print $3 }')
        mkdir "/Volumes/$driveName"
        mount -t msdos "$volumePath" "/Volumes/$driveName"
        echo "/Volumes/$driveName"
    fi
}

# mountOnLinux() will mount the drive on a Linux system

# unmountOnDarwin() will unmount the mounted partition
function unmountOnDarwin() {
    umount "$volumePath"
}

# unmountOnLinux() will unmount the mounted partiton

# installOnEFI() will do the necessary operations required when EFI is mounted
function installOnEFI() {
    # Copy the config.plist to EFI partition
    cp "../config.plist" "$volumePath/EFI/CLOVER/config.plist"
}

# Call the appropriate function depending on the operating system
if [ "$machine" -eq 1 ]; then
    echo "Not yet supported."
elif [ "$machine" -eq 2 ]; then
    # Mount the EFI partition if not mounted
    volumePath=$(mountOnDarwin)

    # Do the necessary operations required on mounted EFI partition
    installOnEFI

    # Unmount the mount EFI partition
    unmountOnDarwin "$volumePath"
else
    echo "Unsupported operating system."
fi