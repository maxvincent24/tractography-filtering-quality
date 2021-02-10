
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd

import subprocess
import os
import sys
import getopt





def plot_dice(filter_type, nerve, parameter, condition):
    
    # get patient list
    directory = '../../data'
    list_patients = [patient for patient in os.listdir(directory) if not patient.startswith('.')]
    
    # create empty dataFrame
    arr_all = pd.DataFrame(columns=list_patients)

    # get data for same nerve, same parameter and same condition for all patients
    for patient in list_patients:

        path2data = directory + '/' + patient + '/' + nerve + '/' + parameter + '/' + condition + '/Dice_' + filter_type.upper() + '_Filltering.csv'
        
        try:
            df = pd.read_csv(path2data, header=None, sep=',')
            arr = df.to_numpy()
            arr_all[patient] = arr[0]
        except IOError:
            print('File {0} not accessible'.format(path2data))
            
    arr_all.plot()
    plt.xlabel('Remaining tracks percent')
    plt.ylabel('Dice value')
    plt.title('Nerve : ' + nerve + ' - Parameter : ' + parameter + ' - Condition : ' + condition)
    plt.show()



plot_dice(sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4])












