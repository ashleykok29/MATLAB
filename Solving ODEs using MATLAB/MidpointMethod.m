% Lab 10 Task 5
% Ashley KOK; 31452981; 02/06/2020

clear all; close all; clc; 

% dvdt = @(t,v) (f - c*v)/m;

% Initalising variables
m = 1000;
f = 75000;
v0 = 0;
h = 0.1;

% Defining t span 
tspan = [0 10];

% Defining the vector c 
c = [50 100 500 1000 2000];
n_c = length(c); % The length of the vector c 

for i = 1:n_c % For the length of the vector c
    dvdt = @(t,v) (f - c(i)*v)/m; % The function handle with the right c value
    [t,v] = midpoint(dvdt,tspan,v0,h); % Midpoint method 
    hold on
    plot(t,v) % Plotting the solution curve
    hold off
    Leg{i} = sprintf('c = %.0f',c(i)); % Adding to the legend cell 
    index = find(t == 10); % Finding the index of t when t = 10
    fprintf('V = %.3f m/s at t = 10s if c = %.0f\n',v(index),c(i)) % Using the previous index to find v when t = 10
end

% Labelling the plot 
legend(Leg,'location','northwest')
title('The motion of a roceket-propelled sled')
xlabel('time, t (s)')
ylabel('velocity, v (m/s)')