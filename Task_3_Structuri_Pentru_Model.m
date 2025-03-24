%demo rezolvare problema pentru a arata stucturile de date folosite
clc; clear; close all;

% 1. Definirea necesarului de apa pentru culturi
crops = {'Grau', 'Porumb', 'Floare Soarelui'};
water_demand = [500; 700; 600]; % Apa necesara per cultura

% 2. Definirea surselor de apa si a retelei (Reprezentare ca graf)
nodes = {'Source', 'Field1', 'Field2', 'Field3'};
edges = [1 2; 1 3; 1 4]; % Conexiuni de la sursa la campuri
water_capacity = [1000; 800; 600]; 
water_cost = [2; 3; 1.5]; % Cost per litru pentru fiecare camp

% Crearea reprezentarii grafice
g = digraph(edges(:,1), edges(:,2), water_capacity, nodes);
figure;
plot(g, 'EdgeLabel', g.Edges.Weight);
title('Retea de irigatii');

% 3. Definirea problemei de optimizare (Folosind matrici)
f = water_cost'; % Minimizarea costului alocarii apei
Aeq = [1 1 1]; % Asigurarea ca apa este distribuita tuturor culturilor
beq = sum(water_capacity); % Apa disponibila
lb = zeros(3,1); % Alocare minima
ub = water_capacity; % Alocare maxima per camp

% Rezolvarea programarii liniare
x = linprog(f, [], [], Aeq, beq, lb, ub);

% 4. Construirea matricei de distributie a apei
water_distribution = zeros(3,3); 
for i = 1:3
    water_distribution(i, :) = (x(i) / sum(x)) * water_demand';
end

% 5. Afisarea rezultatelor
fprintf('Alocare optimizata a apei:\n');
for i = 1:3
    fprintf('%s: %.2f L\n', crops{i}, sum(water_distribution(:,i)));
end

total_cost = sum(x .* water_cost);
fprintf('Cost total al apei: %.2f\n', total_cost);


figure;
bar(water_distribution');
set(gca, 'XTickLabel', crops);
legend({'Field1', 'Field2', 'Field3'});
ylabel('Apa alocata (L)');
title('Distributia optima a apei intre campuri si culturi');
