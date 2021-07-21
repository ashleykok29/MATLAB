% Lab 7 Task 3
% Ashley KOK; 31452981; 13/05/2020
% Using the Bisection Method and The Modified Secant Method to caluclat

clear all; close all; clc;

% Initialising variables and creating necessary function handles
p_t = 3.5;
x = -1:0.01:10;
K = @(x) ((x./(1-x)).*sqrt((2*p_t)./(2+x)))-0.04; % -0.04 as we want to solve for when k = 0.04
precision = 1e-4;

% Plotting K against x
plot(x,K(-1:0.01:10),'k-')
xlabel('x (mole fraction)')
ylabel('K (equilibrium constant)')
title(sprintf('The plot of K = x/(1-x)*sqrt((2*%0.1f)/(2+x))-0.04',p_t))
grid on % Turning the grid on for visibility

%% Bisection Method
% Asking for user inputs for the upper adn lower limits
xl = input('Enter the lower limit: ');
xu = input('Enter the upper limit: ');

% While loop to ensure lower and upper bounds bracket the root 
while K(xl)*K(xu) > 0
    disp('Initial guess does not bracket root, please try again.')
    xl = input('Enter the lower limit: ');
    xu = input('Enter the upper limit: ');
end

% Calling the bisection function
[root_bi,iter_bi] = bisection(K, xl, xu, precision);

% Printing a statement of the results from the bisection method
fprintf('Bisection method: xr = %.4f with %.0f iterations\n',root_bi, iter_bi)

%% Modified Secant Method
pert = 0.05;

% Asking the user for an initial guess
xi = input('Enter initial guess: ');

% Calling the modisecant function 
[root_ms, iter_ms] = modisecant(K, xi, pert, precision);

% Printing a statement of the results from the modified secant method
fprintf('Modified Secant Method: xr = %.4f with %.0f iterations\n',root_ms,iter_ms)