
import subprocess
import sys
import os
import datetime

# GOAL
# tcksample -stat_tck mean Tracks.tck fa.mif FA_Weights.txt
# This script computes tracks weights with fa map
# for each patient, nerve, parameter and condition


print('\n------------------------------start------------------------------\n')

t0 = datetime.datetime.now()

# get patients list
list_patients = [patient for patient in os.listdir('../../data') if not patient.startswith('.')]

for patient in list_patients:

	print('------------------------------------------------------------------------')

	path_fa = '../../data/' + patient + '/fa.mif'

	# get nerves list
	path_nerves = '../../data/' + patient
	list_nerves = os.listdir(path_nerves)
	list_nerves = [nerves for nerves in list_nerves if '.' not in nerves]


	for nerve in list_nerves:

		print('------------------------------------')

		# get parameters list
		path_param = '../../data/' + patient + '/' + nerve
		list_param = os.listdir(path_param)
		list_param = [params for params in list_param if '.' not in params]


		for param in list_param:

			print('------------------')

			# get conditions list
			path_condition = '../../data/' + patient + '/' + nerve + '/' + param
			list_condition = os.listdir(path_condition)
		

			for condition in list_condition:

				print('---------')

				# path to tracks and output weight file
				path_tracks = '../../data/' + patient + '/' + nerve + '/' + param + '/' + condition + '/Tracks.tck'
				path_weights = '../../data/' + patient + '/' + nerve + '/' + param + '/' + condition + '/FA_Weights.txt'

				# actually run command
				command = ['tcksample', '-stat_tck', 'mean', path_tracks, path_fa, path_weights]
				subprocess.run(command)

				# remove header in weight file
				try:
					with open(path_weights, "r") as f:
					    lines = f.readlines()

					with open(path_weights, "w") as f:
					    for line in lines:
					        if line.strip("\n")[0] != "#":
					            f.write(line)
				except IOError:
					print("File not accessible")


				print('OK for', condition)
				print('---------')
				print('\n')


			print('OK for', param)
			print('------------------')
			print('\n\n')


		print('OK for', nerve)
		print('------------------------------------')
		print('\n\n\n')


	print('OK for', patient)
	print('------------------------------------------------------------------------')
	print('\n\n\n\n')


# print execution time
# (15sec for 8 patients for me)
print('\nExecution time', datetime.datetime.now() - t0)

print('\n------------------------------end------------------------------')








