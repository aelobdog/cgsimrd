#!/bin/sh
usage() {
   echo "usage : sh simulate.sh <pdbname> <temperature> <molarity> <ser/par>"
}

if [ $# -ne 4 ]; then
   echo "\e[0;31mERROR\e[0m: Check number of arguments."
   echo "  └── Expected 3, got $#\n"
   usage
   exit 1
fi

temp=`echo $2 | sed "s/\./_/g"`
conc=`echo $3 | sed "s/\./_/g"`
tempK=$(echo "$2 + 273.15" | bc)
input=$1-${temp}C-${conc}M
energy=$1-${temp}-${conc}.energy

if [ ! -f inp/$input.in ]; then
   echo "\e[0;31mERROR\e[0m: input file does NOT EXIST for "
   echo " |---  molecule      : $1"
   echo " |---  temperature   : ${2} C"
   echo " |---  concentration : ${3} M"
   exit 1
fi

cd sim
if [ $4 = "mpi" ]; then
   mpirun -np 4 ~/Downloads/buildDesk/lammps/build_mpi/lmp < ../inp/$input.in
elif [ $4 = "ser" ]; then
   ~/Documents/lmp_serial < ../inp/$input.in
fi
cd ..
