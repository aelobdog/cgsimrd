import numpy as np
from statistics import *
from numpy.core.defchararray import split
from numpy.lib.function_base import append

import sys

def avgen(energy1, energy2, type_energy):
    energy1_file = open(energy1, "r")
    energy2_file = open(energy2, "r")

    E1=energy1_file.readlines()
    E1=[line.split() for line in E1]
    E1=np.array(E1)
    E1=E1.astype(float)

    E2=energy2_file.readlines()
    E2=[line.split() for line in E2]
    E2=np.array(E2)
    E2=E2.astype(float)

    if type_energy == "ke":
        i = 1
    elif type_energy == "pe":
        i = 2
    elif type_energy == "te":
        i = 3
    else:
        return
    
    #m1 = mean(E1[:,i])
    #m2 = mean(E2[:,i])
    #print(m1, "\n", m2)

if __name__ == "__main__":
    try:
        energy1=(sys.argv)[1]
        energy2=(sys.argv)[2]
        en_type=(sys.argv)[3]
    except:
        sys.exit(2)
    avgen(energy1, energy2, en_type)
