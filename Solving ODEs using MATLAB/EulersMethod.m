% Lab 10 Task 2
% Ashley KOK; 31452981; 02/06/2020
% Euler's method using different step sizes

clear all; close all; clc; 

h = [1 0.75 0.5 0.001]; % Vector of step sizes 
tspan = [0 3]; 
dydt = @(t,y) 3*exp(t)-8*y/3; % Function handle of the ODE
n = length(h);

% Function handle of the analytical solution 
y_ana = @(t) (9/11)*exp(t)+(24/11)*exp(-8*t/3);
t = 0:0.001:3;

% Plotting the analytical solution
hold on 
plot(t,y_ana(t),'LineWidth',2)
hold off

% Adding a legend
Leg{1} = sprintf('Analytical Solution');

% Labelling the plot 
xlabel('t')
ylabel('y')
title('Euler''s method for dydt = 3e^t - 8y/3')

fprintf('%2s%14s\n','h =','%error') % Title of the fprintf table

for i = 1:n % For every value of the step size
    [t,y] = euler(dydt,tspan,3,h(i)); % Running Euler's method
    hold on
    plot(t,y) % Plotting the results
    Leg{i+1} = sprintf('h = %0.3f',h(i)); % Adding to the legend cell
    hold off
    index = find(t == 3);
    error = abs((y(index)-y_ana(3))/y_ana(3))*100;
    fprintf('%2.2e %8.3f\n',h(i),error)
end

% Adding the legend
legend(Leg,'location','northwest')

