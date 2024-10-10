## usage: gaussian(Ncols,Mrows,sigmax,sigmay,cy,cx,theta)
##
## Returns a Mrows x Ncols matrix with gaussian sigmax and 
##	sigmay with orientation theta.
##	The orientation theta is in screen coordinates.
##	Note that row column indices are a bit unorderly.
##	Also note that theta is in cartesian coordinate, not in screen coord.

## Author: Yoonsuck Choe <yschoe@cs.utexas.edu>

## License: Released under GNU public license (see http://www.gnu.org
## for details.

function g = gaussian (n, m, sigmax, sigmay, cx, cy, theta)

  radian = theta * pi / 180.0;

  x = (1:m)'*(zeros(1,n).+1).-cx;
  y = (zeros(m,1).+1)*(1:n).-cy;

  xsq = ((x*cos(radian) + y*sin(radian)).^2)/(sigmay**2);
  ysq = ((-x*sin(radian) + y*cos(radian)).^2)/(sigmax**2);

  g = exp(-(xsq+ysq));

endfunction
