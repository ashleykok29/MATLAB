function [root,iter] = bisection(f, xl, xu, precision)
% [root,iter] = bisection(f, xl, xu, precision)
% Written by: Ashley KOK, ID: 31452981
% Last modified: 04/05/2020
%
% INPUTS:
%  - f: function handle of the equation to be solved
%  - xl: lower limit of the initial guess/bracket
%  - xu: upper limit of the initial guess/bracket
%  - precision: stopping criteria determined by the user
% OUTPUT:
%  - root: the root of the equation

% checking if bounds are appropriate
if f(xl)*f(xu) > 0
    error('Bounds are inappropriate');
end

% Estimate 1st iteration of xr and initialise iteration count
iter = 1;
xr = (xl+xu)/2; % equation

% Check if f(xr) is close enough to zero
while abs(f(xr)) > precision
    % checking subinterval for root
	if f(xl)*f(xr) < 0
        xu = xr;
    else
        xl = xr;
    end
    
    % Recalculate xr and update iteration count
    iter = iter + 1;
    xr = (xl + xu)/2;
    
end

% The final xr value is the root
root = xr;
