function [total_distance] = distance(p_matrix, path)
N = size(p_matrix,2); % La misma cantidad de columnas que la matriz posición
path = [path,path(1)]; % Agrego el primer elemento al último lugar
d_x =  (p_matrix(1,path(2:N+1)) - p_matrix(1,path(1:N))).^2;
d_y =  (p_matrix(2,path(2:N+1)) - p_matrix(2,path(1:N))).^2;
pitagoras = (d_x + d_y).^0.5;
total_distance = sum(pitagoras);
end

