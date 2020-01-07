#!/bin/bash
# For-loop for recon-all with qcache in parallel
# based on freesurfer mailing list
# Usage: fs_autorecon_parallel.sh <nifti file(s)>
# Wild card can be used.
# nifti file name will be the subject id for FreeSurfer
# e.g. con001.nii -> con001

# 05 Jan 2020 K.Nemoto

#set -x

#### Set this parameter #### 
maxrunning=8
############################


#Check if the files are specified
if [ $# -lt 1 ]
then
	echo "Please specify nifti files!"
	echo "Usage: $0 <nifti_file(s)>"
	echo "Wild card can be used."
	exit 1
fi

#copy fsaverage and {lr}h.EC_average to $SUBJECTS_DIR if they don't exsit
find $SUBJECTS_DIR -maxdepth 1 | egrep fsaverage$ > /dev/null
if [ $? -eq 1 ]; then
  cp -r $FREESURFER_HOME/subjects/fsaverage $SUBJECTS_DIR
fi

find $SUBJECTS_DIR -maxdepth 1 | egrep [lr]h.EC_average$ > /dev/null
if [ $? -eq 1 ]; then
  cp -r $FREESURFER_HOME/subjects/[lr]h.EC_average $SUBJECTS_DIR
fi



#recon-all
for f in "$@"
do
    running=$(ps -aux | grep 'bin/recon-all' | wc -l)
    while [ $running -gt $maxrunning ];
    do
	sleep 600
    	running=$(ps -aux | grep 'bin/recon-all' | wc -l)
    done
    fsid=${f%.nii*}
    #recon-all -i $f -s $fsid & #for debugging
    recon-all -i $f -s $fsid -all -qcache &
done

exit

