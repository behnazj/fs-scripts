#!/bin/bash
# Script for QC of longitudinal base with FreeView
# Usage: fs_qc_base.sh <base fsid>
# 07 Jan 2020 K.Nemoto

if [ $# -lt 1 ]; then
  echo "Please specify base fsid!"
  echo "Usage: $0 fsid (e.g. bert)"
  exit 1
fi 

#Check norm.mgz exists
if [ ! -f $SUBJECTS_DIR/$1/mri/norm.mgz ]; then
  echo "norm.mgz does not exist!"
  echo "It seems recon-all exited with error!"
  exit 1
fi

freeview -v $1/mri/norm.mgz \
 -f $1/surf/lh.pial:edgecolor=red \
    $1/surf/rh.pial:edgecolor=red \
    $1/surf/lh.white:edgecolor=blue \
    $1/surf/rh.white:edgecolor=blue \
 -layout 1 -viewport coronal -zoom 2 &

 
