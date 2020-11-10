import math

def binomial(L): 
	return [math.factorial(L)/(math.factorial(x)*math.factorial(L-x)) for x in range(L+1)]

L = input('escribe el valor de L: ')
print(binomial(L))
print
