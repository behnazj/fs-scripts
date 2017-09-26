#!/bin/bash

if [ $# -lt 1 ]; then
 echo "Subject名を指定してください"
 echo "使い方: $0 Subject名"
 exit 1
fi 

freeview -v \
    $SUBJECTS_DIR/$1/mri/T1.mgz \
    $SUBJECTS_DIR/$1/mri/wm.mgz \
    $SUBJECTS_DIR/$1/mri/brainmask.mgz \
    $SUBJECTS_DIR/$1/mri/aseg.mgz:colormap=lut:opacity=0.2 &

