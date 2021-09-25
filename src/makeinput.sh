#!/bin/sh
# usage : sh makeinput.sh <pdbname>
usage() {
   echo "usage : sh makeinput.sh <pdbname> <temperature> <molarity> [rna/dna]"
}

if [ $# -ne 4 ]; then
   echo "\e[0;31mERROR\e[0m: Check number of arguments."
   echo "  └── Expected 4, got $#\n"
   usage
   exit 1
fi

temp=`echo $2 | sed "s/\./_/g"`
conc=`echo $3 | sed "s/\./_/g"`
dest="inp/$1-${temp}C-${conc}M.in"
tempK=$(echo "$2 + 273.15" | bc)
tempS=$(python3 -c "print($tempK/3000)")

if [ $4 = "rna" ]; then
   src="src/tmpl_rna.in"
elif [ $4 = "dna" ]; then
   src="src/tmpl_dna.in"
else
   echo "\e[0;31mERROR\e[0m: Check argument 4."
   echo "  └── Expected 'rna' or 'dna', got '$4'\n"
   exit 1
fi

sed \
   -e "s/MOLECULE/$1/g"         \
   -e "s/TEMPERATURE/$tempS/g"  \
   -e "s/TEMP/$temp/g"          \
   -e "s/TEMK/$temp/g"          \
   -e "s/CONCENTRATION/$3/g"    \
   -e "s/CONC/$conc/g"    \
   $src > $dest

echo "\e[0;32mLog\e[0m: input file created for"
echo " |---  molecule      : $1    "
echo " |---  temperature   : ${2} C"
echo " |---  concentration : ${3} M"
echo "\e[0;32mLog\e[0m: done."
