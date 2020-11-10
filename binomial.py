import math
import numpy as np

#---------------------------------functions
def binomial(L):
	return [math.factorial(L)/(math.factorial(x)*math.factorial(L-x)) for x in range(L+1)]

def filtro(h, v):
	return [([i*j for j in h]) for i in v]

def impresion(m):
	print('\n'.join([''.join(['{:9}'.format(item) for item in row]) for row in m]))

#---------------------------------main
fL = binomial(input('escribe el valor de L: '))
g = filtro(fL, fL)
c = np.sum(g)

#---------------------------------exec
print
print("c = 1/"+ str(c))
impresion(g)

