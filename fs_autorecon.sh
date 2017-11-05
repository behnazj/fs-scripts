#!/bin/bash
#fs_autorecon.sh
#For-loop for recon-all
#Usage: fs_autorecon.sh <nifti files>
#Wild card can be used

#05-Nov-2017 K.Nemoto

#Generate a log
logdate=$(date +%Y%m%d-%H%M%S)
log=${logdate}_reconall.log
touch $log
exec &> >(tee -a "$log")

#Check OS
os=$(uname)

#Check number of cores (threads)
if [ $os == "Linux" ]; then
    ncores=$(nproc)
elif [ $os == "Darwin" ]; then 
    ncores=$(sysctl -n hw.ncpu)
else
    echo "Cannot detect your OS!"
    exit 1
fi

echo "Your logical cores are ${ncores}"

#If logical cores >=4, enable parallelize option
if [ $ncores -ge 4 ]; then
	parallel="-parallel"
	echo "enable parallel mode"
else
	parallel=""
	echo "disable parallel mode"
fi

if [ $# -lt 1 ]
then
	echo "Please specify image files!"
	echo "Usage: $0 imagefiles"
	echo "Wild card can be used."
	exit 1
fi

echo "Begin recon-all"

for f in "$@"
do
	subjid=${f%%.*}
	recon-all -i $f -s $subjid -all $parallel
done

