#!/bin/bash
# A script for QC of subcortical segmentation with FreeView
# Usage: fs_qc2_aseg.sh <fsid>
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
  $SUBJECTS_DIR/$1/mri/brainmask.mgz \
  $SUBJECTS_DIR/$1/mri/aseg.mgz:colormap=lut:opacity=0.2 \
  --layout 3 --viewport axial --zoom 1.5 &
 
