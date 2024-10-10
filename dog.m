## Copyright (C) 2000 uschoe
##
## This file is part of Octave.
##
## Octave is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2, or (at your option)
## any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, write to the Free
## Software Foundation, 59 Temple Place - Suite 330, Boston, MA
## 02111-1307, USA.

## usage: d = dog(M)
##
##	return difference of Gaussian kernel of size M x M 

## Author: Yoonsuck Choe <yschoe@cs.utexas.edu>

function d = dog(M)

   	c = round(M/2);
	s1 = M/4;
	s2 = M/8;
	g1 = gaussian(M,M,s1,s1,c,c,0);
	g2 = gaussian(M,M,s2,s2,c,c,0);

	d = g2/sum(vec(g2))-g1/sum(vec(g1));

endfunction
