#!/bin/zsh

#export JAVA_HOME="/Volumes/Data/Java/jdk8u292-b10/Contents/Home"
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/adoptopenjdk-11.jdk/Contents/Home"
export ANDROID_HOME="/Volumes/Data/Android/SDK"
export ANDROID_STUDIO_HOME="/Applications/Android Studio.app"
#export FLUTTER_HOME="/Volumes/Data/Flutter/3.29.0"
export FLUTTER_HOME="/Volumes/Data/Flutter/current"


export PATH="/usr/local/opt/openjdk@17/bin:$PATH"

#export PATH="$PATH:/Volumes/Data/Flutter/current/flutter/bin"
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/tools/bin"
export PATH="$PATH:$ANDROID_HOME/platform-tools"
export PATH="$FLUTTER_HOME/bin:$PATH"

alias ll='ls -l'
alias la='ll -a'
