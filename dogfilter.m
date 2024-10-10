# function M = dogfilter(X,n)
#	return n x n DoG filtered matrix M or X

function M = dogfilter(X,n)

	g = dog(n);
	
	M = real(conv2(X,g,"same"));

endfunction 
