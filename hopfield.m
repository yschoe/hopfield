#----------------------------------------------------------------------------
#
# Hopfield network
# 
# function [x,W] = hopfield(inp,pats,num_iter,ref)
#
#	inp: A column vector containing the input
#
#	pats: Matrix containing patterns to be memorized.
#	      Each row corresponds to one memory pattern.
#
#	num_iter: number of iterations to simulate the Hopfield dynamics
#
#	ref: index value of the target pattern (row number in the matrix pats)
#
#
#	x : returned settled pattern
#
#	W : returned weight
#
# example:
#
# 1. Noisy input
#
# g = []; for i=1:10; g =[g; vec(dogfilter(rand(20,20),17))'>0]; end; inp=g(5,:).*(rand(1,20*20)<0.6); inp=inp*2-1; g=g*2-1; [X,w] = hopfield(inp',g,100,5); 
#
# g = []; for i=1:10; g =[g; vec(dogfilter(rand(20,20),17))'>0]; end; inp=(g(5,:)*2-1).*((rand(1,20*20)<0.2)*2-1); g=-(g*2-1); [X,w] = hopfield(inp',g,100,5); 
#
# 2. Partial input
#
# g = []; for i=1:10; g =[g; vec(dogfilter(rand(20,20),17))'>0]; end; inp=reshape(g(5,:),20,20); inp(1:10,:)=zeros(10,20); inp=vec(inp)'; inp=inp*2-1; g=g*2-1; [X,w] = hopfield(inp',g,100,5); 
#
# Author: Yoonsuck Choe
# http://faculty.cs.tamu.edu/choe
# License: see github repo
#
#----------------------------------------------------------------------------
function [x,W] = hopfield(inp,pats,num_iter,ref)

#----------------------------------------
# 1. Book-keeping
#----------------------------------------

[N,n] = size(pats);

m = sqrt(n);

#----------------------------------------
# 2. Determine weights (learning)
#----------------------------------------

W = zeros(n,n);

for i=1:N
  # Fill this in: You need pats.
  W = W + pats(i,:)'*pats(i,:);
end

W = W/n;

# Remove self-feedback

W = W .* (1-eye(n,n));

#----------------------------------------
# 3. Activate 
#----------------------------------------

# x will be the evolving state vector, initialized to the input pattern
x = inp;

# x0 is a snapshot at time 0 (this will not change)
x0 = inp;

# Main loop
for i=1:num_iter

   for k=1:n
	
	#--------------------
	# 3.1 pick a unit at random, for updating
	#--------------------
   	pick = ceil(rand*n);

	#--------------------
	# 3.2 determine the new state of the neuron just picked
	#	Fill this in: you need W, pick, and x.
	#	Note: the new value should be either -1 or 1.
	#--------------------
   	x(pick) = ((W(pick,:)*x)>=0.0)*2-1;

   end

   #--------------------
   # 3.3 Plot results: you may need to tinker with this a bit.
   # - this was supposed to show an animation. Will need a better method.
   #--------------------
   imagesc([reshape(pats(ref,:),m,m),ones(m,1)*2,reshape(inp,m,m),ones(m,1)*2,reshape(x,m,m)]);  
   
end 

