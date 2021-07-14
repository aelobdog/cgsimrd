#!/bin/sh
# usage : sh pdb2lmp.sh <pdbname>
usage() {
   echo "usage : sh cleaner.sh [pdb/lmp/all] <pdbname>"
}

if [ $# -ne 2 ]; then
   echo "ERROR: Check number of arguments."
   echo "  └── Expected 2, got $#\n"
   usage
   exit 1
fi

if [ $1 = "pdb" -o $1 = "all" ]; then
   rm pdb/$2.pdb
fi

if [ $1 = "lmp" -o $1 = "all" ]; then
   rm lmp/$2.data
fi
