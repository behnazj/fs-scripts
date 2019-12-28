#!/bin/bash
# Script to set Matlab R2012b Runtime for hippocampal subfield calculation
# This script is based on 
# https://surfer.nmr.mgh.harvard.edu/fswiki/MatlabRuntime
# 19 Jan 2019 K.Nemoto

#set -x

#Check if $FREESURFER_HOME is defined
if [ -e $FREESURFER_HOME ]; then 
    echo '$FREESURFER_HOME exists.'
else 
    echo '$FREESURFER_HOME does not exist. Setup FreeSurfer first. exit with error.'
    exit1
fi

#Check OS
os=$(uname)

if [ $os == "Linux" ]; then
    #install curl for Ubuntu
    echo "Check curl is installed"
    curl --help > /dev/null

    if [ $? -ne 0 ]; then
        echo "Install curl"
        sudo apt-get -y install curl
    else
        echo "curl is installed"
    fi

    #Download the runtime
    echo "Download MATLAB Runtime"
    cd ~/Downloads
    curl "https://surfer.nmr.mgh.harvard.edu/fswiki/MatlabRuntime?action=AttachFile&do=get&target=runtime2012bLinux.tar.gz" -o "runtime2012b.tar.gz"


elif [ $os == "Darwin" ]; then 
    "proceed to download Matlab runtime"
    #Download the runtime
    echo "Download MATLAB Runtime"
    cd ~/Downloads
    curl "https://surfer.nmr.mgh.harvard.edu/fswiki/MatlabRuntime?action=AttachFile&do=get&target=runtime2012bMAC.tar.gz" -o "runtime2012b.tar.gz"

else
    echo "Cannot detect your OS!"
    exit 1
fi

#Unpack the runtime
cd $FREESURFER_HOME
sudo tar xvf ~/Downloads/runtime2012b.tar.gz

echo "Runtime was installed successfully. Exit."
echo "You may delete ~/Downloads/runtime2012b.tar.gz"

sleep 5

exit

