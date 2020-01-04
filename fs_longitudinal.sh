#!/bin/bash
# script to perform longitudinal analysis
# Usage: fs_longitudinal.sh <base fsid(s)>
# Prerequisites: fsid_MR1 and fsid_MR2 should have been processed with recon-all beforehand.
# K.Nemoto 4/Jan/2020

for f in "$@"
do
  #recon-all -base
  recon-all -base $f -tp ${f}_MR1 -tp ${f}_MR2 -all

  #recon-all -long
  recon-all -long ${f}_MR1 $f -all
  recon-all -long ${f}_MR2 $f -all
done

