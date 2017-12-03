#!/bin/bash
#A script to utilize aparcstats2table
#Surface, Thickness, and Volume txt files will be generated.
#Usage: fs_aparcstats2table.sh subject(s)
#3 Dec 2017 K.Nemoto

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
  --table ${timestamp}.lh.aparc.area.txt

aparcstats2table --hemi rh \
  --subjects "$@" \
  --table ${timestamp}.rh.aparc.area.txt

aparcstats2table --hemi lh \
  --subjects "$@" \
  --transpose \
  --table ${timestamp}.lh.aparc.area.trans.txt

aparcstats2table --hemi rh \
  --subjects "$@" \
  --transpose \
  --table ${timestamp}.rh.aparc.area.trans.txt

#Thickness
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thickness \
  --table ${timestamp}.lh.aparc.thickness.txt

aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thickness \
  --table ${timestamp}.rh.aparc.thickness.txt

aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thickness \
  --transpose \
  --table ${timestamp}.lh.aparc.thickness.trans.txt

aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thickness \
  --transpose \
  --table ${timestamp}.rh.aparc.thickness.trans.txt

#Thicknessstd
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thicknessstd \
  --table ${timestamp}.lh.aparc.thicknessstd.txt

aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thicknessstd \
  --table ${timestamp}.rh.aparc.thicknessstd.txt

aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thicknessstd \
  --transpose \
  --table ${timestamp}.lh.aparc.thicknessstd.trans.txt

aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thicknessstd \
  --transpose \
  --table ${timestamp}.rh.aparc.thicknessstd.trans.txt

#Volume
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas volume \
  --table ${timestamp}.lh.aparc.volume.txt

aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas volume \
  --table ${timestamp}.rh.aparc.volume.txt

aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas volume \
  --transpose \
  --table ${timestamp}.lh.aparc.volume.trans.txt

aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas volume \
  --transpose \
  --table ${timestamp}.rh.aparc.volume.trans.txt

#Destrieux
#Area
aparcstats2table --hemi lh \
  --subjects "$@" \
  --parc aparc.a2009s \
  --table ${timestamp}.lh.aparc.a2009s.area.txt

aparcstats2table --hemi rh \
  --subjects "$@" \
  --parc aparc.a2009s \
  --table ${timestamp}.rh.aparc.a2009s.area.txt

aparcstats2table --hemi lh \
  --subjects "$@" \
  --transpose \
  --parc aparc.a2009s \
  --table ${timestamp}.lh.aparc.a2009s.area.trans.txt

aparcstats2table --hemi rh \
  --subjects "$@" \
  --transpose \
  --parc aparc.a2009s \
  --table ${timestamp}.rh.aparc.a2009s.area.trans.txt

#Thickness
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thickness \
  --parc aparc.a2009s \
  --table ${timestamp}.lh.aparc.a2009s.thickness.txt

aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thickness \
  --parc aparc.a2009s \
  --table ${timestamp}.rh.aparc.a2009s.thickness.txt

aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thickness \
  --transpose \
  --parc aparc.a2009s \
  --table ${timestamp}.lh.aparc.a2009s.thickness.trans.txt

aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thickness \
  --transpose \
  --parc aparc.a2009s \
  --table ${timestamp}.rh.aparc.a2009s.thickness.trans.txt

#Thicknessstd
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thicknessstd \
  --parc aparc.a2009s \
  --table ${timestamp}.lh.aparc.a2009s.thicknessstd.txt

aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thicknessstd \
  --parc aparc.a2009s \
  --table ${timestamp}.rh.aparc.a2009s.thicknessstd.txt

aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas thicknessstd \
  --transpose \
  --parc aparc.a2009s \
  --table ${timestamp}.lh.aparc.a2009s.thicknessstd.trans.txt

aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas thicknessstd \
  --transpose \
  --parc aparc.a2009s \
  --table ${timestamp}.rh.aparc.a2009s.thicknessstd.trans.txt

#Volume
aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas volume \
  --parc aparc.a2009s \
  --table ${timestamp}.lh.aparc.a2009s.volume.txt

aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas volume \
  --parc aparc.a2009s \
  --table ${timestamp}.rh.aparc.a2009s.volume.txt

aparcstats2table --hemi lh \
  --subjects "$@" \
  --meas volume \
  --transpose \
  --parc aparc.a2009s \
  --table ${timestamp}.lh.aparc.a2009s.volume.trans.txt

aparcstats2table --hemi rh \
  --subjects "$@" \
  --meas volume \
  --transpose \
  --parc aparc.a2009s \
  --table ${timestamp}.rh.aparc.a2009s.volume.trans.txt

cd $SUBJECTS_DIR

exit

