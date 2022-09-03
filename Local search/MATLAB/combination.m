function [ new_path ] = combination( path )
perturbation = randperm(3,1);

if perturbation == 1
    new_path = exchange(path);
elseif perturbation == 2
    new_path = reversion(path);
else
    new_path = insercion(path);
end
end

