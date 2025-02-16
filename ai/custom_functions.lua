function sigmoid(x, limit, damp)	--https://ml-cheatsheet.readthedocs.io/en/latest/activation_functions.html#sigmoid
	return limit*2/(1+exp(-x/damp))-limit	--y=0 when x=0
end