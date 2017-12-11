#!/bin/bash
#A script for QC of pial surface with FreeView
#Usage: fs_qc4_pial.sh <Subject>

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
    $SUBJECTS_DIR/$1/mri/T1.mgz \
    $SUBJECTS_DIR/$1/mri/brainmask.mgz \
-f  \
    $SUBJECTS_DIR/$1/surf/lh.white:edgecolor=yellow \
    $SUBJECTS_DIR/$1/surf/lh.pial:edgecolor=blue \
    $SUBJECTS_DIR/$1/surf/rh.white:edgecolor=yellow \
    $SUBJECTS_DIR/$1/surf/rh.pial:edgecolor=blue \
    --layout 3 --viewport coronal --zoom 2 &
