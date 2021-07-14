# CGSIMRD 
CGSIMRD(Coarse Grained Simulation of RNA and DNA) is a software package (set of scripts) that aids in performing coarse grain simulations of RNA and DNA simulations using LAMMPS.

*<u>DISCLAIMER</u> This project is under development, which means there will be breaking changes from time to time*

## Dependencies
The project depends on the following software packages
   - LAMMPS<sup>3</sup>
   - tacoxDNA<sup>2</sup>
   - VMD<sup>3</sup>
   - Curl<sup>3</sup>

<sup>1</sup> cgsimrd ships with `LAMMPS`. Binary compiled on POP\_OS, x64.
<sup>2</sup> cgsimrd ships with `tacoxDNA`. No downloads required.
<sup>3</sup> cgsimrd does not ship with this. You'll have to install it yourself.

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
   - lmp                   --> mpi binary of lammps
   - lse                   --> serial binary of lammps
```
