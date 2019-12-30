#!/bin/bash
# Script to see how recon-all generates files
# K.Nemoto 29 Dec 2019

cd $SUBJECTS_DIR

if [ ! -d progress ]; then
  mkdir progress
fi

#arguments
#01 -motionor	Motin_Correct_and_Average
cat << EOS > recon_directives
02 -talairach	Talairach
03 -nuintensitycor	Nu_Intensity_Correction
04 -normalization	Intensity_Normalization1
05 -skullstrip	Skull_Stripping
06 -gcareg	GCA_Registration
07 -canorm	Canonical_Intensity_Normalization
08 -careg	Canonical_Registration
09 -calabel	SubCort_Segmentation
10 -normalization2	Intensity_Normalization2
11 -maskbfs	Create_BrainFinalSurfs
12 -segmentation	WM_Segmentation	
13 -fill	Fill
14 -tessellate	Tessellate
15 -smooth1	Smooth1
16 -inflate1	Inflate1
17 -qsphere	Qsphere
18 -fix	Fix_Topology
19 -white	Make_White_Surfaces
20 -smooth2	Smooth2
21 -inflate2	Inflate2
22 -curvHK	Curvature_.H_and_.K
23 -curvstats	Curvature_Anatomical_Stats
24 -sphere	Sphere
25 -surfreg	Surface_Registration
26 -jacobian_white	Jacobian_White
27 -avgcurv	Average_Curv_for_Display
28 -cortparc	Cortical_Parcellation
29 -pial	Make_Pial_Surfaces
30 -cortribbon	Cortical_Ribbon
31 -parcstats	Surface_Anatomical_Stats
32 -cortparc2	Cortical_Parcellation_2
33 -parcstats2	Surface_Anatomical_Stats_2
34 -cortparc3	Cortical_Parcellation_3
35 -parcstats3	Surface_Anatomical_Stats_3
36 -pctsurfcon	WM/GM_Contrast
37 -hyporelabel	Relabel_Hypointensities
38 -aparc2aseg	Aparc2Aseg
39 -apas2aseg	FinalAseg
40 -segstats	SegStats
41 -wmparc	WMparc
42 -balabels	Brodmann_Area_Labels
EOS

#1 motioncor
echo "=============================="
echo "Begin #01"
source fs_timestamp.sh
recon-all -s ernie -i sample-001.mgz -i sample-002.mgz -motioncor 
echo "Step01 -motioncor Motion_Correct_and_Average" > progress/step_01_result.txt
find ernie -type f -newer /tmp/_timestamp | tee -a progress/step_01_result.txt
echo "End #01"
echo "=============================="

#2-
cat recon_directives | while read no directive descrip
do
  echo "=============================="
  echo "Begin #${directive}"
  source fs_timestamp.sh
  result=step_${no}_result.txt
  recon-all -s ernie $directive
  echo "Step_${no} $directive $descrip" > progress/${result}
  find ernie -type f -newer /tmp/_timestamp | tee -a progress/${result}
  echo "End #${directive}"
  echo "=============================="
done

rm recon_directives
rm /tmp/_timestamp



