#!/bin/bash
# Script which counts number of files in a directory under $SUBJECTS_DIR
# This might be useful to monitor the process of recon-all
# 26 Jan 2018 K.Nemoto

#set -x

#change directory to $SUBJECTS_DIR
echo "change directory to $SUBJECTS_DIR"
cd $SUBJECTS_DIR

#count number of files in a directory under $SUBJECTS_DIR
for dir in $(ls -F | grep / | sed 's:/$::')
do
    echo -e "$dir \t $(find $dir -type f | wc -l)"
done

exit

