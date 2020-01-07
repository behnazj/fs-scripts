#!/bin/bash
# Script to visualize thickness symmetrized percent change with FreeView
# Usage: fs_thick-spc.sh <base fsid>
# 08 Jan 2020 K.Nemoto

if [ $# -lt 1 ]; then
  echo "Please specify base fsid!"
  echo "Usage: $0 fsid (e.g. bert)"
  exit 1
fi 

cd $SUBJECTS_DIR

freeview -f \
 fsaverage/surf/lh.pial:overlay=${1}/surf/lh.long.thickness-spc.fwhm15.fsaverage.mgh:overlay_threshold=2,5 \
 fsaverage/surf/rh.pial:overlay=${1}/surf/rh.long.thickness-spc.fwhm15.fsaverage.mgh:overlay_threshold=2,5 \
 -colorscale -layout 1 -viewport 3d

