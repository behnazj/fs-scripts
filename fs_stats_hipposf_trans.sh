#!/bin/bash
# Script to generate csv files from hippocampal subfields
# Usage: fs_stats_hipposf.sh <subject id(s)>
# Wild card can be used.
# 12 Feb 2019 K.Nemoto

#set -x

if [ $# -lt 1 ] ; then
  echo "Please specify the subject id(s) you want to extract ROI!"
  echo "Usage: $0 <subject_id(s)>"
  exit 1
fi

timestamp=$(date +%Y%m%d_%H%M)
cd $SUBJECTS_DIR

#Prepare a list with subregion names
cat << EOS > tmp.subregion
Subregion
Hippocampal_tail
subiculum
CA1
hippocampal-fissure
presubiculum
parasubiculum
molecular_layer_HP
GC-ML-DG
CA3
CA4
fimbria
HATA
Whole_hippocampus
EOS

#Prepare left and right list
sed 's/^/lh_/' tmp.subregion > tmp.lt.subregion
sed 's/^/rh_/' tmp.subregion > tmp.rt.subregion

for fsid in "$@"
do
    #Check if lh.hippoSfVolumes-T1.v10.txt exist
    if [ ! -e ${fsid}/mri/lh.hippoSfVolumes-T1.v10.txt ]; then
      echo "lh.hippoSfVolumes-T1.v10.txt for ${fsid} is not found!"
      echo "Please run fs_autohipposf.sh first for ${fsid}"
    else
      echo "Subregion $fsid" > tmp.$fsid
      cat tmp.$fsid ${fsid}/mri/lh.hippoSfVolumes-T1.v10.txt | \
        awk '{ print $2 }' > tmp.lh.$fsid
      cat tmp.$fsid ${fsid}/mri/rh.hippoSfVolumes-T1.v10.txt | \
        awk '{ print $2 }' > tmp.rh.$fsid
    fi
done

#paste subegion with stats files
paste tmp.lt.subregion tmp.lh.* > tmp.lh.hippo
paste tmp.rt.subregion tmp.rh.* > tmp.rh.hippo

cat tmp.lh.hippo | sed -e 's/ /,/g' -e 's/\t/,/g' \
  -e 's/,,/,/g' > ${timestamp}.trans.lh.hippo.subfields.stats.csv
cat tmp.rh.hippo | sed -e 's/ /,/g' -e 's/\t/,/g' \
  -e 's/,,/,/g' > ${timestamp}.trans.rh.hippo.subfields.stats.csv

#generate table directory
if [ ! -e tables ]; then
    mkdir tables
fi

#move stats files to tables
mv ${timestamp}.trans.lh.hippo.subfields.stats.csv tables
mv ${timestamp}.trans.rh.hippo.subfields.stats.csv tables

#remove temporary files
rm tmp.* 

echo "Subregion tables were generated! Please check the tables directory"

exit

