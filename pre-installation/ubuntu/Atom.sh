#!/bin/bash
##########################################################################
# This script executes commands to add third-party repository of Atom
# editor application. Official text editor of Github.
# @author César Rodríguez González
# @version 1.3, 2016-08-14
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

# Variables
repositoryURL="http://ppa.launchpad.net/webupd8team/atom/ubuntu"
#repository="deb $repositoryURL $distroName main"
#repositorySource="deb-src $repositoryURL $distroName main"
repositoryFilename="webupd8team-ubuntu-atom*.list"

# Commands to add third-party repository of the application.
if [ ! -f "/etc/apt/sources.list.d/$repositoryFilename" ] || [ ! grep -q "$repositoryURL" "/etc/apt/sources.list.d/$repositoryFilename" ]; then
	add-apt-repository -y ppa:webupd8team/atom 2>&1
fi 2>/dev/null