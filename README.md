# CGSIMRD 
CGSIMRD(Coarse Grained Simulation of RNA and DNA) is a software package (set of scripts) that aids in performing coarse grain simulations of RNA and DNA using LAMMPS.

**_DISCLAIMER_ This project is under development, which means there will be breaking changes from time to time**

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
   root
     |-- src
     |    |-- all the source scripts
     |
     |-- lib
     |    |-- tacoxDNA (I am not the author of this package)
     |
     |-- inp
     |    |-- all the generated lammps input files
     |
     |-- lmp
     |    |-- all the generated lammps data files 
     |
     |-- pdb
     |    |-- all downloaded pdb files
     |
     |-- sim
          |-- all the trajectory files generated post simulation

```

## ./src
The source directory contains the following files :
```
   - getpdb.sh             --> script to download pdb files
   - cleaner.sh            --> deletes pdb or lammps data files
   - makeinput.sh          --> generates input file from template
   - pdb2lmp.sh            --> converts pdbs to lammps data files using tacoxDNA
   - simulate.sh           --> performs simulation using input files and lammps
   - tmpl\_dna.in          --> template input file for DNA pdbs
   - tmpl\_rna.in          --> template input file for RNA pdbs
   - visualize.sh          --> visualizes trajectory file using vmd
   - setup.sh              --> creates the directories that don't 
                               get downloaded after "git clone"
```
