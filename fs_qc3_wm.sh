#!/bin/bash
#A script for QC of wm.mgz (white surface and intensity normalization)
# with FreeView
#Usage: fs_qc3_wm.sh <Subject>

if [ $# -lt 1 ]; then
  if [ $LANG == "ja_JP.UTF-8" ]; then
    echo "Subject名を指定してください!"
    echo "使い方: $0 Subject名 (例: bert)"
  else
    echo "Please specify subject name!"
    echo "Usage: $0 subject (e.g. bert)"
  fi
 exit 1
fi 

freeview -v \
    $SUBJECTS_DIR/$1/mri/brainmask.mgz \
    $SUBJECTS_DIR/$1/mri/wm.mgz:colormap=heat:opacity=0.4 \
-f  \
    $SUBJECTS_DIR/$1/surf/lh.white:edgecolor=yellow:visible=0 \
    $SUBJECTS_DIR/$1/surf/lh.pial:edgecolor=blue:visible=0 \
    $SUBJECTS_DIR/$1/surf/rh.white:edgecolor=yellow:visible=0 \
    $SUBJECTS_DIR/$1/surf/rh.pial:edgecolor=blue:visible=0 \
    --layout 3 --viewport coronal --zoom 2 &

