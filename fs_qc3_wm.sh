#!/bin/bash
# A script for QC of wm.mgz (white surface and intensity normalization)
# with FreeView
# Usage: fs_qc3_wm.sh <fsid>
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
  $SUBJECTS_DIR/$1/mri/wm.mgz:colormap=heat:opacity=0.4 \
  -f  \
  $SUBJECTS_DIR/$1/surf/lh.white:edgecolor=yellow \
  $SUBJECTS_DIR/$1/surf/rh.white:edgecolor=yellow \
  --layout 3 --viewport coronal --zoom 1.5 &

