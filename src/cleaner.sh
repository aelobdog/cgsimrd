#!/bin/sh
# usage : sh pdb2lmp.sh <pdbname>
usage() {
   echo "usage : sh cleaner.sh [pdb/lmp/inp/sim/all] <pdbname>"
}

if [ $# -ne 2 ]; then
   echo "ERROR: Check number of arguments."
   echo "  └── Expected 2, got $#\n"
   usage
   exit 1
fi


if [ $1 = "pdb" -o $1 = "all" ]; then
   echo "cleaner cleaned the following files from pdb/"
   ls -l pdb/$2*
   rm pdb/$2.pdb
fi

if [ $1 = "lmp" -o $1 = "all" ]; then
   echo "cleaner cleaned the following files from lmp/"
   ls -l lmp/$2*
   rm lmp/$2.data
fi

if [ $1 = "inp" -o $1 = "all" ]; then
   echo "cleaner cleaned the following files from inp/"
   ls -l inp/$2*
   rm inp/$2*
fi

if [ $1 = "sim" -o $1 = "all" ]; then
   echo "cleaner cleaned the following files from sim/"
   ls -l sim/$2*
   rm sim/$2*
fi
