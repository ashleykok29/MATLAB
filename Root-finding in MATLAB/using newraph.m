% Lab 7 Task 2
% Ashley KOK; 31452981; 13/05/2020
% The spherical water tank

clear all; close all; clc;

% Defining values and vectors
R = 3;
h = 1:0.001:6; % The maximum height is 6 (as the radius is 3)

V = @(h) pi.*h.^2.*((3*R-h)./3)-30; % Function of V  % -30 as we are solving for when V = 30
dV = @(h) (2*(9 - h).*h*pi)/3 - (h.^2*pi)/3; % Function of the derivative of V

% Plotting the curve of V against h
plot(h,V(1:0.001:6),'k-')
grid on % For visibility
xlabel('h (m)')
ylabel('V (m^3)')
title(sprintf('V = pi*h^2*((3*%.0f-h)/3)-30',R)) % Title with the equation plotted

xi = input('Place an initial guess: ');
precision = 1e-4;

% Plotting the user's initial guess 
hold on 
plot(xi,0,'r^')
legend('graph','initial guess')
hold off

% Using the Newton-Raphson method and calling the newraph function
[final_h, iter] = newraph(V, dV, xi, precision);

% Printing a final statement 
fprintf('The depth of water required to fill the tank with 30m^3 of water is %0.3f m and it took %.0f iterations using the Newton-Raphson method.\n',final_h,iter);