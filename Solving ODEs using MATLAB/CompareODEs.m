% Lab 10 Task 3
% Ashley KOK; 31452981; 02/06/2020
% Solving an ODE using different methods and comparing with the analytical
% solution. 

clear all; close all; clc;

dydt = @(t,y) y.*t.^3 -1.5*y; % Function handle of the ODE
tspan = [0 2]; 
y0 = 1; % y(0) = 1

% Analytical solution function handle and corresponding t vector
y = @(t) exp(t.^4/4-1.5*t);
t = 0:0.001:2;

% Using the three methods 
[t_e,y_e] = euler(dydt,tspan,y0,0.5);
[t_m,y_m] = midpoint(dydt,tspan,y0,0.5);
[t_o,y_o] = ode45(dydt,tspan,y0);

% Plotting the three methods
plot(t,y(t),t_e,y_e,t_m,y_m,t_o,y_o)
legend('analytical','euler','midpoint','ode45','location','northwest')
title('Solving dydt = yt^3 - 1.5y')
xlabel('t')
ylabel('y')

%% As the step size is decreased, which method converges faster?
% The midpoint method
% The tangent at the midpoint (between an interval) is more likely to give a
% more accurate approximation of the curve