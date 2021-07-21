function [root, iter] = secant(f, xi, xi_1, precision)
% [root, iter] = secant(f, df, xi, precision)
% Written by: Ashley Kok ID: 31452981 
% Last modified: 04/05/2020
%
% General purpose algorithm for Secant Method
%
% INPUTS:
%  - f: function handle of the equation to be solved
%  - xi: the initial guess
%  - xi_1: the initial guess x_i_-_1
%  - precision: stopping criteria determined by the user
% OUTPUT:
%  - root: the root of the equation
%  - iter: total iteration taken

% Estimate 1st iteration of xi1 and initialise iteration count
iter = 1;
xi1 = xi - f(xi)*(xi-xi_1)/(f(xi)-f(xi_1));

% Iteration for secant method starts
while abs(f(xi1)) > precision
    
    % Increment the iteration count by 1
    iter = iter + 1;
    
    % updating variables
    xi_1 = xi;
    xi = xi1;
    
    % recalculating xi1
     xi1 = xi - f(xi)*(xi-xi_1)/(f(xi)-f(xi_1));
    
end

% The final xi1 value is the root
root = xi1;
