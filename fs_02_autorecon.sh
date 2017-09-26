#!/bin/bash
#For-loop for recon-all

#26-Sep-2017 K.Nemoto

##Check OS
#os=$(uname)
#
##Check number of cores (threads)
#if [ $os == "Linux" ]
#then
#    ncores=$(nproc)
#elif [ $os == "Darwin" ]
#then 
#    ncores=$(sysctl -n hw.ncpu)
#else
#    echo "Cannot detect your OS!"
#    exit 1
#fi
#
#echo "Your logical cores are ${ncores}"
#
##Decide how many cores to use for freesurfer ($ncores -1)
#fscore=$(expr $ncores -1)

if [ $# -lt 1 ]
then
	echo "Please specify image files!"
	echo "Usage: $0 imagefiles"
	echo "Wild card can be used."
	exit 1
fi

echo "Begin recon-all"

#count=0

for f in "$@"
do
	subjid=${f%%.*}
	recon-all -i $f -s $subjid -all

#	count=$(echo "$count + 1" | bc)
#	if [ $(echo "$count % $fscore" | bc) -eq 0 ]; then
#	  wait
#	fi
done

