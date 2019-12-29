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
02 -nuintensitycor	Nu_Intensity_Correction
03 -talairach	Talairach
04 -normalization	Intensity_Normalization1
05 -skullstrip	Skull_Stripping
06 -gcareg	GCA_Registration
07 -canorm	Canonical_Intensity_Normalization
08 -careg	Canonical_Registration
09 -careginv	Inverse_of_Canonical_Registration
10 -rmneck	Removes_neck_and_part_of_the_face
11 -skull-lta	Recompute_lta_with_skull_but_no_neck
12 -calabel	SubCort_Segmentation
13 -normalization2	Intensity_Normalization2
14 -maskbfs	Create_BrainFinalSurfs
15 -segmentation	WM_Segmentation	
16 -fill	Fill
17 -tessellate	Tessellate
18 -smooth1	Smooth1
19 -inflate1	Inflate1
20 -qsphere	Qsphere
21 -fix	Fix_Topology
22 -white	Make_White_Surfaces
23 -smooth2	Smooth2
24 -inflate2	Inflate2
25 -curvHK	Curvature_.H_and_.K
26 -curvstats	Curvature_Anatomical_Stats
27 -sphere	Sphere
28 -surfreg	Surface_Registration
29 -contrasurfreg	Contra_Surface_Registration
30 -surfreg-to-subject	Surface_Registration_to_Average_Subject
31 -jacobian_white	Jacobian_White
32 -avgcurv	Average_Curv_for_Display
33 -cortparc	Cortical_Parcellation
34 -pial	Make_Pial_Surfaces
35 -surfvolume	SurfVolume
36 -cortribbon	Cortical_Ribbon
37 -parcstats	Surface_Anatomical_Stats
38 -cortparc2	Cortical_Parcellation_2
39 -parcstats2	Surface_Anatomical_Stats_2
40 -cortparc3	Cortical_Parcellation_3
41 -parcstats3	Surface_Anatomical_Stats_3
42 -pctsurfcon	WM/GM_Contrast
43 -hyporelabel	Relabel_Hypointensities
44 -aparc2aseg	Aparc2Aseg
45 -apas2aseg	FinalAseg
46 -segstats	SegStats
47 -wmparc	WMparc
48 -balabels	Brodmann_Area_Labels
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



