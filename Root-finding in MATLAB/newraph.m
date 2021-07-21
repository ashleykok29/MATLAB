function [root, iter] = newraph(f, df, xi, precision)
% [root, iter] = newraph(f, df, xi, precision)
% Written by: Ashley KOK ID: 31452981
% Last modified: 04/04/2020
%
% General purpose algorithm for Newton-Raphson Method
%
% INPUTS:
%  - f: function handle of the equation to be solved
%  - df: function handle of the derivative of the equation to be solved
%  - xi: the initial guess / the next guess x_i_+_1
%  - precision: stopping criteria determined by the user
% OUTPUT:
%  - root: the root of the equation
%  - iter: total iteration taken

% Estimate 1st iteration of xi1 and initialise iteration count
iter = 1;
xi1 = xi - f(xi)/df(xi);

% Iteration for Newton-Raphson method starts
while abs(f(xi1)) > precision
    
    % Increment the iteration count by 1
    iter = iter + 1;
    
    % updating variables
    xi = xi1;
    
    % recalculating xi1
    xi1 = xi - f(xi)/df(xi);
    
end

% The final xi1 value is the root
root = xi1;
