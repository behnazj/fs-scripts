#!/bin/bash
#A script for QC of pial surface with FreeView
#Usage: fs_qc4_pial.sh <Subject>

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
  $SUBJECTS_DIR/$1/mri/brainmask.mgz \
  -f  \
  $SUBJECTS_DIR/$1/surf/lh.white:edgecolor=yellow \
  $SUBJECTS_DIR/$1/surf/lh.pial:edgecolor=blue \
  $SUBJECTS_DIR/$1/surf/rh.white:edgecolor=yellow \
  $SUBJECTS_DIR/$1/surf/rh.pial:edgecolor=blue \
  --layout 3 --viewport coronal --zoom 1.5 &
