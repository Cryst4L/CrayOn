#!/usr/bin/env
import sys, math
import numpy as np
import matplotlib.pyplot as plt

#-Functions---------------------------------------------------------
def blackman_filter(x, rad):
	' blackman window filtering '
	x = np.r_[x[rad:0:-1],x,x[-1:-rad-1:-1]]
	blackman = np.blackman(2*rad+1)
	blackman /= blackman.sum()
	return np.convolve(blackman,x,mode='valid')


#-Script body---------------------------------------------------------
def main(file_name):

	trn_cost = []
	tst_cost = []

	#-load the data-------------------------------------------------
	with open(file_name) as f:
		for line in f :
			def values(l) : 
				l = l.replace(',', '.')
				return [float(l[18:24]), float(l[29:35]), float(l[40:46])]
			if line[2:7] == 'Train' :
				trn_cost.append(sum(values(line)))
			elif line[2:6] == 'Test' :
				tst_cost.append(sum(values(line)))
	'''
	with open(file_name) as f:
		for line in f :
			line = line.replace(',', '.')
			if line[2:7] == 'Train' :
				trn_cost.append(float(line[18:24]))
			elif line[2:6] == 'Test' :
				tst_cost.append(float(line[18:24]))
	'''

	#-plot the curves-------------------------------------------------
	plt.figure(figsize=(12,6))
	
	plt.semilogy(trn_cost, color='r', label="train set")
	plt.semilogy(tst_cost, color='b', label="test set ")

	radius = int(math.floor(0.1 * len(trn_cost)))

	trn_cost = blackman_filter(trn_cost,radius)
	tst_cost = blackman_filter(tst_cost,radius)

	plt.semilogy(trn_cost, color='darkred')
	plt.semilogy(tst_cost, color='darkblue')

	#-Annotate the key values-----------------------------------------
	idx = np.argmin(tst_cost)
	plt.annotate('$c_{min} = %.2f$' % tst_cost[idx],
		         xy=(idx, tst_cost[idx]),  xycoords='data', 
		         xytext=(+5, +40), textcoords='offset points', fontsize=16,
		         arrowprops=dict(arrowstyle="->", connectionstyle="arc3"))
		         
	idx = np.argmin(trn_cost)
	plt.annotate('$c_{min} = %.2f$' % trn_cost[idx],
		         xy=(idx, trn_cost[idx]),  xycoords='data', 
		         xytext=(+5, -50), textcoords='offset points', fontsize=16,
		         arrowprops=dict(arrowstyle="->", connectionstyle="arc3"))
		
	#-Rendering-------------------------------------------------------
	plt.grid(True, which="major", linestyle='--')
	plt.grid(True, which="minor", linestyle=':') 
		    
	plt.title('Evolution of the Classification Error')
	plt.legend(loc='upper left')

	plt.savefig(('.').join(file_name.split('.')[:-1]) + '.png')
	
#-Launch the main---------------------------------------------------------
if __name__ == "__main__":
    main(sys.argv[1])

