## Optimizarea multi-obiectivă

Optimizarea multi-obiectivă implică echilibrarea mai multor criterii simultan, cum ar fi reducerea consumului de apă și maximizarea randamentului agricol. Câteva metode utilizate includ:

### Programare liniară multi-obiectivă
- Se formulează o funcție obiectivă care minimizează consumul de apă și maximizează producția agricolă.
- Se aplică metode precum Simplex sau Algoritmul de punct interior pentru a obține soluții optime.

### Algoritmi genetici
- Se utilizează algoritmi evolutivi pentru a găsi soluții optime prin selecție, recombinare și mutație.
- Permite adaptarea continuă a distribuției apei în funcție de schimbările condițiilor meteo și de umiditate.

```matlab
%% Optimizarea unui sistem de irigații inteligente
clc; clear; close all;

% Numărul de terenuri agricole
n = 3; 

% Coeficienții funcțiilor obiectiv
% f1 - Consum de apă (de minimizat)
% f2 - Randament agricol (de maximizat, deci folosim -f2)
f1 = [2 3 1];
f2 = [-5 -6 -4];

% Constrângeri: A*x <= b
% Constrângeri legate de cantitatea totală de apă disponibilă
A = [1 1 1; 2 1 3; 1 2 2];
b = [100; 150; 120];

% Constrângeri de egalitate (nu avem)
Aeq = [];
beq = [];

% Limite inferioare și superioare (minim și maxim de apă pentru fiecare teren)
lb = [10; 20; 15];
ub = [50; 60; 45];

%% Programare liniară multi-obiectivă
% Rezolvarea problemei de optimizare liniară pentru fiecare obiectiv separat
% Minimizarea consumului de apă
x1 = linprog(f1, A, b, Aeq, beq, lb, ub);
% Maximizarea randamentului agricol (prin minimizarea -f2)
x2 = linprog(f2, A, b, Aeq, beq, lb, ub);

fprintf('Distribuția optimă a apei pentru minimizarea consumului: %.2f, %.2f, %.2f\n', x1);
fprintf('Distribuția optimă a apei pentru maximizarea randamentului: %.2f, %.2f, %.2f\n', x2);

%% Algoritm genetic multi-obiectiv
% Definirea funcției obiectiv care include ambele obiective
fun = @(x) [2*x(1) + 3*x(2) + 1*x(3), -5*x(1) - 6*x(2) - 4*x(3)];

% Setarea opțiunilor pentru algoritmul genetic multi-obiectiv
options = optimoptions('gamultiobj', 'PopulationSize', 50, 'ParetoFraction', 0.5);

% Rezolvarea problemei folosind algoritmul genetic multi-obiectiv
[x, fval] = gamultiobj(fun, n, A, b, Aeq, beq, lb, ub, options);

% Afișarea soluțiilor Pareto-optime
figure;
plot(fval(:,1), -fval(:,2), 'bo');
xlabel('Consum de apă');
ylabel('Randament agricol');
title('Frontiera Pareto pentru distribuția apei');
grid on;
```

## Alte metode

### Optimizare bazată pe algoritmul coloniei de furnici (ACO)
- Modelarea distribuției apei ca un traseu optimizat prin feromonii artificiali ai furnicilor.
- Se optimizează traseele prin care apa este distribuită către diverse sectoare agricole.

### Metoda Multi-Objective Particle Swarm Optimization (MOPSO)
- Se utilizează particule virtuale pentru a explora diferite scenarii de distribuție a apei.
- Se ajustează traiectoriile particulelor pentru a minimiza pierderile și a maximiza eficiența irigației.

### Metoda NSGA-II (Non-dominated Sorting Genetic Algorithm II)
- Un algoritm multi-obiectiv care identifică soluții Pareto-optime pentru reducerea consumului de apă și îmbunătățirea randamentului agricol.
- Permite obținerea unui set de soluții eficiente din care fermierii pot alege varianta optimă.
