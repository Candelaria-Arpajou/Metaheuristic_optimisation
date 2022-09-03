function [ d_matrix ] = distance_matrix( p_matrix )
% Creates a NxN matrix with the distances between the cities. The elements of the main
% diagonal are equal to infinite.
 n_cities = length(p_matrix);
 d_matrix = zeros(n_cities);
 
 for i = 1:n_cities
     xs_i = p_matrix(1,i);
     ys_i = p_matrix(2,i);
     for j = 1:n_cities
         xs_j = p_matrix(1,j);
         ys_j = p_matrix(2,j);
         if i == j
             dist = inf;
             d_matrix(i,j) = dist;
         else
             dist = ((xs_i - xs_j)^2  + (ys_i - ys_j)^2)^0.5;
             d_matrix(i,j) = dist;
         end
     end
 end
 end

