function [t,y] = midpoint(dydt,tspan,y0,h)
% [t,y] = midpoint(dydt,tspan,y0,h):
% Written by: Ashley KOK ID: 31452091
% Last modified: 25/05/2020
% uses midpoint method to solve an ODE
%
% INPUTS:
%  - dydt = function handle of the ODE, f(t,y)
%  - tspan = [<initial value>, <final value>] of independent variable
%  - y0 = initial value of dependent variable
%  - h = step size
% OUTPUTS:
%  - t = vector of independent variable
%  - y = vector of solution for dependent variable

% error checking for tspan
if ~(tspan(2)>tspan(1))
    error('upper limit must be greater than lower')
end

% Create t as a column vector
t = transpose(tspan(1):h:tspan(2));
n = length(t);

% if necessary, add an additional t so that range goes up to tspan(2)
if t(n) < tspan(2)
    t(n+1) = tspan(2);
    n = n+1; % Updating the number of points 
end 

% Implement Midpoint method
y = y0*ones(n,1); % Preallocating y solution 

for i = 1:(n-1)
    h = t(i+1) - t(i);
    yhalf = y(i) + h/2*dydt(t(i),y(i));
    thalf = t(i) + h/2;
    y(i+1) = y(i) + dydt(thalf,yhalf)*h;
end