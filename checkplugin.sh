#!/bin/bash

checkplugin() {
	ionic cordova plugin add $1
	
	mkdir -p "./plugin-interactions"
	local path="./plugin-interactions/$1.txt"

	ionic cordova build android >$path 2>&1
	
	if [ $? -ne 1 ]
	then
		rm $path
	fi

	ionic cordova plugin remove $1
}

declare -a plugins=(
cordova-plugin-x-socialsharing
cordova-plugin-appavailability
cordova-plugin-youtube-video-player
cordova-plugin-market
cordova-plugin-flurryanalytics
cordova-sqlite-storage
cordova-plugin-apprate
cordova-plugin-email-composer
cordova-plugin-android-permissions
cordova-plugin-inappbrowser
)

for i in "${plugins[@]}"
do
	checkplugin $i
done

