function [ p_matrix ] = position_matrix( N )
% Creates a 2xN matrix, where the rows represent the coordinates x,y of the city.
% The number of columns N is equal to the number of cities.
p_matrix = rand([2,N]);
end
