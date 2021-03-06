#!/bin/bash
##########################################################################
# This script installs Xonotic game.
# @author César Rodríguez González
# @version 1.3, 2016-08-09
# @license MIT
##########################################################################

# Check if the script is being running by a root or sudoer user
if [ "$(id -u)" != "0" ]; then echo ""; echo "This script must be executed by a root or sudoer user"; echo ""; exit 1; fi

# Parameters
if [ -n "$1" ]; then scriptRootFolder="$1"; else scriptRootFolder="`pwd`/../.."; fi
if [ -n "$2" ]; then username="$2"; else username="`whoami`"; fi
if [ -n "$3" ]; then homeFolder="$3"; else homeFolder="$HOME"; fi

# Add common variables
. $scriptRootFolder/common/commonVariables.properties

# Commands to download, extract and install a non-repository application ...
# Pre-requisite
apt install -y unzip
# Get Xonotic latest version from web site
wget -O $tempFolder/xonotic_index.html http://www.xonotic.org/ 2>&1
xonoticURL=`cat $tempFolder/xonotic_index.html | grep "http://dl.xonotic.org" | awk -F ">" {'print $1}' | awk -F "\"" {'print $2'}`
# Download Xonotic
wget -O $tempFolder/xonotic.zip $xonoticURL 2>&1
# Decompress to system folder
unzip -o $tempFolder/xonotic.zip -d /usr/games
# Copy Xonotic icon to system icons
cp -f /usr/games/Xonotic/misc/logos/xonotic_icon.svg /usr/share/pixmaps
# Create menu launcher for Xonotic game.
echo "[Desktop Entry]
Name=Xonotic (glx)
Exec=bash xonotic-linux-glx.sh
Icon=xonotic_icon
Terminal=false
Type=Application
Categories=Game
Comment=Xonotic (glx)
Path=/usr/games/Xonotic
StartupNotify=false" > /usr/share/applications/xonotic-glx.desktop

echo "[Desktop Entry]
Name=Xonotic (sdl)
Exec=bash xonotic-linux-sdl.sh
Icon=xonotic_icon
Terminal=false
Type=Application
Categories=Game
Comment=Xonotic (sdl)
Path=/usr/games/Xonotic
StartupNotify=false" > /usr/share/applications/xonotic-sdl.desktop

echo "[Desktop Entry]
Name=Xonotic (dedicated server)
Exec=x-terminal-emulator -e \"bash xonotic-linux-dedicated.sh -sessionid localhost\"
Icon=xonotic_icon
Terminal=false
Type=Application
Categories=Game
Comment=Xonotic (dedicated server)
Path=/usr/games/Xonotic
StartupNotify=false" > /usr/share/applications/xonotic-dedicated.desktop
