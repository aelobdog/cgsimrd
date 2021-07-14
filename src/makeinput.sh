#!/bin/sh
# usage : sh makeinput.sh <pdbname>
usage() {
   echo "usage : sh makeinput.sh <pdbname> <temperature> [rna/dna]"
}

if [ $# -ne 3 ]; then
   echo "ERROR: Check number of arguments."
   echo "  └── Expected 3, got $#\n"
   usage
   exit 1
fi

temp=`echo $2 | sed "s/\./_/g"`
dest="inp/$1-$temp.in"
tempK=$(echo "$2 + 273.15" | bc)

if [ $3 = "rna" ]; then
   src="src/tmpl_rna.in"
elif [ $3 = "dna" ]; then
   src="src/tmpl_dna.in"
else
   echo "ERROR: Check argument 3."
   echo "  └── Expected 'rna' or 'dna', got '$3'\n"
   exit 1
fi

sed -e "s/MOLECULE/$1/g ; s/TEMPERATURE/$tempK/g ; s/TEMP/$temp/g" $src > $dest

echo "Log: input file for molecule $1 at temperature $2C ($tempK K) created."
echo "Log: done."
