#!/bin/sh

# this script takes a pdb file as input and produces
# a "usable" lammps data file from it.

# usage : sh pdb2lmp.sh <pdbname>
usage() {
   echo "usage : sh pdb2lmp.sh <pdbname>"
}


if [ $# -ne 1 ]; then
   echo "ERROR: Check number of arguments."
   echo "  └── Expected 1, got $#\n"
   usage
   exit 1
fi

if ! python3 lib/tacoxDNA/src/PDB_oxDNA.py pdb/$1.pdb 53
then
   echo "ERROR: Could not create oxdna file from pdb"
fi

if ! python3 lib/tacoxDNA/src/oxDNA_LAMMPS.py $1.pdb.top $1.pdb.oxdna
then
   echo "ERROR: Could not create LAMMPS file from oxdna file"
fi

mv $1.pdb.oxdna.lammps lmp/$1.data
rm $1*

sed -i '/xlo/ c\-800.000000 800.000000 xlo xhi' lmp/$1.data
sed -i '/ylo/ c\-800.000000 800.000000 ylo yhi' lmp/$1.data
sed -i '/zlo/ c\-800.000000 800.000000 zlo zhi' lmp/$1.data

echo "Log: done."
