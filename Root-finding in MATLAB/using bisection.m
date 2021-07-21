% Lab 7 Task 5
% Ashley KOK; 31452981; 13/05/2020
% Comparing the population of the suburb and the city 

clear all; close all; clc;

%% Initialising Variables and Functions 
p_c_end = 75000; 
k_c = 0.045; 
p_c_start = 100000;
p_s_end = 300000;
p_s_start = 10000;
k_s = 0.08;

t = 0:1:100;

% Function handles to put the root back into, to calulcuate the final populations
p_c_fun = @(t) p_c_end.*exp(-k_c.*t) + p_c_start;
p_s_fun = @(t) p_s_end./(1+(p_s_end./p_s_start - 1).*exp(-k_s.*t));

% Subtracting the suburb vector from 1.2 (120%) the city vector
% The root of this equation will give us the year needed
p_solve = @(t) 1.2*p_c_fun(t) - p_s_fun(t);

%% Plotting the solution curve
plot(t,p_solve(0:100))
xlabel('time (years)')
ylabel('population (# of people)')
title('Difference between the population of the city and 20% more of the suburb')

%% Bisection Method
% Upper and lower limits (observed from the graph)
xl = 30;
xu = 40;

precision = 1000; % Precision of 1000 people

% Calling the bisection function
[root,iter] = bisection(p_solve, xl, xu, precision);

%% Plotting the root
hold on
plot(root,p_solve(root),'r*')
hold off
legend('curve','root')

%% Printing a final statement
year = 2016 + root;

city = p_c_fun(root);
suburb = p_s_fun(root);

fprintf('In the year %0.f, the surburbs are 20%% larger than the city.\n',year)
fprintf('The city population is %.0f and the suburb population is %0.f.\n',city,suburb)