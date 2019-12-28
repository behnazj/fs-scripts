#!/bin/bash
# Script for QC of skull-strip with FreeView
# Usage: fs_qc1_skullstrip.sh <fsid>
# 19 Jan 2019 K.Nemoto

if [ $# -lt 1 ]; then
  echo "Please specify subject name!"
  echo "Usage: $0 fsid (e.g. bert)"
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
  $SUBJECTS_DIR/$1/mri/brainmask.mgz:colormap=heat \
  --layout 3 --viewport coronal --zoom 1.5 &
 
