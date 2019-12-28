#!/bin/bash
# Script to utilize aparcstats2table
# Surface, Thickness, Thickness_SD, and Volume csv files will be generated.
# Usage: fs_stats_aparc_trans.sh <subject_id(s)>
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

#temp files
temp1=$(mktemp)
temp2=$(mktemp)
temp3=$(mktemp)
temp4=$(mktemp)


#Desikan-Killiany
#Area
#left hemisphere
aparcstats2table --hemi lh \
  --subjects "$@" \
  --transpose \
  --delimiter comma \
  --table $temp1

#right hemisphere
aparcstats2table --hemi rh \
  --subjects "$@" \
  --transpose \
  --delimiter comma \
  --table $temp2

#cat left and right
cat $temp1 $temp2 > $temp3
sed -e '37,39d' \
    -e 's/lh.aparc/aparc/' \
    $temp3 > ${timestamp}.trans.aparc.area.csv


#Thickness
#left hemisphere
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thickness \
  --transpose \
  --delimiter comma \
  --table $temp1

#right hemisphere
aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thickness \
  --transpose \
  --delimiter comma \
  --table $temp2

#cat left and right hemisphere
cat $temp1 $temp2 > $temp3
sed -e '37,39d' \
    -e 's/lh.aparc/aparc/' \
    $temp3 > ${timestamp}.trans.aparc.thickness.csv


#Thicknessstd
#left hemisphere
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thicknessstd \
  --transpose \
  --delimiter comma \
  --table $temp1

#right hemisphere
aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thicknessstd \
  --transpose \
  --delimiter comma \
  --table $temp2

#cat left and right hemisphere
cat $temp1 $temp2 > $temp3
sed -e '36,38d' \
    -e 's/lh.aparc/aparc/' \
    $temp3 > ${timestamp}.trans.aparc.thicknessstd.csv


#Volume
#left hemisphere
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas volume \
  --transpose \
  --delimiter comma \
  --table $temp1

#right hemisphere
aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas volume \
  --transpose \
  --delimiter comma \
  --table $temp2

#cat left and right
cat $temp1 $temp2 > $temp3
sed -e '36,38d' \
    -e 's/lh.aparc/aparc/' \
    $temp3 > ${timestamp}.trans.aparc.volume.csv


#Destrieux
#left hemisphere
aparcstats2table --hemi lh \
  --subjects "$@" \
  --transpose \
  --delimiter comma \
  --parc aparc.a2009s \
  --table $temp1

#right hemisphere
aparcstats2table --hemi rh \
  --subjects "$@" \
  --transpose \
  --delimiter comma \
  --parc aparc.a2009s \
  --table $temp2

#cat left and right
cat $temp1 $temp2 > $temp3
sed -e '77,79d' \
    -e 's/lh.aparc/aparc/' \
    $temp3 > ${timestamp}.trans.aparc.a2009s.area.csv

#Thickness
#left hemisphere
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thickness \
  --transpose \
  --delimiter comma \
  --parc aparc.a2009s \
  --table $temp1

#right hemisphere
aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thickness \
  --transpose \
  --delimiter comma \
  --parc aparc.a2009s \
  --table $temp2

#cat left and right
cat $temp1 $temp2 > $temp3
sed -e '77,79d' \
    -e 's/lh.aparc/aparc/' \
    $temp3 > ${timestamp}.trans.aparc.a2009s.thickness.csv


#Thicknessstd
#left hemisphere
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thicknessstd \
  --transpose \
  --delimiter comma \
  --parc aparc.a2009s \
  --table $temp1

#right hemisphere
aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thicknessstd \
  --transpose \
  --delimiter comma \
  --parc aparc.a2009s \
  --table $temp2

#cat left and right
cat $temp1 $temp2 > $temp3
sed -e '76,78d' \
    -e 's/lh.aparc/aparc/' \
    $temp3 > ${timestamp}.trans.aparc.a2009s.thicknessstd.csv


#Volume
#left hemisphere
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas volume \
  --transpose \
  --delimiter comma \
  --parc aparc.a2009s \
  --table $temp1

#right hemisphere
aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas volume \
  --transpose \
  --delimiter comma \
  --parc aparc.a2009s \
  --table $temp2

#cat left and right
cat $temp1 $temp2 > $temp3
sed -e '76,78d' \
    -e 's/lh.aparc/aparc/' \
    $temp3 > ${timestamp}.trans.aparc.a2009s.volume.csv

cd $SUBJECTS_DIR

echo "CSV files were generated! Please check 'tables' directory"

exit

