#!/bin/bash
# Fro-loop for recon-all hippocampal subfields
# Requirements: recon-all should be finished.
# Usage: fs_autohipposf.sh <fsid>
# Wildcard can be used.
# 19 Jan 2019 K.Nemoto

#Check if the files are specified
if [ $# -lt 1 ]
then
	echo "Please specify freesurfer id to specify subjects!"
	echo "Usage: $0 <subject id(s)>"
	exit 1
fi

for fsid in "$@"
do
	echo "Begin hippocampal subfield segmentation of $fsid"
	recon-all -s $fsid -hippocampal-subfields-T1
done

echo "Hippocampal subfield segmentation finished!"

exit

