#!/bin/bash
# Script to utilize aparcstats2table
# Surface, Thickness, Thickness_SD, and Volume csv files will be generated.
# Usage: fs_starts_aparc.sh <subject_id(s)>
# 12 Feb 2019 K.Nemoto

#set -x

if [ $# -lt 1 ] ; then
  echo "Please specify the subject id(s) you want to extract ROI!"
  echo "Usage: $0 <subject_id(s)>"
  exit 1
fi

timestamp=$(date +%Y%m%d_%H%M)
cd $SUBJECTS_DIR

#Check if tables directory exists in $SUBJECTS_DIR
if [ ! -d tables ]; then
  mkdir tables
fi
cd tables

#Desikan-Killiany
#Area
#left hemisphere
aparcstats2table --hemi lh \
  --subjects "$@" \
  --delimiter comma \
  --table ${timestamp}.lh.aparc.area.csv

#right hemisphere
aparcstats2table --hemi rh \
  --subjects "$@" \
  --delimiter comma \
  --table ${timestamp}.rh.aparc.area.csv

#Thickness
#left hemisphere
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thickness \
  --delimiter comma \
  --table ${timestamp}.lh.aparc.thickness.csv

#right hemisphere
aparcstats2table --hemi rh \
  --subjects "$@" \
  --delimiter comma \
  --table ${timestamp}.rh.aparc.thickness.csv

#Thicknessstd
#left hemisphere
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thicknessstd \
  --delimiter comma \
  --table ${timestamp}.lh.aparc.thicknessstd.csv

#right hemisphere
aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thicknessstd \
  --delimiter comma \
  --table ${timestamp}.rh.aparc.thicknessstd.csv

#Volume
#left hemisphere
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas volume \
  --delimiter comma \
  --table ${timestamp}.lh.aparc.volume.csv

#right hemisphere
aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas volume \
  --delimiter comma \
  --table ${timestamp}.rh.aparc.volume.csv

#Destrieux
#left hemisphere
aparcstats2table --hemi lh \
  --subjects "$@" \
  --delimiter comma \
  --parc aparc.a2009s \
  --table ${timestamp}.lh.aparc.a2009s.area.csv

#right hemisphere
aparcstats2table --hemi rh \
  --subjects "$@" \
  --delimiter comma \
  --parc aparc.a2009s \
  --table ${timestamp}.rh.aparc.a2009s.area.csv

#Thickness
#left hemisphere
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thickness \
  --delimiter comma \
  --parc aparc.a2009s \
  --table ${timestamp}.lh.aparc.a2009s.thickness.csv

#right hemisphere
aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thickness \
  --delimiter comma \
  --parc aparc.a2009s \
  --table ${timestamp}.rh.aparc.a2009s.thickness.csv

#Thicknessstd
#left hemisphere
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thicknessstd \
  --delimiter comma \
  --parc aparc.a2009s \
  --table ${timestamp}.lh.aparc.a2009s.thicknessstd.csv

#right hemisphere
aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thicknessstd \
  --delimiter comma \
  --parc aparc.a2009s \
  --table ${timestamp}.rh.aparc.a2009s.thicknessstd.csv

#Volume
#left hemisphere
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas volume \
  --delimiter comma \
  --parc aparc.a2009s \
  --table ${timestamp}.lh.aparc.a2009s.volume.csv

#right hemisphere
aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas volume \
  --delimiter comma \
  --parc aparc.a2009s \
  --table ${timestamp}.rh.aparc.a2009s.volume.csv

cd $SUBJECTS_DIR

echo "CSV files were generated! Please check 'tables' directory"

exit

