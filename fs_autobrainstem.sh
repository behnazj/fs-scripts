#!/bin/bash
# Fro-loop for recon-all brainstem
# Requirements: recon-all should be finished.
# Usage: fs_autobrainstem.sh <fsid>
# Wildcard can be used.
# 04 Jan 2020 K.Nemoto

#Check if the files are specified
if [ $# -lt 1 ]
then
	echo "Please specify freesurfer id to specify subjects!"
	echo "Usage: $0 <subject id(s)>"
	exit 1
fi

for fsid in "$@"
do
	echo "Begin brainstem segmentation of $fsid"
	recon-all -s $fsid -brainstem-structures
done

echo "Brainstem segmentation finished!"

exit

