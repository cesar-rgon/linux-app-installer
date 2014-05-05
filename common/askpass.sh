#!/bin/bash
##########################################################################
# This script adds a translation file according to system language.
#
# Author: César Rodríguez González
# Version: 1.0
# Last modified date (dd/mm/yyyy): 05/05/2014
# Licence: MIT
##########################################################################

ISO639_1=${LANG:0:2}
LANGUAGE_FILE="../languages/"$ISO639_1".properties"

if [ -f "$LANGUAGE_FILE" ]; then
	. $LANGUAGE_FILE
else
	. ../languages/en.properties
fi

zenity --password --title "$adminPassword"

