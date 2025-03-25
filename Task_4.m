% Script MATLAB pentru optimizarea multi-obiectiva a apei in irigatii folosind NSGA-II
% requires Global Optimization Toolbox.
clc; clear; close all;

% 1. Definirea parametrilor problemei
numFields = 3;
water_capacity = [1000; 800; 600]; % Cantitatea maxima de apa pentru fiecare camp
water_cost = [2; 3; 1.5]; % Costul per litru 

% 2. Definirea functiei obiectiv
objectiveFunction = @(x) [sum(x), sum(x .* water_cost)]; % Minim consum & cost

% 3. Definirea restrictiilor
lb = zeros(numFields,1); % Limita inferioara (fara alocare negativa)
ub = water_capacity; % Limita superioara (maxim cat poate primi fiecare camp)

% 4. Configurarea optiunilor pentru NSGA-II
options = optimoptions('gamultiobj', 'PopulationSize', 50, 'MaxGenerations', 100, ...
    'Display', 'iter', 'PlotFcn', @gaplotpareto);

% 5. Executia algoritmului NSGA-II
[x_opt, fval] = gamultiobj(objectiveFunction, numFields, [], [], [], [], lb, ub, options);

% 6. Afisarea rezultatelor
figure;
scatter(fval(:,1), fval(:,2), 50, 'filled');
xlabel('Consum Total de Apa (L)');
ylabel('Cost Total al Apei');
title('Frontiera Pareto - Optimizare Multi-Obiectiva');
grid on;

fprintf('Solutii Optime (Apa Distribuita in Fiecare Camp):\n');
disp(x_opt);
