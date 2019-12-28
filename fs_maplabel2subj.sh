#!/bin/bash

#Check if the subjects are specified
if [ $# -lt 1 ]
then
        echo "Please specify subject(s)!"
        echo "Usage: $0 subject(s)"
        echo "Wild card can be used."
        exit 1
fi

#read label

while true; do

    echo "Name of label (eg. lh.midtemporal):"
    read lname
      if [ -e ${lname}.label ]; then
        echo "found ${lname}.label"
        break
      else
        echo "${lname}.label doesn't exist!"
      fi

done

#mri_label2label

for subj in "$@"
do
    mri_label2label --srclabel $lname \
    --srcsubject fsaverage \
    --trgsubject $subj \
    --trglabel $lname --regmethod surface --hemi lh
done

echo "Finished!"

exit

