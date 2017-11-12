#!/bin/bash
#A script to utilize asegstats2table
#Two csv files will be generated.
#Output will be one row for subject and one column for subject
#Usage: fs_asegstats.sh subject(s)
#12 Nov 2017 K.Nemoto

#Check if the arguments are specified
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

asegstats2table --subjects "$@" --table ${timestamp}.aseg.vol.csv
asegstats2table --subjects "$@" --transpose \
  --table ${timestamp}.aseg.vol.trans.csv

cd $SUBJECTS_DIR

exit

