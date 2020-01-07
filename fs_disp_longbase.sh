#!/bin/bash
# Script to view both volume and surface data with FreeView
# Usage: fs_disp_longbase.sh <fsid_base>
# 06 Jan 2020 K.Nemoto

if [ $# -lt 1 ]; then
  echo "Please specify subject name!"
  echo "Usage: $0 fsid (e.g. bert)"
  exit 1
fi 

#Check brainmask.mgz exists
if [ ! -f $SUBJECTS_DIR/$1/mri/norm.mgz ]; then
    echo "norm.mgz does not exist!"
    echo "It seems recon-all exited with error!"
    exit 1
fi

#Check lh.pial exists
if [ ! -f $SUBJECTS_DIR/$1/surf/lh.pial ]; then
    echo "lh.pial does not exist!"
    echo "It seems recon-all exited with error!"
    exit 1
fi

freeview -v \
 $SUBJECTS_DIR/$1/mri/norm.mgz \
 -f \
 $SUBJECTS_DIR/$1/surf/lh.pial:edgecolor=red \
 $SUBJECTS_DIR/$1/surf/rh.pial:edgecolor=red \
 $SUBJECTS_DIR/$1/surf/lh.white:edgecolor=blue \
 $SUBJECTS_DIR/$1/surf/rh.white:edgecolor=blue \
 -layout 1 -viewport coronal -zoom 2 &
