#!/bin/bash

if [ -e $1/usr/share/sounds/deepin/stereo/version.txt ]
	then
		cat $1/usr/share/sounds/deepin/stereo/version.txt
	else
		echo "false"
fi

