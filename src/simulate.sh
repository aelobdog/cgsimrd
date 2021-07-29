#!/bin/sh
# usage : sh simulate.sh <pdbname>
usage() {
   echo "usage : sh simulate.sh <pdbname> <temperature> <molarity>"
}

if [ $# -ne 3 ]; then
   echo "\e[0;31mERROR\e[0m: Check number of arguments."
   echo "  └── Expected 3, got $#\n"
   usage
   exit 1
fi

temp=`echo $2 | sed "s/\./_/g"`
conc=`echo $3 | sed "s/\./_/g"`
tempK=$(echo "$2 + 273.15" | bc)
input=$1-${temp}C-${conc}M

if [ ! -f inp/$input.in ]; then
   echo "\e[0;31mERROR\e[0m: input file does NOT EXIST for "
   echo " |---  molecule      : $1"
   echo " |---  temperature   : ${2} C"
   echo " |---  concentration : ${3} M"
   exit 1
fi

cd sim
lmp -in ../inp/$input.in
cd ..
