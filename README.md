# CGSIMRD 
CGSIMRD(Coarse Grained Simulation of RNA and DNA) is a software package (set of scripts) that aids in performing coarse grain simulations of RNA and DNA using LAMMPS.

_DISCLAIMER_ This project is under development, which means there will be breaking changes from time to time

## Dependencies
The project depends on the following software packages
   - LAMMPS <sup>2</sup> ([website](https://www.lammps.org/))
   - tacoxDNA <sup>1</sup> ([website](http://tacoxdna.sissa.it/))
   - VMD <sup>2</sup> ([website](https://www.ks.uiuc.edu/Research/vmd/))
   - Curl <sup>2</sup> ([website](https://curl.se/))

<sup>1</sup> cgsimrd ships with `tacoxDNA`. No downloads required.

<sup>2</sup> cgsimrd does not ship with this. You'll have to install it yourself.

## Directory structure
As of now, the project requires the following project structure.
```
   .
   ├── inp [ generated lammps input scripts ]
   ├── lib [ tacoxDNA ]
   ├── lmp [ generated lammps data files (by tacoxDNA) ]
   ├── pdb [ downloaded pdb files ]
   ├── sim [ generated trajectory files ]
   └── src [ all the source scripts ]
```

## Directories

The source directory contains the following files :
```
  src/
   ├── cleaner.sh       --> deletes pdb or lammps data files
   ├── getpdb.sh        --> script to download pdb files
   ├── makeinput.sh     --> generates input file from template
   ├── pdb2lmp.sh       --> converts pdbs to lammps data files using tacoxDNA
   ├── setup.sh         --> creates the directories that don't 
   ├── simulate.sh      --> performs simulation using input files and lammps
   ├── tmpl_dna.in      --> template input file for DNA pdbs
   ├── tmpl_rna.in      --> template input file for RNA pdbs
   └── visualize.sh     --> visualizes trajectory file using vmd
```










