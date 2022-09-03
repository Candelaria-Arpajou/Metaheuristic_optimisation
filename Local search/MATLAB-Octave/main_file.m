close all
clear all

N_cities = 25;

%xy_matrix = position_matrix(N_cities);
%save xy_matrix.mat %Comentar para que no se reescriba la matriz

load xy_matrix.mat % Cargar la matriz guardada
path_0 = randperm(N_cities);
[final_path,total_distance] =  local_search( xy_matrix, path_0 )

