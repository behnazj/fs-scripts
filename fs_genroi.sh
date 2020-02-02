#!/bin/bash
# fs_genroi.sh
# generate rois from atlas with .mgz extension
# Usage: fs_genroi.sh <atlas> <output_base>
# Prerequisite: fsl and freesurfer
# K.Nemoto 02 Feb 2020 

#set -x

if [ $# -ne 2 ] ; then
  echo "Please specify the atlas you want to extract ROIs and output basename!"
  echo "Usage: $0 <atlas> <output_base>"
  exit 1
fi

# decide if $1 is nifti or not
echo $1 | grep nii > /dev/null
if [ $? -eq 1 ]; then
  echo "$1 needs to be converted to nifti"
  mri_convert $1 ${1%.*}.nii.gz
  input=${1%.*}.nii.gz
else
  input=$1
fi

# output basename
outbase=$2

# make directory with basename
mkdir $outbase
cp $input $outbase

# copy FreeSurferColorLUT.txt if $1 is .mgz
echo $1 | grep mgz > /dev/null
if [ $? -eq 0 ]; then
  echo "copy FreeSurferColorLUT.txt"
  cp $FREESURFER_HOME/FreeSurferColorLUT.txt $outbase
fi

# Check how many regions atlas has
numroi=$(fslstats $input -R | awk '{ print int($2) }')
echo "$input has $numroi regions."

sleep 5

cd $outbase

for f in $(seq -w $numroi)
do 
    lthr=$(echo "$f - 0.5" | bc)
    uthr=$(echo "$f + 0.5" | bc)
    fslmaths $input -thr $lthr -uthr $uthr -bin ${outbase}_${f}
done

echo "Done."
echo "If you generate ROIs from freesurfer images, please check FreeSurferColorLUT.txt for the region of ROI"

