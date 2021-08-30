#!/bin/sh
# usage : sh simulate.sh pdbname temperature molarity
usage() {
   echo "usage : sh visualize.sh pdbname temperature molarity" 
}

if [ $# -ne 3 ]; then
   echo "\e[0;31mERROR\e[0m: Check number of arguments."
   echo "  └── Expected 3, got $#\n"
   usage
   exit 1
fi

temp=`echo $2 | sed "s/\./_/g"`
conc=`echo $3 | sed "s/\./_/g"`
input=$1-${temp}-${conc}

if [ ! -f sim/$input.dat ]; then
   echo "\e[0;31mERROR\e[0m: trajectory file does NOT EXIST for"
   echo " |---  molecule      : $1"
   echo " |---  temperature   : $2"
   echo " |---  concentration : $3"
   exit 1
fi

cd oxdna_files/
python3 ../lib/tacoxDNA/src/LAMMPS_oxDNA.py ../lmp/$1.data ../sim/${input}.dat
mv $1.data.oxdna ${input}.oxdna
mv $1.data.top ${input}.top
oxview ${input}.oxdna ${input}.top
cd ..

