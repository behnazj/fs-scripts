#!/bin/bash
#A script to view surface data with FreeView
#Usage: fs_surface.sh <Subject>
# 19 Jan 2019 K.Nemoto

if [ $# -lt 1 ]; then
  echo "Please specify subject name!"
  echo "Usage: $0 subject (e.g. bert)"
  exit 1
fi 

#Check lh.pial exists
if [ ! -f $SUBJECTS_DIR/$1/surf/lh.pial ]; then
  echo "lh.pial does not exist!"
  echo "It seems recon-all exited with error!"
  exit 1
fi

freeview -f \
  $SUBJECTS_DIR/$1/surf/lh.pial:annot=aparc.annot:name=lh.pial_aparc:visible=0 \
  $SUBJECTS_DIR/$1/surf/rh.pial:annot=aparc.annot:name=rh.pial_aparc:visible=0 \
  $SUBJECTS_DIR/$1/surf/lh.inflated:overlay=lh.thickness:overlay_threshold=0.1,3::name=lh.inflated_thickness:visible=0 \
  $SUBJECTS_DIR/$1/surf/rh.inflated:overlay=rh.thickness:overlay_threshold=0.1,3::name=rh.inflated_thickness:visible=0 \
  $SUBJECTS_DIR/$1/surf/lh.inflated:visible=0 \
  $SUBJECTS_DIR/$1/surf/rh.inflated:visible=0 \
  $SUBJECTS_DIR/$1/surf/lh.white:visible=0 \
  $SUBJECTS_DIR/$1/surf/rh.white:visible=0 \
  $SUBJECTS_DIR/$1/surf/lh.pial \
  $SUBJECTS_DIR/$1/surf/rh.pial \
  --viewport 3d &

