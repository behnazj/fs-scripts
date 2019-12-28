#!/bin/bash
# Script to utilize asegstats2table
# CSV file will be generated.
# Usage: fs_stats_aseg.sh <subject_id(s)>
# Wild card can be used.
# 16 Feb 2019 K.Nemoto

#set -x

#Check if the arguments are specified
if [ $# -lt 1 ] ; then
  echo "Please specify the subject id you want to extract ROI!"
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

asegstats2table --subjects "$@"     \
                --delimiter comma   \
                --table ${timestamp}.aseg.csv

cd $SUBJECTS_DIR

echo "${timestamp}.aseg.csv was generated! Please check 'tables' directory"

exit

