% Script MATLAB pentru optimizarea multi-obiectiva a apei in irigatii folosind NSGA-II

clc; clear; close all;

% 1. Definirea parametrilor problemei
numFields = 3; % Numarul de campuri
water_capacity = [1000; 800; 600]; % Cantitatea maxima de apa pentru fiecare camp
water_cost = [2; 3; 1.5]; % Costul per litru 

% 2. Definirea functiei obiectiv (minimizare consum & cost)
objectiveFunction = @(x) [sum(x), sum(x .* water_cost)];

% 3. restrictii
lb = zeros(numFields,1);
ub = water_capacity;

% 4. Configurarea optiunilor
options = optimoptions('gamultiobj', 'PopulationSize', 100, 'MaxGenerations', 200, ...
    'Display', 'iter', 'PlotFcn', []);

% 5. Executia algoritmului NSGA-II
[x_opt, fval] = gamultiobj(objectiveFunction, numFields, [], [], [], [], lb, ub, options);


figure;
scatter3(fval(:,1), fval(:,2), sum(x_opt,2), 100, sum(x_opt,2), 'filled');
colormap(jet);
colorbar;
xlabel('Consum Total de Apa (L)');
ylabel('Cost Total al Apei');
zlabel('Distributia Totala a Apei (L)');
title('Optimizare Multi-Obiectiva - 3D');
grid on;
view(135, 30); 
legend({'Solutii Optime'}, 'Location', 'best');

% 7. Afisarea rezultatelor
fprintf('Solutii Optime (Apa Distribuita in Fiecare Camp):\n');
disp(x_opt);
