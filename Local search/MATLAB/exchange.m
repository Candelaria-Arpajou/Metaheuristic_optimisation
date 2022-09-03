function [ new_path ] = exchange( path )
new_path = path;
indexes = randperm(size(new_path,2),2); % devuelve dos indices random de new_path
auxiliar = new_path(indexes(1));
new_path(indexes(1)) = new_path(indexes(2));
new_path(indexes(2)) = auxiliar;
end

