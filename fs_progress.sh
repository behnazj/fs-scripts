#!/bin/bash
# Script to generate a temporary file to see the progress of recon-all

#Assume you are in "share" directory.

export SUBJECTS_DIR=$PWD/subjects

cd progress 

## autorecon1 (#1-#5)
#1 motioncor
source fs_timestamp.sh
recon-all -s subj01 -i ../nifti/subj01.nii.gz -motioncor 
echo "Step1 motioncor" > step01_result.txt
find $SUBJECTS_DIR/subj01 -type f -newer /tmp/_timestamp | tee -a step01_result.txt

#2 nuintensitycor
source fs_timestamp.sh
recon-all -s subj01 -nuintensitycor 
echo "Step2 nuintensitycor" > step02_result.txt
find $SUBJECTS_DIR/subj01 -type f -newer /tmp/_timestamp | tee -a step02_result.txt

#3 talairach
source fs_timestamp.sh
recon-all -s subj01 -talairach 
echo "Step3 talairach" > step03_result.txt
find $SUBJECTS_DIR/subj01 -type f -newer /tmp/_timestamp | tee -a step03_result.txt

#4 normalization
source fs_timestamp.sh
recon-all -s subj01 -normalization 
echo "Step4 normalization" > step04_result.txt
find $SUBJECTS_DIR/subj01 -type f -newer /tmp/_timestamp | tee -a step04_result.txt

#5 skullstrip
source fs_timestamp.sh
recon-all -s subj01 -skullstrip 
echo "Step5 skullstrip" > step05_result.txt
find $SUBJECTS_DIR/subj01 -type f -newer /tmp/_timestamp | tee -a step05_result.txt

#autorecon2 (#6-23)
#6 gcareg
source fs_timestamp.sh
recon-all -s subj01 -gcareg 
echo "Step6 gcareg" > step06_result.txt
find $SUBJECTS_DIR/subj01 -type f -newer /tmp/_timestamp | tee -a step06_result.txt

#7 canorm
source fs_timestamp.sh
recon-all -s subj01 -canorm 
echo "Step7 canorm" > step07_result.txt
find $SUBJECTS_DIR/subj01 -type f -newer /tmp/_timestamp | tee -a step07_result.txt

#8 careg
source fs_timestamp.sh
recon-all -s subj01 -careg
echo "Step8 careg" > step08_result.txt
find $SUBJECTS_DIR/subj01 -type f -newer /tmp/_timestamp | tee -a step08_result.txt

#9 rmneck
source fs_timestamp.sh
recon-all -s subj01 -rmneck
echo "Step9 rmneck" > step09_result.txt
find $SUBJECTS_DIR/subj01 -type f -newer /tmp/_timestamp | tee -a step09_result.txt

#10 skull-lta
source fs_timestamp.sh
recon-all -s subj01 -skull-lta
echo "Step10 skull-lta" > step10_result.txt
find $SUBJECTS_DIR/subj01 -type f -newer /tmp/_timestamp | tee -a step10_result.txt

#11 calabel
source fs_timestamp.sh
recon-all -s subj01 -calabel
echo "Step11 calabel" > step11_result.txt
find $SUBJECTS_DIR/subj01 -type f -newer /tmp/_timestamp | tee -a step11_result.txt

#autorecon2-cp starts here
#12 normalization2
source fs_timestamp.sh
recon-all -s subj01 -normalization2
echo "Step12 normalization2" > step12_result.txt
find $SUBJECTS_DIR/subj01 -type f -newer /tmp/_timestamp | tee -a step12_result.txt

-motioncor
-nuintensitycor
-talairach
-normalization
-skullstrip
-gcareg
-canorm
-careg
-rmneck
-skull-lta
-calabel
-normalization2
-segmentation
-fill
-tessellate
-smooth1
-inflate1
-qsphere
-fix
-finalsurfs
-smooth2
-inflate2
-cortribbon
-sphere
-surfreg
-contrasurfreg
-avgcurv
-cortparc
-parcstats
-cortparc2
-parcstats2
-aparc2aseg


rm /tmp/_timestamp



