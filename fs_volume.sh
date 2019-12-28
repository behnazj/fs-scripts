#!/bin/bash
# Script to run FreeView to check volume files
# Usage: fs_volume.sh <fsid>
# 19 Jan 2019 K.Nemoto

if [ $# -lt 1 ]; then
  echo "Please specify subject name!"
  echo "Usage: $0 subject (e.g. bert)"
  exit 1
fi 

#Check brainmask.mgz exists
if [ ! -f $SUBJECTS_DIR/$1/mri/brainmask.mgz ]; then
  echo "brainmask.mgz does not exist!"
  echo "It seems recon-all exited with error!"
  exit 1
fi

freeview -v \
  $SUBJECTS_DIR/$1/mri/T1.mgz \
  $SUBJECTS_DIR/$1/mri/wm.mgz \
  $SUBJECTS_DIR/$1/mri/brainmask.mgz \
  $SUBJECTS_DIR/$1/mri/aseg.mgz:colormap=lut:opacity=0.2 \
  -f \
  $SUBJECTS_DIR/$1/surf/lh.white:edgecolor=blue \
  $SUBJECTS_DIR/$1/surf/lh.pial:edgecolor=red \
  $SUBJECTS_DIR/$1/surf/rh.white:edgecolor=blue \
  $SUBJECTS_DIR/$1/surf/rh.pial:edgecolor=red &

