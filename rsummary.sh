#!/bin/bash
file=$1

cat <<EOS > summary.R
args <- commandArgs()
name <- args[6]
df <- read.csv(name,header=T)
summary(df)
EOS

Rscript summary.R $file | tee -a summary_${file%.csv}.txt

rm summary.R

