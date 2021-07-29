#!/bin/sh
# usage : sh simulate.sh <pdbname>
usage() {
   echo "usage : sh visualize.sh <pdbname> <temperature> <molarity> [vis software]"
}

if [ $# -ne 4 ]; then
   echo "\e[0;31mERROR\e[0m: Check number of arguments."
   echo "  └── Expected 4, got $#\n"
   usage
   exit 1
fi

temp=`echo $2 | sed "s/\./_/g"`
conc=`echo $3 | sed "s/\./_/g"`
input=$1-${temp}-${conc}.xyz
echo $input

if [ ! -f sim/$input ]; then
   echo "\e[0;31mERROR\e[0m: trajectory file does NOT EXIST for "
   echo " |---  molecule      : $1"
   echo " |---  temperature   : $2"
   echo " |---  concentration : $3"
   exit 1
fi

if ! $4 sim/$input; then
   echo "\e[0;31mERROR\e[0m: could not visualize the file using $4"
   echo "\e[0;31mERROR\e[0m: check your installation for $4"
fi
