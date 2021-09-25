# importing required libs
import numpy as np
import matplotlib.pyplot as plt
from numpy.core.defchararray import split
from numpy.lib.function_base import append

def plot(xy_data):
    plt.plot(xy_data[0], xy_data[1])

energy_types = {
    "ke": 1,
    "pe": 2,
    "te": 3,
}

def get_energy_column(filename, energy_to_plot):
    energy_file = open(filename, "r")

    E = energy_file.readlines()
    E = [line.split() for line in E]
    E = np.array(E, dtype=np.float64)
    # print(E)

    column_index = energy_types[energy_to_plot]
    return (E[:,0], E[:,column_index])

#get_energy_column("../sim/1kxk-60-0_2.energy", "ke")

def plot_all():
    # plt.figure(1)
    plot(get_energy_column("../sim/1kxk-60-0_2.energy", "ke"))
    plot(get_energy_column("../sim/1kxk-60-0_2.energy", "pe"))
    plt.show()

plot_all()
