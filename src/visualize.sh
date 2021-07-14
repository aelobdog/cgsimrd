#!/bin/sh
# usage : sh simulate.sh <pdbname>
usage() {
   echo "usage : sh visualize.sh <pdbname> temperature"
}

if [ $# -ne 2 ]; then
   echo "ERROR: Check number of arguments."
   echo "  └── Expected 2, got $#\n"
   usage
   exit 1
fi

temp=`echo $2 | sed "s/\./_/g"`
input=$1-$temp.xyz

if [ ! -f sim/$input ]; then
   echo "ERROR: trajectory file for molecule $1 at temperature $2 does not exist."
   exit 1
fi

vmd sim/$input
