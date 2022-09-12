close all
clear all

N_cities = 25;
% xy_matrix = create_position_matrix(N_cities);

%save citiesN.mat Comentar para que no se reescriba la matriz
%load citiesN.mat % Cargar la matriz guardada
xy_matrix = position_matrix(N_cities);
recorrido_0 = randperm(N_cities);
T0 = 10;
[final_path,total_distance] =  simulated_annealing( xy_matrix, recorrido_0, T0 )

