#!/bin/bash
#A script to utilize aparcstats2table
#Surface and Thickness csv files will be generated.
#Usage: fs_aparcstats2table.sh subject(s)
#12 Nov 2017 K.Nemoto

if [ $# -lt 1 ] ; then
  echo "Please specify the subject names you want to extract ROI!"
  echo "Usage: $0 subject(s)"
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
aparcstats2table --hemi lh \
  --subjects "$@" \
  --table ${timestamp}.lh.aparc.area.csv

aparcstats2table --hemi rh \
  --subjects "$@" \
  --table ${timestamp}.rh.aparc.area.csv

aparcstats2table --hemi lh \
  --subjects "$@" \
  --transpose \
  --table ${timestamp}.lh.aparc.area.trans.csv

aparcstats2table --hemi rh \
  --subjects "$@" \
  --transpose \
  --table ${timestamp}.rh.aparc.area.trans.csv

#Thickness
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thickness \
  --table ${timestamp}.lh.aparc.thickness.csv

aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thickness \
  --table ${timestamp}.rh.aparc.thickness.csv

aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thickness \
  --transpose \
  --table ${timestamp}.lh.aparc.thickness.trans.csv

aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thickness \
  --transpose \
  --table ${timestamp}.rh.aparc.thickness.trans.csv

#Destrieux
#Area
aparcstats2table --hemi lh \
  --subjects "$@" \
  --parc aparc.a2009s \
  --table ${timestamp}.lh.aparc.a2009s.area.csv

aparcstats2table --hemi rh \
  --subjects "$@" \
  --parc aparc.a2009s \
  --table ${timestamp}.rh.aparc.a2009s.area.csv

aparcstats2table --hemi lh \
  --subjects "$@" \
  --transpose \
  --parc aparc.a2009s \
  --table ${timestamp}.lh.aparc.a2009s.area.trans.csv

aparcstats2table --hemi rh \
  --subjects "$@" \
  --transpose \
  --parc aparc.a2009s \
  --table ${timestamp}.rh.aparc.a2009s.area.trans.csv

#Thickness
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thickness \
  --parc aparc.a2009s \
  --table ${timestamp}.lh.aparc.a2009s.thickness.csv

aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thickness \
  --parc aparc.a2009s \
  --table ${timestamp}.rh.aparc.a2009s.thickness.csv

aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thickness \
  --transpose \
  --parc aparc.a2009s \
  --table ${timestamp}.lh.aparc.a2009s.thickness.trans.csv

aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thickness \
  --transpose \
  --parc aparc.a2009s \
  --table ${timestamp}.rh.aparc.a2009s.thickness.trans.csv

cd $SUBJECTS_DIR

exit

