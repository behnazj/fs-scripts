#!/bin/bash
# Script to generate a temporary file to see the progress of recon-all

#generate timestamp
ts=$(date +%Y%m%d%H%M.%S)

#generate a temporary file for find
touch -t $ts /tmp/_timestamp


