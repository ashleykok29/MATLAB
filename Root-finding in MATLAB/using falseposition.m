% Lab 7 Task 4
% Ashley KOK; 31452981; 13/05/2020
% Tracking the growth of a yeast bacterial culture and finding the maximum
% growth using the falseposition method

clear all; close all; clc;

% Function of g
g = @(c) (2.*c)./(4 + 0.8.*c + c.^2 + 0.2*c.^3);

% Function of the derivative of g 
dg = @(c) (200 - 50*c.^2-20.*c.^3)./(20 + 4.*c+ 5.*c.^2+c.^3).^2;

% Initialising variables
xl = 0;
xu = 5;
precision = 1e-4;

% Calling the falseposition function 
[root, iter] = falseposition(dg, xl, xu, precision);

%% Plotting
% the vector c from 0 to 10 
c = 0:0.01:10;

% Plotting g and dg against c 
plot(c,g(0:0.01:10),'b-',c,dg(0:0.01:10),'r-')
hold on
xline(root); % A vertical line at the root
hold off
legend('g(c)','g''(c)','maximum')
xlabel('Food Concentration (c mg/L)')
ylabel('Growth Rate (g /day)')
title('Growth of a yeast bacterial culture as a function of concentration')

%% Printing a final statement
fprintf('The concentration is %.3f mg/L when the growth is a maximum\nThe number of iterations of the false positioning method was %0.0f\n',root,iter)