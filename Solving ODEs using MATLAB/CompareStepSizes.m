% Lab 10 Task 4
% Ashley KOK; 31452981; 02/06/2020
% Plotting the solution using different methods and different step sizes

clear all; close all; clc;

% Initialising the ODE (function handle and other components)
dydt = @(t,y) -y - 5*exp(-t).*sin(5*t);
tspan = [0 3];
y0 = 1;
h = [0.5 0.2 0.01]; % Vector of step sizes

% Function handle and corresponding t vector of analytical solution
y = @(t) exp(-t).*cos(5*t);
t = 0:0.001:3;

for i = 1:length(h) % For the length of h
    [t_e,y_e] = euler(dydt,tspan,y0,h(i)); % Using Euler's method
    [t_m,y_m] = midpoint(dydt,tspan,y0,h(i)); % Using the midpoint method
    [t_h,y_h] = heun(dydt,tspan,y0,h(i)); % Using Heun's method
    subplot(1,3,i) % Using the subpoint for the current step size
    plot(t,y(t),'LineWidth',3) % Plotting the analytical solution
    hold on
    plot(t_e,y_e,t_m,y_m,t_h,y_h) % Plotting the solution curves
    hold off
    xlabel('t')
    ylabel('y')
    title(sprintf('h = %0.2f',h(i))) % Putting the step size in the title
    legend('analytical','euler','midpoint','heun')
end