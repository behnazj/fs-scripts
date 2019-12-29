#!/bin/bash
# Script to see how recon-all generates files
# K.Nemoto 29 Dec 2019

cd $SUBJECTS_DIR

if [ ! -d progress ]; then
  mkdir progress
fi

#arguments
cat << EOS > recon_directives
02 -nuintensitycor
03 -talairach
04 -normalization
05 -skullstrip
06 -gcareg
07 -canorm
08 -careg
09 -rmneck
10 -skull-lta
11 -calabel
12 -normalization2
13 -segmentation
14 -fill
15 -tessellate
16 -smooth1
17 -inflate1
18 -qsphere
19 -fix
20 -finalsurfs
21 -smooth2
22 -inflate2
23 -cortribbon
24 -sphere
25 -surfreg
26 -contrasurfreg
27 -avgcurv
28 -cortparc
29 -parcstats
30 -cortparc2
31 -parcstats2
32 -aparc2aseg
EOS

#1 motioncor
echo "=============================="
echo "Begin ${directive}"
source fs_timestamp.sh
recon-all -s ernie -i sample-001.mgz -i sample-002.mgz -motioncor 
echo "Step01 -motioncor" > progress/step_01_result.txt
find ernie -type f -newer /tmp/_timestamp | tee -a progress/step_01_result.txt
echo "End ${directive}"
echo "=============================="

#2-32
cat recon_directives | while read no directive
do
  echo "=============================="
  echo "Begin ${directive}"
  source fs_timestamp.sh
  result=step_${no}_result.txt
  recon-all -s ernie $directive
  echo "Step_${no} $directive" > progress/${result}
  find ernie -type f -newer /tmp/_timestamp | tee -a progress/${result}
  echo "End ${directive}"
  echo "=============================="
done

rm recon_directives
rm /tmp/_timestamp



