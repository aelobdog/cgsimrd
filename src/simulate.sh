#!/bin/sh
# usage : sh simulate.sh <pdbname>
usage() {
   echo "usage : sh simulate.sh <pdbname> temperature"
}

if [ $# -ne 2 ]; then
   echo "ERROR: Check number of arguments."
   echo "  └── Expected 2, got $#\n"
   usage
   exit 1
fi

temp=`echo $2 | sed "s/\./_/g"`
tempK=$(echo "$2 + 273.15" | bc)
input=$1-$temp

if [ ! -f inp/$input.in ]; then
   echo "ERROR: input file for molecule $1 at temperature $2 does not exist."
   exit 1
fi

cd sim
lmp -in ../inp/$input.in
mv $1-$tempK.xyz $input.xyz
cd ..
