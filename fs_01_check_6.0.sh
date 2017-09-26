#!/bin/bash
#fs_01_check_6.0.sh
#Tiny script to check if FreeSurfer is installed correctly.

#The command is based on http://surfer.nmr.mgh.harvard.edu/fswiki/DownloadAndInstall

echo "Test the installation of freesurfer"

cd $SUBJECTS_DIR
freeview -v \
 bert/mri/T1.mgz \
 bert/mri/wm.mgz \
 bert/mri/brainmask.mgz \
 bert/mri/aseg.mgz:colormap=lut:opacity=0.2 \
 -f \
 bert/surf/lh.white:edgecolor=blue \
 bert/surf/lh.pial:edgecolor=red \
 bert/surf/rh.white:edgecolor=blue \
 bert/surf/rh.pial:edgecolor=red &

