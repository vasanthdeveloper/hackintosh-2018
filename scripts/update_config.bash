#!/usr/bin/env bash
#  ___    __________   |  Vasanth Developer (Vasanth Srivatsa)
#  __ |  / /___  __ \  |  ------------------------------------------------
#  __ | / / __  / / /  |  https://github.com/vasanthdeveloper/hackintosh-2018.git
#  __ |/ /  _  /_/ /   |
#  _____/   /_____/    |  Updates the config.plist file from EFI volume
#                      |

# Check which operating system we are running
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=1;;
    Darwin*)    machine=2;;
    *)          machine="UNKNOWN:${unameOut}"
esac

# mountOnDarwin() will mount the drive on macOS system
function mountOnDarwin() {
    # Check if the EFI directory already exists
    if [ ! -d "/Volumes/EFI" ]; then
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
    else
        echo "/Volumes/EFI"
    fi
}

# mountOnLinux() will mount the drive on a Linux system

# Call the appropriate function depending on the operating system
if [ "$machine" -eq 1 ]; then
    echo "Not yet supported."
elif [ "$machine" -eq 2 ]; then
    # Mount the EFI partition if not mounted
    volumePath=$(mountOnDarwin)

    # Copy the config.plist from EFI partition
    cp "$volumePath/EFI/CLOVER/config.plist" "../config.plist"
else
    echo "Unsupported operating system."
fi