#!/bin/bash
# For-loop for recon-all -qcache
# Usage: fs_autoqcache.sh <subject id(s)>
# Wild card can be used.
# 19 Jan 2019 K.Nemoto

#set -x

#Check if the files are specified
if [ $# -lt 1 ]
then
	echo "Please specify subject id(s)!"
	echo "Usage: $0 <subject id(s)>"
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

# recon-all -qcache
for f in "$@"
do
    recon-all -s $f -qcache
done

exit

